#!/bin/bash

nginx='/usr/local/openresty/nginx/sbin/nginx'
$nginx -p `pwd`/tmp/ -c `pwd`/conf/nginx.conf -s stop
$nginx -p `pwd`/tmp/ -c `pwd`/conf/nginx.conf
