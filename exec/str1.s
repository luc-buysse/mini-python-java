	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $42, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	subq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1024, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	subq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	movq -8(%rbp), %rdi
	movq -16(%rbp), %rsi
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
	movq %rbp, %rsp
	popq %rbp
	ret
str_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -24(%rbp)
	movq $10, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_1, %rsi
	call _my_strcpy
	movq %rax, -112(%rbp)
	movq $0, %rax
	movq -112(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_3, %rsi
	call _my_strcpy
	movq %rax, -120(%rbp)
	movq $1, %rax
	movq -120(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_5, %rsi
	call _my_strcpy
	movq %rax, -128(%rbp)
	movq $2, %rax
	movq -128(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_7, %rsi
	call _my_strcpy
	movq %rax, -136(%rbp)
	movq $3, %rax
	movq -136(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_9, %rsi
	call _my_strcpy
	movq %rax, -144(%rbp)
	movq $4, %rax
	movq -144(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_11, %rsi
	call _my_strcpy
	movq %rax, -152(%rbp)
	movq $5, %rax
	movq -152(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_13, %rsi
	call _my_strcpy
	movq %rax, -160(%rbp)
	movq $6, %rax
	movq -160(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_15, %rsi
	call _my_strcpy
	movq %rax, -168(%rbp)
	movq $7, %rax
	movq -168(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_17, %rsi
	call _my_strcpy
	movq %rax, -176(%rbp)
	movq $8, %rax
	movq -176(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_19, %rsi
	call _my_strcpy
	movq %rax, -184(%rbp)
	movq $9, %rax
	movq -184(%rbp), %rdi
	movq -16(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -192(%rbp)
	movq %r14, -104(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je str_4_24
	cmpq $3, (%r14)
	je str_4_25
	cmpq $4, (%r14)
	je str_4_26
	cmpq $1, (%r14)
	je str_4_27
	movq %r15, -112(%rbp)
	movq -200(%rbp), %r15
	movq %r14, %r15
	jmp str_4_28
str_4_24:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_28
str_4_27:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_28
str_4_25:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r8, -48(%rbp)
	movq %rax, %r8
	call _my_strcpy
	subq $16, %r8
	jmp str_4_28
str_4_26:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je str_4_30
str_4_29:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je str_4_30
	jmp str_4_29
str_4_30:
	movq %rax, %r8
str_4_28:
	movq %r15, -200(%rbp)
	movq %r8, %rdi
	movq -192(%rbp), %r15
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jge str_4_31
	movq $1, 8(%r8)
	jmp str_4_32
str_4_31:
	movq $0, 8(%r8)
str_4_32:
	cmpq $0, 8(%r8)
	je str_4_20
	subq $8, %rsp
	movq -16(%rbp), %r15
	cmpq $2, (%r15)
	je str_4_34
	cmpq $3, (%r15)
	je str_4_35
	cmpq $4, (%r15)
	je str_4_36
	cmpq $1, (%r15)
	je str_4_37
	movq %r9, -56(%rbp)
	movq -208(%rbp), %r9
	movq %r15, %r9
	jmp str_4_38
str_4_34:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp str_4_38
str_4_37:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp str_4_38
str_4_35:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rcx, -40(%rbp)
	movq %rax, %rcx
	call _my_strcpy
	subq $16, %rcx
	jmp str_4_38
str_4_36:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je str_4_40
str_4_39:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je str_4_40
	jmp str_4_39
str_4_40:
	movq %rax, %rcx
str_4_38:
	movq %r9, -208(%rbp)
	cmpq $4, (%rcx)
	jne _Error_gestion
	subq $8, %rsp
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je str_4_42
	cmpq $3, (%r14)
	je str_4_43
	cmpq $4, (%r14)
	je str_4_44
	cmpq $1, (%r14)
	je str_4_45
	movq -216(%rbp), %r9
	movq %r14, %r9
	jmp str_4_46
str_4_42:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_46
str_4_45:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_46
str_4_43:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rbx, -80(%rbp)
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp str_4_46
str_4_44:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je str_4_48
str_4_47:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je str_4_48
	jmp str_4_47
str_4_48:
	movq %rax, %rbx
str_4_46:
	movq %r9, -216(%rbp)
	cmpq $2, (%rbx)
	jne _Error_gestion
	movq 8(%rbx), %rdi
	cmpq %rdi, 8(%rcx)
	jge _Error_gestion
	movq 8(%rbx), %rdi
	movq 16(%rcx,%rdi,8), %rbx
	movq %rbx, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp str_4_21
str_4_20:
	subq $8, %rsp
	movq %r15, -16(%rbp)
	movq -16(%rbp), %r15
	cmpq $2, (%r15)
	je str_4_50
	cmpq $3, (%r15)
	je str_4_51
	cmpq $4, (%r15)
	je str_4_52
	cmpq $1, (%r15)
	je str_4_53
	movq -224(%rbp), %r9
	movq %r15, %r9
	jmp str_4_54
str_4_50:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp str_4_54
str_4_53:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp str_4_54
str_4_51:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	subq $16, %rcx
	jmp str_4_54
str_4_52:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je str_4_56
str_4_55:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je str_4_56
	jmp str_4_55
str_4_56:
	movq %rax, %rcx
str_4_54:
	movq %r9, -224(%rbp)
	cmpq $4, (%rcx)
	jne _Error_gestion
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -232(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je str_4_59
	cmpq $3, (%r14)
	je str_4_60
	cmpq $4, (%r14)
	je str_4_61
	cmpq $1, (%r14)
	je str_4_62
	movq -240(%rbp), %r9
	movq %r14, %r9
	jmp str_4_63
str_4_59:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_63
str_4_62:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_63
str_4_60:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rdx, -32(%rbp)
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp str_4_63
str_4_61:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je str_4_65
str_4_64:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je str_4_65
	jmp str_4_64
str_4_65:
	movq %rax, %rdx
str_4_63:
	movq %r9, -240(%rbp)
	movq -232(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rdx)
	jne _Error_gestion
	movq 8(%rdx), %rax
	movq %rdx, -240(%rbp)
	movq 8(%rdi), %rdi
	cqto
	idivq %rdi
	movq -240(%rbp), %rdi
	movq %rdx, 8(%rdi)
	movq -232(%rbp), %r9
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%r9), %rsi
	cmpq %rsi, 8(%rcx)
	jge _Error_gestion
	movq 8(%r9), %rsi
	movq 16(%rcx,%rsi,8), %rdi
	subq $8, %rsp
	movq %rdi, -240(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -248(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je str_4_68
	cmpq $3, (%r14)
	je str_4_69
	cmpq $4, (%r14)
	je str_4_70
	cmpq $1, (%r14)
	je str_4_71
	movq -256(%rbp), %rcx
	movq %r14, %rcx
	jmp str_4_72
str_4_68:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_72
str_4_71:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp str_4_72
str_4_69:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r12, -88(%rbp)
	movq %rax, %r12
	call _my_strcpy
	subq $16, %r12
	jmp str_4_72
str_4_70:
	movq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r12)
	je str_4_74
str_4_73:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r12)
	je str_4_74
	jmp str_4_73
str_4_74:
	movq %rax, %r12
str_4_72:
	movq %rcx, -256(%rbp)
	movq -248(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r12)
	jne _Error_gestion
	movq 8(%rax), %rax
	movq 8(%rdi), %rdi
	cqto
	idivq %rdi
	movq %rax, 8(%r12)
	subq $8, %rsp
	movq %r12, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -272(%rbp)
	movq -240(%rbp), %rcx
	movq -272(%rbp), %r12
	cmpq $2, (%rcx)
	je str_4_77
	cmpq $3, (%rcx)
	je str_4_78
	cmpq $4, (%rcx)
	je str_4_79
	jmp _Error_gestion
str_4_77:
	cmpq $2, (%r12)
	je str_4_80
	jmp _Error_gestion
str_4_80:
	movq 8(%r12), %r12
	addq %r12, 8(%rcx)
	jmp str_4_83
str_4_78:
	cmpq $3, (%r12)
	je str_4_81
	jmp _Error_gestion
str_4_81:
	movq 8(%rcx), %rsi
	addq 8(%r12), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r12), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r12
	call _my_strcpy
	leaq 16(%rcx), %rsi
	leaq 16(%r12), %rdi
	call _my_strcat
	movq %r12, %rcx
	jmp str_4_83
str_4_79:
	cmpq $4, (%r12)
	je str_4_82
	jmp _Error_gestion
str_4_82:
	movq 8(%rcx), %rsi
	addq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je str_4_86
	xorq %rdi, %rdi
str_4_84:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl str_4_84
str_4_86:
	cmpq $0, 8(%rcx)
	je str_4_87
	xorq %rdi, %rdi
str_4_85:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl str_4_85
str_4_87:
	jmp str_4_83
str_4_83:
	movq %rcx, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -32(%rbp), %rdx
	movq -88(%rbp), %r12
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
str_4_21:
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -32(%rbp), %rdx
	movq -88(%rbp), %r12
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
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
	je _implement_context_5_4
	cmpq $1, (%rdi)
	je _implement_context_5_1
	cmpq $2, (%rdi)
	je _implement_context_5_0
	cmpq $3, (%rdi)
	je _implement_context_5_2
	cmpq $4, (%rdi)
	je _implement_context_5_3
	jmp _Error_gestion
_implement_context_5_1:
	cmpq $0, 8(%rdi)
	je _implement_context_5_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_5_8
_implement_context_5_7:
	movq $_False, %rdi
	call printf
_implement_context_5_8:
	jmp _implement_context_5_5
_implement_context_5_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_5_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_5_10
_implement_context_5_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_5_9
_implement_context_5_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_4:
	movq $_None_format, %rdi
	call printf
_implement_context_5_5:
	cmpq $0, %r12
	jne _implement_context_5_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_5_6:
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
	ret
len:
	pushq %rbp
	movq %rsp, %rbp
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
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $0, %rax
	je _implement_context_5_11
	cmpq $3, (%rdi)
	jl _implement_context_5_17
	jg _implement_context_5_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_5_13
_implement_context_5_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_5_12
_implement_context_5_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_5_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_19
	cmpq %rax, 8(%rsi)
	je _implement_context_5_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	jmp _implement_context_5_20
_implement_context_5_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_11:
	cmpq $3, (%rdi)
	jl _implement_context_5_21
	jg _implement_context_5_22
	cmpq $3, (%rsi)
	jne _implement_context_5_14
	jmp _implement_context_5_13
_implement_context_5_21:
	cmpq $2, (%rsi)
	jg _implement_context_5_14
	jmp _implement_context_5_12
_implement_context_5_22:
	cmpq $4, (%rsi)
	jne _implement_context_5_14
	xorq %rax, %rax
_implement_context_5_24:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_23
	cmpq %rax, 8(%rsi)
	je _implement_context_5_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	jmp _implement_context_5_24
_implement_context_5_23:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_12:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_5_15
	jg _implement_context_5_16
	jmp _implement_context_5_14
_implement_context_5_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_16:
	movq $1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_Error_gestion:
	xorq %rax, %rax
	movq $_Error_message, %rdi
	andq $-16, %rsp
	call printf
	movq $1, %rdi
	movq $60, %rax
	syscall
	.data
str_4_1:
	.string "0"
str_4_3:
	.string "1"
str_4_5:
	.string "2"
str_4_7:
	.string "3"
str_4_9:
	.string "4"
str_4_11:
	.string "5"
str_4_13:
	.string "6"
str_4_15:
	.string "7"
str_4_17:
	.string "8"
str_4_19:
	.string "9"
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
_None:
	.quad 0
	.quad 0
