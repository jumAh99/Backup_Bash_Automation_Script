#/bin/bash
#jumma.sh THIS SCRIPT ALLOWS THE USER TO BACKUPS FILES AND FOLER BY PASSING A PARAMETER COMMAND
function backupme(){
    # CREATE A DESTINATION FILE UISNG THE CURRENT TIME STAMP
    timeStamp='date +%y%m%d-%H%M%S'
    destinationFleName='biotech'-${timeStamp}.tar
    # GET THE CURRENT NUMBER OF ARGUMENTS PASSED 
    argumentsNumber=$#
    # IF THE ARGUMENTS DOES NOT MATCH THE DESIRED NUMBER
    if [$argumentsNumber -lt 1] ; then
        # LET THE USER KNOW THAT THE ARGUMENTS ARE NOT CORRECT 
        echo 'You need to input a argument when running the script!!' 
        # CLOSE THE SCRIPT
        exit 1
    fi

    # STORE THE OPTION PASSED TO SRC
    src=${1}
    # CREATE A ITERATIVE VARIABLE THAT WIL LOOP TRHOUGH
    i=1
}


