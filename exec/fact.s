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
	movq %rsi, -16(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	subq $8, %rsp
	movq %rax, -128(%rbp)
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
	movq %rax, -112(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	movq %r15, -104(%rbp)
	movq -120(%rbp), %r15
	cmpq $2, (%r14)
	je fact_4_5
	cmpq $3, (%r14)
	je fact_4_6
	cmpq $4, (%r14)
	je fact_4_7
	cmpq $1, (%r14)
	je fact_4_8
	cmpq $0, (%r14)
	je fact_4_4
	jmp _Error_gestion
fact_4_4:
	movq %r14, %r15
	jmp fact_4_9
fact_4_5:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp fact_4_9
fact_4_8:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp fact_4_9
fact_4_6:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp fact_4_9
fact_4_7:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_11
fact_4_10:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_11
	jmp fact_4_10
fact_4_11:
	movq %rax, %r15
fact_4_9:
	movq %r15, -120(%rbp)
	movq %r8, -40(%rbp)
	movq -112(%rbp), %r8
	movq %r8, %rdi
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r15)
	cmpq $0, %rax
	jg fact_4_12
	movq $1, 8(%r15)
	jmp fact_4_13
fact_4_12:
	movq $0, 8(%r15)
fact_4_13:
	cmpq $0, 8(%r15)
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
	movq %rax, -128(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	movq -144(%rbp), %r8
	cmpq $2, (%r14)
	je fact_4_18
	cmpq $3, (%r14)
	je fact_4_19
	cmpq $4, (%r14)
	je fact_4_20
	cmpq $1, (%r14)
	je fact_4_21
	cmpq $0, (%r14)
	je fact_4_17
	jmp _Error_gestion
fact_4_17:
	movq %r14, %r8
	jmp fact_4_22
fact_4_18:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fact_4_22
fact_4_21:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fact_4_22
fact_4_19:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp fact_4_22
fact_4_20:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_24
fact_4_23:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_24
	jmp fact_4_23
fact_4_24:
	movq %rax, %r8
fact_4_22:
	movq %r8, -144(%rbp)
	movq -136(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%r8)
	subq $8, %rsp
	movq %r8, %rax
	pushq -8(%rbp)
	call fact_4
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	movq -168(%rbp), %r8
	cmpq $2, (%r14)
	je fact_4_29
	cmpq $3, (%r14)
	je fact_4_30
	cmpq $4, (%r14)
	je fact_4_31
	cmpq $1, (%r14)
	je fact_4_32
	cmpq $0, (%r14)
	je fact_4_28
	jmp _Error_gestion
fact_4_28:
	movq %r14, %r8
	jmp fact_4_33
fact_4_29:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fact_4_33
fact_4_32:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp fact_4_33
fact_4_30:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp fact_4_33
fact_4_31:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_35
fact_4_34:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je fact_4_35
	jmp fact_4_34
fact_4_35:
	movq %rax, %r8
fact_4_33:
	movq %r8, -168(%rbp)
	movq -160(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	movq 8(%r8), %rsi
	imulq %rdi, %rsi
	movq %rsi, 8(%r8)
	movq %r8, %rax
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
factimp_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	subq $8, %rsp
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
	movq %r15, -120(%rbp)
	movq -136(%rbp), %r15
	cmpq $2, (%r14)
	je factimp_5_5
	cmpq $3, (%r14)
	je factimp_5_6
	cmpq $4, (%r14)
	je factimp_5_7
	cmpq $1, (%r14)
	je factimp_5_8
	cmpq $0, (%r14)
	je factimp_5_4
	jmp _Error_gestion
factimp_5_4:
	movq %r14, %r15
	jmp factimp_5_9
factimp_5_5:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_9
factimp_5_8:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_9
factimp_5_6:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp factimp_5_9
factimp_5_7:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_11
factimp_5_10:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_11
	jmp factimp_5_10
factimp_5_11:
	movq %rax, %r15
factimp_5_9:
	movq %r15, -136(%rbp)
	subq $8, %rsp
	movq %r15, %rax
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
	movq %r8, -56(%rbp)
	movq %r9, -64(%rbp)
	movq %r10, -72(%rbp)
	movq %r11, -80(%rbp)
	movq %rbx, -88(%rbp)
	movq %r12, -96(%rbp)
	movq %r13, -104(%rbp)
	movq %r14, -8(%rbp)
	xorq %rdi, %rdi
factimp_5_1:
	cmpq %rdi, 8(%rax)
	je factimp_5_2
	movq -24(%rbp), %r14
	movq 16(%rax,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rax, -168(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -176(%rbp)
	movq %r14, -24(%rbp)
	movq -24(%rbp), %r14
	movq -184(%rbp), %r15
	cmpq $2, (%r14)
	je factimp_5_19
	cmpq $3, (%r14)
	je factimp_5_20
	cmpq $4, (%r14)
	je factimp_5_21
	cmpq $1, (%r14)
	je factimp_5_22
	cmpq $0, (%r14)
	je factimp_5_18
	jmp _Error_gestion
factimp_5_18:
	movq %r14, %r15
	jmp factimp_5_23
factimp_5_19:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_23
factimp_5_22:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp factimp_5_23
factimp_5_20:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp factimp_5_23
factimp_5_21:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_25
factimp_5_24:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_25
	jmp factimp_5_24
factimp_5_25:
	movq %rax, %r15
factimp_5_23:
	movq %r15, -184(%rbp)
	movq -176(%rbp), %r8
	cmpq $2, (%r8)
	je factimp_5_26
	cmpq $3, (%r8)
	je factimp_5_27
	cmpq $4, (%r8)
	je factimp_5_28
	jmp _Error_gestion
factimp_5_26:
	cmpq $2, (%r15)
	je factimp_5_29
	jmp _Error_gestion
factimp_5_29:
	movq 8(%r15), %r15
	addq %r15, 8(%r8)
	jmp factimp_5_32
factimp_5_27:
	cmpq $3, (%r15)
	je factimp_5_30
	jmp _Error_gestion
factimp_5_30:
	movq 8(%r8), %rsi
	addq 8(%r15), %rsi
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
	movq %r15, %r8
	jmp factimp_5_32
factimp_5_28:
	cmpq $4, (%r15)
	je factimp_5_31
	jmp _Error_gestion
factimp_5_31:
	movq 8(%r8), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r15)
	je factimp_5_35
	xorq %rdi, %rdi
factimp_5_33:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	jg factimp_5_33
factimp_5_35:
	cmpq $0, 8(%r8)
	je factimp_5_36
	movq %rdi, %r15
	xorq %rdi, %rdi
factimp_5_34:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r15,8)
	incq %rdi
	incq %r15
	cmpq %rdi, 8(%r8)
	jg factimp_5_34
factimp_5_36:
	movq %rax, %r8
	jmp factimp_5_32
factimp_5_32:
	subq $8, %rsp
	movq -16(%rbp), %r15
	movq -192(%rbp), %r9
	cmpq $2, (%r15)
	je factimp_5_39
	cmpq $3, (%r15)
	je factimp_5_40
	cmpq $4, (%r15)
	je factimp_5_41
	cmpq $1, (%r15)
	je factimp_5_42
	cmpq $0, (%r15)
	je factimp_5_38
	jmp _Error_gestion
factimp_5_38:
	movq %r15, %r9
	jmp factimp_5_43
factimp_5_39:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp factimp_5_43
factimp_5_42:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp factimp_5_43
factimp_5_40:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp factimp_5_43
factimp_5_41:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je factimp_5_45
factimp_5_44:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je factimp_5_45
	jmp factimp_5_44
factimp_5_45:
	movq %rax, %r9
factimp_5_43:
	movq %r9, -192(%rbp)
	cmpq $2, (%r8)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%r8), %r8
	movq 8(%r9), %rdi
	imulq %r8, %rdi
	movq %rdi, 8(%r9)
	movq %r15, -16(%rbp)
	popq %rdi
	incq %rdi
	jmp factimp_5_1
factimp_5_2:
	subq $8, %rsp
	movq %r9, -16(%rbp)
	movq -16(%rbp), %r15
	movq -200(%rbp), %r8
	cmpq $2, (%r15)
	je factimp_5_48
	cmpq $3, (%r15)
	je factimp_5_49
	cmpq $4, (%r15)
	je factimp_5_50
	cmpq $1, (%r15)
	je factimp_5_51
	cmpq $0, (%r15)
	je factimp_5_47
	jmp _Error_gestion
factimp_5_47:
	movq %r15, %r8
	jmp factimp_5_52
factimp_5_48:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp factimp_5_52
factimp_5_51:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp factimp_5_52
factimp_5_49:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp factimp_5_52
factimp_5_50:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je factimp_5_54
factimp_5_53:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je factimp_5_54
	jmp factimp_5_53
factimp_5_54:
	movq %rax, %r8
factimp_5_52:
	movq %r8, -200(%rbp)
	movq %r8, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -32(%rbp), %rsi
	movq -88(%rbp), %rbx
	movq -40(%rbp), %rdx
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
	movq -32(%rbp), %rsi
	movq -88(%rbp), %rbx
	movq -40(%rbp), %rdx
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
	je _implement_context_6_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_6_8
_implement_context_6_7:
	movq $_False, %rdi
	call printf
_implement_context_6_8:
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
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_6_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_6_10
_implement_context_6_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_6_9
_implement_context_6_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_6_5
_implement_context_6_4:
	movq $_None_format, %rdi
	call printf
_implement_context_6_5:
	cmpq $0, %r12
	jne _implement_context_6_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_6_6:
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
	je _implement_context_6_11
	cmpq $3, (%rdi)
	jl _implement_context_6_17
	jg _implement_context_6_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_6_13
_implement_context_6_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_6_12
_implement_context_6_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_6_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_6_19
	cmpq %rax, 8(%rsi)
	je _implement_context_6_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_6_14
	jg _implement_context_6_16
	popq %rax
	incq %rax
	jmp _implement_context_6_20
_implement_context_6_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_6_15
	jmp _implement_context_6_14
_implement_context_6_11:
	cmpq $3, (%rdi)
	jl _implement_context_6_21
	jg _implement_context_6_22
	cmpq $3, (%rsi)
	jne _implement_context_6_14
	jmp _implement_context_6_13
_implement_context_6_21:
	cmpq $2, (%rsi)
	jg _implement_context_6_14
	jmp _implement_context_6_12
_implement_context_6_22:
	cmpq $4, (%rsi)
	jne _implement_context_6_14
	xorq %rax, %rax
_implement_context_6_24:
	cmpq %rax, 8(%rdi)
	je _implement_context_6_23
	cmpq %rax, 8(%rsi)
	je _implement_context_6_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_6_14
	jg _implement_context_6_16
	popq %rax
	incq %rax
	jmp _implement_context_6_24
_implement_context_6_23:
	cmpq %rax, 8(%rsi)
	je _implement_context_6_15
	jmp _implement_context_6_14
_implement_context_6_12:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_6_15
	jg _implement_context_6_16
	jmp _implement_context_6_14
_implement_context_6_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_6_16:
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
