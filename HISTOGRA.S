	.text

	datos:	.int 1, 2,1,10, 11, 15, 20, 32, 40, 45, 39, 26, 19, 21 ,27, 13, 15
	.int 13, 6, 9, 10, 6, 5, 3, 1, 0
longitud:
	.int 26
error0:	.asciz " ERROR!!! Se ha pasado un parametro negativo o mayor que 80!\n"

salto: 	.asciz "\n"

	.global start

start:
	push %eax
	push %ecx
	push %edx
	mov $0x41, %edx
	mov $0, %eax

cond0:	cmp %eax, longitud
	jle fin0
	movL datos(,%eax,4) ,%ecx
	sub $4, %esp
	push %ecx
	push %edx
	call linea
	add $8, %esp
	pop %ecx
	cmp $1, %ecx
	jz fallo

	push %eax
	push %ecx
	push %edx
	push $salto
	call printf
	add $4, %esp
	pop %edx
	pop %ecx
	pop %eax

	inc %eax
	add $0x1, %edx
	jmp cond0

fallo:	push $error0
	call printf
	add $4, %esp

fin0:	pop %edx
	pop %ecx
	pop %eax
	ret
