#!/bin/bash
#edit by Jon on Win7 by git on rsa key
#edit by Jon on CentOS by git on rsa key
echo "Clean log files!"
rm tmp/logs/*.log

echo "Restart Nginx!"
bin/restart_nginx.sh

ps -ef |grep nginx|grep worker

echo "Nginx is now started!"
