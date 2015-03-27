CFLAGS+=-I/usr/include/python2.7 -g -O0 -Wall
LDLIBS+=-lpython2.7

GENERATED=str *.so woex

all:	str repeat.so woex

clean:
	rm -f $(GENERATED) *.o

demo:	all
	./str qwert 1 3 4
	python testrepeat.py
	./woex

test:	all
	valgrind ./str qwert 1 3 4
	valgrind python testrepeat.py
	python -c 'import repeat; help(repeat)' | cat

repeat.so: repeat.c
	$(CC) $< $(CFLAGS) -o $@ -shared -fPIC $(LDFLAGS) $(LDLIBS)
