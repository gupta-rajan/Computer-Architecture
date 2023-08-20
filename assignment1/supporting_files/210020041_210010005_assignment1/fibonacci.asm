	.data
n:
	10
	.text
main:
	load %x0, $n, %x3
	addi %x0, 65535, %x20 ; Initialize memory base address
	addi %x0, 0, %x4
	addi %x0, 1, %x5	; Initialize a[i-1]
	addi %x0, 2, %x8	; Initialize a[i-2]
	addi %x4, 1, %x6	; i = 1
	store %x4, 0, %x20	; Store a[i] = i at memory location pointed by x20
	blt %x3, %x8, exit	; Check if n is less than or equal to 2, if yes, exit
	subi %x20, 1, %x20
loop:
	store %x5, 0, %x20	; Store a[i-1] at memory location pointed by x20
	subi %x20, 1, %x20	; Decrement memory base address
	add %x4, %x5, %x7	; a[i] =z a[i-1] + a[i-2]
	addi %x5, 0, %x4
	addi %x7, 0, %x5
	addi %x6, 1, %x6	; Increment i
	beq %x6, %x3, exit
	jmp loop
exit:
	end