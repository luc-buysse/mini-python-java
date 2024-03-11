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
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call fact_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rdi
	call print
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call factimp_5
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rdi
	call print
	movq -8(%rbp), %rdi
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
	movq %rbp, %rsp
	popq %rbp
	ret
fact_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -104(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fact_4_4
	cmpq $3, (%r14)
	je fact_4_5
	cmpq $4, (%r14)
	je fact_4_6
	cmpq $1, (%r14)
	je fact_4_7
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	movq %r14, %r15
	jmp fact_4_8
fact_4_4:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_8
fact_4_7:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_8
fact_4_5:
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
	jmp fact_4_8
fact_4_6:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je fact_4_10
fact_4_9:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je fact_4_10
	jmp fact_4_9
fact_4_10:
	movq %rax, %r8
fact_4_8:
	movq %r15, -112(%rbp)
	movq -104(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r8)
	je _Error_gestion
	movq %rdi, -104(%rbp)
	movq %r8, %rdi
	movq -104(%rbp), %r15
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jg fact_4_11
	movq $1, 8(%r8)
	jmp fact_4_12
fact_4_11:
	movq $0, 8(%r8)
fact_4_12:
	cmpq $0, 8(%r8)
	je fact_4_0
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp fact_4_1
fact_4_0:
fact_4_1:
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fact_4_16
	cmpq $3, (%r14)
	je fact_4_17
	cmpq $4, (%r14)
	je fact_4_18
	cmpq $1, (%r14)
	je fact_4_19
	movq -136(%rbp), %r15
	movq %r14, %r15
	jmp fact_4_20
fact_4_16:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_20
fact_4_19:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_20
fact_4_17:
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
	jmp fact_4_20
fact_4_18:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je fact_4_22
fact_4_21:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je fact_4_22
	jmp fact_4_21
fact_4_22:
	movq %rax, %r9
fact_4_20:
	movq %r15, -136(%rbp)
	movq -128(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r9)
	je _Error_gestion
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%r9)
	subq $8, %rsp
	movq %r9, %rax
	pushq -8(%rbp)
	call fact_4
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je fact_4_26
	cmpq $3, (%r14)
	je fact_4_27
	cmpq $4, (%r14)
	je fact_4_28
	cmpq $1, (%r14)
	je fact_4_29
	movq -160(%rbp), %r15
	movq %r14, %r15
	jmp fact_4_30
fact_4_26:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_30
fact_4_29:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp fact_4_30
fact_4_27:
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
	jmp fact_4_30
fact_4_28:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je fact_4_32
fact_4_31:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je fact_4_32
	jmp fact_4_31
fact_4_32:
	movq %rax, %r9
fact_4_30:
	movq %r15, -160(%rbp)
	movq -152(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r9)
	je _Error_gestion
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	imulq %rdi, 8(%r9)
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
factimp_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rsi, -32(%rbp)
	movq %rax, -16(%rbp)
	movq %r14, -112(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je factimp_5_3
	cmpq $3, (%r14)
	je factimp_5_4
	cmpq $4, (%r14)
	je factimp_5_5
	cmpq $1, (%r14)
	je factimp_5_6
	movq %r15, -120(%rbp)
	movq -120(%rbp), %r15
	movq %r14, %r15
	jmp factimp_5_7
factimp_5_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp factimp_5_7
factimp_5_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp factimp_5_7
factimp_5_4:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r8, -56(%rbp)
	movq %rax, %r8
	call _my_strcpy
	subq $16, %r8
	jmp factimp_5_7
factimp_5_5:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je factimp_5_9
factimp_5_8:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je factimp_5_9
	jmp factimp_5_8
factimp_5_9:
	movq %rax, %r8
factimp_5_7:
	movq %r15, -120(%rbp)
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
	movq %rdx, -40(%rbp)
	movq %rcx, -48(%rbp)
	movq %r9, -64(%rbp)
	movq %r10, -72(%rbp)
	movq %r11, -80(%rbp)
	movq %rbx, -88(%rbp)
	movq %r12, -96(%rbp)
	movq %r13, -104(%rbp)
	movq %r14, -8(%rbp)
	xorq %rdi, %rdi
factimp_5_0:
	cmpq %rdi, 8(%rax)
	je factimp_5_1
	movq -24(%rbp), %r14
	movq 16(%rax,%rdi,8), %r14
	pushq %rdi
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -16(%rbp)
	movq %r14, -24(%rbp)
	movq -24(%rbp), %r14
	cmpq $2, (%r14)
	je factimp_5_15
	cmpq $3, (%r14)
	je factimp_5_16
	cmpq $4, (%r14)
	je factimp_5_17
	cmpq $1, (%r14)
	je factimp_5_18
	movq -160(%rbp), %r15
	movq %r14, %r15
	jmp factimp_5_19
factimp_5_15:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp factimp_5_19
factimp_5_18:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp factimp_5_19
factimp_5_16:
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
	jmp factimp_5_19
factimp_5_17:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je factimp_5_21
factimp_5_20:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je factimp_5_21
	jmp factimp_5_20
factimp_5_21:
	movq %rax, %r8
factimp_5_19:
	movq %r15, -160(%rbp)
	movq -16(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r8)
	je _Error_gestion
	cmpq $2, (%rdi)
	je factimp_5_22
	cmpq $3, (%rdi)
	je factimp_5_23
	cmpq $4, (%rdi)
	je factimp_5_24
	jmp _Error_gestion
factimp_5_22:
	cmpq $2, (%r8)
	je factimp_5_25
	jmp _Error_gestion
factimp_5_25:
	movq 8(%rdi), %rdi
	addq %rdi, 8(%r8)
	jmp factimp_5_28
factimp_5_23:
	cmpq $3, (%r8)
	je factimp_5_26
	jmp _Error_gestion
factimp_5_26:
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	movq 8(%r15), %rsi
	addq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	leaq 16(%r8), %rsi
	leaq 16(%r15), %rdi
	call _my_strcat
	subq $16, %r15
	jmp factimp_5_28
factimp_5_24:
	cmpq $4, (%r15)
	je factimp_5_27
	jmp _Error_gestion
factimp_5_27:
	movq -16(%rbp), %r8
	movq 8(%r8), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je factimp_5_31
	xorq %rdi, %rdi
factimp_5_29:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl factimp_5_29
factimp_5_31:
	cmpq $0, 8(%r8)
	je factimp_5_32
	xorq %rdi, %rdi
factimp_5_30:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl factimp_5_30
factimp_5_32:
	jmp factimp_5_28
factimp_5_28:
	movq -16(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%rdi), %r15
	subq %r15, 8(%r8)
	subq $8, %rsp
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %r15
	cmpq $2, (%r15)
	je factimp_5_34
	cmpq $3, (%r15)
	je factimp_5_35
	cmpq $4, (%r15)
	je factimp_5_36
	cmpq $1, (%r15)
	je factimp_5_37
	movq -168(%rbp), %r9
	movq %r15, %r9
	jmp factimp_5_38
factimp_5_34:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_38
factimp_5_37:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_38
factimp_5_35:
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
	jmp factimp_5_38
factimp_5_36:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je factimp_5_40
factimp_5_39:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je factimp_5_40
	jmp factimp_5_39
factimp_5_40:
	movq %rax, %rcx
factimp_5_38:
	movq %r9, -168(%rbp)
	cmpq $0, (%r8)
	je _Error_gestion
	cmpq $0, (%rcx)
	je _Error_gestion
	cmpq $2, (%r8)
	jne _Error_gestion
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%r8), %r8
	imulq %r8, 8(%rcx)
	popq %rdi
	incq %rdi
	jmp factimp_5_0
factimp_5_1:
	subq $8, %rsp
	movq %r15, -16(%rbp)
	movq -16(%rbp), %r15
	cmpq $2, (%r15)
	je factimp_5_42
	cmpq $3, (%r15)
	je factimp_5_43
	cmpq $4, (%r15)
	je factimp_5_44
	cmpq $1, (%r15)
	je factimp_5_45
	movq -176(%rbp), %r8
	movq %r15, %r8
	jmp factimp_5_46
factimp_5_42:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_46
factimp_5_45:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_46
factimp_5_43:
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
	jmp factimp_5_46
factimp_5_44:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je factimp_5_48
factimp_5_47:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je factimp_5_48
	jmp factimp_5_47
factimp_5_48:
	movq %rax, %r9
factimp_5_46:
	movq %r8, -176(%rbp)
	movq %r9, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq -32(%rbp), %rsi
	movq -88(%rbp), %rbx
	movq -40(%rbp), %rdx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	movq -72(%rbp), %r10
	movq -80(%rbp), %r11
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq -32(%rbp), %rsi
	movq -88(%rbp), %rbx
	movq -40(%rbp), %rdx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	movq -72(%rbp), %r10
	movq -80(%rbp), %r11
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
