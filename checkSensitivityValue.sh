fileData=$1

sensitivityValue=0

if test -f $fileData; then
    while read -r line; do
        ## skip my size option
        if echo "$line" | grep -qE '^[0-9]+$'; then
            sensitivityValue=$line
            echo "Your sensitivity value is: $sensitivityValue"
            echo $'\n Your file status=>'
            continue
        fi
        if [ -d $line ]; then
        dir_size=$(du -s -b "$line" | cut -f1)
            if [ $dir_size -gt "$sensitivityValue" ]; then
                echo "$line ($dir_size): The file size is large!"
            else
                echo "$line ($dir_size): Every thing is allright"
            fi
        else
            echo $line "Not Found!"
        fi
    done <$fileData
fi
