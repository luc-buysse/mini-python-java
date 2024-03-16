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
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	movq %rsi, -16(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	movq %rax, -112(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $42, 8(%rax)
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	movq %rax, -112(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1024, 8(%rax)
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
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
	movq %rdi, -8(%rbp)
	movq %r14, -104(%rbp)
	movq $10, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
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
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_3, %rsi
	call _my_strcpy
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_4, %rsi
	call _my_strcpy
	movq $2, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_5, %rsi
	call _my_strcpy
	movq $3, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_6, %rsi
	call _my_strcpy
	movq $4, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_7, %rsi
	call _my_strcpy
	movq $5, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_8, %rsi
	call _my_strcpy
	movq $6, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_9, %rsi
	call _my_strcpy
	movq $7, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_10, %rsi
	call _my_strcpy
	movq $8, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $str_4_11, %rsi
	call _my_strcpy
	movq $9, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq %r15, -112(%rbp)
	movq -8(%rbp), %r15
	movq %r15, %rdi
	movq %r8, -48(%rbp)
	movq -120(%rbp), %r8
	movq %r8, %rsi
	movq $1, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -144(%rbp), %r8
	movq %rax, %r8
	movq $1, (%r8)
	cmpl $0, %eax
	jl str_4_16
	movq $0, 8(%r8)
	jmp str_4_17
str_4_16:
	movq $1, 8(%r8)
str_4_17:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r8), %rdi
	movq %rdi, (%rax)
	movq 8(%r8), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je str_4_12
	cmpq $4, (%r14)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je str_4_21
str_4_20:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je str_4_21
	jmp str_4_20
str_4_21:
	cmpq $2, (%r15)
	jne _Error_gestion
	movq 8(%r15), %rdi
	cmpq %rdi, 8(%rax)
	jle _Error_gestion
	movq 8(%r15), %rdi
	subq $8, %rsp
	movq -168(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	movq %rsi, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -48(%rbp), %r8
	movq -24(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_str_23
str_4_12:
	subq $16, %rsp
	movq %r8, %rsi
	movq %r8, -168(%rbp)
	movq -168(%rbp), %rsi
	movq %rax, -152(%rbp)
skip_str_23:
	movq -152(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne str_4_13
	cmpq $4, (%r14)
	jne _Error_gestion
	subq $8, %rsp
	movq %rdi, -152(%rbp)
	movq %rsi, -168(%rbp)
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je str_4_26
str_4_25:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je str_4_26
	jmp str_4_25
str_4_26:
	subq $8, %rsp
	movq %rax, -176(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r15)
	jne _Error_gestion
	movq %rax, -184(%rbp)
	movq %rdx, -32(%rbp)
	movq 8(%r15), %rax
	movq -184(%rbp), %rsi
	movq 8(%rsi), %rdi
	cqto
	idivq %rdi
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq %r9, -56(%rbp)
	movq -200(%rbp), %r9
	movq %rax, %r9
	movq $2, (%r9)
	movq %rdx, 8(%r9)
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%r9), %rdi
	movq -176(%rbp), %rsi
	cmpq %rdi, 8(%rsi)
	jle _Error_gestion
	movq 8(%r9), %rdi
	movq 16(%rsi,%rdi,8), %r9
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r15)
	jne _Error_gestion
	movq %rax, -208(%rbp)
	movq 8(%r15), %rax
	movq -208(%rbp), %rsi
	movq 8(%rsi), %rdi
	cqto
	idivq %rdi
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq %rcx, -40(%rbp)
	movq -224(%rbp), %rcx
	movq %rax, %rcx
	movq $2, (%rcx)
	movq %rax, 8(%rcx)
	movq %rcx, %rax
	pushq -8(%rbp)
	call str_4
	addq $8, %rsp
	movq %rax, -224(%rbp)
	movq -224(%rbp), %rcx
	cmpq $2, (%r9)
	je str_4_33
	cmpq $3, (%r9)
	je str_4_34
	cmpq $4, (%r9)
	je str_4_35
	jmp _Error_gestion
str_4_33:
	cmpq $2, (%rcx)
	je str_4_36
	jmp _Error_gestion
str_4_36:
	movq 8(%rcx), %rdx
	addq 8(%r9), %rdx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rdx, 8(%rax)
	movq %rax, %rdx
	jmp str_4_39
str_4_34:
	cmpq $3, (%rcx)
	je str_4_37
	jmp _Error_gestion
str_4_37:
	movq 8(%r9), %rsi
	addq 8(%rcx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rcx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	leaq 16(%r9), %rsi
	leaq 16(%rcx), %rdi
	call _my_strcat
	movq %rcx, %rdx
	jmp str_4_39
str_4_35:
	cmpq $4, (%rcx)
	je str_4_38
	jmp _Error_gestion
str_4_38:
	movq 8(%r9), %rsi
	addq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je str_4_42
	xorq %rdi, %rdi
str_4_40:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	jg str_4_40
str_4_42:
	cmpq $0, 8(%r9)
	je str_4_43
	movq %rdi, %rcx
	xorq %rdi, %rdi
str_4_41:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rcx,8)
	incq %rdi
	incq %rcx
	cmpq %rdi, 8(%r9)
	jg str_4_41
str_4_43:
	movq %rax, %rdx
	jmp str_4_39
str_4_39:
	movq %rcx, -224(%rbp)
	movq %rdx, %rax
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
	movq -32(%rbp), %rdx
	movq -48(%rbp), %r8
	movq -56(%rbp), %r9
	movq -40(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_str_44
str_4_13:
	subq $56, %rsp
	movq %rsi, %rdx
	movq %rdx, -32(%rbp)
	movq %rsi, %rdx
	movq %rsi, -224(%rbp)
	movq %rdi, -152(%rbp)
	movq %r9, -56(%rbp)
	movq %rcx, -40(%rbp)
skip_str_44:
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %rdx, -224(%rbp)
	movq -104(%rbp), %r14
	movq -112(%rbp), %r15
	movq -24(%rbp), %rsi
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
	je _implement_context_7_4
	cmpq $1, (%rdi)
	je _implement_context_7_1
	cmpq $2, (%rdi)
	je _implement_context_7_0
	cmpq $3, (%rdi)
	je _implement_context_7_2
	cmpq $4, (%rdi)
	je _implement_context_7_3
	jmp _Error_gestion
_implement_context_7_1:
	cmpq $0, 8(%rdi)
	je _implement_context_7_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_7_8
_implement_context_7_7:
	movq $_False, %rdi
	call printf
_implement_context_7_8:
	jmp _implement_context_7_5
_implement_context_7_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_7_5
_implement_context_7_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_7_5
_implement_context_7_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_7_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_7_10
_implement_context_7_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_7_9
_implement_context_7_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_7_5
_implement_context_7_4:
	movq $_None_format, %rdi
	call printf
_implement_context_7_5:
	cmpq $0, %r12
	jne _implement_context_7_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_7_6:
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
	je _implement_context_7_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $3, (%rdi)
	jl _implement_context_7_17
	jg _implement_context_7_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_7_13
_implement_context_7_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_7_12
_implement_context_7_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_7_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_7_19
	cmpq %rax, 8(%rsi)
	je _implement_context_7_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_7_14
	jg _implement_context_7_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_7_20
_implement_context_7_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_7_15
	jmp _implement_context_7_14
_implement_context_7_11:
	cmpq $0, (%rdi)
	jne _implement_context_7_21
	cmpq $0, (%rsi)
	je _implement_context_7_15
	jmp _implement_context_7_14
_implement_context_7_21:
	cmpq $0, (%rsi)
	je _implement_context_7_14
	cmpq $3, (%rdi)
	jl _implement_context_7_22
	jg _implement_context_7_23
	cmpq $3, (%rsi)
	jne _implement_context_7_14
	jmp _implement_context_7_13
_implement_context_7_22:
	cmpq $2, (%rsi)
	jg _implement_context_7_14
	jmp _implement_context_7_12
_implement_context_7_23:
	cmpq $4, (%rsi)
	jne _implement_context_7_14
	xorq %rax, %rax
_implement_context_7_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_7_24
	cmpq %rax, 8(%rsi)
	je _implement_context_7_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_7_14
	jg _implement_context_7_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_7_25
_implement_context_7_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_7_15
	jmp _implement_context_7_14
_implement_context_7_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
	je _implement_context_7_15
	jg _implement_context_7_16
	jmp _implement_context_7_14
_implement_context_7_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_7_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_7_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_7_16:
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
str_4_3:
	.string "1"
str_4_4:
	.string "2"
str_4_5:
	.string "3"
str_4_6:
	.string "4"
str_4_7:
	.string "5"
str_4_8:
	.string "6"
str_4_9:
	.string "7"
str_4_10:
	.string "8"
str_4_11:
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
