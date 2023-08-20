	.data
a:
	10
	.text
main:
	load %x0, $a, %x3
	divi %x3, 2, %x3
	beq %x0, %x31, checkEven
	addi %x0, 1, %x10
	end
checkEven:
	subi %x0, 1, %x10
	end
