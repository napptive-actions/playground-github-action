#!/bin/sh

##################################################################
# Command:                                                       #
# run -e PLAYGROUND_PAT=... "command" "environment" "configFile" #
##################################################################

# get args
cmd=$1
environment=$2
configFile=$3

# add actual dir to the path to allow execute the playground command
# required in deploy command
export PATH=$PATH:./

## cmd cannot be empty
if [[ -z "$cmd" ]]; then
    echo "cmd can not be empty"
    exit -1
fi

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    mkdir -p ${HOME}/.napptive
    cp ${configFile} ${HOME}/.napptive/.playground.yaml
fi

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
./playground login --pat
if [[ $? -ne 0 ]]; then
    exit -1
fi



# if environment!= "" -> use it!
if [[ -n "$environment" ]]; then
    ./playground env use ${environment}
    if [[ $? -ne 0 ]]; then    
        exit -1
    fi
fi

# execute the command
./playground ${cmd} 
exit $?


