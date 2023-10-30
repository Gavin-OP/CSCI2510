.section .data
	array_size: .word 4
	array: .word 1, 2, 3, 4

.section .text
.global main
main:
	li t0, 25		# immediate mode

	add t2, t1, t0	# register mode
	
	li t0, 0x0000000000012004
	lw t1, (t0)		# absolute mode & indirect mode

	la t0, array
	lw t1, (t0)		# register indirect mode

	la t0, array
	lw t1, 4(t0)	# index mode

	la t0, array
	add t0, t0, 4
	lw t1, (t0)		# base with index mode
