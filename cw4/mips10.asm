.data
	i: .word 3
	y: .word 6
	a: .word 1,2,3,-4,5,6
	x: .word 0 
.text
	lw $s0, i
	lw $s1, y
	la $s6, a
	lw $t0, x
	
	sll $t1, $s0, 2
	add $t1, $s6, $t1
	lw $t0, 0($t1) 
	jal abs
	
	add $s1, $s1, $t4
	move $a0, $s1
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
abs:
	bltz $t0, minus
	move $t4, $t0
	jr $ra

minus:
	mul $t4, $t0, -1
	jr $ra 
	