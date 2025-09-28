#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check if current user has root access
user_rootaccess=$(id -u)
#if user does not have root access
if [ $user_rootaccess -ne 0 ]; then 
    echo "Error:: Please run the script using root access"
    exit 1
fi

#validate(){
 #   if [ $1 -ne 0 ]; then
 #       echo -e "error:: $2 installation is $R failed $N"
 #       exit 1
  #      else
   #         echo -e "$2 installation $G Completed $N"
   # fi

#}
if [ $# -eq 0 ]; then
    echo "Error:: Please provide package names to install"
    exit 1
fi 
for package in $@

do
    dnf list installed $package 
    if [ $? -ne 0 ]; then
        dnf install $package -y
        #validate $? "$package"
        if [ $? -ne 0]; then
            echo -e "error:: $package installation is $R failed $N"
            exit 1
            else
                echo -e "$package installation $G completed $N"
                fi
                else
                    echo -e "$package is already exist......$Y Skipped $N"
                    fi
                    done