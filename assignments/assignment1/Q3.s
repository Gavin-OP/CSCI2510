.section .data
	# initialization
	N: .word 8		# a 4B word size integer named N to denote the array size
	LIST: .word 1, 2, 3, 4, 5, 6, 7, 8 		# an array of integers
	SUM: .word 0	# a word size integer named SUM to store the sum of the array


.section .text
.global main
main:
	# main program
	li a0, 0	# counter banchmark is 0
	li a1, 1	# counter decrement is 1
	li a2, 4	# word size is 4B

	# load the array size N into register t0, t0 will serve as counter for loop
	lw t0, N

	# initilize sum to 0, sum is stored in register t1
	lw t1, SUM

	# load the address of the first element of the array into register t2, t2 will serve as a pointer
	la t2, LIST

	# if counter t0 greater than 0, go to branch loop
	bne t0, a0, loop
	
	# if counter t0 is 0, go to branch exit
	beq t0, a0, exit

	loop:
		# load the value of pointer t2 into register t3
		lw t3, (t2)

		# add t3 to sum t1
		add t1, t1, t3

		# increment the pointer by 4
		add t2, t2, a2

		# decrement the counter by 1
		sub t0, t0, a1
		
		# if counter t0 greater than 0, go to branch loop
		bne t0, a0, loop

		# if counter t0 is 0, go to branch exit
		beq t0, a0, exit	

	exit:
		# load the address of sum into register t4
		la t4, SUM

		# store the t1 value into address t4
		sw t1, (t4)

