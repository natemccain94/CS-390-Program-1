#!/bin/bash
# Nate McCain
# CS 390
# 09/20/2017

# Get the current hour (military time). This is for the time of day conditional statements.
hour=$(date +%H)

# If the user provided their name as an argument and it is morning.
if [ “$1” != “” ] && [ $hour -lt 12 ]; then
echo Good Morning, $1.

# If the user provided their name as an argument and it is after noon.
elif [ “$1” != “” ] && [ $hour -ge 12 ] && [ $hour -lt 17 ]; then
echo Good Afternoon, $1.

# If the user provided their name as an argument and it is the evening.
elif [ “$1” != “” ] && [ $hour -ge 17 ]; then
echo Good Evening, $1.

# If the user did not provide their name as an argument and it is morning.
elif [ “$1” = “” ] && [ $hour -lt 12 ]; then
printf Please\ \enter\ \your\ \first\ \name:\ 
read username
echo Good Morning, $username.

# If the user did not provide their name as an argument and it is after noon.
elif [ “$1” = “” ] && [ $hour -ge 12 ] && [ $hour -lt 17 ]; then
printf Please\ \enter\ \your\ \first\ \name:\ 
read username
echo Good Afternoon, $username.

# If the user did not provide their name as an argument and it is the evening.
else
printf Please\ \enter\ \your\ \first\ \name:\ 
read username
echo Good Evening, $username.
fi

# Output the required date format.
echo Today is $(date +%A): $(date +%B) $(date +%d), $(date +%Y).

# Output how many users are on the current system.
echo There are $(who | wc -l) users on this system today.

# Output the user’s current directory.
echo Your current directory is $(pwd).

# Output the user’s home directory.
echo Your home directory is $HOME, and

# removewhitespace holds the size of the user’s files. It is used as a way to remove the
# unnecessary output from $(du -hs $HOME).
removewhitespace=$(du -hs $HOME)

# Turn removewhitespace into stdin, and the part we want will be in $1.
set -- $removewhitespace

# Output how much space the user’s files are taking up.
echo Your files are using $1 in storage space.