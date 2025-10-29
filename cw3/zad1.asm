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
	
	sub $t0, $s3, $s4
	sll $t0, $t0, 2
	add $t0, $s6, $t0
	lw $t1, 0($t0)
	sw $t1, 32($s7)
