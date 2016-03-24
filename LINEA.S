	.data
caracter:
	.ascii "%c"
	.text
	.global linea


linea:
	push %ebp
	mov %esp, %ebp
	push %eax
	push %ecx
	push %edx
	push %ebx
	push %esi
	push %edi

	mov 8(%ebp),%ebx
	mov 12(%ebp),%esi

	cmp $0, %esi
	jl error
	cmp $80, %esi
	jg error

	movL $0,16(%ebp)

	mov $0, %edi

cond:	cmp %esi, %edi
	jge fin
	push %ebx
	push $caracter
	call printf
	add $8, %esp
	inc %edi
	jmp cond

error:	movL $1,16(%ebp)

fin:	pop %edi
	pop %esi
	pop %ebx
	pop %edx
	pop %ecx
	pop %eax

	mov %ebp, %esp
	pop %ebp
	ret


