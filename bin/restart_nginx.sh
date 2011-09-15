#!/bin/sh

nginx='/usr/local/openresty/nginx/sbin/nginx'
if [ -f tmp/logs/nginx.pid ]; then
	$nginx -p `pwd`/tmp/ -c `pwd`/conf/nginx.conf -s stop
else
	ps ax | grep nginx | grep master | awk '{print $1}' | xargs kill  >& /dev/null
fi
$nginx -p `pwd`/tmp/ -c `pwd`/conf/nginx.conf
