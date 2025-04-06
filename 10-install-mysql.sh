#!/bin/bash

# dnf install mysql -y
USERID=$(id -u)  # id -u it will give the id of the current user

if [ $USERID -ne 0 ]
  then
     echo "ERROR: you must have sudo access to excute this script"
     exit 1 #other than 0 we have to give here to exit the script from here
fi

dnf list installed mysql 
 if [ $? -ne 0 ]       # $? is previous command exit status if exit status is 0(root) it is success, otherwise it is failure)
 then 
   dnf install mysql -y
   if [ $? -ne 0 ]   #every if condition have one end status is like fi
   then 
      echo "installing mysql....failure"
      exit 1
    else 
      echo "installing mysql...success"
    fi
else 
  echo "mysql is already...installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then                    #not installed
   dnf install git -y
   if [ $? -ne 0 ]
   then
      echo "git is installing...failure"
      exit 1
    else
       echo "git is installing...success"
    fi
else
  echo " git is already...installed"
fi