; Hello_World.asm

;Author: Michele Ghirardelli
;Date 30/10/2020
;Created the object file -> nasm -f elf32 -o hello_world.o Hello_World.asm
;Created the executable -> ld -m elf_i386 -o hello_world hello_world.o

global _start

section .text:

_start:
        mov eax, 0x4            ;Use the write syscall
        mov ebx, 1              ;Use stdout as a file descriptor
        mov ecx, message        ;Use the message as the buffer
        mov edx, message_length ;And supply the message with the length
        int 0x80                ;Interrupt on 0x80 that's actually the screen

        ;Now we exit

        mov eax, 0x1
        mov ebx, 0
        int 0x80

section .data:
        message: db "Hello World!", 0xA ; 0xA correspond to \n
        message_length equ $-message
