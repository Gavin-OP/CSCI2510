.section .data
.section .text
.globl main
main:
    li a0, 5 # store 5 in a0
    li a1, 10 # store 10 in a1 
    ### ONE LINE CODE HERE, call the swap function    
	call swap
    # back to here
    ### ONE LINE CODE HERE, jump to exit that prints the result
	j exit

swap:
    mv a2, a0 # store the value in a0 to a2
    mv a0, a1 # store the value in a1 to a0
    mv a1, a2 # store the value in a2 to a1
    ### ONE LINE CODE HERE, end of function swap and return to main
	jr ra

exit:
    # exit syscall
    li a7, 93          # syscall number for exit
    li a0, 0           # exit status
    ecall              # make the syscall

