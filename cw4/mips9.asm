.data
a: .word 1
b: .word 1
c: .word 1
d: .word 1

.text
	lw $a0,a
	lw $a1,b
	lw $a2,c
	lw $a3,d
	jal f
	
func:
	add $v0,$a0,$a1
	jr $ra

f:	
	jal func
	add $a1, $a2, $a3
	move $a0, $v0
	jal func
	j end
end:
	move $a0,$v0
	li $v0,1
	syscall
	li $v0,10
	syscall
	 
	