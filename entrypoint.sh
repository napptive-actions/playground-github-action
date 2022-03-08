#!/bin/sh

##################################################################
# Command:                                                       #
# run -e PLAYGROUND_PAT=... "command" "environment" "configFile" #
##################################################################

# get args
debug=$1
cmd=$2
environment=$3
configFile=$4


## cmd cannot be empty
if [[ -z "$cmd" ]]; then
    echo "cmd can not be empty"
    exit 1
fi

# if there is a configFile...
if [[ -n "$configFile" ]]; then
    echo "using custom installation from $configFile "    
    mkdir -p /napptive
    cp ${configFile} /napptive/.playground.yaml
    if [[ $? -ne 0 ]]; then
      exit 1
    fi
    export PLAYGROUND_CONFIG=/napptive/
    echo "PLAYGROUND_CONFIG env added: $PLAYGROUND_CONFIG"    

fi

# add app dir to the path to allow execute the playground command
export PATH=$PATH:/app/

# Step 1. Login in to the platform
# Login into the platform (with pat flag)
/app/playground login --pat --debug=$debug 
if [[ $? -ne 0 ]]; then
    exit 1
fi



# if environment!= "" -> use it!
if [[ -n "$environment" ]]; then
    /app/playground env use ${environment} --debug=$debug 
    if [[ $? -ne 0 ]]; then    
        exit 1
    fi
fi

# execute the command
/app/playground ${cmd} --debug=$debug
exit $?


