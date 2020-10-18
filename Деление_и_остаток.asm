.data
ent_str_1: .asciz "Enter the dividend\n"
ent_str_2: .asciz "Enter the devisor\n"
res_str_1: .asciz "Division: "
res_str_2: .asciz "\nRemainder: "
.text 
li a7, 4
la a0, ent_str_1
ecall
li a7, 5
ecall
mv a1, a0
li a7, 4
la a0, ent_str_2
ecall
li a7, 5
ecall
mv a2, a0
	beqz a2, result
	li a5, 0 #sign_1
	bgez a1, point_1
	neg a1, a1
	li a5, 1
point_1:
	bgez a2, point_2
	neg a2, a2
	addi a5, a5, -1
point_2:
	li a3, 0 # division
	blt a1, a2, correction
loop:
	sub a1, a1, a2
	addi a3, a3, 1
	bge a1, a2, loop
correction:
	beqz a5, result
	neg a3, a3
result:
	la a0, res_str_1
	li a7, 4
	ecall
	mv a0, a3
	li a7, 1
	ecall
	la a0, res_str_2
	li a7, 4
	ecall
	mv a0, a1
	li a7, 1
	ecall
