.section .data

.section .text
.globl main
main:
	li a0, 5 # store 5 (as length) in a0
	li a1, 10 # store 10 (as breadth) in a1
	mul a2, a1, a0 # Calculate the area and store it in a2
	add a4, a1, a0 # add length and breadth
	li a3, 2
	mul a3, a3, a4 # Calculate the perimeter and store it in a3
