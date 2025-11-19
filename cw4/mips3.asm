.data 
	a: .word 4
	b: .word 2
	D: .word 1,2,3,4,5,6,7,8
.text
	lw $s0, a 
	lw $s1, b
	la $s2, D
	
	li $t0, 0 
loop: 
	beq $t0, $s0, exit
	li $t1, 0
	
loop_j:
	beq $t1, $s1, exit_j
	
	add $t2, $t0,$t1
	sll $t3, $t1, 2
	addu $t3, $s2, $t3
	sw $t2, 0($t3)

	addi $t1,$t1, 1
	j loop_j
	
exit_j:
	addi $t0, $t0, 1 
	j loop

exit:
	lw $a0, 0($s2)
	li $v0, 1 
	syscall
	li $v0, 10
	syscall
	
	