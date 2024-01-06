echo "Write you index for remove:"
./modules/showConfigPathContent.sh $1
read index

index=$((index + 1))

if [ $index -gt 0 ] && [ $(wc -l < "$1") -ge $index ]; then
    sed -i "${index}d" "$1"
    echo "Removal successful"
else
    echo "Error: Please select a correct index"
fi
