echo "Write you index for remove:"
read index
sed -i $index"d" ./config.txt
echo "Remove success full"