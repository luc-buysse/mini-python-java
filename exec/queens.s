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
	movq %rax, %rax
	movq %rax, -120(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -120(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rsi, -24(%rbp)
	movq %rax, -120(%rbp)
	movq %r14, -104(%rbp)
	movq -120(%rbp), %r14
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_5
main_0_4:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_5
	jmp main_0_4
main_0_5:
	xorq %rdi, %rdi
main_0_0:
	cmpq %rdi, 8(%rax)
	je main_0_1
	movq -8(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	pushq %rdi
	subq $8, %rsp
	movq -136(%rbp), %rdi
	movq %rax, -128(%rbp)
	movq %rdi, %rax
	pushq -8(%rbp)
	call q_7
	addq $8, %rsp
	movq %rsi, -8(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	popq %rdi
	incq %rdi
	jmp main_0_0
	jmp skip_main_7
main_0_1:
	subq $8, %rsp
	movq %rax, %rax
skip_main_7:
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
	movq %r15, %rsi
	movq %r15, -144(%rbp)
	movq -144(%rbp), %rsi
	movq %rax, -136(%rbp)
skip_abs_9:
	movq -136(%rbp), %rax
	cmpq $0, 8(%rax)
	jne abs_4_1
	movq %r14, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq %r8, -40(%rbp)
	movq -152(%rbp), %r8
	movq %rax, %r8
	movq (%r14), %rdi
	movq %rdi, (%r8)
	movq 8(%r14), %rdi
	movq %rdi, 8(%r8)
	jmp skip_abs_10
abs_4_1:
	subq $8, %rsp
	movq %rsi, %r8
	movq %r8, -40(%rbp)
	movq %rsi, %r8
	movq %rsi, -152(%rbp)
	movq %rax, -136(%rbp)
skip_abs_10:
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %r14, -8(%rbp)
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
check_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $112, %rsp
	subq $8, %rsp
	movq -120(%rbp), %rax
	movq %rax, %rax
	movq %rax, -120(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -120(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %rax, -120(%rbp)
	movq %r14, -104(%rbp)
	movq -120(%rbp), %r14
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je check_5_5
check_5_4:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je check_5_5
	jmp check_5_4
check_5_5:
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
	movq %rax, -128(%rbp)
	movq %r15, -112(%rbp)
	movq -8(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_10
check_5_9:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_10
	jmp check_5_9
check_5_10:
	movq -32(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	cmpq %rsi, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rsi
	subq $8, %rsp
	movq %r8, -48(%rbp)
	movq -144(%rbp), %r8
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
	je check_5_15
check_5_14:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_15
	jmp check_5_14
check_5_15:
	movq -16(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rsi
	cmpq %rsi, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rsi
	subq $8, %rsp
	movq %r9, -56(%rbp)
	movq -168(%rbp), %r9
	movq 16(%rax,%rsi,8), %r9
	movq %rdi, -16(%rbp)
	movq %r9, %rdi
	movq %r8, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpl $0, %eax
	je check_5_17
	movq $0, 8(%r9)
	jmp check_5_18
check_5_17:
	movq $1, 8(%r9)
check_5_18:
	cmpq $0, 8(%r9)
	jne check_5_19
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
	movq -184(%rbp), %rcx
	movq %rax, %rcx
	movq $2, (%rcx)
	movq %rsi, 8(%rcx)
	movq %rcx, %rax
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -184(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_25
check_5_24:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_25
	jmp check_5_24
check_5_25:
	movq -32(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%rdi), %rcx
	cmpq %rcx, 8(%rax)
	jle _Error_gestion
	movq 8(%rdi), %rcx
	subq $8, %rsp
	movq -208(%rbp), %rsi
	movq 16(%rax,%rcx,8), %rsi
	subq $8, %rsp
	cmpq $4, (%r15)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -32(%rbp)
	movq %rsi, -208(%rbp)
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je check_5_30
check_5_29:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je check_5_30
	jmp check_5_29
check_5_30:
	cmpq $2, (%r8)
	jne _Error_gestion
	movq 8(%r8), %rdi
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%r8), %rdi
	subq $8, %rsp
	movq -232(%rbp), %rcx
	movq 16(%rax,%rdi,8), %rcx
	movq -208(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%rcx)
	jne _Error_gestion
	movq 8(%rcx), %rsi
	subq 8(%rdi), %rsi
	movq $2, (%rcx)
	movq %rsi, 8(%rcx)
	movq %rcx, %rax
	pushq -8(%rbp)
	call abs_4
	addq $8, %rsp
	movq %rax, -232(%rbp)
	movq -232(%rbp), %rcx
	movq %rcx, %rdi
	movq %rbx, -80(%rbp)
	movq -184(%rbp), %rbx
	movq %rbx, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%rcx)
	cmpl $0, %eax
	je check_5_32
	movq $0, 8(%rcx)
	jmp check_5_33
check_5_32:
	movq $1, 8(%rcx)
check_5_33:
	jmp skip_check_34
check_5_19:
	subq $64, %rsp
	movq %r9, %rcx
	movq -16(%rbp), %r8
	movq %r9, -232(%rbp)
	movq %rcx, -40(%rbp)
	movq -232(%rbp), %rcx
	movq %rbx, -80(%rbp)
skip_check_34:
	movq $1, (%rcx)
	cmpq $0, 8(%rcx)
	je check_5_35
	movq $1, 8(%rcx)
	jmp check_5_36
check_5_35:
	movq $0, 8(%rcx)
check_5_36:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%rcx), %rdi
	movq %rdi, (%rax)
	movq 8(%rcx), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je check_5_6
	movq %rax, -240(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq $0, 8(%rax)
	movq %rcx, -232(%rbp)
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
	jmp skip_check_38
check_5_6:
	subq $0, %rsp
	movq %rax, -240(%rbp)
	movq %rcx, %rax
	movq %rcx, -232(%rbp)
skip_check_38:
	movq -240(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne check_5_7
	jmp skip_check_39
check_5_7:
	subq $0, %rsp
skip_check_39:
	movq %rdi, -240(%rbp)
	popq %rdi
	incq %rdi
	jmp check_5_0
	jmp skip_check_40
check_5_1:
	subq $112, %rsp
	movq %rax, %rax
	movq %r15, -112(%rbp)
	movq -8(%rbp), %r15
	movq %r8, -48(%rbp)
	movq -16(%rbp), %r8
	movq %r9, -56(%rbp)
	movq %rcx, -40(%rbp)
	movq %rbx, -80(%rbp)
skip_check_40:
	movq %rax, -232(%rbp)
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
	movq %rax, -232(%rbp)
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
	movq -152(%rbp), %rdi
	movq %rax, -32(%rbp)
	movq %rdi, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq %r15, -120(%rbp)
	movq -152(%rbp), %r15
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je count_6_14
count_6_13:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je count_6_14
	jmp count_6_13
count_6_14:
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
	cmpq $2, (%r14)
	jne _Error_gestion
	movq %r8, -56(%rbp)
	movq 8(%r14), %r8
	cmpq %r8, 8(%rdi)
	jge _Error_gestion
	subq $8, %rsp
	movq 8(%r14), %r8
	movq %rsi, 16(%rdi,%r8,8)
	subq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq -184(%rbp), %r8
	movq %rax, -160(%rbp)
	movq %r8, %rax
	movq -192(%rbp), %rax
	movq %rdi, -8(%rbp)
	movq %rax, %rdi
	movq -200(%rbp), %rdi
	movq %rsi, -40(%rbp)
	movq %rdi, %rsi
	movq %rax, -192(%rbp)
	pushq -8(%rbp)
	call check_5
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -200(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -200(%rbp), %r8
	movq (%r8), %rdi
	movq %rdi, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je count_6_17
	subq $8, %rsp
	movq %rax, -208(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -216(%rbp)
	movq %r9, -64(%rbp)
	movq -216(%rbp), %r9
	movq %rcx, -48(%rbp)
	cmpq $2, (%r9)
	je count_6_25
	cmpq $3, (%r9)
	je count_6_26
	cmpq $4, (%r9)
	je count_6_27
	jmp _Error_gestion
count_6_25:
	cmpq $2, (%r14)
	je count_6_28
	jmp _Error_gestion
count_6_28:
	movq 8(%r14), %rcx
	addq 8(%r9), %rcx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rcx, 8(%rax)
	movq %rax, %rcx
	jmp count_6_31
count_6_26:
	cmpq $3, (%r14)
	je count_6_29
	jmp _Error_gestion
count_6_29:
	movq 8(%r9), %rsi
	addq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r14
	call _my_strcpy
	leaq 16(%r9), %rsi
	leaq 16(%r14), %rdi
	call _my_strcat
	movq %r14, %rcx
	jmp count_6_31
count_6_27:
	cmpq $4, (%r14)
	je count_6_30
	jmp _Error_gestion
count_6_30:
	movq 8(%r9), %rsi
	addq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je count_6_34
	xorq %rdi, %rdi
count_6_32:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	jg count_6_32
count_6_34:
	cmpq $0, 8(%r9)
	je count_6_35
	movq %rdi, %r14
	xorq %rdi, %rdi
count_6_33:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r14,8)
	incq %rdi
	incq %r14
	cmpq %rdi, 8(%r9)
	jg count_6_33
count_6_35:
	movq %rax, %rcx
	jmp count_6_31
count_6_31:
	subq $8, %rsp
	subq $8, %rsp
	movq -216(%rbp), %rdi
	movq %rdi, %rax
	movq %rdi, -216(%rbp)
	movq %rcx, %rdi
	movq -240(%rbp), %rdi
	movq %rdi, %rsi
	pushq -8(%rbp)
	call count_6
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -240(%rbp)
	movq -32(%rbp), %r9
	movq -240(%rbp), %rcx
	movq %rbx, -88(%rbp)
	cmpq $2, (%rcx)
	je count_6_39
	cmpq $3, (%rcx)
	je count_6_40
	cmpq $4, (%rcx)
	je count_6_41
	jmp _Error_gestion
count_6_39:
	cmpq $2, (%r9)
	je count_6_42
	jmp _Error_gestion
count_6_42:
	movq 8(%r9), %rbx
	addq 8(%rcx), %rbx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rbx, 8(%rax)
	movq %rax, %rbx
	jmp count_6_45
count_6_40:
	cmpq $3, (%r9)
	je count_6_43
	jmp _Error_gestion
count_6_43:
	movq 8(%rcx), %rsi
	addq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	leaq 16(%rcx), %rsi
	leaq 16(%r9), %rdi
	call _my_strcat
	movq %r9, %rbx
	jmp count_6_45
count_6_41:
	cmpq $4, (%r9)
	je count_6_44
	jmp _Error_gestion
count_6_44:
	movq 8(%rcx), %rsi
	addq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r9)
	je count_6_48
	xorq %rdi, %rdi
count_6_46:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	jg count_6_46
count_6_48:
	cmpq $0, 8(%rcx)
	je count_6_49
	movq %rdi, %r9
	xorq %rdi, %rdi
count_6_47:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r9,8)
	incq %rdi
	incq %r9
	cmpq %rdi, 8(%rcx)
	jg count_6_47
count_6_49:
	movq %rax, %rbx
	jmp count_6_45
count_6_45:
	subq $8, %rsp
	movq %r9, -32(%rbp)
	jmp skip_count_51
count_6_17:
	subq $48, %rsp
	movq -256(%rbp), %rdi
	movq %r8, %rdi
	movq %r8, %rdi
	movq %r8, -256(%rbp)
	movq %rbx, -88(%rbp)
	movq -32(%rbp), %rbx
	movq %r9, -64(%rbp)
	movq %rcx, -48(%rbp)
	movq %rax, -208(%rbp)
skip_count_51:
	movq -208(%rbp), %r9
	cmpq $0, 8(%r9)
	jne count_6_18
	jmp skip_count_52
count_6_18:
	subq $0, %rsp
skip_count_52:
	movq %rdi, -256(%rbp)
	popq %rdi
	incq %rdi
	jmp count_6_9
	jmp skip_count_53
count_6_10:
	subq $96, %rsp
	movq -256(%rbp), %rdi
	movq %rax, %rdi
	movq %rax, %rdi
	movq %rax, -256(%rbp)
	movq %r8, -56(%rbp)
	movq %r9, -64(%rbp)
	movq %rbx, -88(%rbp)
	movq -32(%rbp), %rbx
	movq %rcx, -48(%rbp)
skip_count_53:
	movq %rbx, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -48(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rdi, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %rbx, -32(%rbp)
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -88(%rbp), %rbx
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
	movq -112(%rbp), %rax
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	movq %rax, -112(%rbp)
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $0, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	movq %rax, %rdi
	movq -120(%rbp), %rdi
	movq %rsi, -16(%rbp)
	movq %rdi, %rsi
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call count_6
	addq $8, %rsp
	movq %rax, %rax
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
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
