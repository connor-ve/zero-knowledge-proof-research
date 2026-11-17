CC = gcc
CFLAGS = -Wall -O2 -Iinclude
SRC = include/Barretts.c include/multiplier.c include/findK.c include/shifting.c include/subtraction.c

barrett: $(SRC)
	$(CC) $(CFLAGS) -o $@ $(SRC)

clean:
	rm -f barrett barrett.exe *.o include/*.o

.PHONY: clean
