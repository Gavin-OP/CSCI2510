.section .data

.section .text
.global main
main:
	li a0, 5
	li a1, 10
	
	blt a0, a1, swap

	swap:
		mv a2, a0
		mv a0, a1
		mv a1, a2
