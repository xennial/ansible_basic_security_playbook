#!/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do
   # Extract path to file
   filetoexclude=$(echo "$line" | awk -F ":" '{print $2}')
   # Update string that contains path to file with escape slashes:
   filetoexclude=$(echo "$filetoexclude" | sed 's#/#\\\/#g')
   # Remove whitespace
   filetoexclude=$(echo "$filetoexclude" | sed 's/ //g')
   # Finally comment out line where there is a match
   sed -i "/$filetoexclude/s/^/#/g" /etc/tripwire/twpol.txt
done < "$1"