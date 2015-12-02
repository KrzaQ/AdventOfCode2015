#SPL = $(SPL)
#SPL_LIB = $(SPL_LIB)
#SPL_INCLUDE = $(SPL_INCLUDE)

CC = gcc

all: run

run: binary data.txt
	echo `./day01_01_spl < data.txt`
	echo `./day01_02_spl < data.txt`

binary: day01_01_spl.c day01_02_spl.c
	$(CC) day01_01_spl.c $(CFLAGS) -L $(SPL_LIB) -lm -lspl -I $(SPL_INCLUDE) -o day01_01_spl
	$(CC) day01_02_spl.c $(CFLAGS) -L $(SPL_LIB) -lm -lspl -I $(SPL_INCLUDE) -o day01_02_spl

day01_01_spl.c: day01_01_spl.spl
	$(SPL) < day01_01_spl.spl > day01_01_spl.c

day01_02_spl.c: day01_02_spl.spl
	$(SPL) < day01_02_spl.spl > day01_02_spl.c

clean:
	rm day01_01_spl.c
	rm day01_01_spl
	rm day01_02_spl.c
	rm day01_02_spl

