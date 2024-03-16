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
	movq $3, 8(%rax)
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call make_4
	addq $8, %rsp
	movq %rsi, -16(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	andq $-16, %rsp
	xorq %rdi, %rdi
	call fflush
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
make_4:
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
	movq $0, %rax
	call _my_compare
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq -128(%rbp), %r15
	movq %rax, %r15
	movq $1, (%r15)
	cmpl $0, %eax
	je make_4_5
	movq $0, 8(%r15)
	jmp make_4_6
make_4_5:
	movq $1, 8(%r15)
make_4_6:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r15), %rdi
	movq %rdi, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je make_4_0
	movq %rax, -136(%rbp)
	movq $0, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $make_4_8, %rsi
	call _my_strcpy
	movq %r15, -128(%rbp)
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_make_9
make_4_0:
	subq $0, %rsp
	movq %rax, -136(%rbp)
	movq %r15, %rax
	movq %r15, -128(%rbp)
skip_make_9:
	movq -136(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne make_4_1
	movq %rax, -128(%rbp)
	movq %rdi, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%r14), %rdi
	subq 8(%rax), %rdi
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -152(%rbp), %r15
	movq %rax, %r15
	movq $2, (%r15)
	movq %rdi, 8(%r15)
	movq %r15, %rax
	pushq -8(%rbp)
	call make_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $make_4_13, %rsi
	call _my_strcpy
	movq %rax, -160(%rbp)
	movq -160(%rbp), %r15
	movq %r8, -40(%rbp)
	movq -152(%rbp), %r8
	movq %r9, -48(%rbp)
	cmpq $2, (%r8)
	je make_4_14
	cmpq $3, (%r8)
	je make_4_15
	cmpq $4, (%r8)
	je make_4_16
	jmp _Error_gestion
make_4_14:
	cmpq $2, (%r15)
	je make_4_17
	jmp _Error_gestion
make_4_17:
	movq 8(%r15), %r9
	addq 8(%r8), %r9
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r9, 8(%rax)
	movq %rax, %r9
	jmp make_4_20
make_4_15:
	cmpq $3, (%r15)
	je make_4_18
	jmp _Error_gestion
make_4_18:
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
	movq %r15, %r9
	jmp make_4_20
make_4_16:
	cmpq $4, (%r15)
	je make_4_19
	jmp _Error_gestion
make_4_19:
	movq 8(%r8), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r15)
	je make_4_23
	xorq %rdi, %rdi
make_4_21:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r15)
	jg make_4_21
make_4_23:
	cmpq $0, 8(%r8)
	je make_4_24
	movq %rdi, %r15
	xorq %rdi, %rdi
make_4_22:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r15,8)
	incq %rdi
	incq %r15
	cmpq %rdi, 8(%r8)
	jg make_4_22
make_4_24:
	movq %rax, %r9
	jmp make_4_20
make_4_20:
	movq %r15, -160(%rbp)
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_make_25
make_4_1:
	subq $24, %rsp
	movq %rax, %r9
	movq %r9, -48(%rbp)
	movq %rax, %r9
	movq %rax, -160(%rbp)
	movq %rdi, -136(%rbp)
	movq %r8, -40(%rbp)
skip_make_25:
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %r9, -160(%rbp)
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
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
make_4_8:
	.string ""
make_4_13:
	.string "a"
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
