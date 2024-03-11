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
	movq $43, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $main_0_1, %rsi
	call _my_strcpy
	movq %rax, %rdi
	call print
	subq $8, %rsp
	movq %rax, -112(%rbp)
	movq $4, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	movq %rax, -128(%rbp)
	movq $0, %rax
	movq -128(%rbp), %rdi
	movq -120(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -136(%rbp)
	movq $1, %rax
	movq -136(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $11, 8(%rax)
	movq %rax, -144(%rbp)
	movq $2, %rax
	movq -144(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $42, 8(%rax)
	movq %rax, -152(%rbp)
	movq $3, %rax
	movq -152(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	cmpq $4, (%rsi)
	jne _Error_gestion
	movq %rdx, -32(%rbp)
	movq %rcx, -40(%rbp)
	movq %r8, -48(%rbp)
	movq %r9, -56(%rbp)
	movq %r10, -64(%rbp)
	movq %r11, -72(%rbp)
	movq %rbx, -80(%rbp)
	movq %r12, -88(%rbp)
	movq %r13, -96(%rbp)
	movq %r14, -104(%rbp)
	movq %r15, -112(%rbp)
	xorq %rdi, %rdi
main_0_2:
	cmpq %rdi, 8(%rsi)
	je main_0_3
	movq -8(%rbp), %r14
	movq 16(%rsi,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rsi, -120(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je main_0_10
	cmpq $3, (%r14)
	je main_0_11
	cmpq $4, (%r14)
	je main_0_12
	cmpq $1, (%r14)
	je main_0_13
	movq -160(%rbp), %r15
	movq %r14, %r15
	jmp main_0_14
main_0_10:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_14
main_0_13:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_14
main_0_11:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	subq $16, %r8
	jmp main_0_14
main_0_12:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je main_0_16
main_0_15:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je main_0_16
	jmp main_0_15
main_0_16:
	movq %rax, %r8
main_0_14:
	movq %r15, -160(%rbp)
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call fib_5
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rdi
	call print
	popq %rdi
	incq %rdi
	jmp main_0_2
main_0_3:
	movq -16(%rbp), %rdi
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq -24(%rbp), %rsi
	movq -80(%rbp), %rbx
	movq -32(%rbp), %rdx
	movq -88(%rbp), %r12
	movq -96(%rbp), %r13
	movq -64(%rbp), %r10
	movq -72(%rbp), %r11
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
	movq %rbp, %rsp
	popq %rbp
	ret
fibaux_4:
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
	movq %rsi, -16(%rbp)
	movq %rax, -104(%rbp)
	movq %rdx, -24(%rbp)
	movq -24(%rbp), %rdx
	cmpq $2, (%rdx)
	je fibaux_4_4
	cmpq $3, (%rdx)
	je fibaux_4_5
	cmpq $4, (%rdx)
	je fibaux_4_6
	cmpq $1, (%rdx)
	je fibaux_4_7
	movq %r14, -96(%rbp)
	movq -112(%rbp), %r14
	movq %rdx, %r14
	jmp fibaux_4_8
fibaux_4_4:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp fibaux_4_8
fibaux_4_7:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp fibaux_4_8
fibaux_4_5:
	movq 8(%rdx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rdx), %rsi
	leaq 16(%rax), %rdi
	movq %r15, -104(%rbp)
	movq %rax, %r15
	call _my_strcpy
	subq $16, %r15
	jmp fibaux_4_8
fibaux_4_6:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je fibaux_4_10
fibaux_4_9:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je fibaux_4_10
	jmp fibaux_4_9
fibaux_4_10:
	movq %rax, %r15
fibaux_4_8:
	movq %r14, -112(%rbp)
	movq -104(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r15)
	je _Error_gestion
	movq %rdi, -104(%rbp)
	movq %r15, %rdi
	movq -104(%rbp), %r14
	movq %r14, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r15)
	cmpq $0, %rax
	jne fibaux_4_11
	movq $1, 8(%r15)
	jmp fibaux_4_12
fibaux_4_11:
	movq $0, 8(%r15)
fibaux_4_12:
	cmpq $0, 8(%r15)
	je fibaux_4_0
	subq $8, %rsp
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fibaux_4_14
	cmpq $3, (%r14)
	je fibaux_4_15
	cmpq $4, (%r14)
	je fibaux_4_16
	cmpq $1, (%r14)
	je fibaux_4_17
	movq %r8, -40(%rbp)
	movq -120(%rbp), %r8
	movq %r14, %r8
	jmp fibaux_4_18
fibaux_4_14:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fibaux_4_18
fibaux_4_17:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fibaux_4_18
fibaux_4_15:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r9, -48(%rbp)
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp fibaux_4_18
fibaux_4_16:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je fibaux_4_20
fibaux_4_19:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je fibaux_4_20
	jmp fibaux_4_19
fibaux_4_20:
	movq %rax, %r9
fibaux_4_18:
	movq %r8, -120(%rbp)
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp fibaux_4_1
fibaux_4_0:
	subq $8, %rsp
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je fibaux_4_22
	cmpq $3, (%r8)
	je fibaux_4_23
	cmpq $4, (%r8)
	je fibaux_4_24
	cmpq $1, (%r8)
	je fibaux_4_25
	movq %rcx, -32(%rbp)
	movq -128(%rbp), %rcx
	movq %r8, %rcx
	jmp fibaux_4_26
fibaux_4_22:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fibaux_4_26
fibaux_4_25:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fibaux_4_26
fibaux_4_23:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rbx, -72(%rbp)
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp fibaux_4_26
fibaux_4_24:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je fibaux_4_28
fibaux_4_27:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je fibaux_4_28
	jmp fibaux_4_27
fibaux_4_28:
	movq %rax, %rbx
fibaux_4_26:
	movq %rcx, -128(%rbp)
	subq $8, %rsp
	movq %r8, -16(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je fibaux_4_30
	cmpq $3, (%r8)
	je fibaux_4_31
	cmpq $4, (%r8)
	je fibaux_4_32
	cmpq $1, (%r8)
	je fibaux_4_33
	movq -136(%rbp), %rcx
	movq %r8, %rcx
	jmp fibaux_4_34
fibaux_4_30:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fibaux_4_34
fibaux_4_33:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fibaux_4_34
fibaux_4_31:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %r12, -80(%rbp)
	movq %rax, %r12
	call _my_strcpy
	subq $16, %r12
	jmp fibaux_4_34
fibaux_4_32:
	movq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r12)
	je fibaux_4_36
fibaux_4_35:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r12)
	je fibaux_4_36
	jmp fibaux_4_35
fibaux_4_36:
	movq %rax, %r12
fibaux_4_34:
	movq %rcx, -136(%rbp)
	subq $8, %rsp
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fibaux_4_38
	cmpq $3, (%r14)
	je fibaux_4_39
	cmpq $4, (%r14)
	je fibaux_4_40
	cmpq $1, (%r14)
	je fibaux_4_41
	movq -144(%rbp), %rcx
	movq %r14, %rcx
	jmp fibaux_4_42
fibaux_4_38:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fibaux_4_42
fibaux_4_41:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fibaux_4_42
fibaux_4_39:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r13, -88(%rbp)
	movq %rax, %r13
	call _my_strcpy
	subq $16, %r13
	jmp fibaux_4_42
fibaux_4_40:
	movq 8(%r13), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r13)
	je fibaux_4_44
fibaux_4_43:
	movq 16(%r13,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r13)
	je fibaux_4_44
	jmp fibaux_4_43
fibaux_4_44:
	movq %rax, %r13
fibaux_4_42:
	movq %rcx, -144(%rbp)
	cmpq $0, (%r12)
	je _Error_gestion
	cmpq $0, (%r13)
	je _Error_gestion
	cmpq $2, (%r12)
	je fibaux_4_45
	cmpq $3, (%r12)
	je fibaux_4_46
	cmpq $4, (%r12)
	je fibaux_4_47
	jmp _Error_gestion
fibaux_4_45:
	cmpq $2, (%r13)
	je fibaux_4_48
	jmp _Error_gestion
fibaux_4_48:
	movq 8(%r12), %r12
	addq %r12, 8(%r13)
	jmp fibaux_4_51
fibaux_4_46:
	cmpq $3, (%r13)
	je fibaux_4_49
	jmp _Error_gestion
fibaux_4_49:
	movq 8(%r12), %rsi
	addq 8(%r13), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r12), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r12
	call _my_strcpy
	leaq 16(%r13), %rsi
	leaq 16(%r12), %rdi
	call _my_strcat
	subq $16, %r12
	jmp fibaux_4_51
fibaux_4_47:
	cmpq $4, (%r12)
	je fibaux_4_50
	jmp _Error_gestion
fibaux_4_50:
	movq -136(%rbp), %rcx
	movq 8(%rcx), %rsi
	addq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je fibaux_4_54
	xorq %rdi, %rdi
fibaux_4_52:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl fibaux_4_52
fibaux_4_54:
	cmpq $0, 8(%rcx)
	je fibaux_4_55
	xorq %rdi, %rdi
fibaux_4_53:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl fibaux_4_53
fibaux_4_55:
	jmp fibaux_4_51
fibaux_4_51:
	movq -136(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%rcx)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq %rdx, -24(%rbp)
	movq -24(%rbp), %rdx
	cmpq $2, (%rdx)
	je fibaux_4_58
	cmpq $3, (%rdx)
	je fibaux_4_59
	cmpq $4, (%rdx)
	je fibaux_4_60
	cmpq $1, (%rdx)
	je fibaux_4_61
	movq -160(%rbp), %r12
	movq %rdx, %r12
	jmp fibaux_4_62
fibaux_4_58:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp fibaux_4_62
fibaux_4_61:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp fibaux_4_62
fibaux_4_59:
	movq 8(%rdx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rdx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r13
	call _my_strcpy
	subq $16, %r13
	jmp fibaux_4_62
fibaux_4_60:
	movq 8(%r13), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r13)
	je fibaux_4_64
fibaux_4_63:
	movq 16(%r13,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r13)
	je fibaux_4_64
	jmp fibaux_4_63
fibaux_4_64:
	movq %rax, %r13
fibaux_4_62:
	movq %r12, -160(%rbp)
	movq -152(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r13)
	je _Error_gestion
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r13)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%r13)
	subq $8, %rsp
	movq %rbx, %rax
	movq %rcx, %rdi
	movq %r13, %rsi
	pushq -8(%rbp)
	call fibaux_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
	movq -80(%rbp), %r12
	movq -88(%rbp), %r13
	movq %rbp, %rsp
	popq %rbp
	ret
fibaux_4_1:
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
	movq -80(%rbp), %r12
	movq -88(%rbp), %r13
	movq %rbp, %rsp
	popq %rbp
	ret
fib_5:
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
	movq %rax, -104(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -112(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fib_5_3
	cmpq $3, (%r14)
	je fib_5_4
	cmpq $4, (%r14)
	je fib_5_5
	cmpq $1, (%r14)
	je fib_5_6
	movq %r15, -104(%rbp)
	movq -120(%rbp), %r15
	movq %r14, %r15
	jmp fib_5_7
fib_5_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fib_5_7
fib_5_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fib_5_7
fib_5_4:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r8, -40(%rbp)
	movq %rax, %r8
	call _my_strcpy
	subq $16, %r8
	jmp fib_5_7
fib_5_5:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je fib_5_9
fib_5_8:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je fib_5_9
	jmp fib_5_8
fib_5_9:
	movq %rax, %r8
fib_5_7:
	movq %r15, -120(%rbp)
	subq $8, %rsp
	movq -104(%rbp), %rdi
	movq %rdi, %rax
	movq -112(%rbp), %r15
	movq %rdi, -104(%rbp)
	movq %r15, %rdi
	movq %r8, %rsi
	pushq -8(%rbp)
	call fibaux_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
print:
	pushq %rbp
	movq %rsp, %rbp
	pushq %rax
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
	xorq %rax, %rax
	cmpq $0, (%rdi)
	je _implement_context_6_4
	cmpq $1, (%rdi)
	je _implement_context_6_1
	cmpq $2, (%rdi)
	je _implement_context_6_0
	cmpq $3, (%rdi)
	je _implement_context_6_2
	cmpq $4, (%rdi)
	je _implement_context_6_3
	jmp _Error_gestion
_implement_context_6_1:
	cmpq $0, 8(%rdi)
	je _implement_context_6_6
	movq $_True, %rdi
	call printf
	jmp _implement_context_6_7
_implement_context_6_6:
	movq $_False, %rdi
	call printf
_implement_context_6_7:
	jmp _implement_context_6_5
_implement_context_6_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_6_5
_implement_context_6_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_6_5
_implement_context_6_3:
	movq 8(%rdi), %rsi
	movq $_list_format, %rdi
	call printf
	jmp _implement_context_6_5
_implement_context_6_4:
	movq $_None_format, %rdi
	call printf
_implement_context_6_5:
	movq %rbx, %rsp
	popq %rbx
	popq %r11
	popq %r10
	popq %r9
	popq %r8
	popq %rcx
	popq %rdx
	popq %rsi
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
	je _implement_context_6_8
	cmpq $3, (%rdi)
	jl _implement_context_6_14
	jg _implement_context_6_15
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_6_10
_implement_context_6_14:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_6_9
_implement_context_6_15:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_6_17:
	cmpq %rax, 8(%rdi)
	je _implement_context_6_16
	cmpq %rax, 8(%rsi)
	je _implement_context_6_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_6_11
	jg _implement_context_6_13
	popq %rax
	incq %rax
	jmp _implement_context_6_17
_implement_context_6_16:
	cmpq %rax, 8(%rsi)
	je _implement_context_6_12
	jmp _implement_context_6_11
_implement_context_6_8:
	cmpq $3, (%rdi)
	jl _implement_context_6_18
	jg _implement_context_6_19
	cmpq $3, (%rsi)
	jne _implement_context_6_11
	jmp _implement_context_6_10
_implement_context_6_18:
	cmpq $2, (%rsi)
	jg _implement_context_6_11
	jmp _implement_context_6_9
_implement_context_6_19:
	cmpq $4, (%rsi)
	jne _implement_context_6_11
	xorq %rax, %rax
_implement_context_6_21:
	cmpq %rax, 8(%rdi)
	je _implement_context_6_20
	cmpq %rax, 8(%rsi)
	je _implement_context_6_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_6_11
	jg _implement_context_6_13
	popq %rax
	incq %rax
	jmp _implement_context_6_21
_implement_context_6_20:
	cmpq %rax, 8(%rsi)
	je _implement_context_6_12
	jmp _implement_context_6_11
_implement_context_6_9:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_6_12
	jg _implement_context_6_13
	jmp _implement_context_6_11
_implement_context_6_10:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_12:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_11:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_13:
	movq $1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_Error_gestion:
	movq -8(%rbp), %rbp
	movq %rbp, %rsp
	xorq %rax, %rax
	movq _Error_message, %rdi
	andq $-16, %rsp
	call printf
	movq $1, %rdi
	movq $60, %rax
	syscall
	.data
main_0_1:
	.string "quelques valeurs de la suite de Fibonacci :"
_True:
	.string "True"
_False:
	.string "False"
_int_format:
	.string "%d"
_list_format:
	.string "["
_list_format_end:
	.string "]"
_list_format_sep:
	.string ","
_None_format:
	.string "None"
_Error_message:
	.string "error : detected error while excecuting code"
_None:
	.quad 0
	.quad 0
