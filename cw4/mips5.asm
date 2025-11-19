.data 
	x: .word 5
	n: .word 2
.text
	lw $a0, x
	lw $a1, n
	jal potega_rek
	
	
	move $a0, $v0
	li $v0, 1 
	syscall
	li $v0, 10 
	syscall
	
potega_rek:
	addi $sp, $sp, -12  
	sw $ra, 8($sp) 
	sw $a0, 4($sp)
	sw $a1, 0($sp) 
	
	beq $a1, $zero, zero
	
	addi $a1, $a1, -1
	jal potega_rek 
	move $t1, $v0

	lw $a0, 4($sp)	
	lw $a1, 0($sp)
	mul $v0, $a0, $t1
	j pot_end

zero: 
	li $v0, 1
pot_end:
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	jr $ra 

 
