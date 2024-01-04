
isDirectory() {
    if [ -d $1 ]; then
        return 0
    else
        return 1
    fi

}

isExistPathOnConfig() {
#if test -f $1 $2; then
        while read -r line; do
         if echo "$line" | grep -qE '^[0-9]+$'; then
          continue
         fi
         #if [ -e $line ];then
            if [ "$line" == "$2" ]; then
              return 1
              echo "Your path is already exist!"
            fi
         #else
           #echo $line ""
##         fi
      done < "$1"
return 0
#fi

}

echo "Ok, please give me your directions:"
    read directoryPath
    if isDirectory "$directoryPath"; then
      if isExistPathOnConfig $1 $directoryPath; then
        echo "$directoryPath" >> $1
        touch "$directoryPath/size.txt"
        echo $(du -sb "$directoryPath" | cut -f1) > "./$directoryPath/size.txt"
        echo "Registration was successful"
      else
        echo "Your path is already exist!"
      fi
    else
      echo "Please make sure the path is available"
    fi
