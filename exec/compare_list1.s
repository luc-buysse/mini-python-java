	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %r14, -96(%rbp)
	movq $0, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -112(%rbp)
	movq $0, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	movq %rsi, -16(%rbp)
	movq %rax, -120(%rbp)
	movq -112(%rbp), %r14
	movq %r14, %rdi
	movq %r15, -104(%rbp)
	movq -120(%rbp), %r15
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r15)
	cmpq $0, %rax
	jne main_0_2
	movq $1, 8(%r15)
	jmp main_0_3
main_0_2:
	movq $0, 8(%r15)
main_0_3:
	xorq %rsi, %rsi
	movq %r15, %rdi
	call print
	subq $8, %rsp
	movq $1, %r14
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
	movq $0, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	movq %rax, -144(%rbp)
	movq %r14, %rdi
	movq %r8, -40(%rbp)
	movq -144(%rbp), %r8
	movq %r8, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jge main_0_7
	movq $1, 8(%r8)
	jmp main_0_8
main_0_7:
	movq $0, 8(%r8)
main_0_8:
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
	subq $8, %rsp
	movq $1, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq $0, %rdi
	movq -152(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -168(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $0, %rdi
	movq -168(%rbp), %rsi
	movq %rax, 16(%rsi,%rdi,8)
	movq %rsi, -168(%rbp)
	movq %r14, %rdi
	movq %r9, -48(%rbp)
	movq -168(%rbp), %r9
	movq %r9, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r9)
	cmpq $0, %rax
	je main_0_13
	movq $1, 8(%r9)
	jmp main_0_14
main_0_13:
	movq $0, 8(%r9)
main_0_14:
	xorq %rsi, %rsi
	movq %r9, %rdi
	call print
	subq $8, %rsp
	movq $2, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -184(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq $0, %rdi
	movq -184(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
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
	movq $0, %rdi
	movq -208(%rbp), %rsi
	movq %rax, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%rsi,%rdi,8)
	movq %rsi, -208(%rbp)
	movq %r14, %rdi
	movq %rcx, -32(%rbp)
	movq -208(%rbp), %rcx
	movq %rcx, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%rcx)
	cmpq $0, %rax
	jge main_0_21
	movq $1, 8(%rcx)
	jmp main_0_22
main_0_21:
	movq $0, 8(%rcx)
main_0_22:
	xorq %rsi, %rsi
	movq %rcx, %rdi
	call print
	subq $8, %rsp
	movq $2, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -232(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq $0, %rdi
	movq -232(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $6, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%r14,%rdi,8)
	subq $8, %rsp
	movq $1, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -256(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq $0, %rdi
	movq -256(%rbp), %rsi
	movq %rax, 16(%rsi,%rdi,8)
	movq %rsi, -256(%rbp)
	movq %r14, %rdi
	movq %rbx, -72(%rbp)
	movq -256(%rbp), %rbx
	movq %rbx, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%rbx)
	cmpq $0, %rax
	jg main_0_28
	movq $1, 8(%rbx)
	jmp main_0_29
main_0_28:
	movq $0, 8(%rbx)
main_0_29:
	xorq %rsi, %rsi
	movq %rbx, %rdi
	call print
	subq $8, %rsp
	movq $0, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -272(%rbp)
	movq $1, %r14
	leaq 16(,%r14,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %r14, 8(%rax)
	subq $8, %rsp
	movq %rax, -280(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $5, 8(%rax)
	movq $0, %rdi
	movq -280(%rbp), %r14
	movq %rax, 16(%r14,%rdi,8)
	movq %rdx, -24(%rbp)
	movq -272(%rbp), %rdx
	movq %rdx, %rdi
	movq %r14, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%r14)
	cmpq $0, %rax
	jg main_0_33
	movq $1, 8(%r14)
	jmp main_0_34
main_0_33:
	movq $0, 8(%r14)
main_0_34:
	xorq %rsi, %rsi
	movq %r14, %rdi
	call print
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq -72(%rbp), %rbx
	movq -24(%rbp), %rdx
	movq -8(%rbp), %rdi
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
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