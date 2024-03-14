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
	subq $8, %rsp
	movq %rsi, -24(%rbp)
	movq %rax, -8(%rbp)
	movq %r14, -104(%rbp)
	movq -8(%rbp), %r14
	movq %r15, -112(%rbp)
	movq -128(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_3
	cmpq $3, (%r14)
	je main_0_4
	cmpq $4, (%r14)
	je main_0_5
	cmpq $1, (%r14)
	je main_0_6
	cmpq $0, (%r14)
	je main_0_2
	jmp _Error_gestion
main_0_2:
	movq %r14, %r15
	jmp main_0_7
main_0_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_7
main_0_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_7
main_0_4:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp main_0_7
main_0_5:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_9
main_0_8:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_9
	jmp main_0_8
main_0_9:
	movq %rax, %r15
main_0_7:
	movq %r15, -128(%rbp)
	xorq %rsi, %rsi
	movq %r15, %rdi
	call print
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq $0, %rdi
	movq -136(%rbp), %rsi
	movq %rax, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq $1, %rdi
	movq %rax, 16(%rsi,%rdi,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq $2, %rdi
	movq %rax, 16(%rsi,%rdi,8)
	cmpq $4, (%rsi)
	jne _Error_gestion
	movq %rdx, -32(%rbp)
	movq %rcx, -40(%rbp)
	movq %r8, -48(%rbp)
	movq %r9, -56(%rbp)
	movq %r10, -64(%rbp)
	movq %r11, -72(%rbp)
	movq %rbx, -80(%rbp)
	movq %r12, -88(%rbp)
	movq %r13, -96(%rbp)
	movq %r14, -8(%rbp)
	movq %r15, -128(%rbp)
	xorq %rdi, %rdi
main_0_10:
	cmpq %rdi, 8(%rsi)
	je main_0_11
	movq -8(%rbp), %r14
	movq 16(%rsi,%rdi,8), %r14
	pushq %rdi
	subq $8, %rsp
	movq %rsi, -136(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	movq -168(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_18
	cmpq $3, (%r14)
	je main_0_19
	cmpq $4, (%r14)
	je main_0_20
	cmpq $1, (%r14)
	je main_0_21
	cmpq $0, (%r14)
	je main_0_17
	jmp _Error_gestion
main_0_17:
	movq %r14, %r15
	jmp main_0_22
main_0_18:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_22
main_0_21:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp main_0_22
main_0_19:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	jmp main_0_22
main_0_20:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_24
main_0_23:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_24
	jmp main_0_23
main_0_24:
	movq %rax, %r15
main_0_22:
	movq %r15, -168(%rbp)
	xorq %rsi, %rsi
	movq %r15, %rdi
	call print
	popq %rdi
	incq %rdi
	jmp main_0_10
main_0_11:
	subq $8, %rsp
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	movq -176(%rbp), %r8
	cmpq $2, (%r14)
	je main_0_27
	cmpq $3, (%r14)
	je main_0_28
	cmpq $4, (%r14)
	je main_0_29
	cmpq $1, (%r14)
	je main_0_30
	cmpq $0, (%r14)
	je main_0_26
	jmp _Error_gestion
main_0_26:
	movq %r14, %r8
	jmp main_0_31
main_0_27:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp main_0_31
main_0_30:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r8
	jmp main_0_31
main_0_28:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	jmp main_0_31
main_0_29:
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je main_0_33
main_0_32:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je main_0_33
	jmp main_0_32
main_0_33:
	movq %rax, %r8
main_0_31:
	movq %r8, -176(%rbp)
	xorq %rsi, %rsi
	movq %r8, %rdi
	call print
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
	cmpq $0, %rax
	je _implement_context_4_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
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
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_4_14
	jg _implement_context_4_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_4_20
_implement_context_4_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_15
	jmp _implement_context_4_14
_implement_context_4_11:
	cmpq $0, (%rdi)
	jne _implement_context_4_21
	cmpq $0, (%rsi)
	je _implement_context_4_15
	jmp _implement_context_4_14
_implement_context_4_21:
	cmpq $0, (%rsi)
	je _implement_context_4_14
	cmpq $3, (%rdi)
	jl _implement_context_4_22
	jg _implement_context_4_23
	cmpq $3, (%rsi)
	jne _implement_context_4_14
	jmp _implement_context_4_13
_implement_context_4_22:
	cmpq $2, (%rsi)
	jg _implement_context_4_14
	jmp _implement_context_4_12
_implement_context_4_23:
	cmpq $4, (%rsi)
	jne _implement_context_4_14
	xorq %rax, %rax
_implement_context_4_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_4_24
	cmpq %rax, 8(%rsi)
	je _implement_context_4_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_4_14
	jg _implement_context_4_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_4_25
_implement_context_4_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_4_15
	jmp _implement_context_4_14
_implement_context_4_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
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
