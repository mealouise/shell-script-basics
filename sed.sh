#! /bin/bash

#echo 'emma is the assistant regional manager.' > manager.txt
#cat manager.txt

#substitute - find word and replace but only in command line, not in the txt file and case sensitive
#sed 's/assistant/assistant to the/' manager.txt

#echo "I love chocolate" > love.txt
#ignore case
#sed 's/CHOCOLATE/sed/i' love.txt

#new lines appended to existing file
#echo "this is line 2" >> love.txt
#echo "I'm a big fan of chocolate" >> love.txt
#cat love.txt

#sed 's/chocolate/sweets/' love.txt

#echo "I'm obssessed with chocolate and chocolate is the best. Chocolate tastes nice" >> love.txt
#sed 's/chocolate/sweets/' love.txt
#will replace all occurences of a word
#sed 's/chocolate/sweets/g' love.txt

#will replace 2nd occurence of word on a line
#sed 's/chocolate/sweets/2' love.txt

#new file redirected with altered txt
#sed 's/chocolate/sweets/g' love.txt > new-love.txt

#create backup
#sed -i.bak 's/chocolate/sweets/' love.txt

#new file only contains lines were the word replacement were performed
#only save file where word matches were made - love.txt is the file for input
#sed 's/chocolate/sweets/gw like.txt' love.txt

echo '/home/emma'

#escape forward slashes with delimitor
#echo '/home/emma' | sed 's?/\/home\/emma/\/export\/users\/emmac/'
#can use any character for the delimitor
echo '/home/emma' | sed 's#/home/emma#/export/users/emmac#'
echo '/home/emma' | sed 's:/home/emma:/export/users/emmac:'

sed '/this/d' love.txt

echo '#User to run service as.' > config
echo 'User apache' >> config
echo >> config
echo '#Group to run service as.' >> config
echo 'Group apache' >> config
cat config

#remove comments from config
sed '/^#/d' config

#remove blank lines from config
sed '/^$/d' config

#use multiple delete sed commands seperate with ;
sed '/^#/d ; /^$/d' config

#use multipe sed commands to replace and delete
sed '/^#/d ; /^$/d ; s/apache/httpd/' config 
sed -e '/^#/d' ; -e '/^$/d' ; -e 's/apache/httpd/' config

#specify file containing sed commands
echo '/^#/d' > script.sed
echo '/^$/d' >> script.sed
echo 's/apache/httpd/' >> script.sed
cat script.sed

#specify path as input
sed -f script.sed config

#addresses - command will only run on line 2
sed '2 s/apache/httpd/' config

#will change apache to httpd but only on lines that contain word group
sed '/Group/ s/apache/httpd/' config

#specify a range - eg lines 1-3
sed '1,3 s/run/execute/' config

#regular expression instead of line number - line starts with #User and ends next blank line
sed '/#User/,/^$/ s/run/execute/' config