CFLAGS+=-I/usr/include/python2.7 -g -O0
LDLIBS+=-lpython2.7

GENERATED=str

all:	str

clean:
	rm -f $(GENERATED) *.o

test:	all
	valgrind ./str qwert 1 3 4
