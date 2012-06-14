
all: niftest.so niftest.beam

clean:
	rm -f niftest.so niftest.beam

niftest.so:
	gcc -fPIC -shared -o niftest.so niftest.c -I $(ERL_TOP)/usr/include/ -I $(ERL_ROOT)/usr/include/ -I $(ERL_HOME)/usr/include/

%.beam: %.erl
	erlc $<
