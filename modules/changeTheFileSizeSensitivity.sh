echo "Please enter the desired value:"
configFile=$1
read sensitivityValue


if echo "$sensitivityValue" | grep -qE '^[0-9]+$'; then
   sed -i "1s/.*/$sensitivityValue/" $configFile
   echo "The sensitivity of the files was succeess fully changed"
else 
   echo "Error: please enter a numeric value"
fi 
