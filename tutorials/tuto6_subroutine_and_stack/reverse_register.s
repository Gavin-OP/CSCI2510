# ------------- solution 1 ----------------
# save all registers to stack
addi sp, sp, -8     # stack pointer move up for one word
sd a1, 0(sp)        # save a1 to stack

addi sp, sp, -8     # stack pointer move up for one word
sd a2, 0(sp)        # save a2 to stack

addi sp, sp, -8     # stack pointer move up for one word
sd a3, 0(sp)        # save a3 to stack

addi sp, sp, -8     # stack pointer move up for one word
sd a4, 0(sp)        # save a4 to stack

addi sp, sp, -8     # stack pointer move up for one word
sd a5, 0(sp)        # save a5 to stack


# read the elements in the stack in registers
ld a1, 0(sp)    # read a1 from stack
addi sp, sp, 8  # stack pointer move down for one word

ld a2, 0(sp)    # read a2 from stack
addi sp, sp, 8  # stack pointer move down for one word

ld a3, 0(sp)    # read a3 from stack
addi sp, sp, 8  # stack pointer move down for one word

ld a4, 0(sp)    # read a4 from stack
addi sp, sp, 8  # stack pointer move down for one word

ld a5, 0(sp)    # read a5 from stack
addi sp, sp, 8  # stack pointer move down for one word





# ------------- solution 2 ----------------
# save all registers to stack
addi, sp, sp, -40   # stack pointer move up for 5 words
sd a1, 32(sp)       # save a1 to stack
sd a2, 24(sp)       # save a2 to stack
sd a3, 16(sp)       # save a3 to stack
sd a4, 8(sp)        # save a4 to stack
sd a5, 0(sp)        # save a5 to stack

# read the elements in the stack in registers
ld a1, 0(sp)    # read a1 from stack
ld a2, 8(sp)    # read a2 from stack
ld a3, 16(sp)   # read a3 from stack
ld a4, 24(sp)   # read a4 from stack
ld a5, 32(sp)   # read a5 from stack
addi sp, sp, 40 # stack pointer move down for 5 words


