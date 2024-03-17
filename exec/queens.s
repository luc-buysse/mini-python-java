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
	movq %rax, -120(%rbp)
	movq %r14, -104(%rbp)
	movq -120(%rbp), %r14
	movq %r14, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -128(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %r14, -120(%rbp)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq -120(%rbp), %r14
	movq %r14, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -136(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	movq %r14, -120(%rbp)
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rsi, -24(%rbp)
	movq %rax, -120(%rbp)
	movq -120(%rbp), %r14
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_7
main_0_6:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_7
	jmp main_0_6
main_0_7:
	xorq %rdi, %rdi
main_0_0:
	cmpq %rdi, 8(%rax)
	je main_0_1
	movq -8(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	pushq %rdi
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq %rsi, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call q_7
	addq $8, %rsp
	subq $8, %rsp
	movq %rsi, -8(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	popq %rdi
	incq %rdi
	jmp main_0_0
	jmp skip_main_10
main_0_1:
	subq $16, %rsp
	movq %rax, %rax
skip_main_10:
	andq $-16, %rsp
	xorq %rdi, %rdi
	call fflush
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
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
	movq %rax, -112(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	movq %r14, %rdi
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -128(%rbp), %r15
	movq %rax, %r15
	movq $1, (%r15)
	cmpl $0, %eax
	jl abs_4_5
	movq $0, 8(%r15)
	jmp abs_4_6
abs_4_5:
	movq $1, 8(%r15)
abs_4_6:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r15), %rdi
	movq %rdi, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je abs_4_0
	cmpq $2, (%r14)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -144(%rbp), %rsi
	movq %rax, %rsi
	movq $2, (%rsi)
	movq 8(%r14), %rdi
	negq %rdi
	movq %rdi, 8(%rsi)
	movq %rsi, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_abs_9
abs_4_0:
	subq $8, %rsp
	movq -144(%rbp), %rax
	movq %r15, %rax
	movq %r14, -8(%rbp)
	movq -96(%rbp), %r14
	movq %r15, -144(%rbp)
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rax, -136(%rbp)
	movq -144(%rbp), %rax
skip_abs_9:
	movq %r8, -40(%rbp)
	movq -136(%rbp), %r8
	cmpq $0, 8(%r8)
	jne abs_4_1
	movq %r9, -48(%rbp)
	movq -8(%rbp), %r9
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq %rcx, -32(%rbp)
	movq -152(%rbp), %rcx
	movq %rax, %rcx
	movq -8(%rbp), %rax
	movq (%rax), %rdi
	movq %rdi, (%rcx)
	movq 8(%rax), %rdi
	movq %rdi, 8(%rcx)
	jmp skip_abs_10
abs_4_1:
	subq $8, %rsp
	movq %rax, %rcx
	movq %r8, -136(%rbp)
	movq -40(%rbp), %r8
	movq %rcx, -32(%rbp)
	movq %rax, %rcx
	movq %rax, -152(%rbp)
	movq -8(%rbp), %rax
skip_abs_10:
	movq %rax, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
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
	movq %rsi, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -120(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq %r14, -104(%rbp)
	movq -128(%rbp), %r14
	movq %r14, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -136(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	movq %r14, -128(%rbp)
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -128(%rbp)
	movq -128(%rbp), %r14
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je check_5_7
check_5_6:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je check_5_7
	jmp check_5_6
check_5_7:
	xorq %rdi, %rdi
check_5_0:
	cmpq %rdi, 8(%rax)
	je check_5_1
	movq -32(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	pushq %rdi
	movq -8(%rbp), %rdi
	cmpq $4, (%rdi)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -32(%rbp)
	movq %rax, -144(%rbp)
	movq %r15, -112(%rbp)
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_12
check_5_11:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_12
	jmp check_5_11
check_5_12:
	movq -32(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	cmpq %rsi, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rsi
	subq $8, %rsp
	movq %r8, -48(%rbp)
	movq -160(%rbp), %r8
	movq 16(%rax,%rsi,8), %r8
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -32(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_17
check_5_16:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_17
	jmp check_5_16
check_5_17:
	movq -16(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	cmpq %rsi, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rsi
	subq $8, %rsp
	movq %r9, -56(%rbp)
	movq -184(%rbp), %r9
	movq 16(%rax,%rsi,8), %r9
	movq %rdi, -16(%rbp)
	movq %r9, %rdi
	movq %r8, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpl $0, %eax
	je check_5_19
	movq $0, 8(%r9)
	jmp check_5_20
check_5_19:
	movq $1, 8(%r9)
check_5_20:
	cmpq $0, 8(%r9)
	jne check_5_21
	subq $8, %rsp
	movq -32(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%r8), %rsi
	subq 8(%rdi), %rsi
	subq $8, %rsp
	movq %rdi, -32(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq %rcx, -40(%rbp)
	movq -200(%rbp), %rcx
	movq %rax, %rcx
	movq $2, (%rcx)
	movq %rsi, 8(%rcx)
	subq $8, %rsp
	movq %rcx, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -208(%rbp)
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	movq %rcx, -200(%rbp)
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -200(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_28
check_5_27:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_28
	jmp check_5_27
check_5_28:
	movq -32(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rcx
	cmpq %rcx, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rcx
	subq $8, %rsp
	movq -232(%rbp), %rsi
	movq 16(%rax,%rcx,8), %rsi
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -32(%rbp)
	movq %rsi, -232(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_33
check_5_32:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_33
	jmp check_5_32
check_5_33:
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%r8), %rdi
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%r8), %rdi
	subq $8, %rsp
	movq -256(%rbp), %rcx
	movq 16(%rax,%rdi,8), %rcx
	movq -232(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%rcx), %rsi
	subq 8(%rdi), %rsi
	movq $2, (%rcx)
	movq %rsi, 8(%rcx)
	subq $8, %rsp
	movq %rcx, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -264(%rbp)
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	movq %rcx, -256(%rbp)
	movq %rax, -256(%rbp)
	movq -256(%rbp), %rcx
	movq %rcx, %rdi
	movq %rbx, -80(%rbp)
	movq -200(%rbp), %rbx
	movq %rbx, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%rcx)
	cmpl $0, %eax
	je check_5_36
	movq $0, 8(%rcx)
	jmp check_5_37
check_5_36:
	movq $1, 8(%rcx)
check_5_37:
	jmp skip_check_38
check_5_21:
	subq $80, %rsp
	movq %r9, %rcx
	movq -16(%rbp), %r8
	movq %r9, -256(%rbp)
	movq %rcx, -40(%rbp)
	movq -256(%rbp), %rcx
	movq %rbx, -80(%rbp)
skip_check_38:
	movq $1, (%rcx)
	cmpq $0, 8(%rcx)
	je check_5_39
	movq $1, 8(%rcx)
	jmp check_5_40
check_5_39:
	movq $0, 8(%rcx)
check_5_40:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%rcx), %rdi
	movq %rdi, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je check_5_8
	movq %rax, -272(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq $0, 8(%rax)
	movq %rcx, -256(%rbp)
	movq %rax, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_check_42
check_5_8:
	subq $0, %rsp
	movq %r14, -128(%rbp)
	movq -104(%rbp), %r14
	movq %r15, -8(%rbp)
	movq -112(%rbp), %r15
	movq %r8, -16(%rbp)
	movq -48(%rbp), %r8
	movq %r9, -184(%rbp)
	movq -56(%rbp), %r9
	movq %rcx, -256(%rbp)
	movq -40(%rbp), %rcx
	movq -80(%rbp), %rbx
	movq %rax, -272(%rbp)
	movq -256(%rbp), %rax
skip_check_42:
	movq -272(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne check_5_9
	jmp skip_check_43
check_5_9:
	subq $0, %rsp
skip_check_43:
	movq %rdi, -272(%rbp)
	popq %rdi
	incq %rdi
	jmp check_5_0
	jmp skip_check_44
check_5_1:
	subq $128, %rsp
	movq %rax, %rax
	movq %r14, -128(%rbp)
	movq -104(%rbp), %r14
skip_check_44:
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq $1, 8(%rax)
	movq %rax, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -80(%rbp), %rbx
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
	movq %r14, -112(%rbp)
	movq -16(%rbp), %r14
	movq %r14, %rdi
	movq %rdx, %rsi
	movq $0, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -136(%rbp), %rsi
	movq %rax, %rsi
	movq $1, (%rsi)
	cmpl $0, %eax
	je count_6_4
	movq $0, 8(%rsi)
	jmp count_6_5
count_6_4:
	movq $1, 8(%rsi)
count_6_5:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%rsi), %rdi
	movq %rdi, (%rax)
	movq 8(%rsi), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je count_6_0
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rsi, -136(%rbp)
	movq %rax, %rax
	movq -112(%rbp), %r14
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_count_7
count_6_0:
	subq $0, %rsp
	movq %r14, -16(%rbp)
	movq -112(%rbp), %r14
	movq %rax, -144(%rbp)
	movq %rsi, %rax
	movq %rsi, -136(%rbp)
skip_count_7:
	movq -144(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne count_6_1
	jmp skip_count_8
count_6_1:
	subq $0, %rsp
skip_count_8:
	movq %rax, -136(%rbp)
	movq %rdi, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, -32(%rbp)
	movq %rdx, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq -160(%rbp), %rsi
	movq %rsi, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -168(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	movq %rsi, -160(%rbp)
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq %r15, -120(%rbp)
	movq -160(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je count_6_16
count_6_15:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je count_6_16
	jmp count_6_15
count_6_16:
	xorq %rdi, %rdi
count_6_9:
	cmpq %rdi, 8(%rax)
	je count_6_10
	movq -40(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	pushq %rdi
	movq -8(%rbp), %rdi
	cmpq $4, (%rdi)
	jne _Error_gestion
	subq $8, %rsp
	movq %r8, -56(%rbp)
	movq -16(%rbp), %r8
	cmpq $2, (%r8)
	jne _Error_gestion
	movq %r9, -64(%rbp)
	movq 8(%r8), %r9
	cmpq %r9, 8(%rdi)
	jge _Error_gestion
	subq $8, %rsp
	movq 8(%r8), %r9
	movq %rsi, 16(%rdi,%r9,8)
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rax, -176(%rbp)
	movq -8(%rbp), %r9
	movq %r9, %rdi
	call _my_copy
	subq $8, %rsp
	movq %rax, -200(%rbp)
	movq %r8, %rdi
	call _my_copy
	subq $8, %rsp
	movq %rax, -208(%rbp)
	movq %rdx, %rdi
	call _my_copy
	movq -200(%rbp), %rdi
	movq %rdi, %rdi
	movq %rdi, -200(%rbp)
	movq %rcx, -48(%rbp)
	movq -208(%rbp), %rcx
	movq %rsi, -40(%rbp)
	movq %rcx, %rsi
	movq %rcx, -208(%rbp)
	movq %rdx, -24(%rbp)
	movq %rax, %rdx
	movq %rax, -216(%rbp)
	pushq -8(%rbp)
	call check_5
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -224(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -224(%rbp), %rcx
	movq (%rcx), %rdi
	movq %rdi, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je count_6_19
	subq $8, %rsp
	movq %rax, -232(%rbp)
	movq %r9, %rdi
	call _my_copy
	subq $8, %rsp
	movq %rax, -240(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -248(%rbp)
	movq -248(%rbp), %rdx
	movq %rbx, -88(%rbp)
	cmpq $2, (%rdx)
	je count_6_29
	cmpq $3, (%rdx)
	je count_6_30
	cmpq $4, (%rdx)
	je count_6_31
	jmp _Error_gestion
count_6_29:
	cmpq $2, (%r8)
	je count_6_32
	jmp _Error_gestion
count_6_32:
	movq 8(%r8), %rbx
	addq 8(%rdx), %rbx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rbx, 8(%rax)
	movq %rax, %rbx
	jmp count_6_35
count_6_30:
	cmpq $3, (%r8)
	je count_6_33
	jmp _Error_gestion
count_6_33:
	movq 8(%rdx), %rsi
	addq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	leaq 16(%rdx), %rsi
	leaq 16(%r8), %rdi
	call _my_strcat
	movq %r8, %rbx
	jmp count_6_35
count_6_31:
	cmpq $4, (%r8)
	je count_6_34
	jmp _Error_gestion
count_6_34:
	movq 8(%rdx), %rsi
	addq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je count_6_38
	xorq %rdi, %rdi
count_6_36:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	jg count_6_36
count_6_38:
	cmpq $0, 8(%rdx)
	je count_6_39
	movq %rdi, %r8
	xorq %rdi, %rdi
count_6_37:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r8,8)
	incq %rdi
	incq %r8
	cmpq %rdi, 8(%rdx)
	jg count_6_37
count_6_39:
	movq %rax, %rbx
	jmp count_6_35
count_6_35:
	subq $8, %rsp
	subq $8, %rsp
	movq %rbx, %rdi
	call _my_copy
	subq $8, %rsp
	movq %rax, -272(%rbp)
	movq -24(%rbp), %rsi
	movq %rsi, %rdi
	call _my_copy
	movq -240(%rbp), %rdi
	movq %rdi, %rdi
	movq %rdi, -240(%rbp)
	movq -272(%rbp), %rdx
	movq %rsi, -24(%rbp)
	movq %rdx, %rsi
	movq %rdx, -272(%rbp)
	movq %rax, %rdx
	movq %rax, -280(%rbp)
	pushq -8(%rbp)
	call count_6
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -288(%rbp)
	movq -32(%rbp), %rdx
	movq %r12, -96(%rbp)
	movq -288(%rbp), %r12
	movq %r13, -104(%rbp)
	cmpq $2, (%r12)
	je count_6_45
	cmpq $3, (%r12)
	je count_6_46
	cmpq $4, (%r12)
	je count_6_47
	jmp _Error_gestion
count_6_45:
	cmpq $2, (%rdx)
	je count_6_48
	jmp _Error_gestion
count_6_48:
	movq 8(%rdx), %r13
	addq 8(%r12), %r13
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r13, 8(%rax)
	movq %rax, %r13
	jmp count_6_51
count_6_46:
	cmpq $3, (%rdx)
	je count_6_49
	jmp _Error_gestion
count_6_49:
	movq 8(%r12), %rsi
	addq 8(%rdx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rdx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rdx
	call _my_strcpy
	leaq 16(%r12), %rsi
	leaq 16(%rdx), %rdi
	call _my_strcat
	movq %rdx, %r13
	jmp count_6_51
count_6_47:
	cmpq $4, (%rdx)
	je count_6_50
	jmp _Error_gestion
count_6_50:
	movq 8(%r12), %rsi
	addq 8(%rdx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rdx)
	je count_6_54
	xorq %rdi, %rdi
count_6_52:
	movq 16(%rdx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rdx)
	jg count_6_52
count_6_54:
	cmpq $0, 8(%r12)
	je count_6_55
	movq %rdi, %rdx
	xorq %rdi, %rdi
count_6_53:
	movq 16(%r12,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdx,8)
	incq %rdi
	incq %rdx
	cmpq %rdi, 8(%r12)
	jg count_6_53
count_6_55:
	movq %rax, %r13
	jmp count_6_51
count_6_51:
	subq $8, %rsp
	movq %rdx, -32(%rbp)
	jmp skip_count_57
count_6_19:
	subq $72, %rsp
	movq -304(%rbp), %rdi
	movq %rcx, %rdi
	movq %rcx, %rdi
	movq %rcx, -304(%rbp)
	movq %rbx, -88(%rbp)
	movq %r13, -104(%rbp)
	movq -32(%rbp), %r13
	movq %rax, -232(%rbp)
	movq %r12, -96(%rbp)
skip_count_57:
	movq -232(%rbp), %rsi
	cmpq $0, 8(%rsi)
	jne count_6_20
	jmp skip_count_58
count_6_20:
	subq $0, %rsp
skip_count_58:
	movq %rdi, -304(%rbp)
	popq %rdi
	incq %rdi
	jmp count_6_9
	jmp skip_count_59
count_6_10:
	subq $128, %rsp
	movq -304(%rbp), %rdi
	movq %rax, %rdi
	movq %rax, %rdi
	movq %rax, -304(%rbp)
	movq %r8, -56(%rbp)
	movq -16(%rbp), %r8
	movq %r9, -64(%rbp)
	movq -8(%rbp), %r9
	movq %rcx, -48(%rbp)
	movq %rbx, -88(%rbp)
	movq %r13, -104(%rbp)
	movq -32(%rbp), %r13
	movq %rdx, -24(%rbp)
	movq %r12, -96(%rbp)
skip_count_59:
	movq %r13, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rdi, -304(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
	movq -96(%rbp), %r12
	movq -104(%rbp), %r13
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
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	movq %r14, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq %r15, -104(%rbp)
	movq -120(%rbp), %r15
	movq %r15, %rdi
	call _my_copy
	movq %rax, %rdi
	movq %rax, -128(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	movq %r15, -120(%rbp)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq -120(%rbp), %r15
	movq %r15, %rdi
	call _my_copy
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	movq %r15, -120(%rbp)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq -120(%rbp), %r15
	movq %r15, %rdi
	call _my_copy
	subq $8, %rsp
	movq %rax, -144(%rbp)
	movq %r14, %rdi
	call _my_copy
	movq -136(%rbp), %rdi
	movq %rdi, %rdi
	movq %rdi, -136(%rbp)
	movq %r8, -40(%rbp)
	movq -144(%rbp), %r8
	movq %rsi, -16(%rbp)
	movq %r8, %rsi
	movq %r8, -144(%rbp)
	movq %rdx, -24(%rbp)
	movq %rax, %rdx
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call count_6
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rax, -160(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq -24(%rbp), %rdx
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
	je _implement_context_20_4
	cmpq $1, (%rdi)
	je _implement_context_20_1
	cmpq $2, (%rdi)
	je _implement_context_20_0
	cmpq $3, (%rdi)
	je _implement_context_20_2
	cmpq $4, (%rdi)
	je _implement_context_20_3
	jmp _Error_gestion
_implement_context_20_1:
	cmpq $0, 8(%rdi)
	je _implement_context_20_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_20_8
_implement_context_20_7:
	movq $_False, %rdi
	call printf
_implement_context_20_8:
	jmp _implement_context_20_5
_implement_context_20_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_20_5
_implement_context_20_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_20_5
_implement_context_20_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_20_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_20_10
_implement_context_20_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_20_9
_implement_context_20_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_20_5
_implement_context_20_4:
	movq $_None_format, %rdi
	call printf
_implement_context_20_5:
	cmpq $0, %r12
	jne _implement_context_20_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_20_6:
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
	je _implement_context_20_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $3, (%rdi)
	jl _implement_context_20_17
	jg _implement_context_20_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_20_13
_implement_context_20_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_20_12
_implement_context_20_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_20_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_20_19
	cmpq %rax, 8(%rsi)
	je _implement_context_20_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_20_14
	jg _implement_context_20_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_20_20
_implement_context_20_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_20_15
	jmp _implement_context_20_14
_implement_context_20_11:
	cmpq $0, (%rdi)
	jne _implement_context_20_21
	cmpq $0, (%rsi)
	je _implement_context_20_15
	jmp _implement_context_20_14
_implement_context_20_21:
	cmpq $0, (%rsi)
	je _implement_context_20_14
	cmpq $3, (%rdi)
	jl _implement_context_20_22
	jg _implement_context_20_23
	cmpq $3, (%rsi)
	jne _implement_context_20_14
	jmp _implement_context_20_13
_implement_context_20_22:
	cmpq $2, (%rsi)
	jg _implement_context_20_14
	jmp _implement_context_20_12
_implement_context_20_23:
	cmpq $4, (%rsi)
	jne _implement_context_20_14
	xorq %rax, %rax
_implement_context_20_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_20_24
	cmpq %rax, 8(%rsi)
	je _implement_context_20_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_20_14
	jg _implement_context_20_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_20_25
_implement_context_20_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_20_15
	jmp _implement_context_20_14
_implement_context_20_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
	je _implement_context_20_15
	jg _implement_context_20_16
	jmp _implement_context_20_14
_implement_context_20_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_20_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_20_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_20_16:
	movq $1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_my_copy:
	pushq %rbp
	movq %rsp, %rbp
	cmpq $3, (%rdi)
	jl _implement_context_20_26
	jg _implement_context_20_27
	pushq %r8
	pushq %rsi
	addq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	movq %r8, %rax
	popq %rsi
	popq %r8
	jmp _implement_context_20_28
_implement_context_20_27:
	pushq %r8
	pushq %rsi
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je _implement_context_20_30
	xorq %rdi, %rdi
_implement_context_20_29:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	jg _implement_context_20_29
_implement_context_20_30:
	popq %rsi
	popq %r8
	jmp _implement_context_20_28
_implement_context_20_26:
	pushq %rsi
	movq %rdi, %rsi
	movq $16, %rdi
	call _my_malloc
	movq (%rsi), %rdi
	movq %rdi, (%rax)
	movq 8(%rsi), %rdi
	movq %rdi, 8(%rax)
	popq %rsi
	jmp _implement_context_20_28
_implement_context_20_28:
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
