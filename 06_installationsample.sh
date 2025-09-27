#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check user current user has root access
user_rootaccess=$(id -u)

#create folder in log folder 
logs_folder="/var/log/shell-scripting"
#removing .sh from script name to create a log file
script_name=$( echo $0 | cut -d "." -f1 )
log_file="$logs_folder/$script_name.log" 


mkdir -p $log_folder
echo "script started executing at : $(date)" | tee -a $log_file
#if use donot have root acces
if [ $user_rootaccess -ne 0 ]; then
    echo "Error:: Please run the script using root access"
    exit 1
fi

validate(){

    if [$1 -ne 0 ]; then
        echo -e "error: $2 installation is $R failed $N" | tee -a $log_file
        exit 1
    else    
        echo -e "$2 installation $G completed $N" | tee -a $log_file
    fi
}


dnf list installed mysql &>>$log_file
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql" 
else
    echo -e "mysql is already exist...... $Y Skipped $N" | tee -a $log_file
fi


dnf list installed nginx &>>$log_file
if [ $? -ne 0 ]; then
    dnf install nginx -y
    validate $? "nginx" 
else
    echo -e "nginx is already exist...... $Y Skipped $N" | tee -a $log_file
fi

dnf list installed python3 &>>$log_file
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3" 
else
    echo -e "python3 is already exist...... $Y Skipped $N" | tee -a $log_file
fi
