CFLAGS+=-std=c99 -I/usr/include/python2.7 -g -O0 -Wall
LDLIBS+=-lpython2.7

GENERATED=str *.so woex woexp.c

all:	list str repeat.so woex woexp.so ftw.so

%.c:	%.pyx
	cython $< -o $@

%.so: %.c
	$(CC) $< $(CFLAGS) -o $@ -shared -fPIC $(LDFLAGS) $(LDLIBS)

clean:
	rm -f $(GENERATED) *.o

demo:	all
	./str qwert 1 3 4
	python testrepeat.py
	./woex
	python testwoexp.py

test_woexp: all
	valgrind python testwoexp.py
test:	all
	valgrind ./str qwert 1 3 4
	valgrind python testrepeat.py
	python -c 'import repeat; print dir(repeat); help(repeat)' | cat
	valgrind python testwoexp.py
	python -c 'import woexp; print dir(woexp); help(woexp)' | cat
