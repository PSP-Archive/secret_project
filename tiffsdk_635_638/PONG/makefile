PSPSDK=$(shell psp-config --pspsdk-path)
PSPDEV=$(shell psp-config --pspdev-path)
INCLUDE=$(PSPSDK)/include

CC       = psp-gcc
CFLAGS   := -D PSP -I $(INCLUDE) -W -Wall -O2 -G0 -fno-pic -mno-abicalls -w -fomit-frame-pointer

ASM      = psp-as

all:
	$(PSPDEV)/bin/psp-gcc $(CFLAGS) -S main.c -o main.s
	$(PSPDEV)/bin/psp-as main.s -o main.o
	$(PSPDEV)/bin/psp-ld -T tiff_linker.x main.o -o main.elf
	$(PSPDEV)/bin/psp-strip -s main.elf
	$(PSPDEV)/bin/psp-objcopy -O binary main.elf run.bin

clean:
	rm -rf *~ *.o *.elf *.bin *.s *.bin
 
