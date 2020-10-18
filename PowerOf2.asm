.data 
true_str: .asciz "It is power of 2"
false_str: .asciz "It is not power of 2"
.text 
li a7, 5
ecall
mv a1, a0
li a2, 1 #comparer
li a4, -1 #number of 1-bits
li a5, 31 #number of bits
loop:
	and a3, a1, a2
	beqz a3, p_1
	addi a4, a4, 1
	bgtz a4, false
p_1:
	addi a5, a5, -1
	slli a2, a2, 1
	bgtz a5, loop
bnez a4, false
li a7, 4
la a0, true_str
ecall
b end
false:
	la a0, false_str
	li a7, 4
	ecall
end:
	li a0, 0
