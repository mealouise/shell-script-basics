#! /bin/bash

#this script extracts the audio from mp4 file and converts it to mono

INPUT_FILE=$1 #pass in on the command line
BASE_DIR=$(dirname $INPUT_FILE) #extract directory portion so can be used later in script
BASE_NAME=$(basename -s .mp4 $INPUT_FILE) #opposite of dirname - returns name of just the file and 
#-s removes .mp4 suffix
TMP_FILE=$(mktemp --suffix=.wav) #temp .wav file created to extract audio
OUT_FILE="$BASE_DIR/$BASE_NAME.wav" #has new wav extension

#extract the audio
avconv -y -i $INPUT_FILE $TMP_FILE #extracts audio and saves as wave file

#take audio from 1 channel to create a mono wav file so audio comes out both speakers
sox $TMP_FILE -c 1 $OUT_FILE

#display the name of the file on the screen so can easier copy and paste if want to
echo
echo $OUT_FILE
#finally clean up temp file by removing it