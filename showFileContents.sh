fileData=$1
i=0
echo "start in " $fileData
if test -f $fileData; then
    while read -r line; do
        ## skip my size option
        if echo "$line" | grep -qE '^[0-9]+$'; then
            continue
            echo "Error: Please enter a numeric value"
        fi
        i=$((i + 1))
        echo $i".""$line"
    done <$fileData
fi
