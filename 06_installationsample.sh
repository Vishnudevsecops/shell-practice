#!/bin/bash

#check user current user has root access
user_rootaccess=$(id -u)

#if use donot have root acces
if [ $user_rootaccess -ne 0 ]; then
    echo "Error:: Please run the script using root access"
    exit 1
fi

dnf install mysql -y

if [$? -ne 0 ]; then
    echo "error: Mysql installation is failed"
    exit 1
else    
    echo "mysql installation completed"
fi