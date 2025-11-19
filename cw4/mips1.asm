.data
	i: .word 3
	j: .word 1
	A: .word 1,2,3,4
	B: .word 0,1,2,3,4,5,6,7,8,9 
.text
	lw $s0, i
	lw $s1, j
	
	la $s6, A
	la $s7, B

	sub $t0, $s0, $s1
	sll $t0, $t0, 2
	add $t0, $s6, $t0
	lw $t1, 0($t0)
	sw $t1, 32($s7)
	
	add $a0, $a0, $t1
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
