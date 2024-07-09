#!/bin/bash
################
#author: Sush
#date: 6/11
#purpose: just for practice
################

set -x #debug mode
set -e #exit script when there is an error
set -o #pipefail

#processes information
top

#memory information
free

#number of CPUs
echo "Number of CPUs allocated are:"
nproc

#list processes running on the machine
ps -ef


#Curl,Grep, Wget, Awk commands

#curl command extracts the information from any URL
curl https://raw.githubusercontent.com/iam-veeramalla/sandbox/main/log/dummylog01122022.log

#wget
#wget <URL>, this will download the file into pwd

#grep command searches for a given string, and returns just those lines thst has that string in it
curl https://raw.githubusercontent.com/iam-veeramalla/sandbox/main/log/dummylog01122022.log | grep ERROR

#here pipe operator works as follows: it takes output from the lef side one, and applies the right side command. So it goes in this order

#awk command is used to get specfic strings based on pattern
#for example, from the above log file, if we need the timestamp of errors, we do
curl https://raw.githubusercontent.com/iam-veeramalla/sandbox/main/log/dummylog01122022.log | awk -F" " '{print $2}'
#here, F means field separator, the " " represents that the field separator is <space>. $2 is the second column(the one that should be printed)
echo "Hello World"