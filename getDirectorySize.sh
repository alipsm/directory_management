fileData=$1
if test -f $fileData; then
    while read -r line; do
        ## skip my size option
        if echo "$line" | grep -qE '^[0-9]+$'; then
            continue
            echo "Error: Please enter a numeric value"
        fi
        if [ -d $line ]; then
            touch $line/size.txt
            echo $(du -s -b "$line" | cut -f1) >"./$line/size.txt"
        else
            echo $line "Not Found!"
        fi
    done <$fileData
fi
