.data 
	n: .word 5
	
.text 
	lw $a0, n
	jal factorial
	move $a0, $v0
	li $v0, 1 
	syscall
	li $v0, 10
	syscall

factorial:
	# poczatek stosu
	addi $sp, $sp, -8
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	beq $a0, $zero, zero
	
	addi $a0, $a0, -1
	jal factorial
	move $t0, $v0
	
	# pobranie ze stosu 
	lw $a0, 0($sp)
	mul $v0, $t0, $a0 
	j end

zero:
	li $v0, 1
	
end:
	# czyszczenie stosu 
	lw $ra, 4($sp)
	addi $sp, $sp, 8
	jr $ra	