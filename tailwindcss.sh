#!/bin/bash
echo "💡 Welcome to Tailwind Starter 💡"
echo ""

sleep 2

echo "👉 Downloading The Project..."

sleep 2

curl -L -O https://github.com/ZarifSoftware/TailwindStarter/archive/master.zip > /dev/null 2>&1
sleep 3

echo "👉 Extracting The Project..."

sleep 2

unzip_path=$(which unzip)
if [ $unzip_path == '' ]
then
    echo "⚠ Unzip is not installed, Installing it first"
    sudo apt install unzip
fi

unzip master.zip > /dev/null 2>&1

sleep 2

if [ $1 == '.' ]
then
    mv ./TailwindStarter-master/* ./
    rm -R TailwindStarter-master
    rm master.zip
else
    mv ./TailwindStarter-master ./$1
    rm master.zip
    cd ./$1
fi

sleep 3

echo "👉 Installing Node Modules..."


npm i > /dev/null 2>&1


sleep 2

echo ""
echo "🙏 Thanks for using this script 🙏"

sleep 1

if [ $1 == '.' ]
then
    echo "👉 Run this command for build the TailwindCSS"
    echo "> npm run build"
else
    echo "👉 Run these commands for build the TailwindCSS"
    echo "> cd $1"
    echo "> npm run build"
fi