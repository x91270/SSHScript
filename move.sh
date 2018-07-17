#!/bin/sh
 
DOWNLOAD=/home/Download  #Aria2  下载目录!
COMPLETE=/home/OneDrive #Google Drive 网盘映射!
LOG=/root/.aria2/mvcompleted.log
SRC=$3

if [ "$2" == "0" ]; then
  echo `date` "INFO  no file to move for" "$1". >> "$LOG"
  exit 0
fi
 
while true; do
  DIR=`dirname "$SRC"`
  if [ "$DIR" == "$DOWNLOAD" ]; then
    echo `date` "INFO " "$SRC" moved as "$SRC". >> "$LOG"
    mv  "$SRC" "$COMPLETE" >> "$LOG" 2>&1
    exit $?
  elif [ "$DIR" == "/" -o "$DIR" == "." ]; then
    echo `date` ERROR "$SRC" not under "$DOWNLOAD". >> "$LOG"
    exit 1
  else
    SRC=$DIR
  fi
done
