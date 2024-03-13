	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	subq $8, %rsp
	movq %rdi, -24(%rbp)
	movq %r14, -112(%rbp)
	movq $3, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $0, %rdi
	movq -128(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq $2, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq %r15, -120(%rbp)
	movq $3, %r15
	leaq 16(,%r15,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r15, 8(%rax)
	subq $8, %rsp
	movq %rsi, -32(%rbp)
	movq %rax, -160(%rbp)
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	movq -168(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_7
	cmpq $3, (%r14)
	je main_0_8
	cmpq $4, (%r14)
	je main_0_9
	cmpq $1, (%r14)
	je main_0_10
	cmpq $0, (%r14)
	je main_0_6
	jmp _Error_gestion
main_0_6:
	movq %r14, %r15
	jmp main_0_11
main_0_7:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_11
main_0_10:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_11
main_0_8:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp main_0_11
main_0_9:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_13
main_0_12:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_13
	jmp main_0_12
main_0_13:
	movq %rax, %r15
main_0_11:
	movq %r15, -168(%rbp)
	movq $0, %rdi
	movq -160(%rbp), %rsi
	movq %r15, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq %rsi, -160(%rbp)
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	movq -176(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_16
	cmpq $3, (%r14)
	je main_0_17
	cmpq $4, (%r14)
	je main_0_18
	cmpq $1, (%r14)
	je main_0_19
	cmpq $0, (%r14)
	je main_0_15
	jmp _Error_gestion
main_0_15:
	movq %r14, %r15
	jmp main_0_20
main_0_16:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_20
main_0_19:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_20
main_0_17:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp main_0_20
main_0_18:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_22
main_0_21:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_22
	jmp main_0_21
main_0_22:
	movq %rax, %r15
main_0_20:
	movq %r15, -176(%rbp)
	movq $1, %rdi
	movq -160(%rbp), %rsi
	movq %r15, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq %rsi, -160(%rbp)
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	movq -184(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_25
	cmpq $3, (%r14)
	je main_0_26
	cmpq $4, (%r14)
	je main_0_27
	cmpq $1, (%r14)
	je main_0_28
	cmpq $0, (%r14)
	je main_0_24
	jmp _Error_gestion
main_0_24:
	movq %r14, %r15
	jmp main_0_29
main_0_25:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_29
main_0_28:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_29
main_0_26:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp main_0_29
main_0_27:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_31
main_0_30:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_31
	jmp main_0_30
main_0_31:
	movq %rax, %r15
main_0_29:
	movq %r15, -184(%rbp)
	movq $2, %rdi
	movq -160(%rbp), %rsi
	movq %r15, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq %rsi, -8(%rbp)
	movq -8(%rbp), %r15
	movq %r8, -56(%rbp)
	movq -192(%rbp), %r8
	cmpq $2, (%r15)
	je main_0_34
	cmpq $3, (%r15)
	je main_0_35
	cmpq $4, (%r15)
	je main_0_36
	cmpq $1, (%r15)
	je main_0_37
	cmpq $0, (%r15)
	je main_0_33
	jmp _Error_gestion
main_0_33:
	movq %r15, %r8
	jmp main_0_38
main_0_34:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp main_0_38
main_0_37:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp main_0_38
main_0_35:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp main_0_38
main_0_36:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je main_0_40
main_0_39:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je main_0_40
	jmp main_0_39
main_0_40:
	movq %rax, %r8
main_0_38:
	movq %r8, -192(%rbp)
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
	subq $8, %rsp
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq %r9, -64(%rbp)
	movq -200(%rbp), %r9
	cmpq $2, (%r15)
	je main_0_43
	cmpq $3, (%r15)
	je main_0_44
	cmpq $4, (%r15)
	je main_0_45
	cmpq $1, (%r15)
	je main_0_46
	cmpq $0, (%r15)
	je main_0_42
	jmp _Error_gestion
main_0_42:
	movq %r15, %r9
	jmp main_0_47
main_0_43:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp main_0_47
main_0_46:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp main_0_47
main_0_44:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp main_0_47
main_0_45:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je main_0_49
main_0_48:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je main_0_49
	jmp main_0_48
main_0_49:
	movq %rax, %r9
main_0_47:
	movq %r9, -200(%rbp)
	cmpq $4, (%r9)
	jne _Error_gestion
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	cmpq $2, (%rax)
	jne _Error_gestion
	movq 8(%rax), %rdi
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	movq 8(%rax), %rdi
	movq 16(%r9,%rdi,8), %rax
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rax, -208(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	cmpq $2, (%rax)
	jne _Error_gestion
	movq 8(%rax), %rdi
	movq -208(%rbp), %r9
	cmpq %rdi, 8(%r9)
	jge _Error_gestion
	subq $8, %rsp
	movq %rax, -216(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $42, 8(%rax)
	movq -216(%rbp), %rdi
	movq 8(%rdi), %rdi
	movq %rax, 16(%r9,%rdi,8)
	movq %rdi, -216(%rbp)
	subq $8, %rsp
	movq %rax, -224(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	movq -232(%rbp), %r9
	cmpq $2, (%r15)
	je main_0_55
	cmpq $3, (%r15)
	je main_0_56
	cmpq $4, (%r15)
	je main_0_57
	cmpq $1, (%r15)
	je main_0_58
	cmpq $0, (%r15)
	je main_0_54
	jmp _Error_gestion
main_0_54:
	movq %r15, %r9
	jmp main_0_59
main_0_55:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp main_0_59
main_0_58:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r9
	jmp main_0_59
main_0_56:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	jmp main_0_59
main_0_57:
	movq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r15)
	je main_0_61
main_0_60:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	je main_0_61
	jmp main_0_60
main_0_61:
	movq %rax, %r9
main_0_59:
	movq %r9, -232(%rbp)
	xorq %rsi, %rsi
	movq %r9, %rdi
	call print
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -32(%rbp), %rsi
	movq -24(%rbp), %rdi
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	andq $-16, %rsp
	xorq %rdi, %rdi
	call fflush
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
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
