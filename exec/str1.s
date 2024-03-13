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
	movq %rax, -128(%rbp)
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
	movq %rax, -152(%rbp)
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
	andq $-16, %rsp
	xorq %rdi, %rdi
	call fflush
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
str_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %r14, -104(%rbp)
	movq $10, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rsi, -24(%rbp)
	movq %rax, -120(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_2, %rsi
	call _my_strcpy
	movq $0, %rdi
	movq -120(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_4, %rsi
	call _my_strcpy
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_6, %rsi
	call _my_strcpy
	movq $2, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_8, %rsi
	call _my_strcpy
	movq $3, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_10, %rsi
	call _my_strcpy
	movq $4, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_12, %rsi
	call _my_strcpy
	movq $5, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_14, %rsi
	call _my_strcpy
	movq $6, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_16, %rsi
	call _my_strcpy
	movq $7, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_18, %rsi
	call _my_strcpy
	movq $8, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_20, %rsi
	call _my_strcpy
	movq $9, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -208(%rbp)
	movq %r15, -112(%rbp)
	movq -8(%rbp), %r15
	movq %r8, -48(%rbp)
	movq -216(%rbp), %r8
	cmpq $2, (%r15)
	je str_4_26
	cmpq $3, (%r15)
	je str_4_27
	cmpq $4, (%r15)
	je str_4_28
	cmpq $1, (%r15)
	je str_4_29
	cmpq $0, (%r15)
	je str_4_25
	jmp _Error_gestion
str_4_25:
	movq %r15, %r8
	jmp str_4_30
str_4_26:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp str_4_30
str_4_29:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp str_4_30
str_4_27:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp str_4_30
str_4_28:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je str_4_32
str_4_31:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je str_4_32
	jmp str_4_31
str_4_32:
	movq %rax, %r8
str_4_30:
	movq %r8, -216(%rbp)
	movq %r9, -56(%rbp)
	movq -208(%rbp), %r9
	movq %r9, %rdi
	movq %r8, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jge str_4_33
	movq $1, 8(%r8)
	jmp str_4_34
str_4_33:
	movq $0, 8(%r8)
str_4_34:
	cmpq $0, 8(%r8)
	je str_4_21
	subq $8, %rsp
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	movq -224(%rbp), %r9
	cmpq $2, (%r14)
	je str_4_37
	cmpq $3, (%r14)
	je str_4_38
	cmpq $4, (%r14)
	je str_4_39
	cmpq $1, (%r14)
	je str_4_40
	cmpq $0, (%r14)
	je str_4_36
	jmp _Error_gestion
str_4_36:
	movq %r14, %r9
	jmp str_4_41
str_4_37:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_41
str_4_40:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_41
str_4_38:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp str_4_41
str_4_39:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je str_4_43
str_4_42:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je str_4_43
	jmp str_4_42
str_4_43:
	movq %rax, %r9
str_4_41:
	movq %r9, -224(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq %rcx, -40(%rbp)
	movq -232(%rbp), %rcx
	cmpq $2, (%r15)
	je str_4_46
	cmpq $3, (%r15)
	je str_4_47
	cmpq $4, (%r15)
	je str_4_48
	cmpq $1, (%r15)
	je str_4_49
	cmpq $0, (%r15)
	je str_4_45
	jmp _Error_gestion
str_4_45:
	movq %r15, %rcx
	jmp str_4_50
str_4_46:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp str_4_50
str_4_49:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp str_4_50
str_4_47:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	jmp str_4_50
str_4_48:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je str_4_52
str_4_51:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je str_4_52
	jmp str_4_51
str_4_52:
	movq %rax, %rcx
str_4_50:
	movq %rcx, -232(%rbp)
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%rcx), %rdi
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	movq 8(%rcx), %rdi
	movq 16(%r9,%rdi,8), %rcx
	movq %rcx, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp str_4_22
str_4_21:
	subq $8, %rsp
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	movq -240(%rbp), %r9
	cmpq $2, (%r14)
	je str_4_55
	cmpq $3, (%r14)
	je str_4_56
	cmpq $4, (%r14)
	je str_4_57
	cmpq $1, (%r14)
	je str_4_58
	cmpq $0, (%r14)
	je str_4_54
	jmp _Error_gestion
str_4_54:
	movq %r14, %r9
	jmp str_4_59
str_4_55:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_59
str_4_58:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_59
str_4_56:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp str_4_59
str_4_57:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je str_4_61
str_4_60:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je str_4_61
	jmp str_4_60
str_4_61:
	movq %rax, %r9
str_4_59:
	movq %r9, -240(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -248(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq %rbx, -80(%rbp)
	movq -256(%rbp), %rbx
	cmpq $2, (%r15)
	je str_4_65
	cmpq $3, (%r15)
	je str_4_66
	cmpq $4, (%r15)
	je str_4_67
	cmpq $1, (%r15)
	je str_4_68
	cmpq $0, (%r15)
	je str_4_64
	jmp _Error_gestion
str_4_64:
	movq %r15, %rbx
	jmp str_4_69
str_4_65:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rbx
	jmp str_4_69
str_4_68:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rbx
	jmp str_4_69
str_4_66:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	jmp str_4_69
str_4_67:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je str_4_71
str_4_70:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je str_4_71
	jmp str_4_70
str_4_71:
	movq %rax, %rbx
str_4_69:
	movq %rbx, -256(%rbp)
	movq -248(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rbx)
	jne _Error_gestion
	movq 8(%rbx), %rax
	movq %rdx, -32(%rbp)
	movq 8(%rdi), %rdi
	cqto
	idivq %rdi
	movq %rdx, 8(%rbx)
	movq -248(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	cmpq %rsi, 8(%r9)
	jge _Error_gestion
	movq 8(%rdi), %rsi
	movq 16(%r9,%rsi,8), %rbx
	subq $8, %rsp
	movq %rdi, -248(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -264(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq -272(%rbp), %r9
	cmpq $2, (%r15)
	je str_4_75
	cmpq $3, (%r15)
	je str_4_76
	cmpq $4, (%r15)
	je str_4_77
	cmpq $1, (%r15)
	je str_4_78
	cmpq $0, (%r15)
	je str_4_74
	jmp _Error_gestion
str_4_74:
	movq %r15, %r9
	jmp str_4_79
str_4_75:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_79
str_4_78:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp str_4_79
str_4_76:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp str_4_79
str_4_77:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je str_4_81
str_4_80:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je str_4_81
	jmp str_4_80
str_4_81:
	movq %rax, %r9
str_4_79:
	movq %r9, -272(%rbp)
	movq -264(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%r9), %rax
	movq 8(%rdi), %rdi
	cqto
	idivq %rdi
	movq %rax, 8(%r9)
	subq $8, %rsp
	movq %r9, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -288(%rbp)
	movq -288(%rbp), %r9
	cmpq $2, (%rbx)
	je str_4_84
	cmpq $3, (%rbx)
	je str_4_85
	cmpq $4, (%rbx)
	je str_4_86
	jmp _Error_gestion
str_4_84:
	cmpq $2, (%r9)
	je str_4_87
	jmp _Error_gestion
str_4_87:
	movq 8(%r9), %r9
	addq %r9, 8(%rbx)
	jmp str_4_90
str_4_85:
	cmpq $3, (%r9)
	je str_4_88
	jmp _Error_gestion
str_4_88:
	movq 8(%rbx), %rsi
	addq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	leaq 16(%rbx), %rsi
	leaq 16(%r9), %rdi
	call _my_strcat
	movq %r9, %rbx
	jmp str_4_90
str_4_86:
	cmpq $4, (%r9)
	je str_4_89
	jmp _Error_gestion
str_4_89:
	movq 8(%rbx), %rsi
	addq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r9)
	je str_4_93
	xorq %rdi, %rdi
str_4_91:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	jg str_4_91
str_4_93:
	cmpq $0, 8(%rbx)
	je str_4_94
	movq %rdi, %r9
	xorq %rdi, %rdi
str_4_92:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r9,8)
	incq %rdi
	incq %r9
	cmpq %rdi, 8(%rbx)
	jg str_4_92
str_4_94:
	movq %rax, %rbx
	jmp str_4_90
str_4_90:
	movq %rbx, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -32(%rbp), %rdx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
str_4_22:
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -32(%rbp), %rdx
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
	xorq %rdi, %rdi
	call fflush
	movq $1, %rdi
	movq $60, %rax
	syscall
	.data
str_4_2:
	.string "0"
str_4_4:
	.string "1"
str_4_6:
	.string "2"
str_4_8:
	.string "3"
str_4_10:
	.string "4"
str_4_12:
	.string "5"
str_4_14:
	.string "6"
str_4_16:
	.string "7"
str_4_18:
	.string "8"
str_4_20:
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
