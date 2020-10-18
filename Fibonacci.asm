.data
enter_str: .asciz "Enter the index of Fibonacci number\n"
.text
entering:
	li a7, 4
	la a0, enter_str
	ecall
	li a7, 5
	ecall
	mv a1, a0
li a3, 0 #resalt
blez a1, result
li a2, 1 #counter
li a3, 1
beq a1, a2, result
li a4, 0 #previous
li a5, 0 #befor_previous
loop:
	mv a5, a4
	mv a4, a3
	add a3, a4, a5
	addi a2, a2, 1
	bne a2, a1, loop
result:
	mv a0, a3
	li a7, 1
	ecall
