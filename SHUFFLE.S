		.data
mensaje:	.string "Computers are useless.  They can only give you answers."
finlinea:	.asciz "\n"

		.text
		.global start, cambia




start:	push %eax
	push %ecx
	push %edx
	push %ebx

 	push $mensaje
	call printf
	add $4, %esp

	push $finlinea
	call printf
	add $4, %esp
	mov $0, %ebx
etiq1:	mov $0, %eax
	inc %ebx
cond:	mov mensaje(%eax), %edx
	push %edx

	call cambia
	add $4, %esp

	cmp $0, %ecx
	jz final

	mov %ecx, mensaje(%eax)
	add $4, %eax

	jmp cond

final:	push $mensaje
	call printf
	add $4, %esp

	push $finlinea
	call printf
	add $4, %esp

	cmp $2, %ebx
	jl etiq1

	pop %ebx
	pop %edx
	pop %ecx
	pop %eax

 	ret
cambia:
	push %ebp
	mov %esp, %ebp
	push %eax

	mov 8(%ebp), %eax


	cmpb $0, %al
	jz cero
	mov %al, %cl
	ror $8,%eax
	rol $8,%ecx

	cmpb $0, %al
	jz cero
	mov %al, %cl
	ror $8,%eax
	rol $8,%ecx

	cmpb $0, %al
	jz cero
	mov %al, %cl
	ror $8,%eax
	rol $8,%ecx

	cmpb $0, %al
	jz cero
	mov %al, %cl



	jmp fin

cero: 	mov $0, %ecx

fin:

	pop %eax

	mov %ebp, %esp
	pop %ebp
	ret








