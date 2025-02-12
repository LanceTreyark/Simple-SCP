#!/bin/bash
# Script to find, move, unpack the latest 'scp...' file, and optionally delete it

# nano scpUnpack.sh
# sudo chmod +x scpUnpack.sh
# ./scpUnpack.sh
# optional alias:
# alias scpUnpack="sudo bash /home/userName/scpUnpack.sh"


# Variables
sourceDir="/tmp"
targetDir="/var/www/example.com/public_html/repo"

# Find the most recent 'scp...' file in /tmp
latestFile=$(ls -t $sourceDir/scp*.tar.gz 2>/dev/null | head -n 1)

# Check if a file was found
if [ -z "$latestFile" ]; then
    echo "No 'scp...' files found in $sourceDir."
    exit 1
fi

# Display the latest file
echo "The most recent packed file is: $latestFile"
read -p "Are you ready to unpack this file? (y/n): " response

if [[ "$response" =~ ^[Yy]$ ]]; then
    # Move the file to the target directory
    echo "Moving $latestFile to $targetDir..."
    mv "$latestFile" "$targetDir"

    # Extract the file
    echo "Extracting contents of $targetDir/$(basename $latestFile)..."
    cd "$targetDir" || { echo "Failed to navigate to $targetDir. Exiting..."; exit 1; }
    tar -zxvf "$(basename $latestFile)"

    # Ask to delete the compressed file
    read -p "Would you like to delete the compressed file? (y/n): " deleteResponse
    if [[ "$deleteResponse" =~ ^[Yy]$ ]]; then
        echo "Deleting compressed file $(basename $latestFile)..."
        rm -f "$(basename $latestFile)"
        echo "Compressed file deleted."
    else
        echo "Compressed file retained."
    fi
else
    echo "Unpacking canceled."
fi

# Exit message
echo "Script completed."
