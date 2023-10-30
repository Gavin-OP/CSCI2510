.section .data

.section .text
.globl main
main:
	li a0, 5 # store 5 in a0
	li a1, 10 # store 10 in a1
	mv a2, a0 # store the value in a0 to a2
	mv a0, a1 # store the value in a1 to a0
	mv a1, a2 # store the value in a2 to a1
