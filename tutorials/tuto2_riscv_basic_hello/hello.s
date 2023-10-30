.section .data
hello: .asciz "Hello, CSCI 2510!\n"

.section .text
.globl main
main:
    # write syscall
    li a7, 64          # syscall number for write
    li a0, 1           # file descriptor 1 is stdout
    la a1, hello       # pointer to message
    li a2, 18          # length of message
    ecall              # make the syscall

    # exit syscall
    li a7, 93          # syscall number for exit
    li a0, 0           # exit status
    ecall              # make the syscall

