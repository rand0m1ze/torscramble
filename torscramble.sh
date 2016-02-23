#!/bin/bash
 [[ `id -u` -eq 0 ]] || { echo -e "Must be root to run script"; exit 1; }
resize -s 20 60
clear                                   # Clear the screen.
SERVICE=service;

if ps ax | grep -v grep | grep tor-service-defaults-torrc > /dev/null
then
    echo -e "TOR is running!\e[97m"
else
    echo -e "$SERVICE is not running... starting TOR\e[97m" 
sudo service tor start &>/dev/null
echo -e "Starting TOR / Please wait..."
echo -ne '#####                     (33%)\r'
sleep 3
echo -ne '#############             (66%)\r'
sleep 3
echo -ne '#######################   (100%)\r'
echo -ne '\n'
fi
cat << "EOF"
 ____ ____ ____ ____ ____ ____ ____ ____ ____ 
||S |||c |||r |||a |||m |||b |||l |||e |||r ||
||__|||__|||__|||__|||__|||__|||__|||__|||__||
|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|/__\|   
EOF
echo -e "\e[31m--------------------------------------------------------"
echo -e "\E[1;33m::::: \e[97mTOR Identity randomizer \E[1;33m:::::\e[97m github.com/rand0m1ze \e[31m"
read -p 'Set time in minutes to change IP "example" 1m, 10m, 25m: ' uservar
echo -e "\E[1;33m::::: \e[97mChanging TOR identity every $uservar \E[1;33m:::::\e[31m"
for n in {1..50}; do service tor reload && sleep $uservar; done
echo -e "\E[1;33m::::: \e[97mHave a nice day \E[1;33m:::::\e[31m"


