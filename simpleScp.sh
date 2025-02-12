#!/bin/bash
# simpleScp.sh
# sudo chmod +x simpleScp.sh
# ./simpleScp.sh
# optional alias command for ~/.bash_aliases :
# alias simpleScp="sh someLocation/simpleScp.sh"

# Start of the script
echo "The script is live!"
read -p "Press any key to begin..." keyup

# Set default SCP address and path
defaultScpAddr="serveruser@192.168.0.1:/tmp/"
scpExportPath="/tmp/"
exportAddr=$defaultScpAddr

# Display default values
echo "           Defaults:"
echo "-----------------------------"
echo "Default SCP Address: $defaultScpAddr"
echo "Default Export Path: $scpExportPath"
echo "-----------------------------"
echo "Simple SCP script is live"
echo ""
echo "Your current path is:"
pwd
echo ""

# Generate timestamped filename
todaysDate=$(date +%m%d%y)
timeNow=$(date +%I%M%p)
zfilename="scp_${todaysDate}_${timeNow}.tar.gz"

echo "Today's Date: $todaysDate"
echo "Current Time: $timeNow"
echo "Generated File Name: $zfilename"
sleep 2
echo ""

# Get the file path
read -p "(OPTIONAL) Enter the path to the file you want to export (e.g., ~/exampleDir/). If left blank, your current path will be used: " filePath
filePath=${filePath:-$(pwd)}

# List directory contents
echo ""
echo "Here is a list of your current directory:"
echo "-----------------------------------------------------------------------------"
ls -a -1 "$filePath"
echo "-----------------------------------------------------------------------------"

# Get the file name
read -p "Enter the name of the file to be exported: " fileName
echo ""

# Confirm details
echo "Here is the data you provided:"
echo "File to be exported: $filePath/$fileName"
echo "Export Address: $exportAddr"
echo "Export File Name: $zfilename"
sleep 1
echo ""

# Navigate to the provided directory
cd "$filePath" || { echo "Failed to navigate to $filePath. Exiting..."; exit 1; }

# Compress the file
echo "Compressing file $fileName into $zfilename..."
tar -zcvf "$zfilename" "$fileName"
sleep 2
echo "Compressed File: $zfilename"
echo ""

# SCP transfer
echo "Sending $zfilename to remote server via SCP..."
scp "$zfilename" "$exportAddr"
if [ $? -eq 0 ]; then
    echo "File successfully sent to $exportAddr."
else
    echo "Error occurred during SCP transfer."
fi

# Cleanup
echo ""
read -p "Press Enter to remove $zfilename or Ctrl+C to abort..." x
rm -f "$zfilename"
echo "Temporary file $zfilename has been removed."

# End of script
echo "The script has concluded."
echo "Bye!"
