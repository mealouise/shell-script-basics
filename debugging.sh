<<COMMENTS
DEBUG=true
if $DEBUG
then
    echo "Debug mode ON."
else
    echo "Debug mode OFF."
fi

#will only execute code after && if preceeding exit code=0
<<COMMENTS
DEBUG=true
$DEBUG && echo "Debug mode ON."
COMMENTS

#debug function
<<COMMENTS
debug() {
    echo "Executing: $@"
    $@
}
debug ls
COMMENTS
#write script that exit on error and displays commands as they will execute, including all
#expansions and substitutes.
#use 3 ls commands in your script
#make the first one succeed, the second one fail and the third one suceed

# (/bin/bash -ex)
<<COMMENTS
FILE_NAME="./whileloops.sh"
FILE_NAME_TWO="/not/here"
FILE_NAME_THREE-"/logging.sh"
ls $FILE_NAME
echo "File name is ${FILE_NAME}"
ls $FILE_NAME_TWO
echo "File name is ${FILE_NAME_TWO}"
ls $FILE_NAME_THREE
echo "File name is ${FILE_NAME_THREE}"
COMMENTS

#modify so the script continues even if an error occurs.This time all three ls commands will execute
# /bin/bash -x
FILE_NAME="./whileloops.sh"
FILE_NAME_TWO="/not/here"
FILE_NAME_THREE="./logging.sh"
ls $FILE_NAME
echo "File name is ${FILE_NAME}"
ls $FILE_NAME_TWO
echo "File name is ${FILE_NAME_TWO}"
ls $FILE_NAME_THREE
echo "File name is ${FILE_NAME_THREE}"