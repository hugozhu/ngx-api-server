CLUSTER=

#commands
ECHO=echo -e
ifeq "`uname | grep Darwin | wc -l`" "1"
ECHO=echo
endif
LUA=bin/code_gen.lua app.config.base

all: conf tmp conf/nginx.conf


tmp:
	mkdir tmp
	mkdir tmp/logs

conf:
	mkdir conf

conf/nginx.conf: app/config/*.lua templates/conf/*.conf
	@TPLS=`find templates -type f | grep -e .conf$$`;\
	for file in $$TPLS ; do \
		output=`echo $$file | cut -c 11-`;\
		$(ECHO) "\033[31m$$file \033[0m-> \033[32m$$output\033[0m";\
		$(LUA) < $$file > $$output;\
	done

#重新启动nginx
restart: all
	@bin/restart_nginx.sh

#删除生成的文件
.PHONY : clean
clean:
	@rm -rf conf;

#生成开发环境的配置
dev: LUA+= app.config.dev
dev: all

#生成测试环境的配置
test: LUA+= app.config.dev app.config.test
test: all

#生成生产环境的配置
cm4: LUA+= app.config.cm4
cm4: all
