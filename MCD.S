.data
numeros:.int 52, 1183, 7889, 230, 12, 90
texto:  .asciz "mcd(%d, %d) = %d\n"

        .text
        .global start

start:  push %eax               /* salvar registros */
        push %ebx
        push %ecx
        push %edx
        push %esi
        
        mov $numeros, %ebx      /* direccion de los elementos */
        mov $3, %esi            /* contador del bucle */

calcular:       
        /* calcular mcd */
        sub $4, %esp            /* reservar espacio para el resultado */
        push 4(%ebx)
        push (%ebx)
        call mcd                /* llamada a subrutina */
        add $8, %esp            /* restaurar pila */
        pop %eax
        
        /* imprimir resultado */
        push %eax
        push 4(%ebx)
        push (%ebx)
        push $texto
        call printf
        add $16, %esp

        add $8, %ebx            /* siguiente par de numeros */
        dec %esi
        jnz calcular
        
        pop %esi                /* restaurar registros */
        pop %edx
        pop %ecx
        pop %ebx
        pop %eax
        ret

mcd:                            /* Comienzo de subrutina */

	push %ebp
	mov %esp, %ebp

	mov 8(%ebp), %ecx
	mov 12(%ebp), %eax

	mov $0, %edx
	cmp %eax, %ecx
	jg cambio




etiq:
	div %ecx
	cmp $0, %edx
	jz fin

	sub $4, %esp
	push %ecx
	push %edx
	call mcd
	jmp fin



cambio:	mov 8(%ebp), %eax
	mov 12(%ebp), %ecx
	jmp etiq





fin:
 	mov %ecx, 16(%ebp)
	mov %ebp, %esp
	pop %ebp
	ret


