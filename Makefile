all: conf/nginx.conf

conf/nginx.conf: app/global.lua templates/conf/*.conf
	@TPLS=`find templates -type f | grep -e .conf$$`;\
	for file in $$TPLS ; do \
		output=`echo $$file | cut -c 11-`;\
		echo "\033[31m$$file \033[0m-> \033[32m$$output\033[0m";\
		bin/code_gen.lua < $$file > $$output;\
	done

restart: tmp/logs/nginx.pid
	@bin/restart_nginx.sh

.PHONY : clean
clean:
	@rm -rf conf/*.conf
