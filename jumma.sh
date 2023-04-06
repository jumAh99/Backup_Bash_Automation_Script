#!/bin/bash
#jumma.sh THIS SCRIPT ALLOWS THE USER TO BACKUPS FILES AND FOLER BY PASSING A PARAMETER COMMAND

echo "Welcome to our backup script, please type backmeup and what type op backup you would like to do"
echo "1 = local backup"
echo "2 = network backup"
echo "Here is an example of how to execute the code 'backmeup {option}'. "

# THE FUNCTION THAT WILL ALLOW THE USER TO BACUP FILES
function backmeup() { 
    # VARIABLE THAT WILL HOLD THE TOT NUMBER OF PARAMETERS PASSED 
    parameterCounter=$#
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
        echo "You have selected option 1!"
    fi
    # IF OPTION 2 WAS SELECTED 
    if ((selectedOption == 2)); then
        echo "You have selected option 2!"
    fi
    # IF THE OPTION SELECTED IS INVALID 
    if ((selectedOption != 1 && selectedOption != 2)); then
        echo "ERROR: The selected option is invalid, for more information type 'backmeup-help'."
    fi
}