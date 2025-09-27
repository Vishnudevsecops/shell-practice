#!/bin/bash

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

#check user current user has root access
user_rootaccess=$(id -u)

#if use donot have root acces
if [ $user_rootaccess -ne 0 ]; then
    echo "Error:: Please run the script using root access"
    exit 1
fi

validate(){

    if [$1 -ne 0 ]; then
        echo -e "error: $2 installation is $R failed $N"
        exit 1
    else    
        echo -e "$2 installation $G completed $N"
    fi
}


dnf list installed mysql
if [ $? -ne 0 ]; then
    dnf install mysql -y
    validate $? "mysql" 
else
    echo -e "mysql is already exist...... $Y Skipped $N"
fi


dnf list installed nginix
if [ $? -ne 0 ]; then
    dnf install nginix -y
    validate $? "nginix" 
else
    echo -e "nginix is already exist...... $Y Skipped $N"
fi

dnf list installed phython3
if [ $? -ne 0 ]; then
    dnf install python3 -y
    validate $? "python3" 
else
    echo -e "python3 is already exist...... $Y Skipped $N"
fi
