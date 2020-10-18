.data
enter_str: .asciz "Enter array size\n"
.text
la a0, enter_str
li a7, 4
ecall
li a7, 5
ecall
li a7, 9
mv a1, a0
addi a0, a0, 1
slli a0, a0, 2
ecall
mv s0, a0 # array mamory
sw a1, (s0)
mv t0, s0
jal read_arr
jal print_arr
lw a1, (s0)
li a2, 1
ble a1, a2, return
jal sort_arr
li a7, 11
li a0, '\n'
ecall
jal print_arr
return:
	li a7, 10
	ecall

read_arr:
	lw a1, (t0)
	slli a1, a1, 2
	li a2, 4
	li a7, 5
	loop_read:
		ecall
		add t1, t0, a2
		sw a0, (t1)
		addi a2, a2, 4
		ble a2, a1, loop_read
	jr ra

print_arr:
	lw a1, (t0)
	slli a1, a1, 2
	li a2, 4
	loop_print:
		li a7, 1
		add t1, t0, a2
		lw a0, (t1)
		ecall
		li a7, 11
		li a0, ' '
		ecall
		addi a2, a2, 4
		ble a2, a1, loop_print
	jr ra

sort_arr:
	lw a1, (t0)
	slli a1, a1, 2
	li a2, 4
	loop_sort_1:
		sub a3, a1, a2
		li a4, 4
		loop_sort_2:
			add t1, t0, a4
			lw t2, (t1)
			addi t1, t1, 4
			lw t3, (t1)
			ble t2, t3, p
			sw t2, (t1)
			addi t1, t1, -4
			sw t3, (t1)
			p: addi a4, a4, 4
			ble a4, a3, loop_sort_2
		addi a2, a2, 4
		ble a2, a1, loop_sort_1
	jr ra
