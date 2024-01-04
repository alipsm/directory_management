configFile=$1
i=0

if test -f $configFile; then
  while read -r line; do
    if echo "$line" | grep -qE '^[0-9]+$'; then
       continue;
    fi
    i=$((i + 1))
    echo $i"- $line"
  done < $configFile
fi
