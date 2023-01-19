#! /bin/bash
<<COMMENTS
#write script that consists of function that displays number of files
in present working directory. name the function file_count and call it
in your script. If you use variable make it local variable
the wc utility is used to count number of lines,words and bytes
COMMENTS
function file_count {
    local FILES=$(ls -l | wc -l)
    echo "$FILES" 
}
file_count

<<COMMENTS
modify the script - make the file_count function except an argument
then have the function display the name of the directory followed by a colon
finally display the number of files to the screen on the next line
call the function 3 times first on etc directory, then on var and then usr/bin

COMMENTS
function file_count() {
    local Directory=$1
    FILES=$(ls $Directory | wc -l)
    echo "$Directory :"
    echo "$FILES"

}
file_count /etc
file_count /var
file_count /usr/bin