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
	subq $8, %rsp
	movq %rax, %rax
	pushq -8(%rbp)
	call make_4
	addq $8, %rsp
	subq $8, %rsp
	movq %rax, %rdi
	call print
	movq -8(%rbp), %rdi
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
	movq %rbp, %rsp
	popq %rbp
	ret
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
	movq %rax, -104(%rbp)
	movq %r14, -96(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je make_4_4
	cmpq $3, (%r14)
	je make_4_5
	cmpq $4, (%r14)
	je make_4_6
	cmpq $1, (%r14)
	je make_4_7
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	movq %r14, %r15
	jmp make_4_8
make_4_4:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp make_4_8
make_4_7:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp make_4_8
make_4_5:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r8, -40(%rbp)
	movq %rax, %r8
	call _my_strcpy
	subq $16, %r8
	jmp make_4_8
make_4_6:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je make_4_10
make_4_9:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je make_4_10
	jmp make_4_9
make_4_10:
	movq %rax, %r8
make_4_8:
	movq %r15, -112(%rbp)
	movq -104(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r8)
	je _Error_gestion
	movq %rdi, -104(%rbp)
	movq %r8, %rdi
	movq -104(%rbp), %r15
	movq %r15, %rsi
	movq $0, %rax
	call _my_compare
	movq $1, (%r8)
	cmpq $0, %rax
	jne make_4_11
	movq $1, 8(%r8)
	jmp make_4_12
make_4_11:
	movq $0, 8(%r8)
make_4_12:
	cmpq $0, 8(%r8)
	je make_4_0
	subq $8, %rsp
	movq $0, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $make_4_14, %rsi
	call _my_strcpy
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp make_4_1
make_4_0:
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq %r14, -8(%rbp)
	movq -8(%rbp), %r14
	cmpq $2, (%r14)
	je make_4_17
	cmpq $3, (%r14)
	je make_4_18
	cmpq $4, (%r14)
	je make_4_19
	cmpq $1, (%r14)
	je make_4_20
	movq -136(%rbp), %r15
	movq %r14, %r15
	jmp make_4_21
make_4_17:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp make_4_21
make_4_20:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp make_4_21
make_4_18:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %r9, -48(%rbp)
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp make_4_21
make_4_19:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je make_4_23
make_4_22:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je make_4_23
	jmp make_4_22
make_4_23:
	movq %rax, %r9
make_4_21:
	movq %r15, -136(%rbp)
	movq -128(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%r9)
	je _Error_gestion
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%r9)
	subq $8, %rsp
	movq %r9, %rax
	pushq -8(%rbp)
	call make_4
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $1, %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%rax), %rdi
	movq $make_4_27, %rsi
	call _my_strcpy
	movq -152(%rbp), %rdi
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rax)
	je _Error_gestion
	cmpq $2, (%rdi)
	je make_4_28
	cmpq $3, (%rdi)
	je make_4_29
	cmpq $4, (%rdi)
	je make_4_30
	jmp _Error_gestion
make_4_28:
	cmpq $2, (%rax)
	je make_4_31
	jmp _Error_gestion
make_4_31:
	movq 8(%rdi), %rdi
	addq %rdi, 8(%rax)
	jmp make_4_34
make_4_29:
	cmpq $3, (%rax)
	je make_4_32
	jmp _Error_gestion
make_4_32:
	movq %rdi, -152(%rbp)
	movq %rax, -160(%rbp)
	movq -152(%rbp), %r15
	movq -160(%rbp), %r9
	movq 8(%r15), %rsi
	addq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r15
	call _my_strcpy
	leaq 16(%r9), %rsi
	leaq 16(%r15), %rdi
	call _my_strcat
	subq $16, %r15
	jmp make_4_34
make_4_30:
	cmpq $4, (%r15)
	je make_4_33
	jmp _Error_gestion
make_4_33:
	movq -152(%rbp), %r9
	movq 8(%r9), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r9)
	je make_4_37
	xorq %rdi, %rdi
make_4_35:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl make_4_35
make_4_37:
	cmpq $0, 8(%r9)
	je make_4_38
	xorq %rdi, %rdi
make_4_36:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl make_4_36
make_4_38:
	jmp make_4_34
make_4_34:
	movq -152(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	cmpq $2, (%r9)
	jne _Error_gestion
	movq 8(%rdi), %rdi
	subq %rdi, 8(%r9)
	movq %r9, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
make_4_1:
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
	je _implement_context_5_6
	movq $_True, %rdi
	call printf
	jmp _implement_context_5_7
_implement_context_5_6:
	movq $_False, %rdi
	call printf
_implement_context_5_7:
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
	movq 8(%rdi), %rsi
	movq $_list_format, %rdi
	call printf
	jmp _implement_context_5_5
_implement_context_5_4:
	movq $_None_format, %rdi
	call printf
_implement_context_5_5:
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
	je _implement_context_5_8
	cmpq $3, (%rdi)
	jl _implement_context_5_14
	jg _implement_context_5_15
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_5_10
_implement_context_5_14:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_5_9
_implement_context_5_15:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_5_17:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_16
	cmpq %rax, 8(%rsi)
	je _implement_context_5_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_11
	jg _implement_context_5_13
	popq %rax
	incq %rax
	jmp _implement_context_5_17
_implement_context_5_16:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_12
	jmp _implement_context_5_11
_implement_context_5_8:
	cmpq $3, (%rdi)
	jl _implement_context_5_18
	jg _implement_context_5_19
	cmpq $3, (%rsi)
	jne _implement_context_5_11
	jmp _implement_context_5_10
_implement_context_5_18:
	cmpq $2, (%rsi)
	jg _implement_context_5_11
	jmp _implement_context_5_9
_implement_context_5_19:
	cmpq $4, (%rsi)
	jne _implement_context_5_11
	xorq %rax, %rax
_implement_context_5_21:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_20
	cmpq %rax, 8(%rsi)
	je _implement_context_5_13
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_11
	jg _implement_context_5_13
	popq %rax
	incq %rax
	jmp _implement_context_5_21
_implement_context_5_20:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_12
	jmp _implement_context_5_11
_implement_context_5_9:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
	je _implement_context_5_12
	jg _implement_context_5_13
	jmp _implement_context_5_11
_implement_context_5_10:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_12:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_11:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_5_13:
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
make_4_14:
	.string ""
make_4_27:
	.string "a"
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
