.data
	n: .word 5
.text
	lw $a0, n
	jal factorial
	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
factorial:
	# stos
	addi $sp, $sp, -4
	sw $s0, 0($sp)
	li $s0, 1
	li $t1, 1 
	addi $t0, $a0, 1 
	

loop:
	beq $t1, $t0, end
	mul $s0, $s0, $t1
	
	addi $t1, $t1, 1
	j loop 
end:
# czyszczenie
	sw $s0, 0($sp)
	addi $sp, $sp, 4
	jr $ra 


	