all:

conf: all
	bin/code_gen.lua < templates/conf/inc_data_source.conf > conf/
