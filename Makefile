CC	= gcc
CFLAGS	= $(shell pkg-config --cflags fuse) -DFUSE_USE_VERSION=26 -Os
LDFLAGS	= $(shell pkg-config --libs fuse)

EXEC	= mufs

SRC	= main.c
OBJ	= $(SRC:.c=.o)

all: $(EXEC)

$(EXEC): $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -o $@ -c $<

.PHONY: clean mrproper

clean:
	rm -f $(OBJ)

mrproper: clean
	rm -f $(EXEC)
