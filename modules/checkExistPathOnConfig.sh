configFile=$1
userPath=$2

bool=0

isDirectory() {
    if [ -d $1 ]; then
        return 0
    else
        return 1
    fi

}


if test -f $configFile; then
	while read -r line; do
         if echo "$line" | grep -qE '^[0-9]'+$; then
          continue
         fi
         #if [ -e $line ];then
            if [ $line -eq $userPath ]; then
              bool=1
              echo "Your path is already exist!"
            fi
         #else
           #echo $line ""
##         fi
      done < $configFile

fi

echo $bool
