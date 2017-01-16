#!/bin/bash

#Created by Vahid muhammadi

nasm -f elf32 -o start.o start.asm
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o main.o main.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o scrn.o scrn.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o gdt.o gdt.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o idt.o idt.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o isrs.o isrs.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o irq.o irq.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o timer.o timer.c
gcc -m32 -w -Wall -O -fstrength-reduce -fomit-frame-pointer -finline-functions -nostdinc -fno-builtin -I./include -c -o kb.o kb.c
ld -melf_i386 -T link.ld -o kernel.bin start.o main.o scrn.o gdt.o idt.o isrs.o irq.o timer.o kb.o
rm *.o
qemu-system-i386 -kernel kernel.bin
