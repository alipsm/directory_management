echo "Please enter the desired volume"
read sensitivityValue

if echo "$sensitivityValue" | grep -qE '^[0-9]+$'; then
    sed -i "1s/.*/$sensitivityValue/" ./config.txt
    echo "The sensitivity of the files was successfully changed"
else
    echo "Error: Please enter a numeric value"
fi
