	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq %rdi, -16(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $9, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	subq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	movq %rsi, -24(%rbp)
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
main_0_0:
	cmpq %rdi, 8(%rax)
	je main_0_1
	movq -8(%rbp), %r14
	movq 16(%rax,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je main_0_8
	cmpq $3, (%r14)
	je main_0_9
	cmpq $4, (%r14)
	je main_0_10
	cmpq $1, (%r14)
	je main_0_11
	movq -152(%rbp), %r15
	movq %r14, %r15
	jmp main_0_12
main_0_8:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_12
main_0_11:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_12
main_0_9:
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
	jmp main_0_12
main_0_10:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je main_0_14
main_0_13:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je main_0_14
	jmp main_0_13
main_0_14:
	movq %rax, %r8
main_0_12:
	movq %r15, -152(%rbp)
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call q_7
	addq $8, %rsp
	subq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	popq %rdi
	incq %rdi
	jmp main_0_0
main_0_1:
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
abs_4:
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
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je abs_4_4
	cmpq $3, (%r14)
	je abs_4_5
	cmpq $4, (%r14)
	je abs_4_6
	cmpq $1, (%r14)
	je abs_4_7
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	movq %r14, %r15
	jmp abs_4_8
abs_4_4:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_8
abs_4_7:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_8
abs_4_5:
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
	jmp abs_4_8
abs_4_6:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je abs_4_10
abs_4_9:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je abs_4_10
	jmp abs_4_9
abs_4_10:
	movq %rax, %r8
abs_4_8:
	movq %r15, -112(%rbp)
	movq %r8, %rdi
	movq -104(%rbp), %r15
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jge abs_4_11
	movq $1, 8(%r8)
	jmp abs_4_12
abs_4_11:
	movq $0, 8(%r8)
abs_4_12:
	cmpq $0, 8(%r8)
	je abs_4_0
	subq $8, %rsp
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je abs_4_14
	cmpq $3, (%r14)
	je abs_4_15
	cmpq $4, (%r14)
	je abs_4_16
	cmpq $1, (%r14)
	je abs_4_17
	movq -120(%rbp), %r15
	movq %r14, %r15
	jmp abs_4_18
abs_4_14:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_18
abs_4_17:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_18
abs_4_15:
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
	jmp abs_4_18
abs_4_16:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je abs_4_20
abs_4_19:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je abs_4_20
	jmp abs_4_19
abs_4_20:
	movq %rax, %r9
abs_4_18:
	movq %r15, -120(%rbp)
	cmpq $2, (%r9)
	jne _Error_gestion
	negq 8(%r9)
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp abs_4_1
abs_4_0:
	subq $8, %rsp
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je abs_4_22
	cmpq $3, (%r14)
	je abs_4_23
	cmpq $4, (%r14)
	je abs_4_24
	cmpq $1, (%r14)
	je abs_4_25
	movq -128(%rbp), %r15
	movq %r14, %r15
	jmp abs_4_26
abs_4_22:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_26
abs_4_25:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp abs_4_26
abs_4_23:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rcx, -32(%rbp)
	movq %rax, %rcx
	call _my_strcpy
	subq $16, %rcx
	jmp abs_4_26
abs_4_24:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je abs_4_28
abs_4_27:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je abs_4_28
	jmp abs_4_27
abs_4_28:
	movq %rax, %rcx
abs_4_26:
	movq %r15, -128(%rbp)
	movq %rcx, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
abs_4_1:
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
check_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %r14, -104(%rbp)
	movq -16(%rbp), %r14
	cmpq $2, (%r14)
	je check_5_3
	cmpq $3, (%r14)
	je check_5_4
	cmpq $4, (%r14)
	je check_5_5
	cmpq $1, (%r14)
	je check_5_6
	movq %r15, -112(%rbp)
	movq -112(%rbp), %r15
	movq %r14, %r15
	jmp check_5_7
check_5_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_7
check_5_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_7
check_5_4:
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
	jmp check_5_7
check_5_5:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je check_5_9
check_5_8:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je check_5_9
	jmp check_5_8
check_5_9:
	movq %rax, %r8
check_5_7:
	movq %r15, -112(%rbp)
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	subq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	movq %rdx, -24(%rbp)
	movq %rcx, -40(%rbp)
	movq %r9, -56(%rbp)
	movq %r10, -64(%rbp)
	movq %r11, -72(%rbp)
	movq %rbx, -80(%rbp)
	movq %r12, -88(%rbp)
	movq %r13, -96(%rbp)
	movq %r14, -16(%rbp)
	xorq %rdi, %rdi
check_5_0:
	cmpq %rdi, 8(%rax)
	je check_5_1
	movq -32(%rbp), %r14
	movq 16(%rax,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je check_5_17
	cmpq $3, (%r15)
	je check_5_18
	cmpq $4, (%r15)
	je check_5_19
	cmpq $1, (%r15)
	je check_5_20
	movq -152(%rbp), %r8
	movq %r15, %r8
	jmp check_5_21
check_5_17:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_21
check_5_20:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_21
check_5_18:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp check_5_21
check_5_19:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je check_5_23
check_5_22:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je check_5_23
	jmp check_5_22
check_5_23:
	movq %rax, %r9
check_5_21:
	movq %r8, -152(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq %r14, -32(%rbp)
	movq -32(%rbp), %r14
	cmpq $2, (%r14)
	je check_5_25
	cmpq $3, (%r14)
	je check_5_26
	cmpq $4, (%r14)
	je check_5_27
	cmpq $1, (%r14)
	je check_5_28
	movq -160(%rbp), %r8
	movq %r14, %r8
	jmp check_5_29
check_5_25:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_29
check_5_28:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_29
check_5_26:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	subq $16, %rcx
	jmp check_5_29
check_5_27:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_31
check_5_30:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_31
	jmp check_5_30
check_5_31:
	movq %rax, %rcx
check_5_29:
	movq %r8, -160(%rbp)
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%rcx), %rdi
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	movq 8(%rcx), %rdi
	movq 16(%r9,%rdi,8), %rcx
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je check_5_33
	cmpq $3, (%r15)
	je check_5_34
	cmpq $4, (%r15)
	je check_5_35
	cmpq $1, (%r15)
	je check_5_36
	movq -168(%rbp), %r8
	movq %r15, %r8
	jmp check_5_37
check_5_33:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_37
check_5_36:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_37
check_5_34:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp check_5_37
check_5_35:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je check_5_39
check_5_38:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je check_5_39
	jmp check_5_38
check_5_39:
	movq %rax, %r9
check_5_37:
	movq %r8, -168(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je check_5_41
	cmpq $3, (%r8)
	je check_5_42
	cmpq $4, (%r8)
	je check_5_43
	cmpq $1, (%r8)
	je check_5_44
	movq -176(%rbp), %rbx
	movq %r8, %rbx
	jmp check_5_45
check_5_41:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_45
check_5_44:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_45
check_5_42:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp check_5_45
check_5_43:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je check_5_47
check_5_46:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je check_5_47
	jmp check_5_46
check_5_47:
	movq %rax, %rdx
check_5_45:
	movq %rbx, -176(%rbp)
	cmpq $2, (%rdx)
	jne _Error_gestion
	movq 8(%rdx), %rdi
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	movq 8(%rdx), %rdi
	movq 16(%r9,%rdi,8), %rdx
	movq %rdx, %rdi
	movq %rcx, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%rdx)
	cmpq $0, %rax
	jne check_5_48
	movq $1, 8(%rdx)
	jmp check_5_49
check_5_48:
	movq $0, 8(%rdx)
check_5_49:
	cmpq $0, 8(%rdx)
	jne check_5_50
	movq %r14, -32(%rbp)
	movq -32(%rbp), %r14
	cmpq $2, (%r14)
	je check_5_51
	cmpq $3, (%r14)
	je check_5_52
	cmpq $4, (%r14)
	je check_5_53
	cmpq $1, (%r14)
	je check_5_54
	movq %r14, %rdx
	jmp check_5_55
check_5_51:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_55
check_5_54:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_55
check_5_52:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp check_5_55
check_5_53:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je check_5_57
check_5_56:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je check_5_57
	jmp check_5_56
check_5_57:
	movq %rax, %r9
check_5_55:
	movq %rdx, -176(%rbp)
	subq $8, %rsp
	movq %r8, -16(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je check_5_59
	cmpq $3, (%r8)
	je check_5_60
	cmpq $4, (%r8)
	je check_5_61
	cmpq $1, (%r8)
	je check_5_62
	movq -184(%rbp), %rcx
	movq %r8, %rcx
	jmp check_5_63
check_5_59:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_63
check_5_62:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_63
check_5_60:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp check_5_63
check_5_61:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je check_5_65
check_5_64:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je check_5_65
	jmp check_5_64
check_5_65:
	movq %rax, %rbx
check_5_63:
	movq %rcx, -184(%rbp)
	cmpq $2, (%r9)
	jne _Error_gestion
	cmpq $2, (%rbx)
	jne _Error_gestion
	movq 8(%r9), %r9
	subq %r9, 8(%rbx)
	subq $8, %rsp
	movq %rbx, %rax
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -200(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je check_5_69
	cmpq $3, (%r15)
	je check_5_70
	cmpq $4, (%r15)
	je check_5_71
	cmpq $1, (%r15)
	je check_5_72
	movq -208(%rbp), %r9
	movq %r15, %r9
	jmp check_5_73
check_5_69:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_73
check_5_72:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_73
check_5_70:
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
	jmp check_5_73
check_5_71:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_75
check_5_74:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_75
	jmp check_5_74
check_5_75:
	movq %rax, %rcx
check_5_73:
	movq %r9, -208(%rbp)
	cmpq $4, (%rcx)
	jne _Error_gestion
	subq $8, %rsp
	movq %r14, -32(%rbp)
	movq -32(%rbp), %r14
	cmpq $2, (%r14)
	je check_5_77
	cmpq $3, (%r14)
	je check_5_78
	cmpq $4, (%r14)
	je check_5_79
	cmpq $1, (%r14)
	je check_5_80
	movq -216(%rbp), %r9
	movq %r14, %r9
	jmp check_5_81
check_5_77:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_81
check_5_80:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp check_5_81
check_5_78:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp check_5_81
check_5_79:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je check_5_83
check_5_82:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je check_5_83
	jmp check_5_82
check_5_83:
	movq %rax, %rbx
check_5_81:
	movq %r9, -216(%rbp)
	cmpq $2, (%rbx)
	jne _Error_gestion
	movq 8(%rbx), %rdi
	cmpq %rdi, 8(%rcx)
	jge _Error_gestion
	movq 8(%rbx), %rdi
	movq 16(%rcx,%rdi,8), %rbx
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je check_5_85
	cmpq $3, (%r15)
	je check_5_86
	cmpq $4, (%r15)
	je check_5_87
	cmpq $1, (%r15)
	je check_5_88
	movq -224(%rbp), %r9
	movq %r15, %r9
	jmp check_5_89
check_5_85:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_89
check_5_88:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp check_5_89
check_5_86:
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
	jmp check_5_89
check_5_87:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_91
check_5_90:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je check_5_91
	jmp check_5_90
check_5_91:
	movq %rax, %rcx
check_5_89:
	movq %r9, -224(%rbp)
	cmpq $4, (%rcx)
	jne _Error_gestion
	subq $8, %rsp
	movq %r8, -16(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je check_5_93
	cmpq $3, (%r8)
	je check_5_94
	cmpq $4, (%r8)
	je check_5_95
	cmpq $1, (%r8)
	je check_5_96
	movq -232(%rbp), %r9
	movq %r8, %r9
	jmp check_5_97
check_5_93:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_97
check_5_96:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp check_5_97
check_5_94:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp check_5_97
check_5_95:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je check_5_99
check_5_98:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je check_5_99
	jmp check_5_98
check_5_99:
	movq %rax, %rdx
check_5_97:
	movq %r9, -232(%rbp)
	cmpq $2, (%rdx)
	jne _Error_gestion
	movq 8(%rdx), %rdi
	cmpq %rdi, 8(%rcx)
	jge _Error_gestion
	movq 8(%rdx), %rdi
	movq 16(%rcx,%rdi,8), %rdx
	cmpq $2, (%rbx)
	jne _Error_gestion
	cmpq $2, (%rdx)
	jne _Error_gestion
	movq 8(%rbx), %rbx
	subq %rbx, 8(%rdx)
	subq $8, %rsp
	movq %rdx, %rax
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -248(%rbp)
	movq -248(%rbp), %r9
	movq %r9, %rdi
	movq -200(%rbp), %rcx
	movq %rcx, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpq $0, %rax
	jne check_5_102
	movq $1, 8(%r9)
	jmp check_5_103
check_5_102:
	movq $0, 8(%r9)
check_5_103:
check_5_50:
	cmpq $0, 8(%r9)
	je check_5_14
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq $0, 8(%rax)
	movq %rax, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
	movq -88(%rbp), %r12
	movq -96(%rbp), %r13
	movq -64(%rbp), %r10
	movq -72(%rbp), %r11
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp check_5_15
check_5_14:
check_5_15:
	popq %rdi
	incq %rdi
	jmp check_5_0
check_5_1:
	subq $8, %rsp
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq $1, 8(%rax)
	movq %rax, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
	movq -88(%rbp), %r12
	movq -96(%rbp), %r13
	movq -64(%rbp), %r10
	movq -72(%rbp), %r11
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
	movq -88(%rbp), %r12
	movq -96(%rbp), %r13
	movq -64(%rbp), %r10
	movq -72(%rbp), %r11
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
count_6:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rdx, -24(%rbp)
	movq -24(%rbp), %rdx
	cmpq $2, (%rdx)
	je count_6_3
	cmpq $3, (%rdx)
	je count_6_4
	cmpq $4, (%rdx)
	je count_6_5
	cmpq $1, (%rdx)
	je count_6_6
	movq %r14, -112(%rbp)
	movq -120(%rbp), %r14
	movq %rdx, %r14
	jmp count_6_7
count_6_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp count_6_7
count_6_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%rdx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rdx
	jmp count_6_7
count_6_4:
	movq 8(%rdx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rdx), %rsi
	leaq 16(%rax), %rdi
	movq %r15, -120(%rbp)
	movq %rax, %r15
	call _my_strcpy
	subq $16, %r15
	jmp count_6_7
count_6_5:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je count_6_9
count_6_8:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je count_6_9
	jmp count_6_8
count_6_9:
	movq %rax, %r15
count_6_7:
	movq %r14, -120(%rbp)
	subq $8, %rsp
	movq -16(%rbp), %r14
	cmpq $2, (%r14)
	je count_6_11
	cmpq $3, (%r14)
	je count_6_12
	cmpq $4, (%r14)
	je count_6_13
	cmpq $1, (%r14)
	je count_6_14
	movq %r8, -56(%rbp)
	movq -128(%rbp), %r8
	movq %r14, %r8
	jmp count_6_15
count_6_11:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp count_6_15
count_6_14:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp count_6_15
count_6_12:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r9, -64(%rbp)
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp count_6_15
count_6_13:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je count_6_17
count_6_16:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je count_6_17
	jmp count_6_16
count_6_17:
	movq %rax, %r9
count_6_15:
	movq %r8, -128(%rbp)
	movq %r9, %rdi
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpq $0, %rax
	jne count_6_18
	movq $1, 8(%r9)
	jmp count_6_19
count_6_18:
	movq $0, 8(%r9)
count_6_19:
	cmpq $0, 8(%r9)
	je count_6_0
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp count_6_1
count_6_0:
count_6_1:
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, -32(%rbp)
	movq %rdx, -24(%rbp)
	movq -24(%rbp), %r15
	cmpq $2, (%r15)
	je count_6_24
	cmpq $3, (%r15)
	je count_6_25
	cmpq $4, (%r15)
	je count_6_26
	cmpq $1, (%r15)
	je count_6_27
	movq -144(%rbp), %r8
	movq %r15, %r8
	jmp count_6_28
count_6_24:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_28
count_6_27:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_28
count_6_25:
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
	jmp count_6_28
count_6_26:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je count_6_30
count_6_29:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je count_6_30
	jmp count_6_29
count_6_30:
	movq %rax, %rdx
count_6_28:
	movq %r8, -144(%rbp)
	subq $8, %rsp
	movq %rdx, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	subq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	movq %rcx, -48(%rbp)
	movq %r9, -128(%rbp)
	movq %r10, -72(%rbp)
	movq %r11, -80(%rbp)
	movq %rbx, -88(%rbp)
	movq %r12, -96(%rbp)
	movq %r13, -104(%rbp)
	movq %r14, -16(%rbp)
	movq %r15, -24(%rbp)
	xorq %rdi, %rdi
count_6_21:
	cmpq %rdi, 8(%rax)
	je count_6_22
	movq -40(%rbp), %r14
	movq 16(%rax,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rax, -176(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je count_6_36
	cmpq $3, (%r15)
	je count_6_37
	cmpq $4, (%r15)
	je count_6_38
	cmpq $1, (%r15)
	je count_6_39
	movq -184(%rbp), %r8
	movq %r15, %r8
	jmp count_6_40
count_6_36:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_40
count_6_39:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_40
count_6_37:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp count_6_40
count_6_38:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je count_6_42
count_6_41:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je count_6_42
	jmp count_6_41
count_6_42:
	movq %rax, %r9
count_6_40:
	movq %r8, -184(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je count_6_44
	cmpq $3, (%r8)
	je count_6_45
	cmpq $4, (%r8)
	je count_6_46
	cmpq $1, (%r8)
	je count_6_47
	movq -192(%rbp), %rcx
	movq %r8, %rcx
	jmp count_6_48
count_6_44:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_48
count_6_47:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_48
count_6_45:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp count_6_48
count_6_46:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_50
count_6_49:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_50
	jmp count_6_49
count_6_50:
	movq %rax, %rbx
count_6_48:
	movq %rcx, -192(%rbp)
	cmpq $2, (%rbx)
	jne _Error_gestion
	movq 8(%rbx), %rdi
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	subq $8, %rsp
	movq %r14, -40(%rbp)
	movq -40(%rbp), %r14
	cmpq $2, (%r14)
	je count_6_52
	cmpq $3, (%r14)
	je count_6_53
	cmpq $4, (%r14)
	je count_6_54
	cmpq $1, (%r14)
	je count_6_55
	movq -200(%rbp), %rcx
	movq %r14, %rcx
	jmp count_6_56
count_6_52:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp count_6_56
count_6_55:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp count_6_56
count_6_53:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	subq $16, %rdx
	jmp count_6_56
count_6_54:
	movq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rdx)
	je count_6_58
count_6_57:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	je count_6_58
	jmp count_6_57
count_6_58:
	movq %rax, %rdx
count_6_56:
	movq %rcx, -200(%rbp)
	movq 8(%rbx), %rdi
	movq %rdx, 16(%r9,%rdi,8)
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je count_6_62
	cmpq $3, (%r15)
	je count_6_63
	cmpq $4, (%r15)
	je count_6_64
	cmpq $1, (%r15)
	je count_6_65
	movq -208(%rbp), %r9
	movq %r15, %r9
	jmp count_6_66
count_6_62:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_66
count_6_65:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_66
count_6_63:
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
	jmp count_6_66
count_6_64:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je count_6_68
count_6_67:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je count_6_68
	jmp count_6_67
count_6_68:
	movq %rax, %rcx
count_6_66:
	movq %r9, -208(%rbp)
	subq $8, %rsp
	movq %r8, -16(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je count_6_70
	cmpq $3, (%r8)
	je count_6_71
	cmpq $4, (%r8)
	je count_6_72
	cmpq $1, (%r8)
	je count_6_73
	movq -216(%rbp), %r9
	movq %r8, %r9
	jmp count_6_74
count_6_70:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_74
count_6_73:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_74
count_6_71:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp count_6_74
count_6_72:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_76
count_6_75:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_76
	jmp count_6_75
count_6_76:
	movq %rax, %rbx
count_6_74:
	movq %r9, -216(%rbp)
	subq $8, %rsp
	movq -24(%rbp), %r9
	cmpq $2, (%r9)
	je count_6_78
	cmpq $3, (%r9)
	je count_6_79
	cmpq $4, (%r9)
	je count_6_80
	cmpq $1, (%r9)
	je count_6_81
	movq -224(%rbp), %r12
	movq %r9, %r12
	jmp count_6_82
count_6_78:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r9), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp count_6_82
count_6_81:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r9), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp count_6_82
count_6_79:
	movq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r13
	call _my_strcpy
	subq $16, %r13
	jmp count_6_82
count_6_80:
	movq 8(%r13), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r13)
	je count_6_84
count_6_83:
	movq 16(%r13,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r13)
	je count_6_84
	jmp count_6_83
count_6_84:
	movq %rax, %r13
count_6_82:
	movq %r12, -224(%rbp)
	subq $8, %rsp
	movq %rcx, %rax
	movq %rbx, %rdi
	movq %r13, %rsi
	pushq -8(%rbp)
	call check_5
	addq $8, %rsp
	subq $8, %rsp
	cmpq $0, 8(%rax)
	je count_6_59
	movq %rax, -240(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je count_6_87
	cmpq $3, (%r15)
	je count_6_88
	cmpq $4, (%r15)
	je count_6_89
	cmpq $1, (%r15)
	je count_6_90
	movq -32(%rbp), %rcx
	movq %r15, %rcx
	jmp count_6_91
count_6_87:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_91
count_6_90:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp count_6_91
count_6_88:
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
	jmp count_6_91
count_6_89:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_93
count_6_92:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je count_6_93
	jmp count_6_92
count_6_93:
	movq %rax, %rbx
count_6_91:
	movq %rcx, -32(%rbp)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -248(%rbp)
	movq %r8, -16(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	je count_6_96
	cmpq $3, (%r8)
	je count_6_97
	cmpq $4, (%r8)
	je count_6_98
	cmpq $1, (%r8)
	je count_6_99
	movq -256(%rbp), %rcx
	movq %r8, %rcx
	jmp count_6_100
count_6_96:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_100
count_6_99:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp count_6_100
count_6_97:
	movq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r12
	call _my_strcpy
	subq $16, %r12
	jmp count_6_100
count_6_98:
	movq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r12)
	je count_6_102
count_6_101:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r12)
	je count_6_102
	jmp count_6_101
count_6_102:
	movq %rax, %r12
count_6_100:
	movq %rcx, -256(%rbp)
	movq -248(%rbp), %rcx
	cmpq $2, (%rcx)
	je count_6_103
	cmpq $3, (%rcx)
	je count_6_104
	cmpq $4, (%rcx)
	je count_6_105
	jmp _Error_gestion
count_6_103:
	cmpq $2, (%r12)
	je count_6_106
	jmp _Error_gestion
count_6_106:
	movq 8(%r12), %r12
	addq %r12, 8(%rcx)
	jmp count_6_109
count_6_104:
	cmpq $3, (%r12)
	je count_6_107
	jmp _Error_gestion
count_6_107:
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
	jmp count_6_109
count_6_105:
	cmpq $4, (%r12)
	je count_6_108
	jmp _Error_gestion
count_6_108:
	movq 8(%rcx), %rsi
	addq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je count_6_112
	xorq %rdi, %rdi
count_6_110:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl count_6_110
count_6_112:
	cmpq $0, 8(%rcx)
	je count_6_113
	xorq %rdi, %rdi
count_6_111:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl count_6_111
count_6_113:
	jmp count_6_109
count_6_109:
	subq $8, %rsp
	movq %r9, -24(%rbp)
	movq -24(%rbp), %r9
	cmpq $2, (%r9)
	je count_6_115
	cmpq $3, (%r9)
	je count_6_116
	cmpq $4, (%r9)
	je count_6_117
	cmpq $1, (%r9)
	je count_6_118
	movq -264(%rbp), %r12
	movq %r9, %r12
	jmp count_6_119
count_6_115:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r9), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp count_6_119
count_6_118:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r9), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp count_6_119
count_6_116:
	movq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r13
	call _my_strcpy
	subq $16, %r13
	jmp count_6_119
count_6_117:
	movq 8(%r13), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r13)
	je count_6_121
count_6_120:
	movq 16(%r13,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r13)
	je count_6_121
	jmp count_6_120
count_6_121:
	movq %rax, %r13
count_6_119:
	movq %r12, -264(%rbp)
	subq $8, %rsp
	movq %rbx, %rax
	movq %rcx, %rdi
	movq %r13, %rsi
	pushq -8(%rbp)
	call count_6
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -280(%rbp)
	movq %rbx, -32(%rbp)
	movq -32(%rbp), %rcx
	cmpq $2, (%rcx)
	je count_6_125
	cmpq $3, (%rcx)
	je count_6_126
	cmpq $4, (%rcx)
	je count_6_127
	cmpq $1, (%rcx)
	je count_6_128
	movq -288(%rbp), %rbx
	movq %rcx, %rbx
	jmp count_6_129
count_6_125:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp count_6_129
count_6_128:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp count_6_129
count_6_126:
	movq 8(%rcx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rcx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r12
	call _my_strcpy
	subq $16, %r12
	jmp count_6_129
count_6_127:
	movq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r12)
	je count_6_131
count_6_130:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r12)
	je count_6_131
	jmp count_6_130
count_6_131:
	movq %rax, %r12
count_6_129:
	movq %rbx, -288(%rbp)
	movq -280(%rbp), %rbx
	cmpq $2, (%rbx)
	je count_6_132
	cmpq $3, (%rbx)
	je count_6_133
	cmpq $4, (%rbx)
	je count_6_134
	jmp _Error_gestion
count_6_132:
	cmpq $2, (%r12)
	je count_6_135
	jmp _Error_gestion
count_6_135:
	movq 8(%r12), %r12
	addq %r12, 8(%rbx)
	jmp count_6_138
count_6_133:
	cmpq $3, (%r12)
	je count_6_136
	jmp _Error_gestion
count_6_136:
	movq 8(%rbx), %rsi
	addq 8(%r12), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r12), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r12
	call _my_strcpy
	leaq 16(%rbx), %rsi
	leaq 16(%r12), %rdi
	call _my_strcat
	movq %r12, %rbx
	jmp count_6_138
count_6_134:
	cmpq $4, (%r12)
	je count_6_137
	jmp _Error_gestion
count_6_137:
	movq 8(%rbx), %rsi
	addq 8(%r12), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rbx)
	je count_6_141
	xorq %rdi, %rdi
count_6_139:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl count_6_139
count_6_141:
	cmpq $0, 8(%rbx)
	je count_6_142
	xorq %rdi, %rdi
count_6_140:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl count_6_140
count_6_142:
	jmp count_6_138
count_6_138:
	jmp count_6_60
count_6_59:
count_6_60:
	popq %rdi
	incq %rdi
	jmp count_6_21
count_6_22:
	subq $8, %rsp
	movq %rcx, -32(%rbp)
	movq -32(%rbp), %rcx
	cmpq $2, (%rcx)
	je count_6_144
	cmpq $3, (%rcx)
	je count_6_145
	cmpq $4, (%rcx)
	je count_6_146
	cmpq $1, (%rcx)
	je count_6_147
	movq -296(%rbp), %r12
	movq %rcx, %r12
	jmp count_6_148
count_6_144:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp count_6_148
count_6_147:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %rcx
	jmp count_6_148
count_6_145:
	movq 8(%rcx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rcx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r13
	call _my_strcpy
	subq $16, %r13
	jmp count_6_148
count_6_146:
	movq 8(%r13), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r13)
	je count_6_150
count_6_149:
	movq 16(%r13,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r13)
	je count_6_150
	jmp count_6_149
count_6_150:
	movq %rax, %r13
count_6_148:
	movq %r12, -296(%rbp)
	movq %r13, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	movq -72(%rbp), %r10
	movq -80(%rbp), %r11
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	movq -72(%rbp), %r10
	movq -80(%rbp), %r11
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
q_7:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je q_7_1
	cmpq $3, (%r14)
	je q_7_2
	cmpq $4, (%r14)
	je q_7_3
	cmpq $1, (%r14)
	je q_7_4
	movq %r15, -104(%rbp)
	movq -104(%rbp), %r15
	movq %r14, %r15
	jmp q_7_5
q_7_1:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp q_7_5
q_7_4:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp q_7_5
q_7_2:
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
	jmp q_7_5
q_7_3:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je q_7_7
q_7_6:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je q_7_7
	jmp q_7_6
q_7_7:
	movq %rax, %r8
q_7_5:
	movq %r15, -104(%rbp)
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je q_7_14
	cmpq $3, (%r14)
	je q_7_15
	cmpq $4, (%r14)
	je q_7_16
	cmpq $1, (%r14)
	je q_7_17
	movq -152(%rbp), %r15
	movq %r14, %r15
	jmp q_7_18
q_7_14:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp q_7_18
q_7_17:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp q_7_18
q_7_15:
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
	jmp q_7_18
q_7_16:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je q_7_20
q_7_19:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je q_7_20
	jmp q_7_19
q_7_20:
	movq %rax, %r8
q_7_18:
	movq %r15, -152(%rbp)
	subq $8, %rsp
	movq -136(%rbp), %rdi
	movq %rdi, %rax
	movq -144(%rbp), %r15
	movq %rdi, -136(%rbp)
	movq %r15, %rdi
	movq %r8, %rsi
	pushq -8(%rbp)
	call count_6
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
	je _implement_context_8_4
	cmpq $1, (%rdi)
	je _implement_context_8_1
	cmpq $2, (%rdi)
	je _implement_context_8_0
	cmpq $3, (%rdi)
	je _implement_context_8_2
	cmpq $4, (%rdi)
	je _implement_context_8_3
	jmp _Error_gestion
_implement_context_8_1:
	cmpq $0, 8(%rdi)
	je _implement_context_8_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_8_8
_implement_context_8_7:
	movq $_False, %rdi
	call printf
_implement_context_8_8:
	jmp _implement_context_8_5
_implement_context_8_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_8_5
_implement_context_8_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_8_5
_implement_context_8_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_8_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_8_10
_implement_context_8_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_8_9
_implement_context_8_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_8_5
_implement_context_8_4:
	movq $_None_format, %rdi
	call printf
_implement_context_8_5:
	cmpq $0, %r12
	jne _implement_context_8_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_8_6:
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
	je _implement_context_8_11
	cmpq $3, (%rdi)
	jl _implement_context_8_17
	jg _implement_context_8_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_8_13
_implement_context_8_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_8_12
_implement_context_8_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_8_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_8_19
	cmpq %rax, 8(%rsi)
	je _implement_context_8_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_8_14
	jg _implement_context_8_16
	popq %rax
	incq %rax
	jmp _implement_context_8_20
_implement_context_8_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_8_15
	jmp _implement_context_8_14
_implement_context_8_11:
	cmpq $3, (%rdi)
	jl _implement_context_8_21
	jg _implement_context_8_22
	cmpq $3, (%rsi)
	jne _implement_context_8_14
	jmp _implement_context_8_13
_implement_context_8_21:
	cmpq $2, (%rsi)
	jg _implement_context_8_14
	jmp _implement_context_8_12
_implement_context_8_22:
	cmpq $4, (%rsi)
	jne _implement_context_8_14
	xorq %rax, %rax
_implement_context_8_24:
	cmpq %rax, 8(%rdi)
	je _implement_context_8_23
	cmpq %rax, 8(%rsi)
	je _implement_context_8_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_8_14
	jg _implement_context_8_16
	popq %rax
	incq %rax
	jmp _implement_context_8_24
_implement_context_8_23:
	cmpq %rax, 8(%rsi)
	je _implement_context_8_15
	jmp _implement_context_8_14
_implement_context_8_12:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_8_15
	jg _implement_context_8_16
	jmp _implement_context_8_14
_implement_context_8_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_8_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_8_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_8_16:
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
