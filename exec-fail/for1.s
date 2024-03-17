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
	movq $42, 8(%rax)
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
	movq %rsi, -8(%rbp)
	xorq %rsi, %rsi
	movq -8(%rbp), %rdi
	call print
	movq %rdi, -8(%rbp)
	popq %rdi
	incq %rdi
	jmp main_0_0
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -136(%rbp), %rsi
	movq %rax, %rsi
	movq -8(%rbp), %rax
	movq (%rax), %rdi
	movq %rdi, (%rsi)
	movq 8(%rax), %rdi
	movq %rdi, 8(%rsi)
	jmp skip_main_6
main_0_1:
	subq $8, %rsp
	movq %rax, %rsi
	movq %rax, %rsi
	movq %rax, -136(%rbp)
	movq -8(%rbp), %rax
skip_main_6:
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
	je _implement_context_5_4
	cmpq $1, (%rdi)
	je _implement_context_5_1
	cmpq $2, (%rdi)
	je _implement_context_5_0
	cmpq $3, (%rdi)
	je _implement_context_5_2
	cmpq $4, (%rdi)
	je _implement_context_5_3
	jmp _Error_gestion
_implement_context_5_1:
	cmpq $0, 8(%rdi)
	je _implement_context_5_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_5_8
_implement_context_5_7:
	movq $_False, %rdi
	call printf
_implement_context_5_8:
	jmp _implement_context_5_5
_implement_context_5_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_5_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_5_10
_implement_context_5_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_5_9
_implement_context_5_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_4:
	movq $_None_format, %rdi
	call printf
_implement_context_5_5:
	cmpq $0, %r12
	jne _implement_context_5_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_5_6:
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
	je _implement_context_5_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $3, (%rdi)
	jl _implement_context_5_17
	jg _implement_context_5_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_5_13
_implement_context_5_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_5_12
_implement_context_5_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_5_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_19
	cmpq %rax, 8(%rsi)
	je _implement_context_5_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_5_20
_implement_context_5_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_11:
	cmpq $0, (%rdi)
	jne _implement_context_5_21
	cmpq $0, (%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_21:
	cmpq $0, (%rsi)
	je _implement_context_5_14
	cmpq $3, (%rdi)
	jl _implement_context_5_22
	jg _implement_context_5_23
	cmpq $3, (%rsi)
	jne _implement_context_5_14
	jmp _implement_context_5_13
_implement_context_5_22:
	cmpq $2, (%rsi)
	jg _implement_context_5_14
	jmp _implement_context_5_12
_implement_context_5_23:
	cmpq $4, (%rsi)
	jne _implement_context_5_14
	xorq %rax, %rax
_implement_context_5_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_24
	cmpq %rax, 8(%rsi)
	je _implement_context_5_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_5_25
_implement_context_5_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
	je _implement_context_5_15
	jg _implement_context_5_16
	jmp _implement_context_5_14
_implement_context_5_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_16:
	movq $1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_my_copy:
	pushq %rbp
	movq %rsp, %rbp
	cmpq $3, (%rdi)
	jl _implement_context_5_26
	jg _implement_context_5_27
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
	jmp _implement_context_5_28
_implement_context_5_27:
	pushq %r8
	pushq %rsi
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je _implement_context_5_30
	xorq %rdi, %rdi
_implement_context_5_29:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	jg _implement_context_5_29
_implement_context_5_30:
	popq %rsi
	popq %r8
	jmp _implement_context_5_28
_implement_context_5_26:
	pushq %rsi
	movq %rdi, %rsi
	movq $16, %rdi
	call _my_malloc
	movq (%rsi), %rdi
	movq %rdi, (%rax)
	movq 8(%rsi), %rdi
	movq %rdi, 8(%rax)
	popq %rsi
	jmp _implement_context_5_28
_implement_context_5_28:
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
