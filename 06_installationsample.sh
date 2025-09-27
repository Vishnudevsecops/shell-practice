#!/bin/bash

#check user current user has root access
user_rootaccess=$(id -u)

#if use donot have root acces
if [ $user_rootaccess -ne 0 ]; then
    echo "Error:: Please run the script using root access"
    exit 1
fi

validate(){

    if [$1 -ne 0 ]; then
        echo "error: $2 installation is failed"
        exit 1
    else    
        echo "$2 installation completed"
    fi
}
dnf install mysql -y

validate $? "mysql" 

dnf install nginix -y

validate $? "niginix"

dnf install python3 -y

validate $? "python3"
