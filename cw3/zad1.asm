.data
	f: .word 0
	g: .word 0
	h: .word 0 
	i: .word 5
	j: .word 3
	A: .word 1,2,3,4
	B: .word 0,1,2,3,4,5,6,7,8,9
	msg: .asciiz "B[8] = "

.text 
	lw $s0, f		# f
	lw $s1, g
	lw $s2, h
	lw $s3, i		# i
	lw $s4, j		# j
	la $s6, A		# adres tablicy A
	la $s7, B		# adres tablicy B

	# --- Obliczenie A[i-j] ---
	sub $t0, $s3, $s4	# t0 = i - j
	sll $t1, $t0, 2		# t1 = (i-j)*4 bajty
	add $t2, $s6, $t1	# t2 = adres A[i-j]
	lw  $t3, 0($t2)		# t3 = A[i-j]

	# --- Zapisz B[8] = A[i-j] ---
	li  $t4, 8
	sll $t5, $t4, 2		# t5 = 8*4 bajty
	add $t6, $s7, $t5	# t6 = adres B[8]
	sw  $t3, 0($t6)		# B[8] = A[i-j]

	# --- Wypisz wynik ---
	li $v0, 4
	la $a0, msg
	syscall

	li $v0, 1
	lw $a0, 0($t6)
	syscall

	# --- Zakończ ---
	li $v0, 10
	syscall
