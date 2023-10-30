.section .data
.section .text
.global main
main:
	li t0, 25
	li t1, 35

	bge t0, t1, branch1
	
	blt t0, t1, branch2

branch1:
	add t2, t1, t0
	
branch2:
	sub t2, t1, t0
