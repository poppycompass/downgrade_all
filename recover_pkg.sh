#!/bin/sh


if [ $# -ne 1 ]; then
  echo "Usage: ./prog <pkg>.list"
  exit
fi

echo "Recover from $1"
echo "Please wait..."

while read line
do
  yes | sudo pacman -U ${line}
done <$1

echo "Done!"
