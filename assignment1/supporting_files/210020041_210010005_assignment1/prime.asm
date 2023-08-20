	.data
a:
	10
	.text
main:
	load %x0, $a, %x3	;x3=a
	addi %x0, 2, %x4	;x4=2
	beq %x3, %x4, isPrime	;checking if the number is 2 then it's prime
	blt %x3, %x4, notPrime	;if number is less than 2 then it's not prime
loop:
	div %x3, %x4, %x5	;dividing the number by x4
	beq %x0, %x31, notPrime	;if remainder is 0 then it's not prime
	addi %x4, 1, %x4	;incrementing x4 by 1
	beq %x4, %x3, isPrime	;if x4=a then it's prime
	jmp loop
isPrime:
	addi %x0, 1, %x10	;setting x10=1 number is prime
	end
notPrime:
	subi %x0, 1, %x10	;setting x10=-1 number is not prime
	end