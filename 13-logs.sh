#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
  if [ $1 -ne 0 ]
   then 
      echo -e "$2....$R failure"
      exit 1
    else 
      echo -e "$2... $G success"
    fi
}

echo "script started exceuting.. $TIMESTAMP" &>>$LOG_FILE_NAME

if [ $USERID -ne 0 ]
  then
     echo "ERROR: you must have sudo access to excute this script"
     exit 1 #other than 0 we have to give here to exit the script from here
fi

dnf list installed mysql &>>$LOG_FILE_NAME
 if [ $? -ne 0 ]
 then 
   dnf install mysql -y &>>$LOG_FILE_NAME
   VALIDATE $? "Installing mysql"
 else 
   echo -e "mysql is already... $Y installed"
fi

dnf list installed git &>>$LOG_FILE_NAME
 if [ $? -ne 0 ]
 then                    #not installed
   dnf install git -y &>>$LOG_FILE_NAME
   VALIDATE $? "Installing git"
   
 else
   echo -e "git is already... $Y installed"
 fi