#! /bin/bash
#examples
<<COMMENTS
grep xfs /etc/fstab | while read LINE
do
    echo "xfs: ${LINE}"
done
COMMENTS

#read command splitting data into it reads into multiple variables
#each variable stores 1 word or 1 field of data with any left over words or fields
#assigned to the last variable
#here the first word will be assigned to FS, second word to MP
<<COMMENTS
FS_NUM=1
grep xfs /etc/fstab | while read FS MP REST
do
    echo "${FS_NUM}: file system: ${FS}"
    echo "${FS_NUM}: mount point: ${MP}"
    ((FS_NUM++))
done
COMMENTS

#exit loop before normal ending use break statement
# here * ) - means if anything other than 1 or 2 are entered then the while loop ends
<<COMMENTS
while true
do
    read -p "1: show disk usage. 2: show uptime. " CHOICE
    case "$CHOICE" in
    1)
        df -h
        ;;
    2)
        uptime
        ;;
    *)
        break;;
    esac
done
COMMENTS

#loop through list of msql databases -list 1 database per line of output
#-BNe -B disables aste table output from mysql, -N suppresses column name(prevents
#header displayed) -e execute commands that follow
#1st checks if database backed up recently
#continue statement - any commands after continue will not be executed
<<COMMENTS
mysql -BNe "show databases" | while read DB
do
    db-backed-up-recently $DB
    if [ "$?" - eq "0" ]
    then
        continue
    fi
    backup $DB
done
COMMENTS

#write script that loops through /etc/password file one line at a time. Prepend each line with
#line number followed by colon and a space
<<COMMENTS
LINE_NUMBER=1
while read LINE
do
    echo "${LINE_NUMBER}: ${LINE}"
    ((LINE_NUMBER++))
done < /etc/passwd
COMMENTS


#write script that asks users for number of lines they would like to display
#from the /etc/password file and display
<<COMMENTS
read -p "enter number of lines to display: " LINE_NUMBER
COUNT=1
while read LINE
do
    echo "${COUNT}: ${LINE}"
    if [ "$COUNT" -ne "$LINE_NUMBER" ]
    then
        ((COUNT++))
    else
        break
    fi
done < /etc/passwd
COMMENTS

#write script that allows user to select an action from menu. The actions are to
#show the disk usage, show uptime and show user they are logged into the system.
#tell the user to enter q to quit. display goodbye just before the script exists
#if the user enters anything other than 1,2,3 or q, tell them its an 
#invalid option
while true
do
    read -p "What would you like to do? 1: Disk Usage. 2: Uptime. 3: User login. (Enter q to quit)" OPTION
    case "$OPTION" in
    1)
        df
        ;;
    2)
        uptime
        ;;
    3)
        who
        ;;
    q)
        echo "Goodbye!"
        break
        ;;
    *)
        echo "Invalid option"
    esac
done