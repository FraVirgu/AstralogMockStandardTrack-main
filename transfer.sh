#!/bin/bash

# Set your account name
ACCOUNT="fvirgult"
HPC_HOST="login.g100.cineca.it"
REMOTE_PATH=""   # change this to real path on HPC

# Copy current folder to HPC
scp -r . $ACCOUNT@$HPC_HOST:$REMOTE_PATH

# Connect to HPC
ssh $ACCOUNT@$HPC_HOST