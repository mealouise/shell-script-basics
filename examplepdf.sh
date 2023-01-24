#! /bin/bash

#this script converts PDF into series of PNG images. The images will be created in the directory
#from which the script is executed
#usage: $0 [FILE.PDF|/path/to/FILE.PDF]

#Pass in a PDF file.
PDF=$1

#create slides variable and replace .pdf with -slides.png
SLIDES=${PDF/.pdf/-slides.png}

#replace spaces with hyphens
SLIDES=${SLIDES// /-}

#convert to lowercase
SLIDES=${SLIDES,,}

#if path provided extract the basename from the path to save images in directory of the script
SLIDES=$(basename $SLIDES)

#convert PDF into series of png images
convert -density 300 "$PDF" -quality 100
$SLIDES