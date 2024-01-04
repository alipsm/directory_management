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
            chmod 755 "./$line/size.txt"
            last_size=$(cat "./$line/size.txt")
            dir_size=$(du -sb "$line" | cut -f1)
            if [ $last_size -gt $dir_size ]; then
                difference=$(expr $last_size - $dir_size)
            else
                difference=$(expr $dir_size - $last_size)
            fi
            echo "Difference: $difference"
            if [ $difference -gt "$sensitivityValue" ]; then
                echo "$line (now:$dir_size,last:$last_size,diff:$difference)=> The file size is large!"
            else
                echo "$line (now:$dir_size,last:$last_size,diff:$difference)=> Every thing is allright"
            fi
            echo $(du -sb "$line" | cut -f1) > "./$line/size.txt"
        else
            echo $line "Not Found!"
        fi
    done <$fileData
fi
