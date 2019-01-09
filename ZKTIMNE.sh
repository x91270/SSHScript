#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
#选择要进行的操作?
echo "==========================="
#echo "当前时间: ${DateTime}"
read -p "请输入签到用户(默认用户ID 1): " UserID
if [ "${UserID}" = "" ]; then
UserID=1
fi
echo "签到用户: ${UserID}"
#Echo_Yellow "请输入签到的时间"
read -p "请输入签到的时间(默认当前时间): " DateTime
if [ "${DateTime}" = "" ]; then
DateTime=$(date '+%Y-%m-%dT%H:%M:%S')
fi
echo "签到时间: ${DateTime}"
sqlite3_mips ZKDB.db "INSERT INTO ATT_LOG VALUES (null,'${UserID}',15,'${DateTime}','0','0',null,null,null,null,0);"
echo "用户编号 ${UserID} 签到数据插入"
sqlite3_mips ZKDB.db "SELECT * FROM ATT_LOG WHERE User_PIN = '${UserID}' ORDER BY ID DESC LIMIT 0,1;"
sqlite3_mips ZKDB.db ".quit"
