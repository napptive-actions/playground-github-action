#!/bin/sh

##################################################################
# Command:                                                       #
# run -e PLAYGROUND_PAT=... "command" "environment" "configFile" #
##################################################################

# get args
cmd=$1
environment=$2
configFile=$3

function printExit {
    time=$(date)
    echo "::set-output name=time::$time"
    exit $EXIT
}

## cmd cannot be empty
if [[ -z "$cmd" ]]; then
    echo "cmd can not be empty"
    EXIT=-1
    printExit
fi

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    mkdir -p ${HOME}/.napptive
    cp ${configFile} ${HOME}/.napptive/.playground.yaml
fi

# Step 1. Login in to the platform
# Login into the platform (with pat=true)
./playground login --pat=true
EXIT=$?
if [[ $? -ne 0 ]]; then
    printExit  
fi



# if environment!= "" -> use it!
if [[ -n "$environment" ]]; then
    ./playground env use ${environment}
    EXIT=$?
    if [[ $? -ne 0 ]]; then
        printExit
    fi
fi

# execute the command
./playground ${cmd} 
EXIT=$?
printExit


