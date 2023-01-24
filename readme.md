# useful linux commands

echo $TMPDIR
open $TMPDIR
df - disk filesystem to get full summary of available and used disk space usage of the file system
-c - count
-w - timeout
grep - searches for patterns in each file
uptime - how long system running with current time, number of users with running sessions and system load averages
-x - debugging turned on
+x - debugging turned off
-e - exit on error (none 0 exit status)
-v - prints shell input lines as they are read
-vx - how it looks and is executed
help set - options for debugging

# root directory
cd /

# move file to tmp directory
mv -v sleepwalkingserver.sh /tmp

# check last exit code
echo $?

# extra info
READ command used to read a line of data and split it into fields. The line is split into fields using word splitting rules
The first word is assigned to the first variable supplied to the "read" command,
the second word to the second variable and so on with any leftover words assigned to the last variable

BREAK command used to exit 'for', 'while', 'until' loop
CONTINUE command resumes 'for', 'while', 'until' loop