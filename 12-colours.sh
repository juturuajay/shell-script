#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"

VALIDATE(){
  if [ $1 -ne 0 ]
   then 
      echo -e "$2....$R failure"
      exit 1
    else 
      echo -e "$2... $G success"
    fi
}

if [ $USERID -ne 0 ]
  then
     echo "ERROR: you must have sudo access to excute this script"
     exit 1 #other than 0 we have to give here to exit the script from here
fi

dnf list installed mysql 
 if [ $? -ne 0 ]
 then 
   dnf install mysql -y
   VALIDATE $? "Installing mysql"
 else 
   echo -e "mysql is already... $Y installed"
fi

dnf list installed git
 if [ $? -ne 0 ]
 then                    #not installed
   dnf install git -y
   VALIDATE $? "Installing git"
   
 else
   echo -e "git is already... $Y installed"
 fi