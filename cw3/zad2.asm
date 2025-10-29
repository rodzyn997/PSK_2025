.data
	f: .word 0
	g: .word 0
	h: .word 0 
	i: .word 5
	j: .word 3
	A: .word 1,2,3,4
	B: .word 0,1,2,3,4,5,6,7,8,9


.text 
	lw $s0, f		# f
	lw $s1, g
	lw $s2, h		
	lw $s3, i		# i
	lw $s4, j		# j
	la $s6, A		# adres tablicy A
	la $s7, B		# adres tablicy B
	
	sll $t0, $s3, 2   	#t0: = 
	add $t0, $s6, $t0
	lw $t0, 0($t0)
	
	sll $t1, $s4, 2
	add $t1, $s6, $t1
	lw $t1, 0($t1)
	
	add $t2, $t0, $t1
	sw $t2, 32($s7)
	
	
