#
# To run the demos when linked with a shared library (default) ensure that
# libcrypto and libssl are on the library path. For example:
#
#    LD_LIBRARY_PATH=../.. ./sslecho

TESTS = sslecho

CFLAGS  = -g -Wall
LDFLAGS =
LDLIBS  = -lssl -lcrypto

all: $(TESTS)

sslecho: main.o

$(TESTS):
	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $< $(LDLIBS)

clean:
	$(RM) $(TESTS) *.o
