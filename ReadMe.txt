

This script will help with the creation of a simple URL based kiosk app for deployment on a chromebook environment.

The script uses VIM text editor.  If you are unfamiliar with VIM I would recommend getting familiar with it.  You can find the basic command in the man page using the linux command "man vim".  You can also learn the basics at
 
https://coderwall.com/p/adv71w/basic-vim-commands-for-getting-started

How to use this script

***Note: Please have a .png file saved in the location of your choice on your machine before running this script.  Also, take note of the .png files location and the name of the .png file.

1. Navigate to the downloaded zip file in your terminal and unzip the ChromebookKioskApp-master.zip file using "$ unzip ChromebookKioskApp-master.zip" press enter.  (**This step not needed if repository was cloned from github.**)

2. Change the Shell Script to executable if needed using "chmod +x ChromebookKiosk.sh" press enter.

3. Next, run the script using by typing "./ChromebookKiosk.sh" press enter.

4. Follow the onscreen prompts.
    ***Note - In the manifest.js file you must edit the "version":"x.x" and the "manifest_chrome_version": x   values each time you create a zip file of the same kiosk app.
    Note*** - In the browser.html file you must set the <webview src="http://exampleforscript.com" to the URL of you desired web location.  For example if you wanted the kiosk to launch hotmail homepage you would edit the line to <webview src="http://www.hotmail.com"

You will be asked to edit these files while the script is running.

5. Once the script is complete you will have a zip file of your named kiosk.
