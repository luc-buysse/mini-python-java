	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	pushq -8(%rbp)
	call _user_main_6
	addq $8, %rsp
	subq $8, %rsp
	andq $-16, %rsp
	xorq %rdi, %rdi
	call fflush
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
print_row_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq $0, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $print_row_4_1, %rsi
	call _my_strcpy
	movq %rax, -24(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq %r14, -112(%rbp)
	movq -16(%rbp), %r14
	movq %r15, -120(%rbp)
	movq -128(%rbp), %r15
	movq %r8, -56(%rbp)
	cmpq $2, (%r15)
	je print_row_4_5
	cmpq $3, (%r15)
	je print_row_4_6
	cmpq $4, (%r15)
	je print_row_4_7
	jmp _Error_gestion
print_row_4_5:
	cmpq $2, (%r14)
	je print_row_4_8
	jmp _Error_gestion
print_row_4_8:
	movq 8(%r14), %r8
	addq 8(%r15), %r8
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r8, 8(%rax)
	movq %rax, %r8
	jmp print_row_4_11
print_row_4_6:
	cmpq $3, (%r14)
	je print_row_4_9
	jmp _Error_gestion
print_row_4_9:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r14
	call _my_strcpy
	leaq 16(%r15), %rsi
	leaq 16(%r14), %rdi
	call _my_strcat
	movq %r14, %r8
	jmp print_row_4_11
print_row_4_7:
	cmpq $4, (%r14)
	je print_row_4_10
	jmp _Error_gestion
print_row_4_10:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je print_row_4_14
	xorq %rdi, %rdi
print_row_4_12:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	jg print_row_4_12
print_row_4_14:
	cmpq $0, 8(%r15)
	je print_row_4_15
	movq %rdi, %r14
	xorq %rdi, %rdi
print_row_4_13:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r14,8)
	incq %rdi
	incq %r14
	cmpq %rdi, 8(%r15)
	jg print_row_4_13
print_row_4_15:
	movq %rax, %r8
	jmp print_row_4_11
print_row_4_11:
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -144(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq -144(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je print_row_4_19
print_row_4_18:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je print_row_4_19
	jmp print_row_4_18
print_row_4_19:
	xorq %rdi, %rdi
print_row_4_2:
	cmpq %rdi, 8(%rax)
	je print_row_4_3
	movq -32(%rbp), %r8
	movq 16(%rax,%rdi,8), %r8
	pushq %rdi
	movq -8(%rbp), %rdi
	cmpq $4, (%rdi)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rax, -152(%rbp)
	movq %r9, -64(%rbp)
	movq -8(%rbp), %r9
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je print_row_4_24
print_row_4_23:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je print_row_4_24
	jmp print_row_4_23
print_row_4_24:
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%r8), %rdi
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%r8), %rdi
	subq $8, %rsp
	movq -168(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%rsi), %rdi
	movq %rdi, (%rax)
	movq 8(%rsi), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je print_row_4_20
	subq $8, %rsp
	movq %rsi, -168(%rbp)
	movq %rax, -176(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $print_row_4_28, %rsi
	call _my_strcpy
	movq %rax, -184(%rbp)
	movq %rcx, -48(%rbp)
	movq -184(%rbp), %rcx
	movq %rbx, -88(%rbp)
	movq -24(%rbp), %rbx
	movq %rdx, -40(%rbp)
	cmpq $2, (%rbx)
	je print_row_4_29
	cmpq $3, (%rbx)
	je print_row_4_30
	cmpq $4, (%rbx)
	je print_row_4_31
	jmp _Error_gestion
print_row_4_29:
	cmpq $2, (%rcx)
	je print_row_4_32
	jmp _Error_gestion
print_row_4_32:
	movq 8(%rcx), %rdx
	addq 8(%rbx), %rdx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rdx, 8(%rax)
	movq %rax, %rdx
	jmp print_row_4_35
print_row_4_30:
	cmpq $3, (%rcx)
	je print_row_4_33
	jmp _Error_gestion
print_row_4_33:
	movq 8(%rbx), %rsi
	addq 8(%rcx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rcx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	leaq 16(%rbx), %rsi
	leaq 16(%rcx), %rdi
	call _my_strcat
	movq %rcx, %rdx
	jmp print_row_4_35
print_row_4_31:
	cmpq $4, (%rcx)
	je print_row_4_34
	jmp _Error_gestion
print_row_4_34:
	movq 8(%rbx), %rsi
	addq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je print_row_4_38
	xorq %rdi, %rdi
print_row_4_36:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	jg print_row_4_36
print_row_4_38:
	cmpq $0, 8(%rbx)
	je print_row_4_39
	movq %rdi, %rcx
	xorq %rdi, %rdi
print_row_4_37:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rcx,8)
	incq %rdi
	incq %rcx
	cmpq %rdi, 8(%rbx)
	jg print_row_4_37
print_row_4_39:
	movq %rax, %rdx
	jmp print_row_4_35
print_row_4_35:
	movq %rcx, -184(%rbp)
	movq %rbx, -24(%rbp)
	jmp skip_print_row_40
print_row_4_20:
	subq $8, %rsp
	movq -184(%rbp), %rdi
	movq %rsi, %rdi
	movq %rsi, %rdi
	movq %rsi, -184(%rbp)
	movq %rdx, -40(%rbp)
	movq -24(%rbp), %rdx
	movq %rcx, -48(%rbp)
	movq %rbx, -88(%rbp)
	movq %rax, -176(%rbp)
skip_print_row_40:
	movq -176(%rbp), %rcx
	cmpq $0, 8(%rcx)
	jne print_row_4_21
	subq $8, %rsp
	movq %rdi, -184(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $print_row_4_42, %rsi
	call _my_strcpy
	movq %rax, -192(%rbp)
	movq -192(%rbp), %rbx
	movq %r12, -96(%rbp)
	cmpq $2, (%rdx)
	je print_row_4_43
	cmpq $3, (%rdx)
	je print_row_4_44
	cmpq $4, (%rdx)
	je print_row_4_45
	jmp _Error_gestion
print_row_4_43:
	cmpq $2, (%rbx)
	je print_row_4_46
	jmp _Error_gestion
print_row_4_46:
	movq 8(%rbx), %r12
	addq 8(%rdx), %r12
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r12, 8(%rax)
	movq %rax, %r12
	jmp print_row_4_49
print_row_4_44:
	cmpq $3, (%rbx)
	je print_row_4_47
	jmp _Error_gestion
print_row_4_47:
	movq 8(%rdx), %rsi
	addq 8(%rbx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rbx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	leaq 16(%rdx), %rsi
	leaq 16(%rbx), %rdi
	call _my_strcat
	movq %rbx, %r12
	jmp print_row_4_49
print_row_4_45:
	cmpq $4, (%rbx)
	je print_row_4_48
	jmp _Error_gestion
print_row_4_48:
	movq 8(%rdx), %rsi
	addq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rbx)
	je print_row_4_52
	xorq %rdi, %rdi
print_row_4_50:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	jg print_row_4_50
print_row_4_52:
	cmpq $0, 8(%rdx)
	je print_row_4_53
	movq %rdi, %rbx
	xorq %rdi, %rdi
print_row_4_51:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rbx,8)
	incq %rdi
	incq %rbx
	cmpq %rdi, 8(%rdx)
	jg print_row_4_51
print_row_4_53:
	movq %rax, %r12
	jmp print_row_4_49
print_row_4_49:
	movq %rbx, -192(%rbp)
	movq %rdx, -24(%rbp)
	jmp skip_print_row_54
print_row_4_21:
	subq $8, %rsp
	movq -192(%rbp), %rdi
	movq %rdi, %rdi
	movq %r12, -96(%rbp)
	movq %rdx, %r12
	movq %rdx, -24(%rbp)
skip_print_row_54:
	movq %rdi, -192(%rbp)
	popq %rdi
	incq %rdi
	jmp print_row_4_2
	jmp skip_print_row_55
print_row_4_3:
	subq $40, %rsp
	movq -192(%rbp), %rdi
	movq %rax, %rdi
	movq %rax, %rdi
	movq %rax, -192(%rbp)
	movq -32(%rbp), %r8
	movq %r9, -64(%rbp)
	movq -8(%rbp), %r9
	movq %rcx, -48(%rbp)
	movq %r12, -96(%rbp)
	movq -24(%rbp), %r12
	movq %rbx, -88(%rbp)
	movq %rdx, -40(%rbp)
skip_print_row_55:
	movq %rdi, -192(%rbp)
	xorq %rsi, %rsi
	movq %r12, %rdi
	call print
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %r12, -24(%rbp)
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq -88(%rbp), %rbx
	movq -40(%rbp), %rdx
	movq -96(%rbp), %r12
	movq %rbp, %rsp
	popq %rbp
	ret
compute_row_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	movq %rax, -24(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -120(%rbp)
	movq %r14, -104(%rbp)
	movq -16(%rbp), %r14
	movq %r14, %rdi
	movq %r15, -112(%rbp)
	movq -120(%rbp), %r15
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -136(%rbp), %r15
	movq %rax, %r15
	movq $1, (%r15)
	cmpl $0, %eax
	je compute_row_5_5
	movq $0, 8(%r15)
	jmp compute_row_5_6
compute_row_5_5:
	movq $1, 8(%r15)
compute_row_5_6:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r15), %rdi
	movq %rdi, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je compute_row_5_1
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %r15, -136(%rbp)
	jmp skip_compute_row_8
compute_row_5_1:
	subq $0, %rsp
	movq %rax, -144(%rbp)
	movq -24(%rbp), %rax
	movq %r15, -136(%rbp)
skip_compute_row_8:
	movq -144(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne compute_row_5_2
	movq %rax, -24(%rbp)
	movq %rdi, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $7, 8(%rax)
	subq $8, %rsp
	movq -8(%rbp), %rdi
	cmpq $4, (%rdi)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rax, -136(%rbp)
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je compute_row_5_12
compute_row_5_11:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je compute_row_5_12
	jmp compute_row_5_11
compute_row_5_12:
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%r14), %rdi
	subq 8(%rax), %rdi
	subq $8, %rsp
	movq %rax, -168(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -184(%rbp), %rsi
	movq %rax, %rsi
	movq $2, (%rsi)
	movq %rdi, 8(%rsi)
	cmpq $2, (%rsi)
	jne _Error_gestion
	movq 8(%rsi), %rdi
	movq -160(%rbp), %rax
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%rsi), %rdi
	movq 16(%rax,%rdi,8), %rsi
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rsi, -184(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je compute_row_5_19
compute_row_5_18:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je compute_row_5_19
	jmp compute_row_5_18
compute_row_5_19:
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%r14), %rdi
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%r14), %rdi
	subq $8, %rsp
	movq -208(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	movq %rsi, -208(%rbp)
	movq %r8, -48(%rbp)
	movq -208(%rbp), %r8
	movq %r9, -56(%rbp)
	movq -184(%rbp), %r9
	movq %rcx, -40(%rbp)
	cmpq $2, (%r9)
	je compute_row_5_21
	cmpq $3, (%r9)
	je compute_row_5_22
	cmpq $4, (%r9)
	je compute_row_5_23
	jmp _Error_gestion
compute_row_5_21:
	cmpq $2, (%r8)
	je compute_row_5_24
	jmp _Error_gestion
compute_row_5_24:
	movq 8(%r8), %rcx
	addq 8(%r9), %rcx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rcx, 8(%rax)
	movq %rax, %rcx
	jmp compute_row_5_27
compute_row_5_22:
	cmpq $3, (%r8)
	je compute_row_5_25
	jmp _Error_gestion
compute_row_5_25:
	movq 8(%r9), %rsi
	addq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	leaq 16(%r9), %rsi
	leaq 16(%r8), %rdi
	call _my_strcat
	movq %r8, %rcx
	jmp compute_row_5_27
compute_row_5_23:
	cmpq $4, (%r8)
	je compute_row_5_26
	jmp _Error_gestion
compute_row_5_26:
	movq 8(%r9), %rsi
	addq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je compute_row_5_30
	xorq %rdi, %rdi
compute_row_5_28:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	jg compute_row_5_28
compute_row_5_30:
	cmpq $0, 8(%r9)
	je compute_row_5_31
	movq %rdi, %r8
	xorq %rdi, %rdi
compute_row_5_29:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r8,8)
	incq %rdi
	incq %r8
	cmpq %rdi, 8(%r9)
	jg compute_row_5_29
compute_row_5_31:
	movq %rax, %rcx
	jmp compute_row_5_27
compute_row_5_27:
	movq %r8, -208(%rbp)
	movq -136(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq %rdx, -32(%rbp)
	movq 8(%rcx), %rax
	movq 8(%rdi), %r8
	cqto
	idivq %r8
	movq $2, (%rcx)
	movq %rdx, 8(%rcx)
	jmp skip_compute_row_32
compute_row_5_2:
	subq $64, %rsp
	movq -136(%rbp), %r15
	movq -208(%rbp), %rdi
	movq %r15, %rdi
	movq %rdi, -144(%rbp)
	movq %r15, %rdi
	movq %r15, -208(%rbp)
	movq -8(%rbp), %r15
	movq %rcx, -40(%rbp)
	movq %rax, %rcx
	movq %rax, -24(%rbp)
	movq %r8, -48(%rbp)
	movq %r9, -56(%rbp)
	movq %rdx, -32(%rbp)
skip_compute_row_32:
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%r14), %r8
	cmpq %r8, 8(%r15)
	jge _Error_gestion
	subq $8, %rsp
	movq 8(%r14), %r8
	movq %rcx, 16(%r15,%r8,8)
	subq $8, %rsp
	movq %rdi, -208(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, -232(%rbp)
	movq %r14, %rdi
	movq -232(%rbp), %r8
	movq %r8, %rsi
	movq $1, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -248(%rbp), %r8
	movq %rax, %r8
	movq $1, (%r8)
	cmpl $0, %eax
	jg compute_row_5_40
	movq $0, 8(%r8)
	jmp compute_row_5_41
compute_row_5_40:
	movq $1, 8(%r8)
compute_row_5_41:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r8), %rdi
	movq %rdi, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je compute_row_5_35
	subq $8, %rsp
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%r14), %rdi
	subq 8(%rax), %rdi
	subq $8, %rsp
	movq %rax, -264(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -280(%rbp), %r9
	movq %rax, %r9
	movq $2, (%r9)
	movq %rdi, 8(%r9)
	movq -264(%rbp), %rdi
	movq %rdi, %rax
	movq %rdi, -264(%rbp)
	movq %r9, %rdi
	pushq -8(%rbp)
	call compute_row_5
	addq $8, %rsp
	jmp skip_compute_row_46
compute_row_5_35:
	subq $24, %rsp
	movq %r8, %rax
	movq %r8, -280(%rbp)
	movq %rax, -256(%rbp)
	movq -280(%rbp), %rax
skip_compute_row_46:
	movq -256(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne compute_row_5_36
	jmp skip_compute_row_47
compute_row_5_36:
	subq $0, %rsp
skip_compute_row_47:
	movq %rax, -280(%rbp)
	movq %rdi, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -32(%rbp), %rdx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
_user_main_6:
	pushq %rbp
	movq %rsp, %rbp
	subq $128, %rsp
	subq $8, %rsp
	movq %rdi, -32(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $40, 8(%rax)
	movq %rax, -16(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rsi, -40(%rbp)
	movq %rax, -136(%rbp)
	movq %r14, -120(%rbp)
	movq -16(%rbp), %r14
	movq %r15, -128(%rbp)
	movq -136(%rbp), %r15
	movq %r8, -64(%rbp)
	cmpq $2, (%r15)
	je _user_main_6_2
	cmpq $3, (%r15)
	je _user_main_6_3
	cmpq $4, (%r15)
	je _user_main_6_4
	jmp _Error_gestion
_user_main_6_2:
	cmpq $2, (%r14)
	je _user_main_6_5
	jmp _Error_gestion
_user_main_6_5:
	movq 8(%r14), %r8
	addq 8(%r15), %r8
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r8, 8(%rax)
	movq %rax, %r8
	jmp _user_main_6_8
_user_main_6_3:
	cmpq $3, (%r14)
	je _user_main_6_6
	jmp _Error_gestion
_user_main_6_6:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r14
	call _my_strcpy
	leaq 16(%r15), %rsi
	leaq 16(%r14), %rdi
	call _my_strcat
	movq %r14, %r8
	jmp _user_main_6_8
_user_main_6_4:
	cmpq $4, (%r14)
	je _user_main_6_7
	jmp _Error_gestion
_user_main_6_7:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je _user_main_6_11
	xorq %rdi, %rdi
_user_main_6_9:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	jg _user_main_6_9
_user_main_6_11:
	cmpq $0, 8(%r15)
	je _user_main_6_12
	movq %rdi, %r14
	xorq %rdi, %rdi
_user_main_6_10:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r14,8)
	incq %rdi
	incq %r14
	cmpq %rdi, 8(%r15)
	jg _user_main_6_10
_user_main_6_12:
	movq %rax, %r8
	jmp _user_main_6_8
_user_main_6_8:
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	subq $8, %rsp
	movq -160(%rbp), %rdi
	movq %rax, -8(%rbp)
	movq %rdi, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -160(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq -160(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je _user_main_6_19
_user_main_6_18:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je _user_main_6_19
	jmp _user_main_6_18
_user_main_6_19:
	xorq %rdi, %rdi
_user_main_6_14:
	cmpq %rdi, 8(%rax)
	je _user_main_6_15
	movq -24(%rbp), %r8
	movq 16(%rax,%rdi,8), %r8
	pushq %rdi
	movq -8(%rbp), %rdi
	cmpq $4, (%rdi)
	jne _Error_gestion
	subq $8, %rsp
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%r8), %rsi
	cmpq %rsi, 8(%rdi)
	jge _Error_gestion
	subq $8, %rsp
	movq %rax, -168(%rbp)
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	movq 8(%r8), %rsi
	movq -8(%rbp), %rdi
	movq %rax, 16(%rdi,%rsi,8)
	subq $8, %rsp
	subq $8, %rsp
	movq -192(%rbp), %rsi
	movq %rax, -184(%rbp)
	movq %rsi, %rax
	movq -200(%rbp), %rax
	movq %rdi, -8(%rbp)
	movq %rax, %rdi
	movq %rax, -200(%rbp)
	pushq -8(%rbp)
	call compute_row_5
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq -208(%rbp), %rdi
	movq %rax, -200(%rbp)
	movq %rdi, %rax
	movq -216(%rbp), %rsi
	movq %rdi, -208(%rbp)
	movq %rsi, %rdi
	pushq -8(%rbp)
	call print_row_4
	addq $8, %rsp
	popq %rdi
	incq %rdi
	jmp _user_main_6_14
	jmp skip__user_main_26
_user_main_6_15:
	subq $48, %rsp
	movq %rax, %rax
	movq -24(%rbp), %r8
skip__user_main_26:
	movq %rax, -216(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -120(%rbp), %r14
	movq -128(%rbp), %r15
	movq -40(%rbp), %rsi
	movq -32(%rbp), %rdi
	movq -64(%rbp), %r8
	movq %rbp, %rsp
	popq %rbp
	ret
print:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rax
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %r12
	pushq %r13
	pushq %r14
	movq %rsi, %r12
	pushq %rbx
	movq %rsp, %rbx
	andq $-16, %rsp
	xorq %rax, %rax
	cmpq $0, (%rdi)
	je _implement_context_15_4
	cmpq $1, (%rdi)
	je _implement_context_15_1
	cmpq $2, (%rdi)
	je _implement_context_15_0
	cmpq $3, (%rdi)
	je _implement_context_15_2
	cmpq $4, (%rdi)
	je _implement_context_15_3
	jmp _Error_gestion
_implement_context_15_1:
	cmpq $0, 8(%rdi)
	je _implement_context_15_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_15_8
_implement_context_15_7:
	movq $_False, %rdi
	call printf
_implement_context_15_8:
	jmp _implement_context_15_5
_implement_context_15_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_15_5
_implement_context_15_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_15_5
_implement_context_15_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_15_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_15_10
_implement_context_15_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_15_9
_implement_context_15_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_15_5
_implement_context_15_4:
	movq $_None_format, %rdi
	call printf
_implement_context_15_5:
	cmpq $0, %r12
	jne _implement_context_15_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_15_6:
	movq %rbx, %rsp
	popq %rbx
	popq %r14
	popq %r13
	popq %r12
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rax
	popq %rbp
	ret
range:
	movq %rdi, %rax
	ret
len:
	pushq %rbp
	movq %rsp, %rbp
	cmpq $4, (%rdi)
	jne _Error_gestion
	pushq %rsi
	movq 8(%rdi), %rsi
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rsi, 8(%rax)
	popq %rsi
	popq %rbp
	ret
list:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rsi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	testq %rsi, %rsi
	jle list_skip
list_loop:
	decq %rsi
	movq %rsi, 16(%rax,%rsi,8)
	testq %rsi, %rsi
	jg list_loop
list_skip:
	popq %rsi
	popq %rbp
	ret
_my_malloc:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rsi
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rbx
	movq %rsp, %rbx
	andq $-16, %rsp
	call malloc
	movq %rbx, %rsp
	popq %rbx
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
_my_strcpy:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rax
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rbx
	movq %rsp, %rbx
	andq $-16, %rsp
	call strcpy
	movq %rbx, %rsp
	popq %rbx
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rax
	popq %rbp
	ret
_my_strcat:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rax
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rbx
	movq %rsp, %rbx
	andq $-16, %rsp
	call strcat
	movq %rbx, %rsp
	popq %rbx
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rax
	popq %rbp
	ret
_my_strcmp:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rdx
	pushq %rcx
	pushq %r8
	pushq %r9
	pushq %r10
	pushq %r11
	pushq %rbx
	movq %rsp, %rbx
	andq $-16, %rsp
	call strcmp
	movq %rbx, %rsp
	popq %rbx
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rbp
	ret
_my_compare:
	pushq %rbp
	movq %rsp, %rbp
	cmpq $0, %rax
	je _implement_context_15_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $3, (%rdi)
	jl _implement_context_15_17
	jg _implement_context_15_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_15_13
_implement_context_15_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_15_12
_implement_context_15_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_15_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_15_19
	cmpq %rax, 8(%rsi)
	je _implement_context_15_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_15_14
	jg _implement_context_15_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_15_20
_implement_context_15_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_15_15
	jmp _implement_context_15_14
_implement_context_15_11:
	cmpq $0, (%rdi)
	jne _implement_context_15_21
	cmpq $0, (%rsi)
	je _implement_context_15_15
	jmp _implement_context_15_14
_implement_context_15_21:
	cmpq $0, (%rsi)
	je _implement_context_15_14
	cmpq $3, (%rdi)
	jl _implement_context_15_22
	jg _implement_context_15_23
	cmpq $3, (%rsi)
	jne _implement_context_15_14
	jmp _implement_context_15_13
_implement_context_15_22:
	cmpq $2, (%rsi)
	jg _implement_context_15_14
	jmp _implement_context_15_12
_implement_context_15_23:
	cmpq $4, (%rsi)
	jne _implement_context_15_14
	xorq %rax, %rax
_implement_context_15_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_15_24
	cmpq %rax, 8(%rsi)
	je _implement_context_15_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_15_14
	jg _implement_context_15_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_15_25
_implement_context_15_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_15_15
	jmp _implement_context_15_14
_implement_context_15_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
	je _implement_context_15_15
	jg _implement_context_15_16
	jmp _implement_context_15_14
_implement_context_15_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_15_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_15_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_15_16:
	movq $1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_Error_gestion:
	xorq %rax, %rax
	movq $_Error_message, %rdi
	andq $-16, %rsp
	call printf
	xorq %rdi, %rdi
	call fflush
	movq $1, %rdi
	movq $60, %rax
	syscall
	.data
print_row_4_1:
	.string ""
print_row_4_28:
	.string "*"
print_row_4_42:
	.string "0"
_True:
	.string "True"
_False:
	.string "False"
_int_format:
	.string "%d"
_list_format_start:
	.string "["
_list_format_end:
	.string "]"
_list_format_sep:
	.string ", "
_None_format:
	.string "None"
_flush:
	.string "\n"
_Error_message:
	.string "error : detected error while excecuting code\n"
