.data
	x: .word 2
	n: .word 2 
.text
	lw $a0, x
	lw $a1, n 
	jal potega
	
	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
potega:
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	
	li $s0, 1
	li $t1, 1
	
	add $a1, $a1, 1
loop:
	beq $t1, $a1, end
	mul $s0, $s0, $a0
	
	addi $t1, $t1, 1
	j loop

end:
	addi $sp, $sp, 4
	sw $s0, 0($sp)
	jr $ra