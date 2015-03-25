CFLAGS+=-I/usr/include/python2.7
LDLIBS+=-lpython2.7
GENERATED=str

all:	str

clean:
	rm -f $(GENERATED) *.o
