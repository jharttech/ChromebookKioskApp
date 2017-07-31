#!/bin/bash
####################################################

# This is a simple script designed to help the MG
# tech team quickly edit their simple Chrome Kiosk
# App by inputing the changes needed to the Kisok
# App files.
####################################################

# Variables

#_GT='\033[0:32m'
#_NC='\033[0m'
####################################################

# Display shell logo
clear
cat jhart_shell_logo.txt

echo -e "\n"
echo "########################################################################################"
echo "########################################################################################"
sleep 3
###################################################

# Here we will create the needed directories.
# Here we will also install needed tools.

echo -e "\n "
echo "Going to check on needed tools. If they are not found they will be installed."
_PKG_OK=$(dpkg-query -W --showformat='${Status}\n' vim|grep "install ok installed")
echo Checking for vim: $_PKG_OK
if [ "" == "$_PKG_OK" ]; then
  echo "No vim install found. Setting up vim now."
  sudo apt-get --force-yes --yes install vim
fi
_PKG_OKTwo=$(dpkg-query -W --showformat='${Status}\n' imagemagick|grep "install ok installed")
echo Checking for imagemagick: $_PKG_OKTwo
if [ "" == "$_PKG_OKTwo" ]; then
  echo "No imagemagick install found. Setting up imagemagick now."
  sudo apt-get --force-yes --yes install imagemagick
fi

mkdir ~/CBKioskTemp
cp -r KioskFiles ~/CBKioskTemp
cd ~/CBKioskTemp
echo -e "\n"
echo "#######################################################################"
echo "#######################################################################"
while true; do
	echo "Please enter your desired zipped app file name. "
	read _fileName
	echo "You entered your new zip files name as "$_fileName""
	echo "Is this name correct? y/n "
	read yn
	if [ "$yn" = "y" ];
		then
			mv KioskFiles "$_fileName"	
			break
	fi
done
cd "$_fileName"
ls
sleep 3


###################################################

# Here we make the initial changes to the config.js
# file.
echo -e "\n"
echo "#########################################################################"
echo "Now going to open the browser.js file with vim text editor.  Please edit the file with appropriate values."
sleep 3
vim browser.js

echo "Now going to open the the manifest.json file with vim text editor.  Please edit the file with appropriate values."
sleep 3
vim manifest.json

echo "Now going to open the main.js file with vim text editor.  Please edit the file with appropriate values."
sleep 3
vim main.js

echo "Now going to open the browser.html file with vim text editor.  Please edit the file with appropriate values."
sleep 3
vim browser.html

echo "Now going to zip up the finished Kiosk App Project"
sleep 3
cd ~/
cd CBKioskTemp
zip -r "$_fileName".zip "$_fileName"
cd ~/
mv CBKioskTemp "$_fileName"
cd ~/"$_fileName"
##########################################################

# Here we create 3 required by google image sizes to speed
# up publishing of our app
echo -e "\n"
echo " ############################################################################"
echo "Please enter the path to your default image. (example: /home/user/pictures/default.png "
read _DefaultImg
echo "Now going to create the 3 needed image sizes for all published chrome apps.  These images can be changed at any time during the publishing phase. These images can be found inside the new "$_fileName" folder. "
convert "$_DefaultImg" -scale 128x128\! -quality 100 icon_128x128.png
convert "$_DefaultImg" -scale 1280x800\! -quality 100 screenshot_1280x800.png
convert "$_DefaultImg" -scale 440x280\! -quality 100 smalltile_440x280.png
sleep 5
echo -e "\n"
echo "###########################################################################"
echo "ALL DONE!!"
echo "You are now ready to upload the new verison of the kiosk, using your google developer console."
echo "The url is "https://chrome.google.com/webstore/developer/dashboard"" 
echo -e "\n"
echo "##########################################################################"
echo -e "\n"
echo "Your new kiosk app files have been created.  Thank You! -Jhart"
sleep 4
exit
