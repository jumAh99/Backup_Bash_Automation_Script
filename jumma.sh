#!/bin/bash
#jumma.sh simple backup script, used to monitor and generate backups when required

echo "############################################
            WELCOME TO BACKMEUP
############################################"

# THE FUNCTION THAT WILL ALLOW THE USER TO BACUP FILES
function backmeup() { 
    # GET THE TIME AND DATE FOR ORGANISATION FOR BACKUPS 
    timeStamp=$(date +"%Y-%m-%d_%H:%M:%S")
    # SYSTEM CURRENT LOCATION 
    locationPath=/home/bob/Documents/scripts
    # GET THE USER DIRECTORY PATH WHERE THE FILES ARE STORED 
    listOfContentInTargetFolder=$(ls $locationPath/target)
    # VARIABLE THAT WILL HOLD THE TOT NUMBER OF PARAMETERS PASSED 
    parameterCounter=$#
    # IF CORRECT NUMBER OF PARAMETER HAS BEEN GIVEN THEN STORE THE VALUE
    selectedOption=${1}
    # MAKE SURE THAT THE CORRECT NUMBER OF PARAMETERS HAVE BEEN PASSED 
    if ((parameterCounter < 1)); then
        # LET THE USER KNOW THAT THE NUMBER OF PARAMETERS IS INCORRECT
        echo "ERROR: No option has been declared (1, 2), for more help try 'backmeup-help'."

        # IF PARAMETERS WERE PASSED BUT THEY WERE INVALID (OTHER THAN 1 OR 2)
        else 
            # IF THE OPTION SELECTED IS INVALID 
            if ((selectedOption != 1 && selectedOption != 2)); then
                echo "ERROR: The selected option is invalid, for more information type 'backmeup-help'."
            fi

    fi
    # IF OPTION 1 WAS SELECTED
    if ((selectedOption == 1)); then
        # DESTINATION OF WHERE THE ARCHIVES WILL BE STORED 
        destinationFile=/run/media/bob/LocalDrive/biotech_$timeStamp.tar
        # LOOP TROUGH ALL THE FILES AND STORE THEM IN A VARIABLE NAMED ENTRY
        for entry in $listOfContentInTargetFolder; do
            # IF THE USR FILE IS PRESENT IN THE TARGET DIRECTORY
            if test -d "$locationPath/target/usr"; then
                # IF ENTRY IS A FILE OR DIRECTORY
                if [ -d "$locationPath/target/$entry" ] || [ -f "$locationPath/target/$entry" ]; then
                    # CREATE AN ARCHIVE WITH THE FILES THAT ARE VALID FOR THE BACKUP 
                    tar -cvf "$destinationFile" "target/usr"
                    # LET THE USER KNOW THAT THE FILE INDICATED IS NOT A FILE OR DIRECTORY
                    else
                        # PRINT A ERROR MESSAGE
                        echo "ERROR: $locationPath/target/$entry is not a file or directory!!"
                fi
                # LET THE USER KNOW THAT FILES ARE MISSING
                else
                    echo "Some files are missing!" 
                    break; 
            fi
        done
    fi
    
    # IF OPTION 2 WAS SELECTED 
    if ((selectedOption == 2)); then
        # DESTINATION OF WHERE THE ARCHIVES WILL BE STORED 
        destinationFile=/run/media/bob/NetworkDrive/biotech-full_$timeStamp.tar
        # LOOP TROUGH ALL THE FILES AND STORE THEM IN A VARIABLE NAMED ENTRY
        for entry in $listOfContentInTargetFolder; do
            # CHECK WEATHER THE REQUIRED FILES FOR FULL BACKUP ARE PRESENT
            if test -d "$locationPath/target/usr"  &&  test -d "$locationPath/target/etc" ; then
                # IF ENTRY IS A FILE OR DIRECTORY
                if [ -d "/$entry" ] || [ -f "/$entry" ]; then
                    # CREATE AN ARCHIVE WITH THE FILES THAT ARE VALID FOR THE BACKUP 
                    tar -cvf "$destinationFile" "target/usr" "target/etc"
                    # LET THE USER KNOW THAT THE FILE INDICATED IS NOT A FILE OR DIRECTORY
                    else
                        # PRINT A ERROR MESSAGE
                        echo "ERROR: $locationPath/target/$entry is not a file or directory!!"
                fi
                # MAKE THE USER AWARE THAT SOME FILES ARE MISSING SO BACKUP IS NOT POSSIBLE 
                else
                    echo "Some files are missing!"
                    break
            fi
        done
    fi

    # LET THE USER NOW THAT THE FUNCTION HAS COMPLETED THE TASK
    echo "END backmeup!"
}
# ALLOW THE USER TO ACCESS USAGE INFORMATION AT ANY TIME 
function backmeup-help(){
    echo "Welcome to our backup script, please type backmeup and what type of backup you would like to do"
    echo "1 = dialy backup"
    echo "2 = full backup"
    echo "Here is an example of how to execute the code 'backmeup {option}'. "
}
# MONITOR THE DISK USAGE OF THE DRIVE 
function monitorme(){
    # GET THE DISK USAGE OF THE MAIN DIRECTORY SDA1
    diskUsage=$(df --output=pcent /dev/sda1 | tr -dc '0-9')

    # IF THE LOCAL DRIVE DISK USAGE IS MORE THAN 80%
    if ((diskUsage >= 80)); then
        # EXECUTE A FULL BACKUP OF THE SYSTEM 
        backmeup 2
        echo "Backup Completed!"
        else 
            # LET THE USER KNOW THAT BACKUP IS NOT NECESSARY
            echo "ALERT: No need to emergency backup the disk usage is under 80%, current disk usage is:$diskUsage%"
    fi
}
