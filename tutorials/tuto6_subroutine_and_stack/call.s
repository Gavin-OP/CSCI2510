	.file	"call.c"
	.option nopic
	.attribute arch, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	1
	.globl	g
	.type	g, @function
g:
	addi	sp,sp,-32
	sd	s0,24(sp)
	addi	s0,sp,32
	sd	a0,-24(s0)
	sd	a1,-32(s0)
	ld	a4,-24(s0)
	ld	a5,-32(s0)
	mul	a5,a4,a5
	mv	a0,a5
	ld	s0,24(sp)
	addi	sp,sp,32
	jr	ra  # return
	.size	g, .-g
	.align	1
	.globl	f
	.type	f, @function
f:
	addi	sp,sp,-64
	sd	ra,56(sp)
	sd	s0,48(sp)
	addi	s0,sp,64
	sd	a0,-40(s0)
	sd	a1,-48(s0)
	sd	a2,-56(s0)
	li	a1,2
	ld	a0,-40(s0)
	call	g   # call g
	sd	a0,-24(s0)
	li	a1,5
	ld	a0,-48(s0)
	call	g   # call g
	sd	a0,-32(s0)
	ld	a4,-24(s0)
	ld	a5,-32(s0)
	add	a5,a4,a5
	mv	a0,a5
	ld	ra,56(sp)
	ld	s0,48(sp)
	addi	sp,sp,64
	jr	ra  # return
	.size	f, .-f
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-32
	sd	ra,24(sp)
	sd	s0,16(sp)
	addi	s0,sp,32
	li	a2,1
	li	a1,23
	li	a0,20
	call	f   # call f
	sd	a0,-24(s0)
	li	a5,0
	mv	a0,a5
	ld	ra,24(sp)
	ld	s0,16(sp)
	addi	sp,sp,32
	jr	ra
	.size	main, .-main
	.ident	"GCC: (GNU) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
