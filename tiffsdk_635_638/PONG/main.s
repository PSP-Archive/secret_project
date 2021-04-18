	.file	1 "main.c"
	.section .mdebug.eabi32
	.previous
	.section .gcc_compiled_long32
	.previous
	.text
	.align	2
	.globl	strlen_c
	.set	nomips16
	.ent	strlen_c
strlen_c:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lb	$2,0($4)
	beq	$2,$0,$L9
	move	$3,$4

	addiu	$4,$4,1
$L8:
	lb	$2,0($4)
	bnel	$2,$0,$L8
	addiu	$4,$4,1

	subu	$2,$4,$3
$L9:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	strlen_c
	.size	strlen_c, .-strlen_c
	.align	2
	.globl	getSyscallForFunc
	.set	nomips16
	.ent	getSyscallForFunc
getSyscallForFunc:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$2,4($4)
	j	$31
	ext	$2,$2,6,16

	.set	macro
	.set	reorder
	.end	getSyscallForFunc
	.size	getSyscallForFunc, .-getSyscallForFunc
	.align	2
	.globl	getOpcodeForSyscall
	.set	nomips16
	.ent	getOpcodeForSyscall
getOpcodeForSyscall:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	andi	$2,$4,0xffff
	sll	$2,$2,6
	j	$31
	addiu	$2,$2,12

	.set	macro
	.set	reorder
	.end	getOpcodeForSyscall
	.size	getOpcodeForSyscall, .-getOpcodeForSyscall
	.align	2
	.globl	io_write_string
	.set	nomips16
	.ent	io_write_string
io_write_string:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lb	$3,0($5)
	lui	$2,%hi(sceIoWrite)
	beq	$3,$0,$L15
	lw	$25,%lo(sceIoWrite)($2)

$L18:
	j	$L18
	nop

$L15:
	jr	$25
	move	$6,$0

	.set	macro
	.set	reorder
	.end	io_write_string
	.size	io_write_string, .-io_write_string
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
$LC0:
	.ascii	"0x\000"
	.align	2
$LC1:
	.ascii	"0123456789ABCDEF\000"
	.text
	.align	2
	.globl	io_write_wide_hex
	.set	nomips16
	.ent	io_write_wide_hex
io_write_wide_hex:
	.frame	$sp,40,$31		# vars= 16, regs= 6/0, args= 0, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	sw	$20,32($sp)
	lui	$20,%hi(sceIoWrite)
	lw	$7,%lo(sceIoWrite)($20)
	sw	$16,16($sp)
	move	$16,$5
	lui	$5,%hi($LC0)
	sw	$19,28($sp)
	sw	$18,24($sp)
	sw	$17,20($sp)
	addiu	$5,$5,%lo($LC0)
	li	$6,2			# 0x2
	sw	$31,36($sp)
	jalr	$7
	move	$19,$4

	sra	$3,$16,31
	li	$2,251658240			# 0xf000000
	and	$2,$3,$2
	li	$5,983040			# 0xf0000
	li	$4,15728640			# 0xf00000
	and	$5,$3,$5
	and	$4,$3,$4
	andi	$6,$3,0xf0
	andi	$7,$3,0xf00
	andi	$8,$3,0xf000
	sra	$2,$2,24
	srl	$17,$3,28
	andi	$9,$16,0xf
	ext	$10,$16,4,4
	ext	$11,$16,8,4
	ext	$12,$16,12,4
	ext	$13,$16,16,4
	ext	$14,$16,20,4
	ext	$15,$16,24,4
	sra	$6,$6,4
	srl	$16,$16,28
	sra	$7,$7,8
	sra	$8,$8,12
	sra	$5,$5,16
	sra	$4,$4,20
	andi	$3,$3,0xf
	sb	$2,14($sp)
	lui	$2,%hi($LC1)
	sb	$16,7($sp)
	sb	$17,15($sp)
	sb	$9,0($sp)
	sb	$10,1($sp)
	sb	$11,2($sp)
	sb	$12,3($sp)
	sb	$13,4($sp)
	sb	$14,5($sp)
	sb	$15,6($sp)
	sb	$3,8($sp)
	sb	$6,9($sp)
	sb	$7,10($sp)
	sb	$8,11($sp)
	sb	$5,12($sp)
	sb	$4,13($sp)
	addiu	$18,$2,%lo($LC1)
	addiu	$16,$sp,15
	addiu	$17,$sp,-1
	lbu	$5,0($16)
$L23:
	lw	$3,%lo(sceIoWrite)($20)
	addiu	$16,$16,-1
	addu	$5,$18,$5
	move	$4,$19
	jalr	$3
	li	$6,1			# 0x1

	bnel	$17,$16,$L23
	lbu	$5,0($16)

	lw	$31,36($sp)
	lw	$20,32($sp)
	lw	$19,28($sp)
	lw	$18,24($sp)
	lw	$17,20($sp)
	lw	$16,16($sp)
	j	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	io_write_wide_hex
	.size	io_write_wide_hex, .-io_write_wide_hex
	.align	2
	.globl	io_write_hex
	.set	nomips16
	.ent	io_write_hex
io_write_hex:
	.frame	$sp,32,$31		# vars= 8, regs= 6/0, args= 0, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$20,24($sp)
	lui	$20,%hi(sceIoWrite)
	lw	$3,%lo(sceIoWrite)($20)
	sw	$16,8($sp)
	move	$16,$5
	lui	$5,%hi($LC0)
	sw	$19,20($sp)
	sw	$18,16($sp)
	sw	$17,12($sp)
	addiu	$5,$5,%lo($LC0)
	li	$6,2			# 0x2
	sw	$31,28($sp)
	jalr	$3
	move	$19,$4

	andi	$2,$16,0xf
	srl	$8,$16,28
	ext	$3,$16,4,4
	ext	$4,$16,8,4
	ext	$5,$16,12,4
	ext	$6,$16,16,4
	ext	$7,$16,20,4
	sb	$2,0($sp)
	ext	$16,$16,24,4
	lui	$2,%hi($LC1)
	sb	$16,6($sp)
	sb	$3,1($sp)
	sb	$4,2($sp)
	sb	$5,3($sp)
	sb	$6,4($sp)
	sb	$7,5($sp)
	sb	$8,7($sp)
	addiu	$18,$2,%lo($LC1)
	addiu	$16,$sp,7
	addiu	$17,$sp,-1
	lbu	$5,0($16)
$L28:
	lw	$3,%lo(sceIoWrite)($20)
	addiu	$16,$16,-1
	addu	$5,$18,$5
	move	$4,$19
	jalr	$3
	li	$6,1			# 0x1

	bnel	$17,$16,$L28
	lbu	$5,0($16)

	lw	$31,28($sp)
	lw	$20,24($sp)
	lw	$19,20($sp)
	lw	$18,16($sp)
	lw	$17,12($sp)
	lw	$16,8($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	io_write_hex
	.size	io_write_hex, .-io_write_hex
	.align	2
	.globl	io_write_short_hex
	.set	nomips16
	.ent	io_write_short_hex
io_write_short_hex:
	.frame	$sp,32,$31		# vars= 8, regs= 6/0, args= 0, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	sw	$20,24($sp)
	lui	$20,%hi(sceIoWrite)
	lw	$3,%lo(sceIoWrite)($20)
	sw	$16,8($sp)
	move	$16,$5
	lui	$5,%hi($LC0)
	sw	$19,20($sp)
	sw	$18,16($sp)
	sw	$17,12($sp)
	sw	$31,28($sp)
	addiu	$5,$5,%lo($LC0)
	li	$6,2			# 0x2
	jalr	$3
	move	$18,$4

	andi	$2,$16,0xf
	ext	$4,$16,12,4
	ext	$3,$16,4,4
	sb	$2,0($sp)
	ext	$16,$16,8,4
	lui	$2,%hi($LC1)
	sb	$16,2($sp)
	sb	$3,1($sp)
	sb	$4,3($sp)
	addiu	$19,$2,%lo($LC1)
	addiu	$16,$sp,3
	addiu	$17,$sp,-1
	lbu	$5,0($16)
$L33:
	lw	$3,%lo(sceIoWrite)($20)
	addiu	$16,$16,-1
	addu	$5,$19,$5
	move	$4,$18
	jalr	$3
	li	$6,1			# 0x1

	bnel	$17,$16,$L33
	lbu	$5,0($16)

	lw	$31,28($sp)
	lw	$20,24($sp)
	lw	$19,20($sp)
	lw	$18,16($sp)
	lw	$17,12($sp)
	lw	$16,8($sp)
	j	$31
	addiu	$sp,$sp,32

	.set	macro
	.set	reorder
	.end	io_write_short_hex
	.size	io_write_short_hex, .-io_write_short_hex
	.align	2
	.globl	io_write_byte_hex
	.set	nomips16
	.ent	io_write_byte_hex
io_write_byte_hex:
	.frame	$sp,24,$31		# vars= 0, regs= 5/0, args= 0, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$18,12($sp)
	lui	$18,%hi(sceIoWrite)
	lw	$3,%lo(sceIoWrite)($18)
	sw	$17,8($sp)
	move	$17,$5
	lui	$5,%hi($LC0)
	sw	$31,20($sp)
	sw	$19,16($sp)
	sw	$16,4($sp)
	addiu	$5,$5,%lo($LC0)
	li	$6,2			# 0x2
	move	$19,$4
	jalr	$3
	lui	$16,%hi($LC1)

	lw	$7,%lo(sceIoWrite)($18)
	addiu	$16,$16,%lo($LC1)
	andi	$5,$17,0xf
	addu	$5,$16,$5
	move	$4,$19
	jalr	$7
	li	$6,1			# 0x1

	lw	$25,%lo(sceIoWrite)($18)
	ext	$17,$17,4,4
	addu	$5,$16,$17
	move	$4,$19
	lw	$31,20($sp)
	lw	$19,16($sp)
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	li	$6,1			# 0x1
	jr	$25
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	io_write_byte_hex
	.size	io_write_byte_hex, .-io_write_byte_hex
	.align	2
	.globl	dump_memregion
	.set	nomips16
	.ent	dump_memregion
dump_memregion:
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceIoOpen)
	lw	$3,%lo(sceIoOpen)($2)
	addiu	$sp,$sp,-16
	sw	$18,8($sp)
	sw	$17,4($sp)
	sw	$16,0($sp)
	sw	$31,12($sp)
	move	$17,$5
	move	$18,$6
	li	$5,1538			# 0x602
	jalr	$3
	li	$6,511			# 0x1ff

	bltz	$2,$L38
	move	$16,$2

	lui	$2,%hi(sceIoWrite)
	lw	$7,%lo(sceIoWrite)($2)
	move	$4,$16
	move	$5,$17
	jalr	$7
	move	$6,$18

	lui	$3,%hi(sceIoClose)
	lw	$25,%lo(sceIoClose)($3)
	move	$4,$16
	lw	$31,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	jr	$25
	addiu	$sp,$sp,16

$L38:
	lw	$31,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	dump_memregion
	.size	dump_memregion, .-dump_memregion
	.align	2
	.globl	LoadStartModule
	.set	nomips16
	.ent	LoadStartModule
LoadStartModule:
	.frame	$sp,16,$31		# vars= 8, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceKernelLoadModule)
	lw	$3,%lo(sceKernelLoadModule)($2)
	addiu	$sp,$sp,-16
	sw	$16,8($sp)
	sw	$31,12($sp)
	move	$5,$0
	jalr	$3
	move	$6,$0

	bgez	$2,$L40
	move	$16,$2

	li	$2,-1			# 0xffffffffffffffff
$L41:
	lw	$31,12($sp)
	lw	$16,8($sp)
	j	$31
	addiu	$sp,$sp,16

$L40:
	lui	$2,%hi(sceKernelStartModule)
	lw	$3,%lo(sceKernelStartModule)($2)
	move	$4,$16
	move	$5,$0
	move	$6,$0
	move	$7,$sp
	jalr	$3
	move	$8,$0

	xor	$2,$16,$2
	li	$3,-2			# 0xfffffffffffffffe
	movz	$3,$0,$2
	j	$L41
	move	$2,$3

	.set	macro
	.set	reorder
	.end	LoadStartModule
	.size	LoadStartModule, .-LoadStartModule
	.align	2
	.globl	StopUnloadModule
	.set	nomips16
	.ent	StopUnloadModule
StopUnloadModule:
	.frame	$sp,16,$31		# vars= 8, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceKernelStopModule)
	lw	$9,%lo(sceKernelStopModule)($2)
	addiu	$sp,$sp,-16
	sw	$31,12($sp)
	sw	$16,8($sp)
	move	$7,$sp
	move	$5,$0
	move	$6,$0
	move	$8,$0
	jalr	$9
	move	$16,$4

	lui	$3,%hi(sceKernelUnloadModule)
	lw	$5,%lo(sceKernelUnloadModule)($3)
	jalr	$5
	move	$4,$16

	lw	$31,12($sp)
	move	$2,$0
	lw	$16,8($sp)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	StopUnloadModule
	.size	StopUnloadModule, .-StopUnloadModule
	.align	2
	.globl	reset
	.set	nomips16
	.ent	reset
reset:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(var1)
	lw	$7,%lo(var1)($2)
	lui	$3,%hi(var2)
	lui	$2,%hi(sceKernelDelayThread)
	lw	$8,%lo(var2)($3)
	lw	$25,%lo(sceKernelDelayThread)($2)
	li	$3,200			# 0xc8
	lui	$2,%hi(ballX)
	sw	$3,%lo(ballX)($2)
	li	$4,100			# 0x64
	lui	$2,%hi(ballY)
	lui	$3,%hi(ballV_Direction)
	li	$5,4			# 0x4
	sw	$4,%lo(ballY)($2)
	sw	$7,%lo(ballV_Direction)($3)
	lui	$2,%hi(ballH_Direction)
	lui	$3,%hi(ballH_Speed)
	li	$6,20			# 0x14
	sw	$8,%lo(ballH_Direction)($2)
	sw	$5,%lo(ballH_Speed)($3)
	lui	$2,%hi(paddle2Y)
	lui	$3,%hi(ballV_Speed)
	sw	$6,%lo(paddle2Y)($2)
	sw	$5,%lo(ballV_Speed)($3)
	lui	$2,%hi(paddle1Y)
	lui	$3,%hi(bounces)
	li	$4,983040			# 0xf0000
	sw	$6,%lo(paddle1Y)($2)
	sw	$0,%lo(bounces)($3)
	jr	$25
	ori	$4,$4,0x4240

	.set	macro
	.set	reorder
	.end	reset
	.size	reset, .-reset
	.align	2
	.globl	AI
	.set	nomips16
	.ent	AI
AI:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(paddleHeight)
	lw	$4,%lo(paddleHeight)($2)
	lui	$3,%hi(ballH_Direction)
	lui	$2,%hi(ballY)
	lui	$9,%hi(paddle2Y)
	lw	$7,%lo(ballY)($2)
	lw	$5,%lo(ballH_Direction)($3)
	lui	$2,%hi(RIGHT)
	lw	$8,%lo(paddle2Y)($9)
	lui	$3,%hi(bottom)
	lw	$6,%lo(RIGHT)($2)
	lw	$2,%lo(bottom)($3)
	addu	$4,$8,$4
	xor	$5,$5,$6
	slt	$2,$4,$2
	slt	$4,$4,$7
	and	$4,$4,$2
	sltu	$5,$5,1
	and	$4,$4,$5
	beq	$4,$0,$L52
	lui	$3,%hi(ballHeight)

	lui	$3,%hi(paddleSpeed)
	lw	$2,%lo(paddleSpeed)($3)
	addu	$2,$2,$8
	sw	$2,%lo(paddle2Y)($9)
	lui	$3,%hi(ballHeight)
$L52:
	lw	$2,%lo(ballHeight)($3)
	lui	$3,%hi(top)
	lw	$6,%lo(paddle2Y)($9)
	lw	$4,%lo(top)($3)
	addu	$2,$7,$2
	slt	$2,$2,$6
	slt	$4,$4,$6
	and	$2,$2,$4
	and	$2,$2,$5
	beq	$2,$0,$L53
	lui	$2,%hi(paddleSpeed)

	lw	$3,%lo(paddleSpeed)($2)
	lui	$2,%hi(paddle2Y)
	subu	$3,$6,$3
	sw	$3,%lo(paddle2Y)($2)
$L53:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	AI
	.size	AI, .-AI
	.align	2
	.globl	checkCollide
	.set	nomips16
	.ent	checkCollide
checkCollide:
	.frame	$sp,24,$31		# vars= 0, regs= 5/0, args= 0, gp= 0
	.mask	0x800f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$19,16($sp)
	lui	$3,%hi(top)
	lui	$19,%hi(ballY)
	lw	$2,%lo(top)($3)
	lw	$5,%lo(ballY)($19)
	sw	$31,20($sp)
	sw	$18,12($sp)
	slt	$2,$5,$2
	sw	$17,8($sp)
	bne	$2,$0,$L64
	sw	$16,4($sp)

	lui	$16,%hi(bounces)
$L55:
	lui	$3,%hi(ballHeight)
	lw	$2,%lo(ballHeight)($3)
	lui	$4,%hi(bottom)
	lw	$3,%lo(bottom)($4)
	addu	$2,$5,$2
	slt	$2,$3,$2
	beq	$2,$0,$L69
	lui	$17,%hi(ballX)

	lw	$3,%lo(bounces)($16)
	lui	$2,%hi(UP)
	lw	$4,%lo(UP)($2)
	addiu	$3,$3,1
	lui	$2,%hi(ballV_Direction)
	sw	$4,%lo(ballV_Direction)($2)
	sw	$3,%lo(bounces)($16)
$L69:
	lw	$2,%lo(ballX)($17)
	bltz	$2,$L65
	lui	$3,%hi(cpuScore)

	lui	$18,%hi(ballWidth)
$L68:
	lw	$2,%lo(ballWidth)($18)
	lw	$3,%lo(ballX)($17)
	addu	$2,$2,$3
	slt	$2,$2,513
	beq	$2,$0,$L66
	lui	$3,%hi(playerScore)

	lui	$2,%hi(paddle1X)
$L67:
	lw	$5,%lo(paddle1X)($2)
	lui	$2,%hi(paddle1Y)
	lw	$4,%lo(paddle1Y)($2)
	lui	$3,%hi(paddleHeight)
	lui	$2,%hi(paddleWidth)
	lw	$8,%lo(ballX)($17)
	lw	$6,%lo(ballWidth)($18)
	lw	$7,%lo(ballY)($19)
	lw	$10,%lo(paddleWidth)($2)
	lw	$9,%lo(paddleHeight)($3)
	addu	$11,$7,$6
	addu	$2,$10,$5
	addu	$3,$9,$4
	addu	$6,$6,$8
	slt	$3,$7,$3
	slt	$2,$8,$2
	slt	$5,$5,$6
	slt	$4,$4,$11
	and	$4,$4,$3
	and	$2,$2,$5
	and	$4,$4,$2
	beq	$4,$0,$L70
	lui	$2,%hi(paddle2X)

	lw	$3,%lo(bounces)($16)
	lui	$2,%hi(RIGHT)
	lw	$4,%lo(RIGHT)($2)
	addiu	$3,$3,1
	lui	$2,%hi(ballH_Direction)
	sw	$4,%lo(ballH_Direction)($2)
	sw	$3,%lo(bounces)($16)
	lui	$2,%hi(paddle2X)
$L70:
	lui	$3,%hi(paddle2Y)
	lw	$4,%lo(paddle2X)($2)
	lw	$2,%lo(paddle2Y)($3)
	addu	$5,$4,$10
	addu	$3,$2,$9
	slt	$3,$7,$3
	slt	$5,$8,$5
	slt	$2,$2,$11
	slt	$4,$4,$6
	and	$2,$2,$3
	and	$4,$4,$5
	and	$2,$2,$4
	beq	$2,$0,$L71
	lw	$2,%lo(bounces)($16)

	lw	$3,%lo(bounces)($16)
	lui	$2,%hi(LEFT)
	lw	$4,%lo(LEFT)($2)
	addiu	$3,$3,1
	lui	$2,%hi(ballH_Direction)
	sw	$4,%lo(ballH_Direction)($2)
	sw	$3,%lo(bounces)($16)
	lw	$2,%lo(bounces)($16)
$L71:
	slt	$2,$2,21
	bne	$2,$0,$L62
	lui	$5,%hi(ballH_Speed)

	lui	$6,%hi(ballV_Speed)
	lw	$3,%lo(ballH_Speed)($5)
	lw	$4,%lo(ballV_Speed)($6)
	lui	$2,%hi(bounces)
	addiu	$3,$3,1
	addiu	$4,$4,1
	sw	$0,%lo(bounces)($2)
	sw	$3,%lo(ballH_Speed)($5)
	sw	$4,%lo(ballV_Speed)($6)
$L62:
	lw	$31,20($sp)
	lw	$19,16($sp)
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	j	$31
	addiu	$sp,$sp,24

$L64:
	lui	$16,%hi(bounces)
	lw	$3,%lo(bounces)($16)
	lui	$2,%hi(DOWN)
	lw	$4,%lo(DOWN)($2)
	addiu	$3,$3,1
	lui	$2,%hi(ballV_Direction)
	sw	$4,%lo(ballV_Direction)($2)
	j	$L55
	sw	$3,%lo(bounces)($16)

$L66:
	lw	$2,%lo(playerScore)($3)
	addiu	$2,$2,1
	jal	reset
	sw	$2,%lo(playerScore)($3)

	j	$L67
	lui	$2,%hi(paddle1X)

$L65:
	lw	$2,%lo(cpuScore)($3)
	addiu	$2,$2,1
	jal	reset
	sw	$2,%lo(cpuScore)($3)

	j	$L68
	lui	$18,%hi(ballWidth)

	.set	macro
	.set	reorder
	.end	checkCollide
	.size	checkCollide, .-checkCollide
	.align	2
	.globl	updateBall
	.set	nomips16
	.ent	updateBall
updateBall:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(ballV_Direction)
	lui	$3,%hi(UP)
	lw	$6,%lo(ballV_Direction)($2)
	lw	$2,%lo(UP)($3)
	beq	$6,$2,$L78
	lui	$5,%hi(ballY)

$L73:
	lui	$2,%hi(DOWN)
	lw	$3,%lo(DOWN)($2)
	beq	$6,$3,$L79
	lui	$5,%hi(ballY)

$L74:
	lui	$2,%hi(ballH_Direction)
	lui	$3,%hi(LEFT)
	lw	$6,%lo(ballH_Direction)($2)
	lw	$2,%lo(LEFT)($3)
	beq	$6,$2,$L80
	lui	$5,%hi(ballX)

$L75:
	lui	$2,%hi(RIGHT)
	lw	$3,%lo(RIGHT)($2)
	beq	$6,$3,$L81
	lui	$5,%hi(ballX)

	j	$31
	nop

$L81:
	lui	$3,%hi(ballH_Speed)
	lw	$4,%lo(ballX)($5)
	lw	$2,%lo(ballH_Speed)($3)
	addu	$2,$2,$4
	j	$31
	sw	$2,%lo(ballX)($5)

$L80:
	lui	$3,%hi(ballH_Speed)
	lw	$2,%lo(ballX)($5)
	lw	$4,%lo(ballH_Speed)($3)
	subu	$2,$2,$4
	j	$L75
	sw	$2,%lo(ballX)($5)

$L79:
	lui	$3,%hi(ballV_Speed)
	lw	$4,%lo(ballY)($5)
	lw	$2,%lo(ballV_Speed)($3)
	addu	$2,$2,$4
	j	$L74
	sw	$2,%lo(ballY)($5)

$L78:
	lui	$3,%hi(ballV_Speed)
	lw	$2,%lo(ballY)($5)
	lw	$4,%lo(ballV_Speed)($3)
	subu	$2,$2,$4
	j	$L73
	sw	$2,%lo(ballY)($5)

	.set	macro
	.set	reorder
	.end	updateBall
	.size	updateBall, .-updateBall
	.align	2
	.globl	drawScore
	.set	nomips16
	.ent	drawScore
drawScore:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	drawScore
	.size	drawScore, .-drawScore
	.align	2
	.globl	ProcessKeys
	.set	nomips16
	.ent	ProcessKeys
ProcessKeys:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	andi	$2,$4,0x10
	beq	$2,$0,$L91
	andi	$2,$4,0x40

	lui	$6,%hi(paddle1Y)
	lui	$3,%hi(top)
	lw	$2,%lo(top)($3)
	lw	$5,%lo(paddle1Y)($6)
	slt	$2,$2,$5
	bne	$2,$0,$L90
	lui	$3,%hi(paddleSpeed)

$L87:
	andi	$2,$4,0x40
$L91:
	beq	$2,$0,$L92
	lui	$2,%hi(paddleHeight)

	lui	$6,%hi(paddle1Y)
	lw	$3,%lo(paddleHeight)($2)
	lw	$5,%lo(paddle1Y)($6)
	lui	$2,%hi(bottom)
	lw	$4,%lo(bottom)($2)
	addu	$3,$5,$3
	slt	$3,$3,$4
	beq	$3,$0,$L92
	lui	$3,%hi(paddleSpeed)

	lw	$2,%lo(paddleSpeed)($3)
	addu	$2,$2,$5
	sw	$2,%lo(paddle1Y)($6)
$L92:
	j	$31
	nop

$L90:
	lw	$2,%lo(paddleSpeed)($3)
	subu	$2,$5,$2
	j	$L87
	sw	$2,%lo(paddle1Y)($6)

	.set	macro
	.set	reorder
	.end	ProcessKeys
	.size	ProcessKeys, .-ProcessKeys
	.align	2
	.globl	memcpy
	.set	nomips16
	.ent	memcpy
memcpy:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	beq	$6,$0,$L98
	move	$3,$0

$L95:
	lbu	$2,0($5)
	addiu	$3,$3,1
	addiu	$5,$5,1
	sb	$2,0($4)
	bne	$3,$6,$L95
	addiu	$4,$4,1

$L98:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	memcpy
	.size	memcpy, .-memcpy
	.align	2
	.globl	GetVramAddr
	.set	nomips16
	.ent	GetVramAddr
GetVramAddr:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(drawframe)
	lw	$3,%lo(drawframe)($2)
	lui	$2,%hi(vramtop)
	move	$6,$4
	bne	$3,$0,$L100
	lw	$7,%lo(vramtop)($2)

	sll	$2,$5,9
	addu	$2,$2,$6
	li	$3,1073741824			# 0x40000000
	sll	$2,$2,2
	move	$4,$0
	addu	$2,$2,$3
	addu	$2,$2,$4
	j	$31
	addu	$2,$7,$2

$L100:
	li	$2,655360			# 0xa0000
	ori	$4,$2,0xa000
	sll	$2,$5,9
	addu	$2,$2,$6
	li	$3,1073741824			# 0x40000000
	sll	$2,$2,2
	addu	$2,$2,$3
	addu	$2,$2,$4
	j	$31
	addu	$2,$7,$2

	.set	macro
	.set	reorder
	.end	GetVramAddr
	.size	GetVramAddr, .-GetVramAddr
	.align	2
	.globl	PutChar
	.set	nomips16
	.ent	PutChar
PutChar:
	.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
	.mask	0x00070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(drawframe)
	lw	$3,%lo(drawframe)($2)
	addiu	$sp,$sp,-16
	lui	$2,%hi(vramtop)
	sw	$18,12($sp)
	sw	$17,8($sp)
	sw	$16,4($sp)
	move	$13,$5
	andi	$8,$8,0x00ff
	seb	$9,$9
	seb	$10,$10
	seb	$11,$11
	bne	$3,$0,$L104
	lw	$12,%lo(vramtop)($2)

	move	$5,$0
$L105:
	sll	$3,$13,9
	addu	$3,$3,$4
	li	$2,1073741824			# 0x40000000
	sll	$3,$3,2
	addiu	$4,$11,-1
	addu	$3,$3,$2
	andi	$4,$4,0x00ff
	lui	$2,%hi(font)
	addu	$3,$3,$5
	addiu	$4,$4,1
	addiu	$2,$2,%lo(font)
	sll	$5,$8,3
	addu	$5,$2,$5
	sll	$18,$4,11
	addu	$2,$12,$3
	move	$17,$0
	sll	$24,$4,2
	li	$25,8			# 0x8
$L106:
	blez	$11,$L115
	move	$15,$2

	move	$4,$2
	addu	$16,$2,$18
$L112:
	move	$8,$0
	li	$14,128			# 0x80
$L111:
	move	$13,$4
	j	$L109
	move	$12,$0

$L120:
	bnel	$9,$0,$L108
	sw	$6,0($13)

$L108:
	addiu	$2,$12,1
$L121:
	seb	$12,$2
	slt	$3,$12,$11
	beq	$3,$0,$L119
	addiu	$13,$13,4

$L109:
	lbu	$2,0($5)
	and	$2,$14,$2
	bne	$2,$0,$L120
	nop

	beq	$10,$0,$L121
	addiu	$2,$12,1

	seb	$12,$2
	slt	$3,$12,$11
	sw	$7,0($13)
	bne	$3,$0,$L109
	addiu	$13,$13,4

$L119:
	addiu	$8,$8,1
	beq	$8,$25,$L110
	addu	$4,$4,$24

	j	$L111
	srl	$14,$14,1

$L110:
	addiu	$15,$15,2048
	bne	$15,$16,$L112
	move	$4,$15

	move	$2,$15
$L115:
	addiu	$17,$17,1
	beq	$17,$25,$L116
	addiu	$5,$5,1

	j	$L106
	nop

$L104:
	li	$2,655360			# 0xa0000
	j	$L105
	ori	$5,$2,0xa000

$L116:
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	j	$31
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	PutChar
	.size	PutChar, .-PutChar
	.align	2
	.globl	Print
	.set	nomips16
	.ent	Print
Print:
	.frame	$sp,24,$31		# vars= 0, regs= 6/0, args= 0, gp= 0
	.mask	0x801f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-24
	sw	$20,16($sp)
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	sw	$16,0($sp)
	sw	$31,20($sp)
	move	$16,$4
	move	$18,$5
	move	$19,$6
	move	$17,$7
	li	$20,60			# 0x3c
	lb	$2,0($17)
$L131:
	sltu	$12,$16,60
	sll	$4,$16,3
	addiu	$17,$17,1
	andi	$8,$2,0x00ff
	sltu	$3,$18,38
	addiu	$16,$16,1
	sll	$5,$18,3
	move	$6,$19
	move	$7,$0
	li	$9,1			# 0x1
	li	$10,1			# 0x1
	beq	$2,$0,$L127
	li	$11,1			# 0x1

$L128:
	beq	$12,$0,$L129
	lw	$31,20($sp)

	beql	$3,$0,$L130
	lw	$20,16($sp)

	jal	PutChar
	nop

	bne	$16,$20,$L131
	lb	$2,0($17)

	move	$16,$0
	addiu	$18,$18,1
	sltu	$12,$16,60
	sll	$4,$16,3
	addiu	$17,$17,1
	andi	$8,$2,0x00ff
	sltu	$3,$18,38
	addiu	$16,$16,1
	sll	$5,$18,3
	move	$6,$19
	move	$7,$0
	li	$9,1			# 0x1
	li	$10,1			# 0x1
	bne	$2,$0,$L128
	li	$11,1			# 0x1

$L127:
	lw	$31,20($sp)
$L129:
	lw	$20,16($sp)
$L130:
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,24

	.set	macro
	.set	reorder
	.end	Print
	.size	Print, .-Print
	.align	2
	.globl	Fillvram
	.set	nomips16
	.ent	Fillvram
Fillvram:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(drawframe)
	lw	$3,%lo(drawframe)($2)
	lui	$2,%hi(vramtop)
	bne	$3,$0,$L133
	lw	$5,%lo(vramtop)($2)

	li	$2,1073741824			# 0x40000000
$L134:
	addu	$5,$5,$2
	li	$2,131072			# 0x20000
	ori	$2,$2,0xa800
	move	$3,$0
$L135:
	addiu	$3,$3,1
	sw	$4,0($5)
	bne	$3,$2,$L135
	addiu	$5,$5,4

	j	$31
	nop

$L133:
	li	$2,1074397184			# 0x400a0000
	j	$L134
	ori	$2,$2,0xa000

	.set	macro
	.set	reorder
	.end	Fillvram
	.size	Fillvram, .-Fillvram
	.align	2
	.globl	FillRect
	.set	nomips16
	.ent	FillRect
FillRect:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lw	$7,8($4)
	lw	$12,12($4)
	sltu	$2,$7,$12
	beq	$2,$0,$L148
	lui	$2,%hi(vramtop)

	lw	$8,4($4)
	lw	$4,0($4)
	lw	$11,%lo(vramtop)($2)
	li	$3,655360			# 0xa0000
	ori	$3,$3,0xa000
	move	$9,$7
	lui	$13,%hi(drawframe)
	sltu	$10,$4,$8
	li	$14,1073741824			# 0x40000000
$L144:
	lw	$2,%lo(drawframe)($13)
	move	$6,$0
	beq	$10,$0,$L142
	movn	$6,$3,$2

	sll	$2,$7,9
	addu	$2,$2,$4
	sll	$2,$2,2
	addu	$2,$2,$14
	addu	$2,$2,$6
	addu	$7,$11,$2
	move	$6,$4
$L143:
	addiu	$6,$6,1
	sltu	$2,$6,$8
	sw	$5,0($7)
	bne	$2,$0,$L143
	addiu	$7,$7,4

$L142:
	addiu	$9,$9,1
	sltu	$2,$9,$12
	bne	$2,$0,$L144
	move	$7,$9

$L148:
	j	$31
	nop

	.set	macro
	.set	reorder
	.end	FillRect
	.size	FillRect, .-FillRect
	.align	2
	.globl	changeBuffer
	.set	nomips16
	.ent	changeBuffer
changeBuffer:
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceDisplayWaitVblankStart)
	lw	$3,%lo(sceDisplayWaitVblankStart)($2)
	addiu	$sp,$sp,-8
	sw	$16,0($sp)
	sw	$31,4($sp)
	jalr	$3
	lui	$16,%hi(drawframe)

	lw	$4,%lo(drawframe)($16)
	lui	$2,%hi(sceDisplaySetFrameBuf)
	lui	$3,%hi(vramtop)
	lw	$8,%lo(sceDisplaySetFrameBuf)($2)
	bne	$4,$0,$L150
	lw	$3,%lo(vramtop)($3)

	li	$2,1073741824			# 0x40000000
	addu	$4,$3,$2
	li	$5,512			# 0x200
	li	$6,3			# 0x3
	jalr	$8
	move	$7,$0

	lw	$3,%lo(drawframe)($16)
	lw	$31,4($sp)
	sltu	$3,$3,1
	sw	$3,%lo(drawframe)($16)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

$L150:
	li	$2,1074397184			# 0x400a0000
	ori	$2,$2,0xa000
	addu	$4,$3,$2
	li	$5,512			# 0x200
	li	$6,3			# 0x3
	jalr	$8
	move	$7,$0

	lw	$3,%lo(drawframe)($16)
	lw	$31,4($sp)
	sltu	$3,$3,1
	sw	$3,%lo(drawframe)($16)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	changeBuffer
	.size	changeBuffer, .-changeBuffer
	.align	2
	.globl	initScreenAndCtrl
	.set	nomips16
	.ent	initScreenAndCtrl
initScreenAndCtrl:
	.frame	$sp,16,$31		# vars= 0, regs= 3/0, args= 0, gp= 0
	.mask	0x80030000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceDisplaySetMode)
	addiu	$sp,$sp,-16
	lw	$3,%lo(sceDisplaySetMode)($2)
	sw	$17,8($sp)
	lui	$17,%hi(drawframe)
	sw	$31,12($sp)
	sw	$16,4($sp)
	move	$4,$0
	li	$5,512			# 0x200
	li	$6,272			# 0x110
	jalr	$3
	sw	$0,%lo(drawframe)($17)

	lui	$16,%hi(vramtop)
	lui	$2,%hi(sceDisplaySetFrameBuf)
	lw	$8,%lo(sceDisplaySetFrameBuf)($2)
	lw	$4,%lo(vramtop)($16)
	li	$5,512			# 0x200
	li	$6,3			# 0x3
	jalr	$8
	li	$7,1			# 0x1

	lw	$3,%lo(drawframe)($17)
	bne	$3,$0,$L154
	lw	$5,%lo(vramtop)($16)

	li	$2,1073741824			# 0x40000000
$L155:
	addu	$4,$5,$2
	li	$2,131072			# 0x20000
	ori	$2,$2,0xa800
	move	$3,$0
$L156:
	addiu	$3,$3,1
	sw	$0,0($4)
	bne	$3,$2,$L156
	addiu	$4,$4,4

	li	$2,1			# 0x1
	sw	$2,%lo(drawframe)($17)
	li	$3,1075118080			# 0x40150000
	li	$2,1074397184			# 0x400a0000
	ori	$3,$3,0x4000
	ori	$2,$2,0xa000
	addu	$3,$5,$3
	addu	$2,$5,$2
	sw	$0,0($2)
$L161:
	addiu	$2,$2,4
	bnel	$2,$3,$L161
	sw	$0,0($2)

	lui	$2,%hi(sceCtrlSetSamplingMode)
	lw	$25,%lo(sceCtrlSetSamplingMode)($2)
	lw	$31,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	li	$4,1			# 0x1
	jr	$25
	addiu	$sp,$sp,16

$L154:
	li	$2,1074397184			# 0x400a0000
	j	$L155
	ori	$2,$2,0xa000

	.set	macro
	.set	reorder
	.end	initScreenAndCtrl
	.size	initScreenAndCtrl, .-initScreenAndCtrl
	.align	2
	.globl	strlen
	.set	nomips16
	.ent	strlen
strlen:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lb	$2,0($4)
	beq	$2,$0,$L163
	nop

$L166:
	j	$L166
	nop

$L163:
	j	$31
	move	$2,$0

	.set	macro
	.set	reorder
	.end	strlen
	.size	strlen, .-strlen
	.align	2
	.set	nomips16
	.ent	genrand_int32
genrand_int32:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$8,%hi(left)
	lw	$2,%lo(left)($8)
	addiu	$2,$2,-1
	bne	$2,$0,$L187
	sw	$2,%lo(left)($8)

	lui	$9,%hi(initf)
	lw	$2,%lo(initf)($9)
	beq	$2,$0,$L186
	lui	$14,%hi(state)

	addiu	$12,$14,%lo(state)
$L169:
	li	$2,624			# 0x270
	sw	$2,%lo(left)($8)
	lw	$7,0($12)
	lui	$2,%hi(state+908)
	lui	$13,%hi(next)
	addiu	$11,$2,%lo(state+908)
	li	$3,-1727528960			# 0xffffffff99080000
	li	$2,2147418112			# 0x7fff0000
	sw	$12,%lo(next)($13)
	ori	$10,$3,0xb0df
	ori	$9,$2,0xffff
	move	$6,$12
	li	$8,-2147483648			# 0xffffffff80000000
$L173:
	lw	$5,1588($6)
	addiu	$6,$6,4
	move	$3,$7
	lw	$7,0($6)
	and	$3,$3,$8
	and	$2,$7,$9
	or	$2,$2,$3
	srl	$2,$2,1
	andi	$4,$7,0x1
	move	$3,$0
	xor	$2,$2,$5
	movn	$3,$10,$4
	xor	$2,$2,$3
	bne	$6,$11,$L173
	sw	$2,-4($6)

	lui	$2,%hi(state+2492)
	lw	$7,0($6)
	addiu	$11,$2,%lo(state+2492)
	li	$3,-1727528960			# 0xffffffff99080000
	li	$2,2147418112			# 0x7fff0000
	ori	$10,$3,0xb0df
	ori	$9,$2,0xffff
	li	$8,-2147483648			# 0xffffffff80000000
$L176:
	lw	$5,-908($6)
	addiu	$6,$6,4
	move	$3,$7
	lw	$7,0($6)
	and	$3,$3,$8
	and	$2,$7,$9
	or	$2,$2,$3
	srl	$2,$2,1
	andi	$4,$7,0x1
	move	$3,$0
	xor	$2,$2,$5
	movn	$3,$10,$4
	xor	$2,$2,$3
	bne	$6,$11,$L176
	sw	$2,-4($6)

	lw	$4,%lo(state)($14)
	lw	$6,1584($12)
	andi	$2,$4,0x1
	bne	$2,$0,$L177
	lw	$3,2492($12)

	move	$5,$0
$L178:
	li	$2,-2147483648			# 0xffffffff80000000
	and	$2,$3,$2
	li	$3,2147418112			# 0x7fff0000
	ori	$3,$3,0xffff
	and	$3,$4,$3
	or	$2,$2,$3
	srl	$2,$2,1
	xor	$2,$2,$6
	xor	$2,$2,$5
	sw	$2,2492($12)
$L168:
	lw	$5,%lo(next)($13)
	lw	$2,0($5)
	addiu	$5,$5,4
	sw	$5,%lo(next)($13)
	srl	$3,$2,11
	xor	$3,$3,$2
	li	$2,-1658060800			# 0xffffffff9d2c0000
	sll	$4,$3,7
	ori	$2,$2,0x5680
	and	$4,$4,$2
	xor	$4,$4,$3
	sll	$2,$4,15
	li	$3,-272236544			# 0xffffffffefc60000
	and	$2,$2,$3
	xor	$2,$2,$4
	srl	$3,$2,18
	j	$31
	xor	$2,$3,$2

$L186:
	addiu	$12,$14,%lo(state)
	li	$2,5489			# 0x1571
	li	$3,1812398080			# 0x6c070000
	sw	$2,%lo(state)($14)
	ori	$7,$3,0x8965
	move	$5,$12
	li	$4,1			# 0x1
	li	$6,624			# 0x270
$L170:
	lw	$3,0($5)
	srl	$2,$3,30
	xor	$2,$2,$3
	mult	$2,$7
	mflo	$2
	addu	$2,$2,$4
	addiu	$4,$4,1
	sw	$2,4($5)
	bne	$4,$6,$L170
	addiu	$5,$5,4

	li	$2,1			# 0x1
	sw	$2,%lo(initf)($9)
	j	$L169
	sw	$2,%lo(left)($8)

$L187:
	j	$L168
	lui	$13,%hi(next)

$L177:
	li	$2,-1727528960			# 0xffffffff99080000
	j	$L178
	ori	$5,$2,0xb0df

	.set	macro
	.set	reorder
	.end	genrand_int32
	.size	genrand_int32, .-genrand_int32
	.align	2
	.globl	InitGlobals
	.set	nomips16
	.ent	InitGlobals
InitGlobals:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$7,%hi(colours)
	li	$2,8912896			# 0x880000
	addiu	$4,$7,%lo(colours)
	ori	$2,$2,0x8888
	sw	$2,36($4)
	li	$5,7			# 0x7
	lui	$2,%hi(color)
	sw	$5,%lo(color)($2)
	li	$2,255			# 0xff
	li	$6,16711680			# 0xff0000
	li	$3,34816			# 0x8800
	sw	$2,12($4)
	li	$2,65535			# 0xffff
	ori	$11,$6,0xff88
	ori	$8,$6,0xffff
	ori	$9,$6,0xff
	ori	$10,$6,0xff00
	sw	$3,%lo(colours)($7)
	sw	$2,24($4)
	li	$3,65280			# 0xff00
	lui	$2,%hi(i)
	sw	$8,4($4)
	sw	$9,8($4)
	sw	$3,20($4)
	sw	$10,28($4)
	sw	$11,32($4)
	sw	$0,%lo(i)($2)
	sw	$0,40($4)
	j	$31
	sw	$6,16($4)

	.set	macro
	.set	reorder
	.end	InitGlobals
	.size	InitGlobals, .-InitGlobals
	.align	2
	.globl	fadeIn
	.set	nomips16
	.ent	fadeIn
fadeIn:
	.frame	$sp,40,$31		# vars= 0, regs= 9/0, args= 0, gp= 0
	.mask	0x80ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-40
	li	$2,1074397184			# 0x400a0000
	li	$3,131072			# 0x20000
	sw	$21,24($sp)
	sw	$17,8($sp)
	ori	$21,$2,0xa000
	ori	$17,$3,0xa800
	li	$2,3342336			# 0x330000
	li	$3,20119552			# 0x1330000
	sw	$23,32($sp)
	sw	$22,28($sp)
	sw	$20,20($sp)
	sw	$19,16($sp)
	sw	$18,12($sp)
	sw	$16,4($sp)
	sw	$31,36($sp)
	ori	$22,$2,0x3333
	ori	$23,$3,0x3332
	move	$16,$0
	lui	$18,%hi(vramtop)
	lui	$20,%hi(drawframe)
	lui	$19,%hi(sceDisplayWaitVblankStart)
	lw	$2,%lo(drawframe)($20)
$L198:
	lw	$4,%lo(vramtop)($18)
	li	$3,1073741824			# 0x40000000
	movn	$3,$21,$2
	addu	$4,$4,$3
	move	$2,$0
$L193:
	addiu	$2,$2,1
	sw	$16,0($4)
	bne	$2,$17,$L193
	addiu	$4,$4,4

	lw	$3,%lo(sceDisplayWaitVblankStart)($19)
	jalr	$3
	addu	$16,$16,$22

	jal	changeBuffer
	nop

	bne	$16,$23,$L198
	lw	$2,%lo(drawframe)($20)

	lw	$31,36($sp)
	lw	$23,32($sp)
	lw	$22,28($sp)
	lw	$21,24($sp)
	lw	$20,20($sp)
	lw	$19,16($sp)
	lw	$18,12($sp)
	lw	$17,8($sp)
	lw	$16,4($sp)
	j	$31
	addiu	$sp,$sp,40

	.set	macro
	.set	reorder
	.end	fadeIn
	.size	fadeIn, .-fadeIn
	.align	2
	.globl	fadeOut
	.set	nomips16
	.ent	fadeOut
fadeOut:
	.frame	$sp,32,$31		# vars= 0, regs= 8/0, args= 0, gp= 0
	.mask	0x807f0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-32
	li	$2,16711680			# 0xff0000
	li	$3,1074397184			# 0x400a0000
	sw	$22,24($sp)
	sw	$16,0($sp)
	ori	$22,$3,0xa000
	ori	$16,$2,0xffff
	li	$3,-1179648			# 0xffffffffffee0000
	li	$2,131072			# 0x20000
	sw	$21,20($sp)
	sw	$20,16($sp)
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	sw	$31,28($sp)
	ori	$17,$2,0xa800
	ori	$18,$3,0xeeef
	lui	$20,%hi(vramtop)
	lui	$21,%hi(drawframe)
	lui	$19,%hi(sceDisplayWaitVblankStart)
	lw	$2,%lo(drawframe)($21)
$L215:
	lw	$4,%lo(vramtop)($20)
	li	$3,1073741824			# 0x40000000
	movn	$3,$22,$2
	addu	$4,$4,$3
	move	$2,$0
$L202:
	addiu	$2,$2,1
	sw	$16,0($4)
	bne	$2,$17,$L202
	addiu	$4,$4,4

	lw	$3,%lo(sceDisplayWaitVblankStart)($19)
	jalr	$3
	addu	$16,$16,$18

	jal	changeBuffer
	nop

	bne	$16,$18,$L215
	lw	$2,%lo(drawframe)($21)

	bne	$2,$0,$L204
	lw	$3,%lo(vramtop)($20)

	li	$2,1073741824			# 0x40000000
$L205:
	addu	$4,$3,$2
	li	$2,131072			# 0x20000
	ori	$2,$2,0xa800
	move	$3,$0
$L206:
	addiu	$3,$3,1
	sw	$0,0($4)
	bne	$3,$2,$L206
	addiu	$4,$4,4

	jal	changeBuffer
	nop

	lw	$2,%lo(drawframe)($21)
	bne	$2,$0,$L207
	lw	$3,%lo(vramtop)($20)

	li	$2,1073741824			# 0x40000000
$L208:
	addu	$4,$3,$2
	li	$2,131072			# 0x20000
	ori	$2,$2,0xa800
	move	$3,$0
$L209:
	addiu	$3,$3,1
	sw	$0,0($4)
	bne	$3,$2,$L209
	addiu	$4,$4,4

	lw	$31,28($sp)
	lw	$22,24($sp)
	lw	$21,20($sp)
	lw	$20,16($sp)
	lw	$19,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	$31
	addiu	$sp,$sp,32

$L207:
	li	$2,1074397184			# 0x400a0000
	j	$L208
	ori	$2,$2,0xa000

$L204:
	li	$2,1074397184			# 0x400a0000
	j	$L205
	ori	$2,$2,0xa000

	.set	macro
	.set	reorder
	.end	fadeOut
	.size	fadeOut, .-fadeOut
	.align	2
	.globl	drawPixel
	.set	nomips16
	.ent	drawPixel
drawPixel:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$9,%hi(pixel)
	addiu	$2,$9,%lo(pixel)
	move	$3,$4
	move	$10,$5
	addu	$7,$7,$5
	addu	$6,$6,$4
	move	$5,$8
	move	$4,$2
	sw	$3,%lo(pixel)($9)
	sw	$7,12($2)
	sw	$6,4($2)
	j	FillRect
	sw	$10,8($2)

	.set	macro
	.set	reorder
	.end	drawPixel
	.size	drawPixel, .-drawPixel
	.align	2
	.globl	drawBounds
	.set	nomips16
	.ent	drawBounds
drawBounds:
	.frame	$sp,8,$31		# vars= 0, regs= 2/0, args= 0, gp= 0
	.mask	0x80010000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(top)
	addiu	$sp,$sp,-8
	lw	$7,%lo(top)($2)
	sw	$16,0($sp)
	li	$16,16711680			# 0xff0000
	ori	$8,$16,0xffff
	move	$4,$0
	move	$5,$0
	sw	$31,4($sp)
	jal	drawPixel
	li	$6,512			# 0x200

	lui	$3,%hi(bottom)
	lui	$2,%hi(ballHeight)
	lw	$5,%lo(bottom)($3)
	lw	$7,%lo(ballHeight)($2)
	ori	$8,$16,0xffff
	lw	$31,4($sp)
	lw	$16,0($sp)
	move	$4,$0
	li	$6,512			# 0x200
	j	drawPixel
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	drawBounds
	.size	drawBounds, .-drawBounds
	.align	2
	.globl	drawBall
	.set	nomips16
	.ent	drawBall
drawBall:
	.frame	$sp,0,$31		# vars= 0, regs= 0/0, args= 0, gp= 0
	.mask	0x00000000,0
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(ballX)
	lui	$3,%hi(ballY)
	lw	$4,%lo(ballX)($2)
	lw	$5,%lo(ballY)($3)
	lui	$2,%hi(ballWidth)
	lui	$3,%hi(ballHeight)
	lw	$6,%lo(ballWidth)($2)
	lw	$7,%lo(ballHeight)($3)
	li	$8,16711680			# 0xff0000
	j	drawPixel
	ori	$8,$8,0xffff

	.set	macro
	.set	reorder
	.end	drawBall
	.size	drawBall, .-drawBall
	.align	2
	.globl	drawPaddles
	.set	nomips16
	.ent	drawPaddles
drawPaddles:
	.frame	$sp,16,$31		# vars= 0, regs= 4/0, args= 0, gp= 0
	.mask	0x80070000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-16
	sw	$18,8($sp)
	sw	$17,4($sp)
	lui	$18,%hi(paddleHeight)
	lui	$17,%hi(paddleWidth)
	lui	$3,%hi(paddle1Y)
	lui	$2,%hi(paddle1X)
	lw	$5,%lo(paddle1Y)($3)
	lw	$6,%lo(paddleWidth)($17)
	lw	$7,%lo(paddleHeight)($18)
	lw	$4,%lo(paddle1X)($2)
	sw	$16,0($sp)
	li	$16,16711680			# 0xff0000
	sw	$31,12($sp)
	jal	drawPixel
	ori	$8,$16,0xffff

	lui	$3,%hi(paddle2X)
	lui	$2,%hi(paddle2Y)
	lw	$6,%lo(paddleWidth)($17)
	lw	$7,%lo(paddleHeight)($18)
	lw	$4,%lo(paddle2X)($3)
	lw	$5,%lo(paddle2Y)($2)
	ori	$8,$16,0xffff
	lw	$31,12($sp)
	lw	$18,8($sp)
	lw	$17,4($sp)
	lw	$16,0($sp)
	j	drawPixel
	addiu	$sp,$sp,16

	.set	macro
	.set	reorder
	.end	drawPaddles
	.size	drawPaddles, .-drawPaddles
	.align	2
	.globl	drawAll
	.set	nomips16
	.ent	drawAll
drawAll:
	.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$31,4($sp)
	jal	drawBounds
	nop

	jal	drawBall
	nop

	jal	drawPaddles
	nop

	lw	$31,4($sp)
	j	changeBuffer
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	drawAll
	.size	drawAll, .-drawAll
	.align	2
	.globl	pong
	.set	nomips16
	.ent	pong
pong:
	.frame	$sp,8,$31		# vars= 0, regs= 1/0, args= 0, gp= 0
	.mask	0x80000000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	addiu	$sp,$sp,-8
	sw	$31,4($sp)
	jal	checkCollide
	nop

	jal	updateBall
	nop

	jal	AI
	nop

	lw	$31,4($sp)
	j	drawAll
	addiu	$sp,$sp,8

	.set	macro
	.set	reorder
	.end	pong
	.size	pong, .-pong
	.section	.rodata.str1.4
	.align	2
$LC2:
	.ascii	"- VSH-Exploit DEMO -\000"
	.align	2
$LC3:
	.ascii	"loading required functions...\000"
	.align	2
$LC4:
	.ascii	"loading required functions... done\000"
	.align	2
$LC5:
	.ascii	"start\000"
	.align	2
$LC6:
	.ascii	"       - Pong Demo -\000"
	.text
	.align	2
	.globl	main
	.set	nomips16
	.ent	main
main:
	.frame	$sp,40,$31		# vars= 0, regs= 10/0, args= 0, gp= 0
	.mask	0xc0ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	lui	$2,%hi(sceKernelDcacheWritebackAll)
	lw	$3,%lo(sceKernelDcacheWritebackAll)($2)
	addiu	$sp,$sp,-40
	sw	$31,36($sp)
	sw	$fp,32($sp)
	sw	$23,28($sp)
	sw	$22,24($sp)
	sw	$21,20($sp)
	sw	$20,16($sp)
	sw	$19,12($sp)
	sw	$18,8($sp)
	sw	$17,4($sp)
	jalr	$3
	sw	$16,0($sp)

	jal	InitGlobals
	lui	$23,%hi(vramtop)

	jal	initScreenAndCtrl
	lui	$fp,%hi(drawframe)

	lui	$2,%hi(colours)
	li	$3,1074397184			# 0x400a0000
	addiu	$20,$2,%lo(colours)
	ori	$16,$3,0xa000
	li	$2,131072			# 0x20000
	li	$3,1966080			# 0x1e0000
	ori	$18,$2,0xa800
	ori	$19,$3,0x8480
	lui	$2,%hi($LC2)
	li	$3,983040			# 0xf0000
	addiu	$21,$2,%lo($LC2)
	ori	$22,$3,0x4240
	lui	$17,%hi(sceKernelDelayThread)
	lw	$2,%lo(drawframe)($fp)
$L248:
	lw	$4,%lo(vramtop)($23)
	li	$3,1073741824			# 0x40000000
	lw	$5,40($20)
	movn	$3,$16,$2
	addu	$4,$4,$3
	move	$2,$0
$L231:
	addiu	$2,$2,1
	sw	$5,0($4)
	bne	$2,$18,$L231
	addiu	$4,$4,4

	lw	$3,%lo(sceKernelDelayThread)($17)
	jalr	$3
	move	$4,$19

	lw	$6,4($20)
	move	$4,$0
	move	$5,$0
	jal	Print
	move	$7,$21

	jal	changeBuffer
	nop

	lw	$3,%lo(sceKernelDelayThread)($17)
	jalr	$3
	move	$4,$22

	bne	$2,$0,$L248
	lw	$2,%lo(drawframe)($fp)

	lui	$2,%hi($LC3)
	move	$18,$22
	addiu	$16,$2,%lo($LC3)
	lw	$3,%lo(sceKernelDelayThread)($17)
$L249:
	jalr	$3
	move	$4,$18

	lw	$6,4($20)
	move	$4,$0
	move	$5,$0
	jal	Print
	move	$7,$16

	jal	changeBuffer
	nop

	lw	$3,%lo(sceKernelDelayThread)($17)
	jalr	$3
	move	$4,$19

	bne	$2,$0,$L249
	lw	$3,%lo(sceKernelDelayThread)($17)

	lui	$2,%hi($LC4)
	addiu	$16,$2,%lo($LC4)
	lw	$6,4($20)
$L250:
	move	$4,$0
	move	$5,$0
	jal	Print
	move	$7,$16

	jal	changeBuffer
	nop

	lw	$3,%lo(sceKernelDelayThread)($17)
	jalr	$3
	move	$4,$18

	bne	$2,$0,$L250
	lw	$6,4($20)

	lui	$2,%hi($LC5)
	addiu	$18,$2,%lo($LC5)
$L251:
	move	$4,$0
	move	$5,$0
	jal	Print
	move	$7,$16

	lw	$6,4($20)
	move	$4,$0
	li	$5,1			# 0x1
	jal	Print
	move	$7,$18

	jal	changeBuffer
	nop

	lw	$3,%lo(sceKernelDelayThread)($17)
	jalr	$3
	li	$4,1			# 0x1

	bnel	$2,$0,$L251
	lw	$6,4($20)

	lui	$2,%hi(sceDisplayWaitVblankStart)
	lw	$3,%lo(sceDisplayWaitVblankStart)($2)
	lui	$21,%hi(sceCtrlReadBufferPositive)
	jalr	$3
	lui	$18,%hi(var1)

	jal	fadeIn
	lui	$19,%hi(var2)

	jal	fadeOut
	nop

	lw	$6,12($20)
	lui	$7,%hi($LC6)
	addiu	$7,$7,%lo($LC6)
	li	$5,15			# 0xf
	jal	Print
	li	$4,16			# 0x10

	jal	changeBuffer
	nop

	lui	$2,%hi(sceKernelDelayThread)
	lw	$3,%lo(sceKernelDelayThread)($2)
	li	$4,2949120			# 0x2d0000
	jalr	$3
	ori	$4,$4,0xc6c0

	jal	changeBuffer
	nop

	jal	fadeIn
	nop

	jal	fadeOut
	nop

	lui	$2,%hi(gpaddata)
	addiu	$17,$2,%lo(gpaddata)
	li	$3,1074397184			# 0x400a0000
	li	$2,131072			# 0x20000
	ori	$22,$3,0xa000
	ori	$16,$2,0xa800
	lw	$2,%lo(drawframe)($fp)
$L247:
	lw	$4,%lo(vramtop)($23)
	li	$3,1073741824			# 0x40000000
	lw	$5,40($20)
	movn	$3,$22,$2
	addu	$4,$4,$3
	move	$2,$0
$L238:
	addiu	$2,$2,1
	sw	$5,0($4)
	bne	$2,$16,$L238
	addiu	$4,$4,4

	lw	$3,%lo(sceCtrlReadBufferPositive)($21)
	li	$5,1			# 0x1
	move	$4,$17
	jalr	$3
	sw	$0,4($17)

	jal	ProcessKeys
	lw	$4,4($17)

	jal	rand
	nop

	andi	$2,$2,0x1
	addiu	$2,$2,1
	jal	rand
	sw	$2,%lo(var1)($18)

	andi	$2,$2,0x1
	addiu	$2,$2,1
	jal	pong
	sw	$2,%lo(var2)($19)

	j	$L247
	lw	$2,%lo(drawframe)($fp)

	.set	macro
	.set	reorder
	.end	main
	.size	main, .-main
	.section	.text.start,"ax",@progbits
	.align	2
	.globl	_start
	.set	nomips16
	.ent	_start
_start:
	.frame	$sp,264,$31		# vars= 224, regs= 9/0, args= 0, gp= 0
	.mask	0x40ff0000,-4
	.fmask	0x00000000,0
	.set	noreorder
	.set	nomacro
	
	li	$5,1376256			# 0x150000
	ori	$2,$5,0xb130
	addiu	$sp,$sp,-264
	addu	$2,$4,$2
	sw	$2,0($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb150
	addu	$2,$4,$2
	sw	$2,16($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb158
	addu	$2,$4,$2
	sw	$2,20($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb160
	addu	$2,$4,$2
	sw	$2,24($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb168
	addu	$2,$4,$2
	sw	$2,28($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb180
	addu	$2,$4,$2
	sw	$2,32($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb188
	addu	$2,$4,$2
	sw	$2,36($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb198
	addu	$2,$4,$2
	sw	$2,40($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb178
	addu	$2,$4,$2
	sw	$2,44($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1a8
	addu	$2,$4,$2
	sw	$2,48($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1b0
	addu	$2,$4,$2
	sw	$2,52($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1b8
	addu	$2,$4,$2
	sw	$2,56($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1a0
	addu	$2,$4,$2
	sw	$2,60($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1c0
	addu	$2,$4,$2
	sw	$2,64($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1c8
	addu	$2,$4,$2
	sw	$2,68($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1d0
	addu	$2,$4,$2
	sw	$2,72($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1d8
	addu	$2,$4,$2
	sw	$2,76($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1e0
	addu	$2,$4,$2
	sw	$2,80($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1e8
	addu	$2,$4,$2
	sw	$2,84($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb1f0
	ori	$3,$5,0xb138
	ori	$7,$5,0xb140
	addu	$2,$4,$2
	sw	$2,88($sp)
	addu	$3,$4,$3
	addu	$7,$4,$7
	li	$2,1376256			# 0x150000
	sw	$fp,260($sp)
	sw	$3,4($sp)
	sw	$7,8($sp)
	ori	$fp,$5,0xb148
	ori	$3,$5,0xb1f8
	ori	$7,$5,0xb200
	ori	$2,$2,0xb218
	addu	$fp,$4,$fp
	addu	$3,$4,$3
	addu	$7,$4,$7
	addu	$2,$4,$2
	sw	$23,256($sp)
	sw	$22,252($sp)
	sw	$21,248($sp)
	sw	$20,244($sp)
	sw	$19,240($sp)
	sw	$18,236($sp)
	sw	$17,232($sp)
	sw	$16,228($sp)
	sw	$fp,12($sp)
	sw	$3,92($sp)
	sw	$7,96($sp)
	sw	$2,108($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb238
	addu	$2,$4,$2
	sw	$2,116($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb250
	addu	$2,$4,$2
	sw	$2,124($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb260
	addu	$2,$4,$2
	sw	$2,132($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb270
	addu	$2,$4,$2
	sw	$2,140($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb278
	addu	$2,$4,$2
	sw	$2,144($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb280
	addu	$2,$4,$2
	sw	$2,148($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb288
	addu	$2,$4,$2
	sw	$2,152($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb290
	addu	$2,$4,$2
	sw	$2,156($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb298
	addu	$2,$4,$2
	sw	$2,160($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2a0
	addu	$2,$4,$2
	sw	$2,164($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2a8
	addu	$2,$4,$2
	sw	$2,168($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2b0
	addu	$2,$4,$2
	sw	$2,172($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2b8
	addu	$2,$4,$2
	sw	$2,176($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2c0
	addu	$2,$4,$2
	sw	$2,180($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2c8
	addu	$2,$4,$2
	sw	$2,184($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2d0
	addu	$2,$4,$2
	sw	$2,188($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2d8
	addu	$2,$4,$2
	sw	$2,192($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb2e0
	addu	$2,$4,$2
	sw	$2,196($sp)
	li	$2,1376256			# 0x150000
	ori	$2,$2,0xb4b0
	addu	$2,$4,$2
	li	$3,1376256			# 0x150000
	sw	$2,200($sp)
	ori	$3,$3,0xb210
	li	$2,1376256			# 0x150000
	addu	$3,$4,$3
	ori	$2,$2,0xb4b8
	sw	$3,104($sp)
	addu	$2,$4,$2
	li	$3,1376256			# 0x150000
	sw	$2,204($sp)
	ori	$3,$3,0xb228
	li	$2,1376256			# 0x150000
	addu	$3,$4,$3
	ori	$2,$2,0xb4c0
	sw	$3,112($sp)
	addu	$2,$4,$2
	li	$3,1376256			# 0x150000
	sw	$2,208($sp)
	ori	$3,$3,0xb240
	li	$2,1376256			# 0x150000
	addu	$3,$4,$3
	ori	$2,$2,0xb480
	sw	$3,120($sp)
	addu	$2,$4,$2
	li	$3,1376256			# 0x150000
	sw	$2,212($sp)
	ori	$3,$3,0xb258
	li	$2,1376256			# 0x150000
	addu	$3,$4,$3
	ori	$2,$2,0xb488
	sw	$3,128($sp)
	addu	$2,$4,$2
	li	$3,1376256			# 0x150000
	sw	$2,216($sp)
	ori	$3,$3,0xb268
	li	$2,1376256			# 0x150000
	addu	$3,$4,$3
	ori	$2,$2,0xb498
	sw	$3,136($sp)
	ori	$8,$5,0xb398
	ori	$3,$5,0xb4a0
	ori	$9,$5,0xb3a0
	addu	$2,$4,$2
	sw	$2,220($sp)
	ori	$10,$5,0xb3a8
	ori	$11,$5,0xb3b0
	ori	$fp,$5,0xb208
	addu	$6,$4,$3
	lui	$2,%hi(sceGeListSync)
	lui	$3,%hi(sceGeListEnQueueHead)
	addu	$8,$4,$8
	addu	$9,$4,$9
	ori	$13,$5,0xb3c0
	addu	$fp,$4,$fp
	sw	$8,%lo(sceGeListSync)($2)
	sw	$9,%lo(sceGeListEnQueueHead)($3)
	lui	$2,%hi(sceGeEdramGetSize)
	lui	$3,%hi(sceGeContinue)
	addu	$10,$4,$10
	addu	$11,$4,$11
	sw	$fp,100($sp)
	ori	$15,$5,0xb3d0
	sw	$10,%lo(sceGeEdramGetSize)($2)
	addu	$13,$4,$13
	sw	$11,%lo(sceGeContinue)($3)
	lui	$3,%hi(sceGeDrawSync)
	ori	$12,$5,0xb3b8
	ori	$17,$5,0xb358
	sw	$13,%lo(sceGeDrawSync)($3)
	addu	$15,$4,$15
	lui	$3,%hi(sceGeListUpdateStallAddr)
	ori	$14,$5,0xb3c8
	ori	$19,$5,0xb368
	addu	$17,$4,$17
	lui	$2,%hi(sceGeListEnQueue)
	sw	$15,%lo(sceGeListUpdateStallAddr)($3)
	addu	$12,$4,$12
	lui	$3,%hi(sceCtrlSetSamplingMode)
	sw	$17,%lo(sceCtrlSetSamplingMode)($3)
	ori	$16,$5,0xb3d8
	ori	$21,$5,0xb378
	addu	$19,$4,$19
	sw	$12,%lo(sceGeListEnQueue)($2)
	lui	$3,%hi(sceCtrlGetSamplingMode)
	lui	$2,%hi(sceGeBreak)
	addu	$14,$4,$14
	sw	$19,%lo(sceCtrlGetSamplingMode)($3)
	ori	$18,$5,0xb360
	ori	$23,$5,0xb388
	addu	$16,$4,$16
	addu	$21,$4,$21
	sw	$14,%lo(sceGeBreak)($2)
	lui	$3,%hi(sceDisplaySetFrameBuf)
	lui	$2,%hi(sceGeEdramGetAddr)
	sw	$16,%lo(sceGeEdramGetAddr)($2)
	sw	$21,%lo(sceDisplaySetFrameBuf)($3)
	ori	$20,$5,0xb370
	ori	$25,$5,0xb128
	addu	$18,$4,$18
	addu	$23,$4,$23
	lui	$2,%hi(sceCtrlReadBufferPositive)
	lui	$3,%hi(sceDisplayGetFrameBuf)
	sw	$18,%lo(sceCtrlReadBufferPositive)($2)
	sw	$23,%lo(sceDisplayGetFrameBuf)($3)
	ori	$22,$5,0xb380
	addu	$20,$4,$20
	lui	$2,%hi(sceDisplaySetMode)
	lui	$3,%hi(sceKernelReleaseSubIntrHandler)
	addu	$25,$4,$25
	sw	$20,%lo(sceDisplaySetMode)($2)
	ori	$24,$5,0xb120
	addu	$22,$4,$22
	lui	$2,%hi(sceDisplayWaitVblankStart)
	sw	$25,%lo(sceKernelReleaseSubIntrHandler)($3)
	lw	$3,0($sp)
	sw	$22,%lo(sceDisplayWaitVblankStart)($2)
	addu	$24,$4,$24
	lui	$2,%hi(sceKernelRegisterSubIntrHandler)
	sw	$24,%lo(sceKernelRegisterSubIntrHandler)($2)
	lui	$2,%hi(sceKernelEnableSubIntr)
	sw	$3,%lo(sceKernelEnableSubIntr)($2)
	lw	$2,4($sp)
	lui	$3,%hi(sceIoWrite)
	li	$7,65536			# 0x10000
	sw	$2,%lo(sceIoWrite)($3)
	lw	$3,8($sp)
	lui	$2,%hi(sceIoIoctl)
	ori	$7,$7,0x5230
	sw	$3,%lo(sceIoIoctl)($2)
	lw	$2,12($sp)
	lui	$3,%hi(sceIoRead)
	addu	$7,$4,$7
	sw	$2,%lo(sceIoRead)($3)
	lw	$3,16($sp)
	lui	$2,%hi(sceIoClose)
	ori	$fp,$5,0xb490
	sw	$3,%lo(sceIoClose)($2)
	lw	$2,20($sp)
	lui	$3,%hi(sceIoGetstat)
	addu	$fp,$4,$fp
	sw	$2,%lo(sceIoGetstat)($3)
	lw	$3,24($sp)
	lui	$2,%hi(sceIoOpen)
	ori	$5,$5,0xb4a8
	sw	$3,%lo(sceIoOpen)($2)
	lw	$2,28($sp)
	lui	$3,%hi(sceIoLseek)
	addu	$5,$4,$5
	sw	$2,%lo(sceIoLseek)($3)
	lw	$3,32($sp)
	lui	$2,%hi(sceKernelCpuSuspendIntr)
	sw	$3,%lo(sceKernelCpuSuspendIntr)($2)
	lw	$2,36($sp)
	lui	$3,%hi(sceKernelUnlockLwMutex)
	sw	$2,%lo(sceKernelUnlockLwMutex)($3)
	lw	$3,40($sp)
	lui	$2,%hi(sceKernelCpuResumeIntr)
	sw	$3,%lo(sceKernelCpuResumeIntr)($2)
	lw	$2,44($sp)
	lui	$3,%hi(sceKernelLockLwMutex)
	sw	$2,%lo(sceKernelLockLwMutex)($3)
	lw	$3,48($sp)
	lui	$2,%hi(sceKernelUnloadModule)
	sw	$3,%lo(sceKernelUnloadModule)($2)
	lw	$2,52($sp)
	lui	$3,%hi(sceKernelStartModule)
	sw	$2,%lo(sceKernelStartModule)($3)
	lw	$3,56($sp)
	lui	$2,%hi(sceKernelLoadModule)
	sw	$3,%lo(sceKernelLoadModule)($2)
	lw	$2,60($sp)
	lui	$3,%hi(sceKernelStopModule)
	sw	$2,%lo(sceKernelStopModule)($3)
	lw	$3,64($sp)
	lui	$2,%hi(sceKernelPrintf)
	sw	$3,%lo(sceKernelPrintf)($2)
	lw	$2,68($sp)
	lui	$3,%hi(SysMemUserForUser_ACBD88CA)
	sw	$2,%lo(SysMemUserForUser_ACBD88CA)($3)
	lw	$3,72($sp)
	lui	$2,%hi(sceKernelCreateFpl)
	sw	$3,%lo(sceKernelCreateFpl)($2)
	lw	$2,76($sp)
	lui	$3,%hi(sceKernelCancelEventFlag)
	sw	$2,%lo(sceKernelCancelEventFlag)($3)
	lw	$3,80($sp)
	lui	$2,%hi(sceKernelDelayThread)
	sw	$3,%lo(sceKernelDelayThread)($2)
	lw	$2,84($sp)
	lui	$3,%hi(sceKernelCreateSema)
	sw	$2,%lo(sceKernelCreateSema)($3)
	lw	$3,88($sp)
	lui	$2,%hi(sceKernelDeleteFpl)
	sw	$3,%lo(sceKernelDeleteFpl)($2)
	lw	$2,92($sp)
	lui	$3,%hi(sceKernelDeleteEventFlag)
	sw	$2,%lo(sceKernelDeleteEventFlag)($3)
	lw	$3,96($sp)
	lui	$2,%hi(sceKernelSetEventFlag)
	sw	$3,%lo(sceKernelSetEventFlag)($2)
	lw	$2,100($sp)
	lui	$3,%hi(sceKernelStartThread)
	sw	$2,%lo(sceKernelStartThread)($3)
	lw	$3,104($sp)
	lui	$2,%hi(sceKernelFreeFpl)
	sw	$3,%lo(sceKernelFreeFpl)($2)
	lw	$2,108($sp)
	lui	$3,%hi(sceKernelWaitThreadEnd)
	sw	$2,%lo(sceKernelWaitThreadEnd)($3)
	lw	$3,112($sp)
	lui	$2,%hi(sceKernelDeleteSema)
	sw	$3,%lo(sceKernelDeleteSema)($2)
	lui	$3,%hi(sceKernelPollEventFlag)
	sw	$7,%lo(sceKernelPollEventFlag)($3)
	lw	$3,116($sp)
	lui	$2,%hi(sceKernelGetSystemTimeLow)
	sw	$3,%lo(sceKernelGetSystemTimeLow)($2)
	lw	$2,120($sp)
	lui	$3,%hi(sceKernelTerminateDeleteThread)
	sw	$2,%lo(sceKernelTerminateDeleteThread)($3)
	lw	$3,124($sp)
	lui	$2,%hi(sceKernelSignalSema)
	sw	$3,%lo(sceKernelSignalSema)($2)
	lw	$2,128($sp)
	lui	$3,%hi(sceKernelWaitEventFlag)
	sw	$2,%lo(sceKernelWaitEventFlag)($3)
	lw	$3,132($sp)
	lui	$2,%hi(sceKernelCreateThread)
	sw	$3,%lo(sceKernelCreateThread)($2)
	lw	$2,136($sp)
	lui	$3,%hi(sceKernelWaitSema)
	sw	$2,%lo(sceKernelWaitSema)($3)
	lw	$3,140($sp)
	lui	$2,%hi(sceKernelCreateEventFlag)
	sw	$3,%lo(sceKernelCreateEventFlag)($2)
	lw	$2,144($sp)
	lui	$3,%hi(sceKernelPollSema)
	sw	$2,%lo(sceKernelPollSema)($3)
	lw	$3,148($sp)
	lui	$2,%hi(sceKernelDeleteLwMutex)
	sw	$3,%lo(sceKernelDeleteLwMutex)($2)
	lw	$2,152($sp)
	lui	$3,%hi(sceKernelTryAllocateFpl)
	sw	$2,%lo(sceKernelTryAllocateFpl)($3)
	lw	$3,156($sp)
	lui	$2,%hi(sceKernelChangeThreadPriority)
	sw	$3,%lo(sceKernelChangeThreadPriority)($2)
	lw	$2,160($sp)
	lui	$3,%hi(sceKernelExitDeleteThread)
	sw	$2,%lo(sceKernelExitDeleteThread)($3)
	lw	$3,164($sp)
	lui	$2,%hi(sceKernelClearEventFlag)
	sw	$3,%lo(sceKernelClearEventFlag)($2)
	lw	$2,168($sp)
	lui	$3,%hi(sceKernelCancelSema)
	sw	$2,%lo(sceKernelCancelSema)($3)
	lw	$3,172($sp)
	lui	$2,%hi(sceKernelGetThreadCurrentPriority)
	sw	$3,%lo(sceKernelGetThreadCurrentPriority)($2)
	lw	$2,176($sp)
	lui	$3,%hi(sceKernelDeleteThread)
	lw	$23,256($sp)
	sw	$2,%lo(sceKernelDeleteThread)($3)
	lw	$3,180($sp)
	lui	$2,%hi(sceKernelExitThread)
	lw	$22,252($sp)
	sw	$3,%lo(sceKernelExitThread)($2)
	lw	$2,184($sp)
	lui	$3,%hi(sceKernelCreateLwMutex)
	lw	$21,248($sp)
	sw	$2,%lo(sceKernelCreateLwMutex)($3)
	lw	$3,188($sp)
	lui	$2,%hi(sceKernelDcacheWritebackAll)
	lw	$20,244($sp)
	sw	$3,%lo(sceKernelDcacheWritebackAll)($2)
	lw	$2,192($sp)
	lui	$3,%hi(sceKernelDcacheInvalidateRange)
	lw	$19,240($sp)
	sw	$2,%lo(sceKernelDcacheInvalidateRange)($3)
	lw	$3,196($sp)
	lui	$2,%hi(sceKernelDcacheWritebackRange)
	lw	$18,236($sp)
	sw	$3,%lo(sceKernelDcacheWritebackRange)($2)
	lw	$2,200($sp)
	lui	$3,%hi(sceRtcGetCurrentTick)
	lw	$17,232($sp)
	sw	$2,%lo(sceRtcGetCurrentTick)($3)
	lw	$3,204($sp)
	lui	$2,%hi(sceRtcGetCurrentClock)
	lw	$16,228($sp)
	sw	$3,%lo(sceRtcGetCurrentClock)($2)
	lw	$2,208($sp)
	lui	$3,%hi(sceRtcGetCurrentClockLocalTime)
	sw	$2,%lo(sceRtcGetCurrentClockLocalTime)($3)
	lw	$3,212($sp)
	lui	$2,%hi(sceRegCloseCategory)
	sw	$3,%lo(sceRegCloseCategory)($2)
	lw	$2,216($sp)
	lui	$3,%hi(sceRegOpenCategory)
	sw	$2,%lo(sceRegOpenCategory)($3)
	lui	$2,%hi(sceRegGetKeyValue)
	sw	$fp,%lo(sceRegGetKeyValue)($2)
	lw	$2,220($sp)
	lui	$3,%hi(sceRegOpenRegistry)
	lw	$fp,260($sp)
	sw	$2,%lo(sceRegOpenRegistry)($3)
	addiu	$sp,$sp,264
	lui	$2,%hi(sceRegGetKeyInfo)
	lui	$3,%hi(sceRegCloseRegistry)
	sw	$6,%lo(sceRegGetKeyInfo)($2)
	j	main
	sw	$5,%lo(sceRegCloseRegistry)($3)

	.set	macro
	.set	reorder
	.end	_start
	.size	_start, .-_start
	.globl	sceGeListSync
	.section	.bss,"aw",@nobits
	.align	2
	.type	sceGeListSync, @object
	.size	sceGeListSync, 4
sceGeListSync:
	.space	4
	.globl	sceGeListEnQueueHead
	.align	2
	.type	sceGeListEnQueueHead, @object
	.size	sceGeListEnQueueHead, 4
sceGeListEnQueueHead:
	.space	4
	.globl	sceGeEdramGetSize
	.align	2
	.type	sceGeEdramGetSize, @object
	.size	sceGeEdramGetSize, 4
sceGeEdramGetSize:
	.space	4
	.globl	sceGeContinue
	.align	2
	.type	sceGeContinue, @object
	.size	sceGeContinue, 4
sceGeContinue:
	.space	4
	.globl	sceGeListEnQueue
	.align	2
	.type	sceGeListEnQueue, @object
	.size	sceGeListEnQueue, 4
sceGeListEnQueue:
	.space	4
	.globl	sceGeDrawSync
	.align	2
	.type	sceGeDrawSync, @object
	.size	sceGeDrawSync, 4
sceGeDrawSync:
	.space	4
	.globl	sceGeBreak
	.align	2
	.type	sceGeBreak, @object
	.size	sceGeBreak, 4
sceGeBreak:
	.space	4
	.globl	sceGeListUpdateStallAddr
	.align	2
	.type	sceGeListUpdateStallAddr, @object
	.size	sceGeListUpdateStallAddr, 4
sceGeListUpdateStallAddr:
	.space	4
	.globl	sceGeEdramGetAddr
	.align	2
	.type	sceGeEdramGetAddr, @object
	.size	sceGeEdramGetAddr, 4
sceGeEdramGetAddr:
	.space	4
	.globl	sceCtrlSetSamplingMode
	.align	2
	.type	sceCtrlSetSamplingMode, @object
	.size	sceCtrlSetSamplingMode, 4
sceCtrlSetSamplingMode:
	.space	4
	.globl	sceCtrlReadBufferPositive
	.align	2
	.type	sceCtrlReadBufferPositive, @object
	.size	sceCtrlReadBufferPositive, 4
sceCtrlReadBufferPositive:
	.space	4
	.globl	sceCtrlGetSamplingMode
	.align	2
	.type	sceCtrlGetSamplingMode, @object
	.size	sceCtrlGetSamplingMode, 4
sceCtrlGetSamplingMode:
	.space	4
	.globl	sceDisplaySetMode
	.align	2
	.type	sceDisplaySetMode, @object
	.size	sceDisplaySetMode, 4
sceDisplaySetMode:
	.space	4
	.globl	sceDisplaySetFrameBuf
	.align	2
	.type	sceDisplaySetFrameBuf, @object
	.size	sceDisplaySetFrameBuf, 4
sceDisplaySetFrameBuf:
	.space	4
	.globl	sceDisplayWaitVblankStart
	.align	2
	.type	sceDisplayWaitVblankStart, @object
	.size	sceDisplayWaitVblankStart, 4
sceDisplayWaitVblankStart:
	.space	4
	.globl	sceDisplayGetFrameBuf
	.align	2
	.type	sceDisplayGetFrameBuf, @object
	.size	sceDisplayGetFrameBuf, 4
sceDisplayGetFrameBuf:
	.space	4
	.globl	sceKernelRegisterSubIntrHandler
	.align	2
	.type	sceKernelRegisterSubIntrHandler, @object
	.size	sceKernelRegisterSubIntrHandler, 4
sceKernelRegisterSubIntrHandler:
	.space	4
	.globl	sceKernelReleaseSubIntrHandler
	.align	2
	.type	sceKernelReleaseSubIntrHandler, @object
	.size	sceKernelReleaseSubIntrHandler, 4
sceKernelReleaseSubIntrHandler:
	.space	4
	.globl	sceKernelEnableSubIntr
	.align	2
	.type	sceKernelEnableSubIntr, @object
	.size	sceKernelEnableSubIntr, 4
sceKernelEnableSubIntr:
	.space	4
	.globl	sceIoWrite
	.align	2
	.type	sceIoWrite, @object
	.size	sceIoWrite, 4
sceIoWrite:
	.space	4
	.globl	sceIoDevctl
	.align	2
	.type	sceIoDevctl, @object
	.size	sceIoDevctl, 4
sceIoDevctl:
	.space	4
	.globl	sceIoIoctl
	.align	2
	.type	sceIoIoctl, @object
	.size	sceIoIoctl, 4
sceIoIoctl:
	.space	4
	.globl	sceIoRead
	.align	2
	.type	sceIoRead, @object
	.size	sceIoRead, 4
sceIoRead:
	.space	4
	.globl	sceIoClose
	.align	2
	.type	sceIoClose, @object
	.size	sceIoClose, 4
sceIoClose:
	.space	4
	.globl	sceIoGetstat
	.align	2
	.type	sceIoGetstat, @object
	.size	sceIoGetstat, 4
sceIoGetstat:
	.space	4
	.globl	sceIoOpen
	.align	2
	.type	sceIoOpen, @object
	.size	sceIoOpen, 4
sceIoOpen:
	.space	4
	.globl	sceIoLseek
	.align	2
	.type	sceIoLseek, @object
	.size	sceIoLseek, 4
sceIoLseek:
	.space	4
	.globl	sceKernelCpuSuspendIntr
	.align	2
	.type	sceKernelCpuSuspendIntr, @object
	.size	sceKernelCpuSuspendIntr, 4
sceKernelCpuSuspendIntr:
	.space	4
	.globl	sceKernelUnlockLwMutex
	.align	2
	.type	sceKernelUnlockLwMutex, @object
	.size	sceKernelUnlockLwMutex, 4
sceKernelUnlockLwMutex:
	.space	4
	.globl	sceKernelCpuResumeIntr
	.align	2
	.type	sceKernelCpuResumeIntr, @object
	.size	sceKernelCpuResumeIntr, 4
sceKernelCpuResumeIntr:
	.space	4
	.globl	sceKernelLockLwMutex
	.align	2
	.type	sceKernelLockLwMutex, @object
	.size	sceKernelLockLwMutex, 4
sceKernelLockLwMutex:
	.space	4
	.globl	sceKernelUnloadModule
	.align	2
	.type	sceKernelUnloadModule, @object
	.size	sceKernelUnloadModule, 4
sceKernelUnloadModule:
	.space	4
	.globl	sceKernelStartModule
	.align	2
	.type	sceKernelStartModule, @object
	.size	sceKernelStartModule, 4
sceKernelStartModule:
	.space	4
	.globl	sceKernelLoadModule
	.align	2
	.type	sceKernelLoadModule, @object
	.size	sceKernelLoadModule, 4
sceKernelLoadModule:
	.space	4
	.globl	sceKernelStopModule
	.align	2
	.type	sceKernelStopModule, @object
	.size	sceKernelStopModule, 4
sceKernelStopModule:
	.space	4
	.globl	sceKernelPrintf
	.align	2
	.type	sceKernelPrintf, @object
	.size	sceKernelPrintf, 4
sceKernelPrintf:
	.space	4
	.globl	SysMemUserForUser_ACBD88CA
	.align	2
	.type	SysMemUserForUser_ACBD88CA, @object
	.size	SysMemUserForUser_ACBD88CA, 4
SysMemUserForUser_ACBD88CA:
	.space	4
	.globl	sceKernelCreateFpl
	.align	2
	.type	sceKernelCreateFpl, @object
	.size	sceKernelCreateFpl, 4
sceKernelCreateFpl:
	.space	4
	.globl	sceKernelCancelEventFlag
	.align	2
	.type	sceKernelCancelEventFlag, @object
	.size	sceKernelCancelEventFlag, 4
sceKernelCancelEventFlag:
	.space	4
	.globl	sceKernelDelayThread
	.align	2
	.type	sceKernelDelayThread, @object
	.size	sceKernelDelayThread, 4
sceKernelDelayThread:
	.space	4
	.globl	sceKernelCreateSema
	.align	2
	.type	sceKernelCreateSema, @object
	.size	sceKernelCreateSema, 4
sceKernelCreateSema:
	.space	4
	.globl	sceKernelDeleteFpl
	.align	2
	.type	sceKernelDeleteFpl, @object
	.size	sceKernelDeleteFpl, 4
sceKernelDeleteFpl:
	.space	4
	.globl	sceKernelDeleteEventFlag
	.align	2
	.type	sceKernelDeleteEventFlag, @object
	.size	sceKernelDeleteEventFlag, 4
sceKernelDeleteEventFlag:
	.space	4
	.globl	sceKernelStartThread
	.align	2
	.type	sceKernelStartThread, @object
	.size	sceKernelStartThread, 4
sceKernelStartThread:
	.space	4
	.globl	sceKernelSetEventFlag
	.align	2
	.type	sceKernelSetEventFlag, @object
	.size	sceKernelSetEventFlag, 4
sceKernelSetEventFlag:
	.space	4
	.globl	sceKernelFreeFpl
	.align	2
	.type	sceKernelFreeFpl, @object
	.size	sceKernelFreeFpl, 4
sceKernelFreeFpl:
	.space	4
	.globl	sceKernelWaitThreadEnd
	.align	2
	.type	sceKernelWaitThreadEnd, @object
	.size	sceKernelWaitThreadEnd, 4
sceKernelWaitThreadEnd:
	.space	4
	.globl	sceKernelDeleteSema
	.align	2
	.type	sceKernelDeleteSema, @object
	.size	sceKernelDeleteSema, 4
sceKernelDeleteSema:
	.space	4
	.globl	sceKernelPollEventFlag
	.align	2
	.type	sceKernelPollEventFlag, @object
	.size	sceKernelPollEventFlag, 4
sceKernelPollEventFlag:
	.space	4
	.globl	sceKernelGetSystemTimeLow
	.align	2
	.type	sceKernelGetSystemTimeLow, @object
	.size	sceKernelGetSystemTimeLow, 4
sceKernelGetSystemTimeLow:
	.space	4
	.globl	sceKernelTerminateDeleteThread
	.align	2
	.type	sceKernelTerminateDeleteThread, @object
	.size	sceKernelTerminateDeleteThread, 4
sceKernelTerminateDeleteThread:
	.space	4
	.globl	sceKernelSignalSema
	.align	2
	.type	sceKernelSignalSema, @object
	.size	sceKernelSignalSema, 4
sceKernelSignalSema:
	.space	4
	.globl	sceKernelWaitEventFlag
	.align	2
	.type	sceKernelWaitEventFlag, @object
	.size	sceKernelWaitEventFlag, 4
sceKernelWaitEventFlag:
	.space	4
	.globl	sceKernelCreateThread
	.align	2
	.type	sceKernelCreateThread, @object
	.size	sceKernelCreateThread, 4
sceKernelCreateThread:
	.space	4
	.globl	sceKernelWaitSema
	.align	2
	.type	sceKernelWaitSema, @object
	.size	sceKernelWaitSema, 4
sceKernelWaitSema:
	.space	4
	.globl	sceKernelCreateEventFlag
	.align	2
	.type	sceKernelCreateEventFlag, @object
	.size	sceKernelCreateEventFlag, 4
sceKernelCreateEventFlag:
	.space	4
	.globl	sceKernelPollSema
	.align	2
	.type	sceKernelPollSema, @object
	.size	sceKernelPollSema, 4
sceKernelPollSema:
	.space	4
	.globl	sceKernelDeleteLwMutex
	.align	2
	.type	sceKernelDeleteLwMutex, @object
	.size	sceKernelDeleteLwMutex, 4
sceKernelDeleteLwMutex:
	.space	4
	.globl	sceKernelTryAllocateFpl
	.align	2
	.type	sceKernelTryAllocateFpl, @object
	.size	sceKernelTryAllocateFpl, 4
sceKernelTryAllocateFpl:
	.space	4
	.globl	sceKernelChangeThreadPriority
	.align	2
	.type	sceKernelChangeThreadPriority, @object
	.size	sceKernelChangeThreadPriority, 4
sceKernelChangeThreadPriority:
	.space	4
	.globl	sceKernelExitDeleteThread
	.align	2
	.type	sceKernelExitDeleteThread, @object
	.size	sceKernelExitDeleteThread, 4
sceKernelExitDeleteThread:
	.space	4
	.globl	sceKernelClearEventFlag
	.align	2
	.type	sceKernelClearEventFlag, @object
	.size	sceKernelClearEventFlag, 4
sceKernelClearEventFlag:
	.space	4
	.globl	sceKernelCancelSema
	.align	2
	.type	sceKernelCancelSema, @object
	.size	sceKernelCancelSema, 4
sceKernelCancelSema:
	.space	4
	.globl	sceKernelGetThreadCurrentPriority
	.align	2
	.type	sceKernelGetThreadCurrentPriority, @object
	.size	sceKernelGetThreadCurrentPriority, 4
sceKernelGetThreadCurrentPriority:
	.space	4
	.globl	sceKernelDeleteThread
	.align	2
	.type	sceKernelDeleteThread, @object
	.size	sceKernelDeleteThread, 4
sceKernelDeleteThread:
	.space	4
	.globl	sceKernelExitThread
	.align	2
	.type	sceKernelExitThread, @object
	.size	sceKernelExitThread, 4
sceKernelExitThread:
	.space	4
	.globl	sceKernelCreateLwMutex
	.align	2
	.type	sceKernelCreateLwMutex, @object
	.size	sceKernelCreateLwMutex, 4
sceKernelCreateLwMutex:
	.space	4
	.globl	sceKernelDcacheWritebackAll
	.align	2
	.type	sceKernelDcacheWritebackAll, @object
	.size	sceKernelDcacheWritebackAll, 4
sceKernelDcacheWritebackAll:
	.space	4
	.globl	sceKernelDcacheInvalidateRange
	.align	2
	.type	sceKernelDcacheInvalidateRange, @object
	.size	sceKernelDcacheInvalidateRange, 4
sceKernelDcacheInvalidateRange:
	.space	4
	.globl	sceKernelDcacheWritebackRange
	.align	2
	.type	sceKernelDcacheWritebackRange, @object
	.size	sceKernelDcacheWritebackRange, 4
sceKernelDcacheWritebackRange:
	.space	4
	.globl	sceRtcGetCurrentTick
	.align	2
	.type	sceRtcGetCurrentTick, @object
	.size	sceRtcGetCurrentTick, 4
sceRtcGetCurrentTick:
	.space	4
	.globl	sceRtcGetCurrentClock
	.align	2
	.type	sceRtcGetCurrentClock, @object
	.size	sceRtcGetCurrentClock, 4
sceRtcGetCurrentClock:
	.space	4
	.globl	sceRtcGetCurrentClockLocalTime
	.align	2
	.type	sceRtcGetCurrentClockLocalTime, @object
	.size	sceRtcGetCurrentClockLocalTime, 4
sceRtcGetCurrentClockLocalTime:
	.space	4
	.globl	sceMpegAvcDecode
	.align	2
	.type	sceMpegAvcDecode, @object
	.size	sceMpegAvcDecode, 4
sceMpegAvcDecode:
	.space	4
	.globl	sceMpegRingbufferDestruct
	.align	2
	.type	sceMpegRingbufferDestruct, @object
	.size	sceMpegRingbufferDestruct, 4
sceMpegRingbufferDestruct:
	.space	4
	.globl	sceMpegInitAu
	.align	2
	.type	sceMpegInitAu, @object
	.size	sceMpegInitAu, 4
sceMpegInitAu:
	.space	4
	.globl	sceMpegQueryStreamOffset
	.align	2
	.type	sceMpegQueryStreamOffset, @object
	.size	sceMpegQueryStreamOffset, 4
sceMpegQueryStreamOffset:
	.space	4
	.globl	sceMpegRingbufferConstruct
	.align	2
	.type	sceMpegRingbufferConstruct, @object
	.size	sceMpegRingbufferConstruct, 4
sceMpegRingbufferConstruct:
	.space	4
	.globl	sceMpegRegistStream
	.align	2
	.type	sceMpegRegistStream, @object
	.size	sceMpegRegistStream, 4
sceMpegRegistStream:
	.space	4
	.globl	sceMpegUnRegistStream
	.align	2
	.type	sceMpegUnRegistStream, @object
	.size	sceMpegUnRegistStream, 4
sceMpegUnRegistStream:
	.space	4
	.globl	sceMpegDelete
	.align	2
	.type	sceMpegDelete, @object
	.size	sceMpegDelete, 4
sceMpegDelete:
	.space	4
	.globl	sceMpegQueryStreamSize
	.align	2
	.type	sceMpegQueryStreamSize, @object
	.size	sceMpegQueryStreamSize, 4
sceMpegQueryStreamSize:
	.space	4
	.globl	sceMpegAtracDecode
	.align	2
	.type	sceMpegAtracDecode, @object
	.size	sceMpegAtracDecode, 4
sceMpegAtracDecode:
	.space	4
	.globl	sceMpegMallocAvcEsBuf
	.align	2
	.type	sceMpegMallocAvcEsBuf, @object
	.size	sceMpegMallocAvcEsBuf, 4
sceMpegMallocAvcEsBuf:
	.space	4
	.globl	sceMpegRingbufferPut
	.align	2
	.type	sceMpegRingbufferPut, @object
	.size	sceMpegRingbufferPut, 4
sceMpegRingbufferPut:
	.space	4
	.globl	sceMpegRingbufferAvailableSize
	.align	2
	.type	sceMpegRingbufferAvailableSize, @object
	.size	sceMpegRingbufferAvailableSize, 4
sceMpegRingbufferAvailableSize:
	.space	4
	.globl	sceMpegQueryMemSize
	.align	2
	.type	sceMpegQueryMemSize, @object
	.size	sceMpegQueryMemSize, 4
sceMpegQueryMemSize:
	.space	4
	.globl	sceMpegFreeAvcEsBuf
	.align	2
	.type	sceMpegFreeAvcEsBuf, @object
	.size	sceMpegFreeAvcEsBuf, 4
sceMpegFreeAvcEsBuf:
	.space	4
	.globl	sceMpegRingbufferQueryMemSize
	.align	2
	.type	sceMpegRingbufferQueryMemSize, @object
	.size	sceMpegRingbufferQueryMemSize, 4
sceMpegRingbufferQueryMemSize:
	.space	4
	.globl	sceMpegCreate
	.align	2
	.type	sceMpegCreate, @object
	.size	sceMpegCreate, 4
sceMpegCreate:
	.space	4
	.globl	sceMpegGetAtracAu
	.align	2
	.type	sceMpegGetAtracAu, @object
	.size	sceMpegGetAtracAu, 4
sceMpegGetAtracAu:
	.space	4
	.globl	sceMpegQueryAtracEsSize
	.align	2
	.type	sceMpegQueryAtracEsSize, @object
	.size	sceMpegQueryAtracEsSize, 4
sceMpegQueryAtracEsSize:
	.space	4
	.globl	sceMpegGetAvcAu
	.align	2
	.type	sceMpegGetAvcAu, @object
	.size	sceMpegGetAvcAu, 4
sceMpegGetAvcAu:
	.space	4
	.globl	sceAudioOutputBlocking
	.align	2
	.type	sceAudioOutputBlocking, @object
	.size	sceAudioOutputBlocking, 4
sceAudioOutputBlocking:
	.space	4
	.globl	sceAudioOutputPannedBlocking
	.align	2
	.type	sceAudioOutputPannedBlocking, @object
	.size	sceAudioOutputPannedBlocking, 4
sceAudioOutputPannedBlocking:
	.space	4
	.globl	sceAudioChReserve
	.align	2
	.type	sceAudioChReserve, @object
	.size	sceAudioChReserve, 4
sceAudioChReserve:
	.space	4
	.globl	sceAudioChRelease
	.align	2
	.type	sceAudioChRelease, @object
	.size	sceAudioChRelease, 4
sceAudioChRelease:
	.space	4
	.globl	sceAudioChangeChannelConfig
	.align	2
	.type	sceAudioChangeChannelConfig, @object
	.size	sceAudioChangeChannelConfig, 4
sceAudioChangeChannelConfig:
	.space	4
	.globl	sceAudioGetChannelRestLength
	.align	2
	.type	sceAudioGetChannelRestLength, @object
	.size	sceAudioGetChannelRestLength, 4
sceAudioGetChannelRestLength:
	.space	4
	.globl	sceAudioChangeChannelVolume
	.align	2
	.type	sceAudioChangeChannelVolume, @object
	.size	sceAudioChangeChannelVolume, 4
sceAudioChangeChannelVolume:
	.space	4
	.globl	sceAudioSetChannelDataLen
	.align	2
	.type	sceAudioSetChannelDataLen, @object
	.size	sceAudioSetChannelDataLen, 4
sceAudioSetChannelDataLen:
	.space	4
	.globl	sceAudioOutputPanned
	.align	2
	.type	sceAudioOutputPanned, @object
	.size	sceAudioOutputPanned, 4
sceAudioOutputPanned:
	.space	4
	.globl	sceRegCloseCategory
	.align	2
	.type	sceRegCloseCategory, @object
	.size	sceRegCloseCategory, 4
sceRegCloseCategory:
	.space	4
	.globl	sceRegOpenCategory
	.align	2
	.type	sceRegOpenCategory, @object
	.size	sceRegOpenCategory, 4
sceRegOpenCategory:
	.space	4
	.globl	sceRegGetKeyValue
	.align	2
	.type	sceRegGetKeyValue, @object
	.size	sceRegGetKeyValue, 4
sceRegGetKeyValue:
	.space	4
	.globl	sceRegOpenRegistry
	.align	2
	.type	sceRegOpenRegistry, @object
	.size	sceRegOpenRegistry, 4
sceRegOpenRegistry:
	.space	4
	.globl	sceRegGetKeyInfo
	.align	2
	.type	sceRegGetKeyInfo, @object
	.size	sceRegGetKeyInfo, 4
sceRegGetKeyInfo:
	.space	4
	.globl	sceRegCloseRegistry
	.align	2
	.type	sceRegCloseRegistry, @object
	.size	sceRegCloseRegistry, 4
sceRegCloseRegistry:
	.space	4
	.globl	LEFT
	.data
	.align	2
	.type	LEFT, @object
	.size	LEFT, 4
LEFT:
	.word	1
	.globl	RIGHT
	.align	2
	.type	RIGHT, @object
	.size	RIGHT, 4
RIGHT:
	.word	2
	.globl	UP
	.align	2
	.type	UP, @object
	.size	UP, 4
UP:
	.word	1
	.globl	DOWN
	.align	2
	.type	DOWN, @object
	.size	DOWN, 4
DOWN:
	.word	2
	.globl	ballX
	.align	2
	.type	ballX, @object
	.size	ballX, 4
ballX:
	.word	200
	.globl	ballY
	.align	2
	.type	ballY, @object
	.size	ballY, 4
ballY:
	.word	100
	.globl	ballV_Direction
	.align	2
	.type	ballV_Direction, @object
	.size	ballV_Direction, 4
ballV_Direction:
	.word	2
	.globl	ballH_Direction
	.align	2
	.type	ballH_Direction, @object
	.size	ballH_Direction, 4
ballH_Direction:
	.word	1
	.globl	ballWidth
	.align	2
	.type	ballWidth, @object
	.size	ballWidth, 4
ballWidth:
	.word	16
	.globl	ballHeight
	.align	2
	.type	ballHeight, @object
	.size	ballHeight, 4
ballHeight:
	.word	16
	.globl	ballV_Speed
	.align	2
	.type	ballV_Speed, @object
	.size	ballV_Speed, 4
ballV_Speed:
	.word	4
	.globl	ballH_Speed
	.align	2
	.type	ballH_Speed, @object
	.size	ballH_Speed, 4
ballH_Speed:
	.word	4
	.globl	paddleHeight
	.align	2
	.type	paddleHeight, @object
	.size	paddleHeight, 4
paddleHeight:
	.word	64
	.globl	paddleWidth
	.align	2
	.type	paddleWidth, @object
	.size	paddleWidth, 4
paddleWidth:
	.word	16
	.globl	paddleSpeed
	.align	2
	.type	paddleSpeed, @object
	.size	paddleSpeed, 4
paddleSpeed:
	.word	6
	.globl	paddle1X
	.align	2
	.type	paddle1X, @object
	.size	paddle1X, 4
paddle1X:
	.word	10
	.globl	paddle1Y
	.align	2
	.type	paddle1Y, @object
	.size	paddle1Y, 4
paddle1Y:
	.word	20
	.globl	paddle2X
	.align	2
	.type	paddle2X, @object
	.size	paddle2X, 4
paddle2X:
	.word	452
	.globl	paddle2Y
	.align	2
	.type	paddle2Y, @object
	.size	paddle2Y, 4
paddle2Y:
	.word	20
	.globl	playerScore
	.section	.bss
	.align	2
	.type	playerScore, @object
	.size	playerScore, 4
playerScore:
	.space	4
	.globl	cpuScore
	.align	2
	.type	cpuScore, @object
	.size	cpuScore, 4
cpuScore:
	.space	4
	.globl	top
	.data
	.align	2
	.type	top, @object
	.size	top, 4
top:
	.word	16
	.globl	bottom
	.align	2
	.type	bottom, @object
	.size	bottom, 4
bottom:
	.word	256
	.globl	bounces
	.section	.bss
	.align	2
	.type	bounces, @object
	.size	bounces, 4
bounces:
	.space	4
	.globl	font
	.rdata
	.align	2
	.type	font, @object
	.size	font, 2048
font:
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	120
	.byte	120
	.byte	48
	.byte	48
	.byte	0
	.byte	48
	.byte	0
	.byte	108
	.byte	108
	.byte	108
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	108
	.byte	108
	.byte	-2
	.byte	108
	.byte	-2
	.byte	108
	.byte	108
	.byte	0
	.byte	48
	.byte	124
	.byte	-64
	.byte	120
	.byte	12
	.byte	-8
	.byte	48
	.byte	0
	.byte	0
	.byte	-58
	.byte	-52
	.byte	24
	.byte	48
	.byte	102
	.byte	-58
	.byte	0
	.byte	56
	.byte	108
	.byte	56
	.byte	118
	.byte	-36
	.byte	-52
	.byte	118
	.byte	0
	.byte	96
	.byte	96
	.byte	-64
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	24
	.byte	48
	.byte	96
	.byte	96
	.byte	96
	.byte	48
	.byte	24
	.byte	0
	.byte	96
	.byte	48
	.byte	24
	.byte	24
	.byte	24
	.byte	48
	.byte	96
	.byte	0
	.byte	0
	.byte	102
	.byte	60
	.byte	-1
	.byte	60
	.byte	102
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	-4
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	96
	.byte	0
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	6
	.byte	12
	.byte	24
	.byte	48
	.byte	96
	.byte	-64
	.byte	-128
	.byte	0
	.byte	124
	.byte	-58
	.byte	-50
	.byte	-34
	.byte	-10
	.byte	-26
	.byte	124
	.byte	0
	.byte	48
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	-4
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	56
	.byte	96
	.byte	-52
	.byte	-4
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	56
	.byte	12
	.byte	-52
	.byte	120
	.byte	0
	.byte	28
	.byte	60
	.byte	108
	.byte	-52
	.byte	-2
	.byte	12
	.byte	30
	.byte	0
	.byte	-4
	.byte	-64
	.byte	-8
	.byte	12
	.byte	12
	.byte	-52
	.byte	120
	.byte	0
	.byte	56
	.byte	96
	.byte	-64
	.byte	-8
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	-4
	.byte	-52
	.byte	12
	.byte	24
	.byte	48
	.byte	48
	.byte	48
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	120
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	24
	.byte	112
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	0
	.byte	0
	.byte	48
	.byte	48
	.byte	96
	.byte	24
	.byte	48
	.byte	96
	.byte	-64
	.byte	96
	.byte	48
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	-4
	.byte	0
	.byte	0
	.byte	96
	.byte	48
	.byte	24
	.byte	12
	.byte	24
	.byte	48
	.byte	96
	.byte	0
	.byte	120
	.byte	-52
	.byte	12
	.byte	24
	.byte	48
	.byte	0
	.byte	48
	.byte	0
	.byte	124
	.byte	-58
	.byte	-34
	.byte	-34
	.byte	-34
	.byte	-64
	.byte	120
	.byte	0
	.byte	48
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	-52
	.byte	-52
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	102
	.byte	102
	.byte	-4
	.byte	0
	.byte	60
	.byte	102
	.byte	-64
	.byte	-64
	.byte	-64
	.byte	102
	.byte	60
	.byte	0
	.byte	-8
	.byte	108
	.byte	102
	.byte	102
	.byte	102
	.byte	108
	.byte	-8
	.byte	0
	.byte	-2
	.byte	98
	.byte	104
	.byte	120
	.byte	104
	.byte	98
	.byte	-2
	.byte	0
	.byte	-2
	.byte	98
	.byte	104
	.byte	120
	.byte	104
	.byte	96
	.byte	-16
	.byte	0
	.byte	60
	.byte	102
	.byte	-64
	.byte	-64
	.byte	-50
	.byte	102
	.byte	62
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	0
	.byte	120
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	30
	.byte	12
	.byte	12
	.byte	12
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	-26
	.byte	102
	.byte	108
	.byte	120
	.byte	108
	.byte	102
	.byte	-26
	.byte	0
	.byte	-16
	.byte	96
	.byte	96
	.byte	96
	.byte	98
	.byte	102
	.byte	-2
	.byte	0
	.byte	-58
	.byte	-18
	.byte	-2
	.byte	-2
	.byte	-42
	.byte	-58
	.byte	-58
	.byte	0
	.byte	-58
	.byte	-26
	.byte	-10
	.byte	-34
	.byte	-50
	.byte	-58
	.byte	-58
	.byte	0
	.byte	56
	.byte	108
	.byte	-58
	.byte	-58
	.byte	-58
	.byte	108
	.byte	56
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	96
	.byte	96
	.byte	-16
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-36
	.byte	120
	.byte	28
	.byte	0
	.byte	-4
	.byte	102
	.byte	102
	.byte	124
	.byte	108
	.byte	102
	.byte	-26
	.byte	0
	.byte	120
	.byte	-52
	.byte	-32
	.byte	112
	.byte	28
	.byte	-52
	.byte	120
	.byte	0
	.byte	-4
	.byte	-76
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-4
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	0
	.byte	-58
	.byte	-58
	.byte	-58
	.byte	-42
	.byte	-2
	.byte	-18
	.byte	-58
	.byte	0
	.byte	-58
	.byte	-58
	.byte	108
	.byte	56
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	-2
	.byte	-58
	.byte	-116
	.byte	24
	.byte	50
	.byte	102
	.byte	-2
	.byte	0
	.byte	120
	.byte	96
	.byte	96
	.byte	96
	.byte	96
	.byte	96
	.byte	120
	.byte	0
	.byte	-64
	.byte	96
	.byte	48
	.byte	24
	.byte	12
	.byte	6
	.byte	2
	.byte	0
	.byte	120
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	24
	.byte	120
	.byte	0
	.byte	16
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	-1
	.byte	48
	.byte	48
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	12
	.byte	124
	.byte	-52
	.byte	118
	.byte	0
	.byte	-32
	.byte	96
	.byte	96
	.byte	124
	.byte	102
	.byte	102
	.byte	-36
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-64
	.byte	-52
	.byte	120
	.byte	0
	.byte	28
	.byte	12
	.byte	12
	.byte	124
	.byte	-52
	.byte	-52
	.byte	118
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-4
	.byte	-64
	.byte	120
	.byte	0
	.byte	56
	.byte	108
	.byte	96
	.byte	-16
	.byte	96
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	0
	.byte	118
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	-8
	.byte	-32
	.byte	96
	.byte	108
	.byte	118
	.byte	102
	.byte	102
	.byte	-26
	.byte	0
	.byte	48
	.byte	0
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	12
	.byte	0
	.byte	12
	.byte	12
	.byte	12
	.byte	-52
	.byte	-52
	.byte	120
	.byte	-32
	.byte	96
	.byte	102
	.byte	108
	.byte	120
	.byte	108
	.byte	-26
	.byte	0
	.byte	112
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	120
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-2
	.byte	-2
	.byte	-42
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	-8
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	0
	.byte	0
	.byte	0
	.byte	120
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	0
	.byte	0
	.byte	0
	.byte	-36
	.byte	102
	.byte	102
	.byte	124
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	118
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	30
	.byte	0
	.byte	0
	.byte	-36
	.byte	118
	.byte	102
	.byte	96
	.byte	-16
	.byte	0
	.byte	0
	.byte	0
	.byte	124
	.byte	-64
	.byte	120
	.byte	12
	.byte	-8
	.byte	0
	.byte	16
	.byte	48
	.byte	124
	.byte	48
	.byte	48
	.byte	52
	.byte	24
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	118
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	120
	.byte	48
	.byte	0
	.byte	0
	.byte	0
	.byte	-58
	.byte	-42
	.byte	-2
	.byte	-2
	.byte	108
	.byte	0
	.byte	0
	.byte	0
	.byte	-58
	.byte	108
	.byte	56
	.byte	108
	.byte	-58
	.byte	0
	.byte	0
	.byte	0
	.byte	-52
	.byte	-52
	.byte	-52
	.byte	124
	.byte	12
	.byte	-8
	.byte	0
	.byte	0
	.byte	-4
	.byte	-104
	.byte	48
	.byte	100
	.byte	-4
	.byte	0
	.byte	28
	.byte	48
	.byte	48
	.byte	-32
	.byte	48
	.byte	48
	.byte	28
	.byte	0
	.byte	24
	.byte	24
	.byte	24
	.byte	0
	.byte	24
	.byte	24
	.byte	24
	.byte	0
	.byte	-32
	.byte	48
	.byte	48
	.byte	28
	.byte	48
	.byte	48
	.byte	-32
	.byte	0
	.byte	118
	.byte	-36
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.globl	vramtop
	.data
	.align	2
	.type	vramtop, @object
	.size	vramtop, 4
vramtop:
	.word	67108864
	.align	2
	.type	left, @object
	.size	left, 4
left:
	.word	1
	.local	initf
	.comm	initf,4,4
	.local	state
	.comm	state,2496,4
	.local	next
	.comm	next,4,4

	.comm	var1,4,4

	.comm	var2,4,4

	.comm	drawframe,4,4

	.comm	gcursor,8,4

	.comm	gpaddata,16,4

	.comm	Paused,4,4

	.comm	colours,44,4

	.comm	color,4,4

	.comm	i,4,4

	.comm	pixel,16,4
	rand = genrand_int32
	.ident	"GCC: (GNU) 4.3.3"
