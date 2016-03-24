	.data
clave: 	.byte 4
texto:	.asciz "zw_ani, V{di, vinci"
salto: 	.asciz "\n"


	.text
	.global start
start:
	push %eax
	push %ecx
	push %edx

	push $texto
	call printf
	add $4, %esp

	push $salto
	call printf
	add $4, %esp
	mov $0, %eax
	mov clave, %ecx
	mov $0x7A, %edx
	sub clave, %edx



cond:	cmpb $0, texto(%eax)
	jz fin


	cmpb $0x61, texto(%eax)
	jl saltar

	cmpb %dl, texto(%eax)
	jg saltarc

	addB %cl, texto(%eax)
	jmp saltar

saltarc:cmpb $0x7A, texto(%eax)
	jg saltar
	subb $26, texto(%eax)
	addb %cl,texto(%eax)


saltar:
	inc %eax
	jmp cond

fin:	push $texto
	call printf
	add $4, %esp
	push $salto
	call printf
	add $4, %esp
	pop %edx
	pop %ecx
	pop %eax

	ret
