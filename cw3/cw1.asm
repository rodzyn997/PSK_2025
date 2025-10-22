.data
str:	.asciiz "Hello World" 
.text
	addi $v0, $zero, 4 	# v0:= 0+4
	la $a0, str		# a0:= &str
	syscall
	addi $v0, $zero, 10
	syscall
	
