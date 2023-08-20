	.data
a:
	70
	80
	40
	20
	10
	30
	50
	60
n:
	8
	.text
main:
	load %x0, $n, %x3		;x3=n
	subi %x3, 1, %x11   ;x11=n-1
	subi %x0, 1, %x4		;x4=i
outerloop:
	beq %x4, %x11, exit
	bgt %x4, %x11, exit
	addi %x4, 1, %x4
	addi %x4, 1, %x5	;x5=j
innerloop:
	beq %x5, %x3, outerloop
	bgt %x5, %x3, outerloop
	load %x4, $a, %x6		; x6 = a[x4] (ie. x6 = a[i])
	load %x5, $a, %x7		; x7 = a[x5] (ie. x7 = a[j])
	bgt %x7, %x6, swap
	addi %x5, 1, %x5
	jmp innerloop
swap:
	store %x7, $a, %x4	; a[x4] = x7
	store %x6, $a, %x5	;	a[x5] = x8
	addi %x5, 1, %x5
	jmp innerloop
exit:
	end
