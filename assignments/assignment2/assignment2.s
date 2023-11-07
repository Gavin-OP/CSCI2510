    .section  .rodata
    .align    3 # 2^3=8
error_msg:
    .string   "pow(%ld, %ld) got %ld expected %ld\n"

    .text
    .align 1
    .globl pow
    .type  pow, @function

pow:
    # long pow(long base, long exponent)
    # Here, you should implement the PROLOGUE for calling pow()
    # reference lines of code: 4
    ### YOUR CODE HERE
    addi  sp,sp,-48         # move stack pointer up for 6 words, ra, s0, base, exponent, alignment
    sd    ra,40(sp)         # save return address
    sd    s0,32(sp)         # save s0, old frame pointer
    addi  s0,sp,48          # set new frame pointer
    
    # Here, you are recommended to store two variables (base & exponent) 
    # in proper place of the stack
    # reference lines of code: 2
    ### YOUR CODE HERE
    sd   a0,-32(s0)         # store parameter from caller, base
    sd   a1,-24(s0)         # store parameter from caller, exponent
    
    bne   a1,zero,pow_nonzero_exp

pow_zero_exp:
    # Here corresponds to the branch condition that current exponent is zero.
    # You can refer to the Line 5 of C code example.
    # Note: Here is the end of recursion and should return a value.
    # reference lines of code: 1
    ### YOUR CODE HERE
    li    a0,1              # a0 is originally used to store parameter from caller, base
                            # now it is used to store return value 1

    j     pow_return

pow_nonzero_exp:
    # Here corresponds to the branch condition that current exponent is not zero.
    # Calculate pow(base, exponent / 2)
    # And then branch to pow_even or pow_odd according to the value of (exponent/2)
    # reference lines of code: 5
    ### YOUR CODE HERE
    srai  a1,a1,1           # a1 = exponent / 2
                            # a1 is originally used to store parameter from caller, exponent
    call  pow               # calculate pow(base, exponent / 2)
    ld    a1,-24(s0)        # load exponent from caller
    srai  a2,a1,1           # a2 = exponent / 2
    slli  a2,a2,1           # a2 = a2 * 2
    sub   a1,a1,a2          # a2 = exponent - (exponent / 2) * 2

    beq   a1,zero,pow_even

pow_odd:
    # Here corresponds to the Line 9 of C code example.
    # reference lines of code: 3
    ### YOUR CODE HERE
    mul   a0,a0,a0          # a0 = half * half
    ld    a1,-32(s0)        # load base from caller
    mul   a0,a0,a1          # a0 = half * half * base
    
    j     pow_return

pow_even:
    # Here corresponds to the Line 11 of C code example.
    # reference lines of code: 1
    ### YOUR CODE HERE
    mul   a0,a0,a0          # a0 = half * half

pow_return:
    # Here, you should implement the EPILOGUE for calling pow()
    # reference lines of code: 4
    ### YOUR CODE HERE
    ld    ra,40(sp)         # restore return address
    ld    s0,32(sp)         # restore s0, old frame pointer
    addi  sp,sp,48          # move stack pointer down for 5 words, delete ra, s0, base, exponent, alignment
    jr    ra                # return to caller

    .size pow, .-pow


    .align 1
    .globl check
    .type  check, @function
check:
    # void check(long base, long exponent, long expected);
    addi  sp,sp,-64
    sd    ra,56(sp)
    sd    s0,48(sp)
    addi  s0,sp,64
    sd    a0,-40(s0) # base
    sd    a1,-48(s0) # exponent
    sd    a2,-56(s0) # expected
    call  pow
    sd    a0,-24(s0)
    lui   a5,%hi(stderr)
    ld    a0,%lo(stderr)(a5)
    ld    a5,-56(s0) # expected
    ld    a4,-24(s0) # pow result
    ld    a3,-48(s0) # exponent
    ld    a2,-40(s0) # base
    lui   a1,%hi(error_msg)
    addi  a1,a1,%lo(error_msg)
    call  fprintf
    ld    a0,-24(s0)
    ld    a5,-56(s0)
    beq   a0,a5,check_ok
check_fail:
    li    a0,-1
    call  exit # will not return
check_ok:
    ld    ra,56(sp)
    ld    s0,48(sp)
    addi  sp,sp,64
    jr    ra
    .size check, .-check


    .align 1
    .globl main
    .type  main, @function
main:
    addi  sp,sp,-16
    sd    ra,8(sp)
    sd    s0,0(sp)
    addi  s0,sp,16

    # check whether pow(2, 5) gives 32
    li    a2,32
    li    a1,5
    li    a0,2
    call  check
    # more test cases ...
    li    a2,27
    li    a1,3
    li    a0,3
    call  check

    li    a2,387420489
    li    a1,18
    li    a0,3
    call  check

    li    a5,0
    mv    a0,a5
    ld    ra,8(sp)
    ld    s0,0(sp)
    addi  sp,sp,16
    jr    ra
    .size    main, .-main



