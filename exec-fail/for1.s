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
	movq %rax, -112(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je main_0_4
	cmpq $3, (%r14)
	je main_0_5
	cmpq $4, (%r14)
	je main_0_6
	cmpq $1, (%r14)
	je main_0_7
	movq -120(%rbp), %r15
	movq %r14, %r15
	jmp main_0_8
main_0_4:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_8
main_0_7:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp main_0_8
main_0_5:
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
	jmp main_0_8
main_0_6:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je main_0_10
main_0_9:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je main_0_10
	jmp main_0_9
main_0_10:
	movq %rax, %r8
main_0_8:
	movq %r15, -120(%rbp)
	movq %r8, %rdi
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
	je _implement_context_4_6
	movq $_True, %rdi
	call printf
	jmp _implement_context_4_7
_implement_context_4_6:
	movq $_False, %rdi
	call printf
_implement_context_4_7:
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
	movq 8(%rdi), %rsi
	movq $_list_format, %rdi
	call printf
	jmp _implement_context_4_5
_implement_context_4_4:
	movq $_None_format, %rdi
	call printf
_implement_context_4_5:
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
	je _implement_context_4_8
	cmpq $3, (%rdi)
	jl _implement_context_4_14
	jg _implement_context_4_15
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_4_10
_implement_context_4_14:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_4_9
_implement_context_4_15:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_4_17:
	cmpq %rax, 8(%rdi)
	je _implement_context_4_16
	cmpq %rax, 8(%rsi)
	je _implement_context_4_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_4_11
	jg _implement_context_4_13
	popq %rax
	incq %rax
	jmp _implement_context_4_17
_implement_context_4_16:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_12
	jmp _implement_context_4_11
_implement_context_4_8:
	cmpq $3, (%rdi)
	jl _implement_context_4_18
	jg _implement_context_4_19
	cmpq $3, (%rsi)
	jne _implement_context_4_11
	jmp _implement_context_4_10
_implement_context_4_18:
	cmpq $2, (%rsi)
	jg _implement_context_4_11
	jmp _implement_context_4_9
_implement_context_4_19:
	cmpq $4, (%rsi)
	jne _implement_context_4_11
	xorq %rax, %rax
_implement_context_4_21:
	cmpq %rax, 8(%rdi)
	je _implement_context_4_20
	cmpq %rax, 8(%rsi)
	je _implement_context_4_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_4_11
	jg _implement_context_4_13
	popq %rax
	incq %rax
	jmp _implement_context_4_21
_implement_context_4_20:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_12
	jmp _implement_context_4_11
_implement_context_4_9:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_4_12
	jg _implement_context_4_13
	jmp _implement_context_4_11
_implement_context_4_10:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_12:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_11:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_4_13:
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
