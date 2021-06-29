#!/bin/bash
echo "hello world"
echo -n "hello world"
echo -e "\nhello \tworld"


# special variables
echo "$#"
echo "$@"
echo "$?"
echo "$$"

echo "$USER"
echo "$HOSTNAME"
echo "$SECONDS"
echo "$RANDOM"
echo "$LINENO"

# user defined variables
year=2021
name=$USER

echo -e "hello $name \n"
echo -e "year=$year \n"

# user input
echo "enter your age:"
read -r age
echo "you are $age years old."

# command aguments
echo "total arguments: $#"
echo "username: $1"
echo "age: $2"
echo "full name: $3"

# loops
i=0
while [ $i -le 4 ] 
do
  echo number: $i
  (( i++ ))
done

i=2
for (( counter=1; counter<=10; counter++ )); do
  (( result=i * counter ))
  echo "$i x $counter = $result"
done

# conditional statements
echo -n "enter a number: "
read -r VAR

if [[ $VAR -gt 10 ]]; then
  echo "variable is greater than 10"
elif [[ $VAR -eq 10 ]]; then
  echo "variable is equal to 10"
else
  echo "variable is equal or less than 10"
fi

# function
function sum() {
  echo -n "enter first number:"
  read -r a
  echo -n "enter second number:"
  read -r b
  echo "$a + $b = $(( a + b ))"
}
sum

# string length
str="hello world"
echo "length: ${#str}"

# concatenating strings
str1="hello"
str2="world"
str3=$str1" "$str2
echo "$str3"

# extracting string
echo "${str:5}"
echo "${str:5:3}"

# find and replace string
echo "${str/world/"World!"}"
echo "${str//l/L}"

# check even/odd number
echo -n "enter the number:"
read -r num
number=$( expr "$num" % 2 )
if [ "$number" -eq 0 ]; then
  echo "it is a even number"
else
  echo "it is a odd number"
fi

# generate factorial of number
echo -n "enter number:"
read -r n
fact=1
while [ "$n" -gt 1 ]; do
  fact=$((fact*n))
  n=$((n-1))
done
echo $fact

# creating directories
echo -n "enter directory name->"
read -r dir
if [ -d "$dir" ]; then
  echo "driectory exists"
else
  eval "mkdir $dir"
echo "directory created"
fi

# reading file
file='company.txt'
while read -r line; do
  echo "$line"
done < $file

# deleting files
echo -n "enter filename ->"
read -r name
rm -i "$name"
echo "file deleted"

# print files with line count
for file in *; do
  if [[ -f $file ]]; then
    echo $file: "$(cat "$file" | wc -l)"
  fi
done

# print number of files and folders
if [ -d "$@" ]; then
  echo "file found: $(find "$@" -type f | wc -l)"
  echo "folders found: $(find "$@" -type d | wc -l)"
else 
  echo "[ERROR] please try agin"
  exit 1
fi

# check if user is root
ROOT_UID=0

if [ "$UID" -eq "$ROOT_UID" ]; then
  echo "you are a root user"
else
  echo "you are not a root user"
fi

# send mail using bash
recipient="ben@wizschool.io"
subject="greetings"
message="welcome to my website"
eval mail -s $subject $recipient <<< "$message"

# display server stats
date
echo "uptime:"
uptime
echo "Currently connected:"
w
echo "--------------------"
echo "Last logins:"
last -a | head -3
echo "--------------------"
echo "Disk and memory usage:"
df -h | xargs | awk '{print "Free/total disk: " $11 " / " $9}'
free -m | xargs | awk '{print "Free/total memory: " $17 " / " $8 " MB"}'

# system maintenance
echo -e "\n$(date "+%d-%m-%Y --- %T") ---Starting work\n"

sudo apt-get update
sudo apt-get -y upgrade

sudo apt-get -y autoremove
sudo apt-get autoclean

echo -e "\n$(date "+%T") \t Script Terminated"