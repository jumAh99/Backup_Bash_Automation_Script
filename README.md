# WHY USE THIS SCRIPT?
- Makes life simpler
- Automated backups for /etc file and /usr file

# REQUIREMENTS 
- USB (partitioned in 2) or drives with the name 'LocalDrive' and 'NetworkDrive'
- Need to change the destination path to your desired one or just leave the one that I have and change just the username
- You will also need to change the path of the drives, they are most likely in your '/run/media/yourUsername/yourDriveName' folder
- You need ownership for the drives/partitions if not you need to run the script in su priviladges
- Make sure to put the jumma.sh file in your /bin folder so you can call the script whenever in your terminal

# HOW TO USE THE SCRIPT 
- Put the jumma.sh script in your /bin folder, you will need to open this folder in administrative mode
- Open terminal 
- Type 'source jumma.sh' if you have ownership of the 2 drives required, else type su --> your password when asked --> source jumma.sh
- To do a daily backup type 'backmeup 1' or for a full backup type 'backmeup 2'
- For help type 'backmeup-help'
- For monitoring the main drive type 'monitorme'

# CRONTAB 
The script cannot automate the backups without your intervention, you need to conifgure crontab to run this script, here is how to do it:
- Open terminal 
- Run the command 'sudo crontab -e'
- Delete everyhting in the crontab file 
- Copy the contents from crontab-settings.settings
- Paste the contant into the crontab file 
- To save the file press ctrl+X and press ENTER
- To check if they were applied type 'sudo crontab -l'
- You should see the rules printed in your terminal
- Done



