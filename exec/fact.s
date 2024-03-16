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
	movq $10, 8(%rax)
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call fact_4
	addq $8, %rsp
	movq %rsi, -16(%rbp)
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	movq %rax, -112(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $10, 8(%rax)
	movq %rax, %rax
	movq %rax, -112(%rbp)
	pushq -8(%rbp)
	call factimp_5
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
fact_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
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
	jle fact_4_5
	movq $0, 8(%r15)
	jmp fact_4_6
fact_4_5:
	movq $1, 8(%r15)
fact_4_6:
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq (%r15), %rdi
	movq %rdi, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	cmpq $0, 8(%rax)
	je fact_4_0
	movq %rax, -136(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %r15, -128(%rbp)
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp skip_fact_8
fact_4_0:
	subq $0, %rsp
	movq %rax, -136(%rbp)
	movq %r15, %rax
	movq %r15, -128(%rbp)
skip_fact_8:
	movq -136(%rbp), %rdi
	cmpq $0, 8(%rdi)
	jne fact_4_1
	jmp skip_fact_9
fact_4_1:
	subq $0, %rsp
skip_fact_9:
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
	call fact_4
	addq $8, %rsp
	subq $8, %rsp
	cmpq $2, (%rax)
	jne _Error_gestion
	cmpq $2, (%r14)
	jne _Error_gestion
	movq 8(%rax), %r15
	movq 8(%r14), %rdi
	imulq %rdi, %r15
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq -168(%rbp), %rsi
	movq %rax, %rsi
	movq $2, (%rsi)
	movq %r15, 8(%rsi)
	movq %rsi, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %rsi, -168(%rbp)
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
factimp_5:
	pushq %rbp
	movq %rsp, %rbp
	subq $120, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq -136(%rbp), %rdi
	movq %rax, -16(%rbp)
	movq %rdi, %rax
	pushq -8(%rbp)
	call range
	addq $8, %rsp
	movq %rax, %rax
	movq %rax, -136(%rbp)
	pushq -8(%rbp)
	call list
	addq $8, %rsp
	cmpq $4, (%rax)
	jne _Error_gestion
	subq $8, %rsp
	movq %rsi, -32(%rbp)
	movq %rax, -136(%rbp)
	movq %r14, -112(%rbp)
	movq -136(%rbp), %r14
	movq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_6
factimp_5_5:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	je factimp_5_6
	jmp factimp_5_5
factimp_5_6:
	xorq %rdi, %rdi
factimp_5_1:
	cmpq %rdi, 8(%rax)
	je factimp_5_2
	movq -24(%rbp), %rsi
	movq 16(%rax,%rdi,8), %rsi
	pushq %rdi
	movq %rax, -144(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %r14, -136(%rbp)
	subq $8, %rsp
	movq %rsi, -24(%rbp)
	movq %rax, -136(%rbp)
	movq -24(%rbp), %r14
	movq %r15, -120(%rbp)
	movq -136(%rbp), %r15
	movq %r8, -56(%rbp)
	cmpq $2, (%r15)
	je factimp_5_8
	cmpq $3, (%r15)
	je factimp_5_9
	cmpq $4, (%r15)
	je factimp_5_10
	jmp _Error_gestion
factimp_5_8:
	cmpq $2, (%r14)
	je factimp_5_11
	jmp _Error_gestion
factimp_5_11:
	movq 8(%r14), %r8
	addq 8(%r15), %r8
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq %r8, 8(%rax)
	movq %rax, %r8
	jmp factimp_5_14
factimp_5_9:
	cmpq $3, (%r14)
	je factimp_5_12
	jmp _Error_gestion
factimp_5_12:
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
	jmp factimp_5_14
factimp_5_10:
	cmpq $4, (%r14)
	je factimp_5_13
	jmp _Error_gestion
factimp_5_13:
	movq 8(%r15), %rsi
	addq 8(%r14), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je factimp_5_17
	xorq %rdi, %rdi
factimp_5_15:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r14)
	jg factimp_5_15
factimp_5_17:
	cmpq $0, 8(%r15)
	je factimp_5_18
	movq %rdi, %r14
	xorq %rdi, %rdi
factimp_5_16:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%r14,8)
	incq %rdi
	incq %r14
	cmpq %rdi, 8(%r15)
	jg factimp_5_16
factimp_5_18:
	movq %rax, %r8
	jmp factimp_5_14
factimp_5_14:
	subq $8, %rsp
	subq $8, %rsp
	cmpq $2, (%r8)
	jne _Error_gestion
	movq -16(%rbp), %rdi
	cmpq $2, (%rdi)
	jne _Error_gestion
	movq 8(%r8), %rsi
	movq 8(%rdi), %r15
	imulq %r15, %rsi
	subq $8, %rsp
	movq %rdi, -16(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq %r9, -64(%rbp)
	movq -176(%rbp), %r9
	movq %rax, %r9
	movq $2, (%r9)
	movq %rsi, 8(%r9)
	popq %rdi
	incq %rdi
	jmp factimp_5_1
	jmp skip_factimp_22
factimp_5_2:
	subq $32, %rsp
	movq -176(%rbp), %rdi
	movq %rax, %rdi
	movq %rax, %rdi
	movq %rax, -176(%rbp)
	movq %r14, -136(%rbp)
	movq -24(%rbp), %r14
	movq %r9, -64(%rbp)
	movq -16(%rbp), %r9
	movq %r15, -120(%rbp)
	movq %r8, -56(%rbp)
skip_factimp_22:
	movq %r9, %rax
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -32(%rbp), %rsi
	movq %rbp, %rsp
	popq %rbp
	ret
	movq %rdi, -176(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $0, (%rax)
	movq $0, 8(%rax)
	movq %r9, -16(%rbp)
	movq -112(%rbp), %r14
	movq -120(%rbp), %r15
	movq -56(%rbp), %r8
	movq -64(%rbp), %r9
	movq -32(%rbp), %rsi
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
	je _implement_context_9_4
	cmpq $1, (%rdi)
	je _implement_context_9_1
	cmpq $2, (%rdi)
	je _implement_context_9_0
	cmpq $3, (%rdi)
	je _implement_context_9_2
	cmpq $4, (%rdi)
	je _implement_context_9_3
	jmp _Error_gestion
_implement_context_9_1:
	cmpq $0, 8(%rdi)
	je _implement_context_9_7
	movq $_True, %rdi
	call printf
	jmp _implement_context_9_8
_implement_context_9_7:
	movq $_False, %rdi
	call printf
_implement_context_9_8:
	jmp _implement_context_9_5
_implement_context_9_0:
	movq 8(%rdi), %rsi
	movq $_int_format, %rdi
	call printf
	jmp _implement_context_9_5
_implement_context_9_2:
	leaq 16(%rdi), %rdi
	call printf
	jmp _implement_context_9_5
_implement_context_9_3:
	movq 8(%rdi), %r13
	leaq 16(%rdi), %r14
	movq $_list_format_start, %rdi
	call printf
	cmpq $0, %r13
	je _implement_context_9_10
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	je _implement_context_9_10
_implement_context_9_9:
	movq $_list_format_sep, %rdi
	xorq %rax, %rax
	call printf
	movq (%r14), %rdi
	movq $1, %rsi
	call print
	decq %r13
	leaq 8(%r14), %r14
	cmpq $0, %r13
	jg _implement_context_9_9
_implement_context_9_10:
	movq $_list_format_end, %rdi
	call printf
	jmp _implement_context_9_5
_implement_context_9_4:
	movq $_None_format, %rdi
	call printf
_implement_context_9_5:
	cmpq $0, %r12
	jne _implement_context_9_6
	xorq %rax, %rax
	movq $_flush, %rdi
	call printf
_implement_context_9_6:
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
	je _implement_context_9_11
	cmpq $0, (%rdi)
	je _Error_gestion
	cmpq $0, (%rsi)
	je _Error_gestion
	cmpq $3, (%rdi)
	jl _implement_context_9_17
	jg _implement_context_9_18
	cmpq $3, (%rsi)
	jne _Error_gestion
	jmp _implement_context_9_13
_implement_context_9_17:
	cmpq $2, (%rsi)
	jg _Error_gestion
	jmp _implement_context_9_12
_implement_context_9_18:
	cmpq $4, (%rsi)
	jne _Error_gestion
	xorq %rax, %rax
_implement_context_9_20:
	cmpq %rax, 8(%rdi)
	je _implement_context_9_19
	cmpq %rax, 8(%rsi)
	je _implement_context_9_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_9_14
	jg _implement_context_9_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_9_20
_implement_context_9_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_9_15
	jmp _implement_context_9_14
_implement_context_9_11:
	cmpq $0, (%rdi)
	jne _implement_context_9_21
	cmpq $0, (%rsi)
	je _implement_context_9_15
	jmp _implement_context_9_14
_implement_context_9_21:
	cmpq $0, (%rsi)
	je _implement_context_9_14
	cmpq $3, (%rdi)
	jl _implement_context_9_22
	jg _implement_context_9_23
	cmpq $3, (%rsi)
	jne _implement_context_9_14
	jmp _implement_context_9_13
_implement_context_9_22:
	cmpq $2, (%rsi)
	jg _implement_context_9_14
	jmp _implement_context_9_12
_implement_context_9_23:
	cmpq $4, (%rsi)
	jne _implement_context_9_14
	xorq %rax, %rax
_implement_context_9_25:
	cmpq %rax, 8(%rdi)
	je _implement_context_9_24
	cmpq %rax, 8(%rsi)
	je _implement_context_9_16
	pushq %rdi
	pushq %rsi
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $0, %rax
	jl _implement_context_9_14
	jg _implement_context_9_16
	popq %rax
	incq %rax
	popq %rsi
	popq %rdi
	jmp _implement_context_9_25
_implement_context_9_24:
	cmpq %rax, 8(%rsi)
	je _implement_context_9_15
	jmp _implement_context_9_14
_implement_context_9_12:
	movq 8(%rsi), %rsi
	cmpq %rsi, 8(%rdi)
	je _implement_context_9_15
	jg _implement_context_9_16
	jmp _implement_context_9_14
_implement_context_9_13:
	leaq 16(%rdi), %rdi
	leaq 16(%rsi), %rsi
	call _my_strcmp
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_9_15:
	movq $0, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_9_14:
	movq $-1, %rax
	movq %rbp, %rsp
	popq %rbp
	ret
_implement_context_9_16:
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
