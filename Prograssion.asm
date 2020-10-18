li a7, 5
ecall
mv a1, a0
ecall
mv a2, a0
ecall
mv a3, a0
li a4, 0
blez a3, result
loop:
	add a4, a4, a1
	add a1, a1, a2
	addi a3, a3, -1
	bgtz a3, loop
result:
	li a7, 1
	mv a0, a4
	ecall
