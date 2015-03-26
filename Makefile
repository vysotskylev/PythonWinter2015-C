CFLAGS+=-I/usr/include/python2.7 -g -O0
LDLIBS+=-lpython2.7

GENERATED=str *.so

all:	str repeat.so

clean:
	rm -f $(GENERATED) *.o

test:	all
	valgrind ./str qwert 1 3 4
	valgrind python testrepeat.py

repeat.so: repeat.c
	$(CC) $< $(CFLAGS) -o $@ -shared -fPIC $(LDFLAGS) $(LDLIBS)
