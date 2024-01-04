configFile=$1

if test -f $configFile; then
	while read -r line; do
         if echo "$line" | grep -qE '^[0-9]'+$; then
          continue
         fi
         if [ -e $line ];then
           touch $line/size.txt
           echo $(du -sb "$line" | cut -f1) > "./$line/size.txt"
         else
           echo $line "Not found!"
         fi
      done < $configFile
fi
