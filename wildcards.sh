#! /bin/bash
<<COMMENTS
#write script that renames all files in current directory that ends in .jpg to begin with todays date
in the format YYYYMMDD
eg if cat in current directory and today was october 31 2016, it would change name from
mycat.jpg to 20161031mycat.jpeg
hint: look at the format options to the date command


NOW="$(date "+%Y-%m-%d")"
for FILE in *.jpg
do
        echo "renaming file"
        mv $FILE $NOW$FILE
done 
COMMENTS
<<COMMENTS
#handle instances where there are no 'jpg' files in the current directory.
hint man bash and read the section on the nullglob option


NOW="$(date "+%Y-%m-%d")"
shopt -s nullglob
for FILE in *.jpg
do
        echo "found file: $FILE"
        echo "renaming file"
        mv $FILE $NOW-$FILE
done
COMMENTS

<<COMMENTS
write script that renames files based on file extension. the script should prompt
user for file extension.
next it should ask user what prefix to append to file names
by default this should current date in yyymmdd
so if user presses enter the date will be used otherwise whatever users enters will be
used
next it should display original file name and new name of file
finally it should rename the file
COMMENTS

echo "Please enter a file extension"
read st1
echo "Please enter a file prefix"
read st2

NOW="$(date "+%Y-%m-%d")"
for FILE in *.$st1
do
        echo "found file: $FILE"
        echo "renaming file"
        if [ -z "$st2" ]
        then
            mv $FILE $NOW-$FILE
            echo "file renamed to: $NOW-$FILE"
        else
            mv $FILE $st2-$FILE
            echo "file renamed to: $st2-$FILE"
        fi
done


