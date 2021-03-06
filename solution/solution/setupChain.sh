#!/bin/bash

# Use this script to perform any necessary setup on non-primary nodes, such as subscribing to streams, installing dependencies, etc. 
# We will run this scipt on each node sequentially, after running setupPrimaryNode.sh on the primary node.
# Once all of these are complete, testing will begin. 

# Change directory to where the script is stored, not where it is run from
scriptPath=$(cd -P -- "$(dirname -- "$0")" && pwd -P)
cd $scriptPath
source participantConfig.sh
# This brought in the following variables 
# $chainName
# $rpcuser
# $rpcpassword
# $rpcport

# =====================================================
# Place your code below this comment block
# 
# The following variables have been set for you. 
# $chainName        The name of the chain
# $rpcuser          The rpc username for the chain
# $rpcpassword      The rpc password for the chain    
# $rpcport          The rpc port for the chain
# =====================================================

for stream in "${streams[@]}"
do
    multichain-cli $chainName subscribe $stream
done

echo "{
    \"rpcuser\": \"$rpcuser\",
    \"rpcpasswd\": \"$rpcpassword\",
    \"rpchost\": \"127.0.0.1\",
    \"rpcport\": \"$rpcport\",
    \"chainname\": \"$chainName\"
}" > $scriptPath/auth.json
