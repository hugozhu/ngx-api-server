#!/bin/bash
echo "Clean log files!"
rm tmp/logs/*.log
echo "Restart Nginx!"
bin/restart_nginx.sh
ps -ef |grep nginx|grep worker
echo "Nginx is now started!"
