	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq %rdi, -16(%rbp)
	movq %rsi, -24(%rbp)
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -112(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -120(%rbp)
	movq $0, %rax
	movq -120(%rbp), %rdi
	movq -112(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -128(%rbp)
	movq $1, %rax
	movq -128(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -136(%rbp)
	movq $2, %rax
	movq -136(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -112(%rbp)
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -152(%rbp)
	movq $0, %rax
	movq -152(%rbp), %rdi
	movq -144(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -144(%rbp)
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -168(%rbp)
	movq $0, %rax
	movq -168(%rbp), %rdi
	movq -160(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -176(%rbp)
	movq $1, %rax
	movq -176(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq $1, %rax
	movq -144(%rbp), %rdi
	movq %rsi, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %rax, -184(%rbp)
	movq $2, %rax
	movq -184(%rbp), %rdi
	movq -144(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	movq %rsi, -144(%rbp)
	movq %r14, -104(%rbp)
	movq -144(%rbp), %r14
	movq %r14, %rdi
	movq %r15, -112(%rbp)
	movq -112(%rbp), %r15
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r14)
	cmpq $0, %rax
	je main_0_10
	movq $1, 8(%r14)
	jmp main_0_11
main_0_10:
	movq $0, 8(%r14)
main_0_11:
	xorq %rsi, %rsi
	movq %r14, %rdi
	call print
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -192(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -200(%rbp)
	movq $0, %rax
	movq -200(%rbp), %rdi
	movq -192(%rbp), %r15
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -208(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -216(%rbp)
	movq $0, %rax
	movq -216(%rbp), %rdi
	movq -208(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -224(%rbp)
	movq $1, %rax
	movq -224(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq $1, %rax
	movq %rsi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -232(%rbp)
	movq $2, %rax
	movq -232(%rbp), %rdi
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -240(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -248(%rbp)
	movq $0, %rax
	movq -248(%rbp), %rdi
	movq -240(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -240(%rbp)
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -264(%rbp)
	movq $0, %rax
	movq -264(%rbp), %rdi
	movq -256(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -272(%rbp)
	movq $1, %rax
	movq -272(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq $1, %rax
	movq -240(%rbp), %rdi
	movq %rsi, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -240(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %rax, -280(%rbp)
	movq $2, %rax
	movq -280(%rbp), %rdi
	movq -240(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	movq %rsi, -240(%rbp)
	movq %r8, -48(%rbp)
	movq -240(%rbp), %r8
	movq %r8, %rdi
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jne main_0_24
	movq $1, 8(%r8)
	jmp main_0_25
main_0_24:
	movq $0, 8(%r8)
main_0_25:
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -288(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -296(%rbp)
	movq $0, %rax
	movq -296(%rbp), %rdi
	movq -288(%rbp), %r15
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -304(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -312(%rbp)
	movq $0, %rax
	movq -312(%rbp), %rdi
	movq -304(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -320(%rbp)
	movq $1, %rax
	movq -320(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq $1, %rax
	movq %rsi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %rax, -328(%rbp)
	movq $2, %rax
	movq -328(%rbp), %rdi
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -336(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -344(%rbp)
	movq $0, %rax
	movq -344(%rbp), %rdi
	movq -336(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq %rsi, -336(%rbp)
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -352(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -360(%rbp)
	movq $0, %rax
	movq -360(%rbp), %rdi
	movq -352(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -368(%rbp)
	movq $1, %rax
	movq -368(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq $1, %rax
	movq -336(%rbp), %rdi
	movq %rsi, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -336(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %rax, -376(%rbp)
	movq $2, %rax
	movq -376(%rbp), %rdi
	movq -336(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	movq %rsi, -336(%rbp)
	movq %r9, -56(%rbp)
	movq -336(%rbp), %r9
	movq %r9, %rdi
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpq $0, %rax
	jne main_0_38
	movq $1, 8(%r9)
	jmp main_0_39
main_0_38:
	movq $0, 8(%r9)
main_0_39:
	xorq %rsi, %rsi
	movq %r9, %rdi
	call print
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -8(%rbp)
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -384(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_42
	cmpq $3, (%r15)
	je main_0_43
	cmpq $4, (%r15)
	je main_0_44
	cmpq $1, (%r15)
	je main_0_45
	movq %rcx, -40(%rbp)
	movq -392(%rbp), %rcx
	movq %r15, %rcx
	jmp main_0_46
main_0_42:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_46
main_0_45:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_46
main_0_43:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rbx, -80(%rbp)
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp main_0_46
main_0_44:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je main_0_48
main_0_47:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je main_0_48
	jmp main_0_47
main_0_48:
	movq %rax, %rbx
main_0_46:
	movq %rcx, -392(%rbp)
	movq $0, %rax
	movq -384(%rbp), %rdi
	movq %rbx, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -384(%rbp)
	movq $1, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -400(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_51
	cmpq $3, (%r15)
	je main_0_52
	cmpq $4, (%r15)
	je main_0_53
	cmpq $1, (%r15)
	je main_0_54
	movq -408(%rbp), %rcx
	movq %r15, %rcx
	jmp main_0_55
main_0_51:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_55
main_0_54:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_55
main_0_52:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp main_0_55
main_0_53:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je main_0_57
main_0_56:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je main_0_57
	jmp main_0_56
main_0_57:
	movq %rax, %rbx
main_0_55:
	movq %rcx, -408(%rbp)
	movq $0, %rax
	movq -400(%rbp), %rdi
	movq %rbx, 16(%rdi,%rax,8)
	movq $1, %rax
	movq -384(%rbp), %rcx
	movq %rdi, 16(%rcx,%rax,8)
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_59
	cmpq $3, (%r15)
	je main_0_60
	cmpq $4, (%r15)
	je main_0_61
	cmpq $1, (%r15)
	je main_0_62
	movq -416(%rbp), %rbx
	movq %r15, %rbx
	jmp main_0_63
main_0_59:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_63
main_0_62:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_63
main_0_60:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rdx, -32(%rbp)
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp main_0_63
main_0_61:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_65
main_0_64:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_65
	jmp main_0_64
main_0_65:
	movq %rax, %rdx
main_0_63:
	movq %rbx, -416(%rbp)
	movq $2, %rax
	movq %rdx, 16(%rcx,%rax,8)
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -424(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_68
	cmpq $3, (%r15)
	je main_0_69
	cmpq $4, (%r15)
	je main_0_70
	cmpq $1, (%r15)
	je main_0_71
	movq -432(%rbp), %rbx
	movq %r15, %rbx
	jmp main_0_72
main_0_68:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_72
main_0_71:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_72
main_0_69:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp main_0_72
main_0_70:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_74
main_0_73:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_74
	jmp main_0_73
main_0_74:
	movq %rax, %rdx
main_0_72:
	movq %rbx, -432(%rbp)
	movq $0, %rax
	movq -424(%rbp), %rdi
	movq %rdx, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -424(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_76
	cmpq $3, (%r15)
	je main_0_77
	cmpq $4, (%r15)
	je main_0_78
	cmpq $1, (%r15)
	je main_0_79
	movq -440(%rbp), %rbx
	movq %r15, %rbx
	jmp main_0_80
main_0_76:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_80
main_0_79:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_80
main_0_77:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp main_0_80
main_0_78:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_82
main_0_81:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_82
	jmp main_0_81
main_0_82:
	movq %rax, %rdx
main_0_80:
	movq %rbx, -440(%rbp)
	movq $1, %rax
	movq -424(%rbp), %rdi
	movq %rdx, 16(%rdi,%rax,8)
	subq $8, %rsp
	movq %rdi, -424(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je main_0_84
	cmpq $3, (%r15)
	je main_0_85
	cmpq $4, (%r15)
	je main_0_86
	cmpq $1, (%r15)
	je main_0_87
	movq -448(%rbp), %rbx
	movq %r15, %rbx
	jmp main_0_88
main_0_84:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_88
main_0_87:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_88
main_0_85:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp main_0_88
main_0_86:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_90
main_0_89:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je main_0_90
	jmp main_0_89
main_0_90:
	movq %rax, %rdx
main_0_88:
	movq %rbx, -448(%rbp)
	movq $2, %rax
	movq -424(%rbp), %rdi
	movq %rdx, 16(%rdi,%rax,8)
	movq %rdi, -424(%rbp)
	movq -424(%rbp), %rbx
	movq %rbx, %rdi
	movq %rcx, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%rbx)
	cmpq $0, %rax
	jne main_0_91
	movq $1, 8(%rbx)
	jmp main_0_92
main_0_91:
	movq $0, 8(%rbx)
main_0_92:
	xorq %rsi, %rsi
	movq %rbx, %rdi
	call print
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -16(%rbp), %rdi
	movq -40(%rbp), %rcx
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -32(%rbp), %rdx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
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
	je _implement_context_4_4
	cmpq $1, (%rdi)
	je _implement_context_4_1
	cmpq $2, (%rdi)
	je _implement_context_4_0
	cmpq $3, (%rdi)
	je _implement_context_4_2
	cmpq $4, (%rdi)
	je _implement_context_4_3
	jmp _Error_gestion
_implement_context_4_1:
	cmpq $0, 8(%rdi)
	je _implement_context_4_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_4_8
_implement_context_4_7:
	movq $_False, %rdi
	call printf
_implement_context_4_8:
	jmp _implement_context_4_5
_implement_context_4_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_4_5
_implement_context_4_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_4_5
_implement_context_4_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_4_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_4_10
_implement_context_4_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_4_9
_implement_context_4_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_4_5
_implement_context_4_4:
	movq $_None_format, %rdi
	call printf
_implement_context_4_5:
	cmpq $0, %r12
	jne _implement_context_4_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_4_6:
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
	je _implement_context_4_11
	cmpq $3, (%rdi)
	jl _implement_context_4_17
	jg _implement_context_4_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_4_13
_implement_context_4_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_4_12
_implement_context_4_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_4_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_4_19
	cmpq %rax, 8(%rsi)
	je _implement_context_4_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_4_14
	jg _implement_context_4_16
	popq %rax
	incq %rax
	jmp _implement_context_4_20
_implement_context_4_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_15
	jmp _implement_context_4_14
_implement_context_4_11:
	cmpq $3, (%rdi)
	jl _implement_context_4_21
	jg _implement_context_4_22
	cmpq $3, (%rsi)
	jne _implement_context_4_14
	jmp _implement_context_4_13
_implement_context_4_21:
	cmpq $2, (%rsi)
	jg _implement_context_4_14
	jmp _implement_context_4_12
_implement_context_4_22:
	cmpq $4, (%rsi)
	jne _implement_context_4_14
	xorq %rax, %rax
_implement_context_4_24:
	cmpq %rax, 8(%rdi)
	je _implement_context_4_23
	cmpq %rax, 8(%rsi)
	je _implement_context_4_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_4_14
	jg _implement_context_4_16
	popq %rax
	incq %rax
	jmp _implement_context_4_24
_implement_context_4_23:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_15
	jmp _implement_context_4_14
_implement_context_4_12:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_4_15
	jg _implement_context_4_16
	jmp _implement_context_4_14
_implement_context_4_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_16:
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
