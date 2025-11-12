# nie dziala nie wiem xd
.data
	p: .word 0
	k: .word 3
	A: .word 1,2,3,4,5,6,7,8,9
	N: .word 9
	
.text 
main: 
	la $a0, A	# s2:= &A
	lw $a1, N
	#li $a1, p
	#li $a2, k
	jal sum
	move $a0, $v0
	li $v0, 1
	syscall
	li $v0, 10
	syscall
	
sum:	li $t0, 0		# t0:= 0
	sll $t1, $a1, 2 	# t1:= 4*p
	add $t1, $a0, $t1	# t1:= &A[p]
	move $t2, $a1		# t2: = i = p
	addi $t3, $a2, 1	# t3:= k+1
sum_t_i:	
	slt $t4, $t2, $t3 	# if i < k+1 then t4:= 1 else t4:=0
	beq $t4, $zero, sum_e	# if ~(i<k+1) then 
	lw $t5, 0($t1)		# t5:= A[i]
	add $v0, $v0, $t5	# v0:= v0 + A[i]
	addi $t1, $t1, 4	# t1:= $A[i+1]
	addi $t2, $t2, 1	# t2:= i+1
	j sum_t_i		# go to sum_t_i
sum_e:
	jr $ra			#exit
	
mean:
	addi $sp, $sp, -8
	sw $a1, 4($sp)
	sw $ra, 0($sp)
	addi $a2, $a1, -1
	li $a1, 0 
	jal sum
	lw $ra, 0($sp)
	lw $a1, 4($sp)
	addi $sp, $sp, 8
	div $v0, $v0, $a1
	jr $ra
	
	
