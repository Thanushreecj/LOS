#!/bin/bash

echo "Enter the password file name:"
read FILE

if [ ! -f "$FILE" ]; then
  echo "File not found!"
  exit 1
fi

grep -i -E "123|password|admin|qwerty|abc" "$FILE" > weak.txt


awk -F ":" '{print "Username: "$1" | Password: "$2}' weak.txt > report.txt


sed -i '1i Weak Password Report' report.txt


echo "=========== Weak Password Report ==========="
cat report.txt
echo "============================================"
