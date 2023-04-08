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
    timeStamp=$(date +"%Y-%m-%d_%H:%M:%S")
    # SYSTEM CURRENT LOCATION 
    locationPath=/home/bob/Documents/scripts
    # MAKE SURE THAT THE CORRECT NUMBER OF PARAMETERS HAVE BEEN PASSED 
    if ((parameterCounter < 1)); then
        # LET THE USER KNOW THAT THE NUMBER OF PARAMETERS IS INCORRECT
        echo "ERROR: No option has been declared (1, 2), for more help try 'backmeup-help'."
    fi
    # IF CORRECT NUMBER OF PARAMETER HAS BEEN GIVEN THEN STORE THE VALUE
    selectedOption=${1}
    # GET THE USER DIRECTORY PATH WHERE THE FILES ARE STORED 
    listOfContentInTargetFolder=$(ls $locationPath/target)
    
    # IF OPTION 1 WAS SELECTED
    if ((selectedOption == 1)); then
        # DESTINATION OF WHERE THE ARCHIVES WILL BE STORED 
        destinationFile=/home/bob/Documents/scripts/local-drive/biotech_$timeStamp.tar
        # LOOP TROUGH ALL THE FILES AND STORE THEM IN A VARIABLE NAMED ENTRY
        for entry in $listOfContentInTargetFolder; do
            if [ "$entry" == "usr" ] && [ "$entry" != "etc" ]; then
                # IF ENTRY IS A FILE OR DIRECTORY
                if [ -d "$locationPath/target/$entry" ] || [ -f "$locationPath/target/$entry" ]; then
                    # STORE ALL THE FILTERED FILES INTO A SOURCE FILE
                    sourceToBackup="${entry}"
                    # CREATE AN ARCHIVE WITH THE FILES THAT ARE VALID FOR THE BACKUP 
                    tar -cvf "$destinationFile" "target/$sourceToBackup"
                    # LET THE USER KNOW THAT THE FILE INDICATED IS NOT A FILE OR DIRECTORY
                    else
                        # PRINT A ERROR MESSAGE
                        echo "ERROR: $locationPath/target/$entry is not a file or directory!!"
                fi
            fi
        done
    fi
    # IF OPTION 2 WAS SELECTED 
    if ((selectedOption == 2)); then
        # DESTINATION OF WHERE THE ARCHIVES WILL BE STORED 
        destinationFile=/home/bob/Documents/scripts/network-drive/biotech-full_$timeStamp.tar
        # LOOP TROUGH ALL THE FILES AND STORE THEM IN A VARIABLE NAMED ENTRY
        for entry in $listOfContentInTargetFolder; do
            if [ "$entry" == "etc" ] || [ "$entry" == "usr" ]; then
                # IF ENTRY IS A FILE OR DIRECTORY
                if [ -d "$locationPath/target/$entry" ] || [ -f "$locationPath/target/$entry" ]; then
                    # STORE ALL THE FILTERED FILES INTO A SOURCE FILE
                    sourceToBackup="$entry"
                    # CREATE AN ARCHIVE WITH THE FILES THAT ARE VALID FOR THE BACKUP 
                    tar -cvf "$destinationFile" "target/$sourceToBackup"
                    # LET THE USER KNOW THAT THE FILE INDICATED IS NOT A FILE OR DIRECTORY
                    else
                        # PRINT A ERROR MESSAGE
                        echo "ERROR: $locationPath/target/$entry is not a file or directory!!"
                fi
                else
                    echo "ERROR: $entry"
            fi
        done
    fi
    # IF THE OPTION SELECTED IS INVALID 
    if ((selectedOption != 1 && selectedOption != 2)); then
        echo "ERROR: The selected option is invalid, for more information type 'backmeup-help'."
    fi
}
# ALLOW THE USER TO ACCESS USAGE INFORMATION AT ANY TIME 
function backmeup-help(){
    echo "Welcome to our backup script, please type backmeup and what type of backup you would like to do"
    echo "1 = local backup"
    echo "2 = network backup"
    echo "Here is an example of how to execute the code 'backmeup {option}'. "
}