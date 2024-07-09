#!/bin/bash
#########################
# Author: Sushanth
# Date: 6/13
#
# Version: v1
#
# This script will report the AWS resource usage
#########################

set -x #debug
set -e #exit script when an error occurs
set -o #pipeline

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users

# listing s3 buckets
echo "Printing list of S3 buckets"
aws s3 ls

# listing EC2 instaces
echo "Printing list of EC2 instances"
aws ec2 describe-instances

# listing lambda
echo "Printing list of lambda functions"
aws lambda list-functions

# listing IAM Users
echo "Printing UserNames of IAM Users"
#aws iam list-users
aws iam list-users | jq '.Users[0].UserName'

aws iam list-users | jq '.Users[0].UserName' >> /home/ubuntu/resource_tracker/iam_users.txt #redirecting to a file

# Now let us print the output to a text file for every 2 minutes using a Cronjob. Below are some basic Cronjob commands
# view crontab: crontab -l
# edit crontab: crontab -e
# List Scheduled Jobs for Another User (requires root privileges): sudo crontab -u username -l
# SYNTAX:
# *     *     *     *     *  command
# -     -     -     -     -
# |     |     |     |     |
# |     |     |     |     +----- day of the week (0 - 7) (Sunday = 0 or 7)
# |     |     |     +------- month (1 - 12)
# |     |     +--------- day of the month (1 - 31)
# |     +----------- hour (0 - 23)
# +------------- minute (0 - 59)

# examples:
# Run a command every Monday at 3 AM: 0 3 * * 1 /path/to/command
# Run a command on the 1st of every month at 6 AM: 0 6 1 * * /path/to/command
# Run a command every 5 minutes: * 5 * * * * /path/to/command

# Instead of these, to reduce the work, we have some special string commands that can be used.
# Crontab also supports special strings for common schedules:

# @reboot: Run once at startup.
# @yearly or @annually: Run once a year, 0 0 1 1 *.
# @monthly: Run once a month, 0 0 1 * *.
# @weekly: Run once a week, 0 0 * * 0.
# @daily or @midnight: Run once a day, 0 0 * * *.
# @hourly: Run once an hour, 0 * * * *.