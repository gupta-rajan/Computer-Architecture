	.data
a:
	1
	.text
main:
	load %x0, $a, %x3	;x3= a
	add %x0, %x3, %x4	;x4=a
	add %x0, %x0, %x5	;x5=0
	blt %x3, %x0, no	;check if a<0 and go to no.
loop:
	divi %x3, 10, %x3	;x3 = x3/10 , x31 contains the remainder
	muli %x5, 10, %x5	;x5 = x5*10
	add %x5, %x31, %x5	;x5 = x5 + x31 , reversing the number
	beq %x0, %x3, check	;checks if x3 = 0 then go to check
	jmp loop
check:
	beq %x4, %x5, yes	;if num = reversed_num then go to yes
	bne %x4, %x5, no	;if num != reversed_num then go to no
yes:
	addi %x0, 1, %x10	;stores 1 in x10 if num is palindrome 
	end
no:
	subi %x0, 1, %x10	;stores -1 in x10 if num is not palindrome
	end