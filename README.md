# WHY USE THIS SCRIPT?
- Makes life simpler
- Automated backups for /etc file and /usr file

# REQUIREMENTS 
- USB (partitioned in 2) or drives with the name LocalDrive and NetworkDrive
- Need to change the destination path to your desired one or just leave the one that I have and change just the username
- You need ownership for the drives/partitions if not you need to run the script in su priviladges
- Make sure to put the jumma.sh file in your /bin folder so you can call the script whenever in your terminal

# CRONTAB 
The script cannot automate the backups without your intervention, you need to conifgure crontab to run this script, here is how to do it:
- Open terminal 
- Run the command 'sudo crontab -e'
- Copy the contents from crontab-settings.settings 
- To check if they were applied type 'sudo crontab -l'
- You should see the rules printed in your terminal
- Done



