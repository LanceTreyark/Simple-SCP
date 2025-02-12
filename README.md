There are two scripts here. One for your local pc (I use WSL on Windows 11) and one for the server (I use Debian 12)
I set these up to be run with alias commands "simpleScp" & "scpUnpack"

# Local script:
Make executable with:
sudo chmod +x simpleScp.sh
Run with: 
./simpleScp.sh
Or optional alias command for your ~/.bash_aliases file:
alias simpleScp="sh someLocation/simpleScp.sh"

# Server script:
Make executable with:
sudo chmod +x scpUnpack.sh
Run with: (sudo to access /var/www...) 
sudo ./scpUnpack.sh
Or optional alias command for your ~/.bash_aliases file:
alias scpUnpack="sudo bash /home/userName/scpUnpack.sh"

Message me on Twitter/X if you have any questions @LanceTreyark

_Lance
