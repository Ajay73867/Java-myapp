#!/bin/bash
#printing even numbers using while

var=2
while [ $var -le 100 ]
do
var=$((var+2))
echo "$var" 
done

var=1
while [ $var -le 15 ]
do
var=$((var+2))
echo "$var" 
done

var=1
until [ $var -le 15 ]
do
var=$((var+2))
echo "$var" 
done


##########################################################################
#Printing even numbers using for condition

for ((var=2; var<=50; var+=2))
do
echo "$var"
done


Likewise :
var++ or var+=1     -> will increment the value +1 to variable
var+=2              -> will increment the value +2 to variable

Likewise :
seq 1 100 			-> provide incrimental value by default 1
seq 1 3 100			-> provide incrimental value by 3


##########################################################################

for i in {1..100};
do 
if (( '$i % 3' == 0 ))
then 
echo "$i"
fi
done

##########################################################################

Q1: Write a script to check if a number is even or odd.

#!/bin/bash

echo "Please enter the number"
read num
#######################num=${number}

if (( ${num} % 2 == 0 ))
then 
        echo "$num even number"
else
        echo "$num odd number"
fi

##########################################################################

Q2: Write a script to check if a file exists and is readable.

#finding file or something related to ti we can write in [] 
# + = % / all these kind of arthametic conditions are written in (()) and also () will not work as it will treat as shell and tries to execute cmmand so keep (())

[] --> does not treat values in side as string so we need to mention them in "$in"
always use - -ge, -gt or -le, -lt -eq etc..

(()) --> where we can use arthematic symbols as above



#!/bin/bash

echo "Please enter full file name: "
read file

var="/home/ubuntu"

if [ -d $var ]
then
        echo "directory exist.."
        cd $var
        if [ -f $var/$file ] && [ -r $var/$file ]
        then 
                echo "File exist and readable"

        else
                echo "unable to find or read file"
        fi
else
        echo "unable to find directory"
fi

##########################################################################

Q3: Write a script to print numbers from 1 to 100 that are divisible by 5.


#!/bin/bash

for i in {1..100}
do 
        if (( i % 5 == 0))
        then
                echo "below are divisible numbers by 5"
                echo $i
        fi
done



##########################################################################

Q4: Write a script to count the number of lines, words, and characters in a file.

#!/bin/bash

echo "Please enter file name"
read file

if [ -f "$file" ]
then
        lines=$( wc -l < "$file" )
        words=$( wc -w < "$file" )
        chars=$( wc -c < "$file" )
#else
        echo "line:$lines; words:$words; chars:$chars"
fi

##########################################################################

Q5: Write a script to find the top 10 largest files in a directory.


#!/bin/bash

var=/home/ubuntu/

if [ -d $var ]
then
        cd $var
        echo "Switched to directory where to list and sort the files"
        ls -lp | grep -v / | sort -rh | head -10
fi





Command	Function
sort file.txt	Sorts text alphabetically
sort -r file.txt	Reverse sorting
sort -n file.txt	Sorts numbers
sort -h file.txt	Sorts human-readable sizes (KB, MB, GB)
sort -u file.txt	Removes duplicates while sorting
sort -k2 file.txt	Sorts by the 2nd column
ls -lSh	Sorts files by size
ls -lt	Sorts files by modification time
sort file.txt	Sorts text alphabetically
sort -r file.txt	Reverse sorting
grep -v / - ignore to print or pass where ever it see
ls -l - list by sizes
ls -p - add / to directories


##########################################################################

Q7: Write a script to back up a directory to another location using tar.


#!/bin/bash

source="/home/ubuntu/seq.sh"
dest="/home/ubuntu/backup_scripts"
backupfile="$(date +%Y_%m_%d_%H_%M_%S).tar.gz"

tar -czf "$dest/$backupfile" "$source" 2>/dev/null

if [ $? -eq 0 ]
then
        echo "Backup successfull"
else
        echo "Backup failed"
fi


tar -xvzf filename.tar  -> to untar the file


##########################################################################


find /path/ -type f -mtime 7	Find files modified exactly 7 days ago
find /path/ -type f -mtime -7	Find files modified in the last 7 days
find /path/ -type f -mtime +30	Find files modified more than 30 days ago
find /path/ -type f -mtime +60 -delete	Delete files older than 60 days
find /path/ -type f -mtime -7 -exec tar -cvf backup.tar {} +	Backup files modified in the last 7 days
find /path/ -type d -mtime -3	Find directories modified in the last 3 days

##########################################################################



Delete files older than 7days in the direcotry :

find /home/ubuntu/ -type f -mtime +7 -exec rm {} \;


Arguments passing script :

Parameter	Description
$0	Script name
$1, $2, …	First, second, … arguments
$#	Number of arguments passed
$@	All arguments as separate values
$*	All arguments as a single string
"$@"	Preserves spaces in arguments
$?	Exit status of the last command



while running the script we need to pass the arguments so that args we passed will be replaced with the values we passed while running script.


if [ $# -eq 0 ]; then
            echo "No arguments provided. Exiting..."
                exit 1
fi

echo "You provided $# You provided: $@"

Run : ./test.sh hello world

output : You provided 2 You provided: hello world


##########################################################################

Example for listing all argumrnts using $@ :

#!/bin/bash

echo "Running command: ls -l $@"
ls -l "$@"

Run : ./script.sh /etc /var

Output:
Lists both /etc and /var.


##########################################################################






