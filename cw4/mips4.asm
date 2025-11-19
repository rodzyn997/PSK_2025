.data
	n: .word 2
.text
main:
    lw $a0, n      # wczytaj n
    jal fib        # wywołanie fib(n)

    # wypisz wynik
    li $v0, 1      # syscall print integer
    move $a0, $v0  # wynik w $a0
    syscall

    # zakończ program
    li $v0, 10
    syscall

fib:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)

    li $t0, 0
    beq $a0, $t0, zero
    li $t1, 1
    beq $a0, $t1, one

    # fib(n-1)
    addi $a0, $a0, -1
    jal fib
    move $t2, $v0

    # fib(n-2)
    lw $a0, 0($sp)
    addi $a0, $a0, -2
    jal fib

    add $v0, $v0, $t2
    j fib_end

zero:
    li $v0, 0
    j fib_end

one:
    li $v0, 1

fib_end:
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    jr $ra
