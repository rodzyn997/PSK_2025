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
	
	sll $t0, $s0, 2
	sll $t1, $s1, 2
	
	add $t0, $s6, $t0
	lw $t2, 0($t0)
	
	add $t1, $s6, $t1
	lw $t3, 0($t1)
	
	add $t4, $t2, $t3
	
	sw $t4, 32($s7)
	
	add $a0, $a0, $t4
	li $v0, 1 
	syscall 
	li $v0, 10
	 
	
	
	