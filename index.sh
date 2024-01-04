echo "Please enter your config file path:"
read configPath

isExistConfigFile() {
    if [ -f $1 ]; then
        return 0
    else
        return 1
    fi
}

isTxtFile() {
    if [[ "$1" == *".txt" ]]; then
        return 1
    else
        return 0
    fi
}

if isExistConfigFile $configPath; then
    echo "exist"
else
   if isTxtFile $configPath; then
     echo "Your config file must be ./txt format. (forexample:./config.txt)"
     exit 
   fi
    echo "Your path is not exist, do you like create config file in this path? (yes,no)"
    read accessToCreateConfFile
    
    if [ $accessToCreateConfFile == "yes" ];then
         touch $configPath
         echo "2000" > $configPath
    else
         exit
    fi
fi
clear
./menu.sh
read getMenuOption

while [ ! -z $getMenuOption ]
do

case $getMenuOption in "1")
    ./modules/registerPath.sh $configPath
    ;;
"2")
    ./modules/showConfigPathContent.sh $configPath
    ;;
"3")
   ./modules/getDirectorySize.sh $configPath
    ;;
"4")
   ./modules/checkSensitivityValue.sh $configPath
   ;;
"5")
   ./modules/changeTheFileSizeSensitivity.sh $configPath
    ;;
"6")
   ./modules/removeItemByIndex.sh $configPath
   ;;
"0")
    exit
    ;;
esac

echo "---------- End of operation ----------"
read getMenuOption
done
