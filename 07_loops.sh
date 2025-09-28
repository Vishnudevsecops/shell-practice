#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check if current user has root access
user_rootaccess=$(id -u)

#create folder in log folder 
logs_folder="/var/log/shell-script"
#removing .sh from script name to create a log file
script_name=$( echo $0 | cut -d "." -f1 )
log_file="$logs_folder/$script_name.log" 

mkdir -p $logs_folder
echo "script started excuting at : $(date)" | tee -a $log_file
#if user does not have root access
if [ $user_rootaccess -ne 0 ]; then 
    echo "Error:: Please run the script using root access"
    exit 1
fi

validate(){
    if [ $1 -ne 0 ]; then
        echo -e "error:: $2 installation is $R failed $N" | tee -a $log_file
        exit 1
    else
        echo -e "$2 installation $G Completed $N" | tee -a $log_file
    fi

}
if [ $# -eq 0 ]; then
    echo "Error:: Please provide package names to install" | tee -a $log_file
    exit 1
fi 
for package in $@; do
    dnf list installed $package &>>$log_file
    if [ $? -ne 0 ]; then
        dnf install $package -y
        validate $? "$package"
        if [ $? -ne 0 ]; then
            echo -e "error:: $package installation is $R failed $N" | tee -a $log_file
            exit 1
        else
            echo -e "$package installation $G completed $N" | tee -a $log_file
    fi
        else
            echo -e "$package is already exist......$Y Skipped $N" | tee -a $log_file
        fi
    done