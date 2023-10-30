.section .data
	# initialization
	array_size: .word 7
	array: .word 8, 7, 6, 5, 4, 3, 2, 1

.section .text
.global main
main:
	# initialization
	li a0, 0			# counter j
	lw a2, array_size	# load array size as a2
	la t0, array		# base address for outer loop
	li a3, 4			# word size
	
	# go to outer loop
	ble a0, a2, outer_loop

	# outer loop
	outer_loop:
		# initialized the counter and pointer for inner_loop 
		li a1, -1 		# counter i
		mv t1, t0		# inner loop pointer
		sub t1, t1, a3 	# inner loop pointer
		add a0, a0, 1	# counter j
		
		# check exit condition
		bgt a0, a2, exit

		# go to inner_loop
		ble a0, a2, inner_loop

	# inner_loop
	inner_loop:
		# initialize the counter and pointer for inner_loop
		add a1, a1, 1	# counter i
		add t1, t1, 4	# pointer for inner loop
		
		# check exit condition
		beq a1, a2, outer_loop

		# go to condition
		blt a1, a2, condition
	
	# condition
	condition:
		# load array[i] and array[i+1]
		lw t2, (t1)		# array[i]
		lw t3, 4(t1)	# array[i+1]		

		# compare array[i] and array[i+1] and go to swap
		bgt t2, t3, swap
		
		# enter next inner_loop
		ble t2, t3, inner_loop
	
	# swap
	swap:
		# swap array[i] and array[i+1]
		sw t3, (t1)
		sw t2, 4(t1)
		
		# enter next inner_loop
		bgt t2, t3, inner_loop

	# exit
	exit:
		# exit program
		li a7, 10 # useless
