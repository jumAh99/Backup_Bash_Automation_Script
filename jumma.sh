#!/bin/bash
#jumma.sh THIS SCRIPT ALLOWS THE USER TO BACKUPS FILES AND FOLER BY PASSING A PARAMETER COMMAND

echo "############################################
            WELCOME TO BACKMEUP
############################################"
# THE FUNCTION THAT WILL ALLOW THE USER TO BACUP FILES
function backmeup() { 
    # VARIABLE THAT WILL HOLD THE TOT NUMBER OF PARAMETERS PASSED 
    parameterCounter=$#
    # GET THE TIME AND DATE FOR ORGANISATION FOR BACKUPS 
    timeStamp=$(date +"%Y-%m-%d-%H:%M:%S")
    # SYSTEM CURRENT LOCATION 
    locationPath=/home/bob/Documents/scripts
    # DESTINATION OF WHERE THE ARCHIVES WILL BE STORED 
    destinationFile=$locationPath/backups/biotech$timeStamp.tar
    # MAKE SURE THAT THE CORRECT NUMBER OF PARAMETERS HAVE BEEN PASSED 
    if ((parameterCounter < 1)); then
        # LET THE USER KNOW THAT THE NUMBER OF PARAMETERS IS INCORRECT
        echo "ERROR: No option has been declared (1, 2), for more help try 'backmeup-help'."
        exit 1
    fi
    # IF CORRECT NUMBER OF PARAMETER HAS BEEN GIVEN THEN STORE THE VALUE
    selectedOption=${1}
    # IF OPTION 1 WAS SELECTED
    if ((selectedOption == 1)); then
        # GET THE USER DIRECTORY PATH WHERE THE FILES ARE STORED 
        userDirectory=$(ls $locationPath)
        # LOOP THROUGH ALL THE FILES PRESENT IN THE USER FOLDER
        for entry in $userDirectory; do
            # MAKE SURE TO GRAB ONLY FILES AND DIRECTORIES /home/bob/Documents/scripts/
            if [ -d "$entry" ] || [ -f "$entry" ]; then
                # STORE ALL THE FILTERED FILES INTO A SOURCE FILE
                sourceToBackup="${entry}"
            fi
        done
    fi
    # IF OPTION 2 WAS SELECTED 
    if ((selectedOption == 2)); then
        echo "You have selected option 2!"
    fi
    # IF THE OPTION SELECTED IS INVALID 
    if ((selectedOption != 1 && selectedOption != 2)); then
        echo "ERROR: The selected option is invalid, for more information type 'backmeup-help'."
    fi

    # CREATE AN ARCHIVE WITH THE FILES THAT ARE VALID FOR THE BACKUP 
    tar -cvf "$destinationFile" "$sourceToBackup"
}
# ALLOW THE USER TO ACCESS USAGE INFORMATION AT ANY TIME 
function bakmeup-help(){
    echo "Welcome to our backup script, please type backmeup and what type of backup you would like to do"
    echo "1 = local backup"
    echo "2 = network backup"
    echo "Here is an example of how to execute the code 'backmeup {option}'. "
}