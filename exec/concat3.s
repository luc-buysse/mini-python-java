	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	movq %rdi, -8(%rbp)
	movq %r14, -96(%rbp)
	movq $0, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -112(%rbp)
	movq $0, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rsi, -16(%rbp)
	movq %rax, -128(%rbp)
	movq -128(%rbp), %r14
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	movq %r8, -40(%rbp)
	cmpq $2, (%r15)
	je main_0_3
	cmpq $3, (%r15)
	je main_0_4
	cmpq $4, (%r15)
	je main_0_5
	jmp _Error_gestion
main_0_3:
	cmpq $2, (%r14)
	je main_0_6
	jmp _Error_gestion
main_0_6:
	movq 8(%r14), %r8
	addq 8(%r15), %r8
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r8, 8(%rax)
	movq %rax, %r8
	jmp main_0_9
main_0_4:
	cmpq $3, (%r14)
	je main_0_7
	jmp _Error_gestion
main_0_7:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r14
	call _my_strcpy
	leaq 16(%r15), %rsi
	leaq 16(%r14), %rdi
	call _my_strcat
	movq %r14, %r8
	jmp main_0_9
main_0_5:
	cmpq $4, (%r14)
	je main_0_8
	jmp _Error_gestion
main_0_8:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je main_0_12
	xorq %rdi, %rdi
main_0_10:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	jg main_0_10
main_0_12:
	cmpq $0, 8(%r15)
	je main_0_13
	movq %rdi, %r14
	xorq %rdi, %rdi
main_0_11:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r14,8)
	incq %rdi
	incq %r14
	cmpq %rdi, 8(%r15)
	jg main_0_11
main_0_13:
	movq %rax, %r8
	jmp main_0_9
main_0_9:
	movq %r14, -128(%rbp)
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
	movq $3, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %r8, -128(%rbp)
	movq $0, %rdi
	movq -136(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $5, 8(%rax)
	movq $2, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $2, %r15
	leaq 16(,%r15,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r15, 8(%rax)
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $0, %rdi
	movq -152(%rbp), %r15
	movq %rax, 16(%r15,%rdi,8)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%r15,%rdi,8)
	cmpq $2, (%r14)
	je main_0_17
	cmpq $3, (%r14)
	je main_0_18
	cmpq $4, (%r14)
	je main_0_19
	jmp _Error_gestion
main_0_17:
	cmpq $2, (%r15)
	je main_0_20
	jmp _Error_gestion
main_0_20:
	movq 8(%r15), %r8
	addq 8(%r14), %r8
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r8, 8(%rax)
	movq %rax, %r8
	jmp main_0_23
main_0_18:
	cmpq $3, (%r15)
	je main_0_21
	jmp _Error_gestion
main_0_21:
	movq 8(%r14), %rsi
	addq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	leaq 16(%r14), %rsi
	leaq 16(%r15), %rdi
	call _my_strcat
	movq %r15, %r8
	jmp main_0_23
main_0_19:
	cmpq $4, (%r15)
	je main_0_22
	jmp _Error_gestion
main_0_22:
	movq 8(%r14), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r15)
	je main_0_26
	xorq %rdi, %rdi
main_0_24:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	jg main_0_24
main_0_26:
	cmpq $0, 8(%r14)
	je main_0_27
	movq %rdi, %r15
	xorq %rdi, %rdi
main_0_25:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r15,8)
	incq %rdi
	incq %r15
	cmpq %rdi, 8(%r14)
	jg main_0_25
main_0_27:
	movq %rax, %r8
	jmp main_0_23
main_0_23:
	movq %r15, -152(%rbp)
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %r8, -152(%rbp)
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $7, 8(%rax)
	movq %rax, %rax
	movq %rax, %rdi
	movq %rax, -152(%rbp)
	pushq -8(%rbp)
	call f_4
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
f_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	movq %r14, %rdi
	movq %r15, -104(%rbp)
	movq -16(%rbp), %r15
	movq %r15, %rsi
	movq $1, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -120(%rbp), %rsi
	movq %rax, %rsi
	movq $1, (%rsi)
	cmpl $0, %eax
	jge f_4_4
	movq $0, 8(%rsi)
	jmp f_4_5
f_4_4:
	movq $1, 8(%rsi)
f_4_5:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%rsi), %rdi
	movq %rdi, (%rax)
	movq 8(%rsi), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je f_4_0
	movq %rax, -128(%rbp)
	movq %r8, -40(%rbp)
	movq $0, %r8
	leaq 16(,%r8,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r8, 8(%rax)
	subq $8, %rsp
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_f_8
f_4_0:
	subq $8, %rsp
	movq %rsi, %rax
	movq %r14, -8(%rbp)
	movq -96(%rbp), %r14
	movq %r15, -16(%rbp)
	movq -104(%rbp), %r15
	movq %rsi, -136(%rbp)
	movq %rax, -128(%rbp)
	movq -136(%rbp), %rax
skip_f_8:
	movq -128(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne f_4_1
	jmp skip_f_9
f_4_1:
	subq $0, %rsp
skip_f_9:
	movq %rax, -136(%rbp)
	movq %rdi, -128(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rsi, -120(%rbp)
	movq %rax, -136(%rbp)
	movq %r9, -48(%rbp)
	movq -8(%rbp), %r9
	movq %rcx, -32(%rbp)
	movq -136(%rbp), %rcx
	movq %rbx, -72(%rbp)
	cmpq $2, (%rcx)
	je f_4_11
	cmpq $3, (%rcx)
	je f_4_12
	cmpq $4, (%rcx)
	je f_4_13
	jmp _Error_gestion
f_4_11:
	cmpq $2, (%r9)
	je f_4_14
	jmp _Error_gestion
f_4_14:
	movq 8(%r9), %rbx
	addq 8(%rcx), %rbx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rbx, 8(%rax)
	movq %rax, %rbx
	jmp f_4_17
f_4_12:
	cmpq $3, (%r9)
	je f_4_15
	jmp _Error_gestion
f_4_15:
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
	jmp f_4_17
f_4_13:
	cmpq $4, (%r9)
	je f_4_16
	jmp _Error_gestion
f_4_16:
	movq 8(%rcx), %rsi
	addq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r9)
	je f_4_20
	xorq %rdi, %rdi
f_4_18:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	jg f_4_18
f_4_20:
	cmpq $0, 8(%rcx)
	je f_4_21
	movq %rdi, %r9
	xorq %rdi, %rdi
f_4_19:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r9,8)
	incq %rdi
	incq %r9
	cmpq %rdi, 8(%rcx)
	jg f_4_19
f_4_21:
	movq %rax, %rbx
	jmp f_4_17
f_4_17:
	subq $8, %rsp
	subq $8, %rsp
	movq %rbx, %rax
	movq -160(%rbp), %rdi
	movq %rdi, %rdi
	pushq -8(%rbp)
	call f_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq $1, %rcx
	leaq 16(,%rcx,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rcx, 8(%rax)
	subq $8, %rsp
	movq $0, %rdi
	movq %r9, 16(%rax,%rdi,8)
	movq %rax, -176(%rbp)
	movq -176(%rbp), %rcx
	movq -160(%rbp), %rbx
	movq %rdx, -24(%rbp)
	cmpq $2, (%rbx)
	je f_4_26
	cmpq $3, (%rbx)
	je f_4_27
	cmpq $4, (%rbx)
	je f_4_28
	jmp _Error_gestion
f_4_26:
	cmpq $2, (%rcx)
	je f_4_29
	jmp _Error_gestion
f_4_29:
	movq 8(%rcx), %rdx
	addq 8(%rbx), %rdx
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %rdx, 8(%rax)
	movq %rax, %rdx
	jmp f_4_32
f_4_27:
	cmpq $3, (%rcx)
	je f_4_30
	jmp _Error_gestion
f_4_30:
	movq 8(%rbx), %rsi
	addq 8(%rcx), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rcx), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %rcx
	call _my_strcpy
	leaq 16(%rbx), %rsi
	leaq 16(%rcx), %rdi
	call _my_strcat
	movq %rcx, %rdx
	jmp f_4_32
f_4_28:
	cmpq $4, (%rcx)
	je f_4_31
	jmp _Error_gestion
f_4_31:
	movq 8(%rbx), %rsi
	addq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%rcx)
	je f_4_35
	xorq %rdi, %rdi
f_4_33:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	jg f_4_33
f_4_35:
	cmpq $0, 8(%rbx)
	je f_4_36
	movq %rdi, %rcx
	xorq %rdi, %rdi
f_4_34:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rcx,8)
	incq %rdi
	incq %rcx
	cmpq %rdi, 8(%rbx)
	jg f_4_34
f_4_36:
	movq %rax, %rdx
	jmp f_4_32
f_4_32:
	movq %rcx, -176(%rbp)
	movq %rdx, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
	movq -24(%rbp), %rdx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
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
