	.text
	.global main
main:
main_0:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq $0, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -104(%rbp)
	movq $0, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	movq %rax, -112(%rbp)
	movq %r14, -96(%rbp)
	movq -104(%rbp), %r14
	movq %r15, -104(%rbp)
	movq -112(%rbp), %r15
	cmpq $2, (%r14)
	je main_0_2
	cmpq $3, (%r14)
	je main_0_3
	cmpq $4, (%r14)
	je main_0_4
	jmp _Error_gestion
main_0_2:
	cmpq $2, (%r15)
	je main_0_5
	jmp _Error_gestion
main_0_5:
	movq 8(%r15), %r15
	addq %r15, 8(%r14)
	jmp main_0_8
main_0_3:
	cmpq $3, (%r15)
	je main_0_6
	jmp _Error_gestion
main_0_6:
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
	movq %r15, %r14
	jmp main_0_8
main_0_4:
	cmpq $4, (%r15)
	je main_0_7
	jmp _Error_gestion
main_0_7:
	movq 8(%r14), %rsi
	addq 8(%r15), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r14)
	je main_0_11
	xorq %rdi, %rdi
main_0_9:
	movq 16(%r14,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl main_0_9
main_0_11:
	cmpq $0, 8(%r14)
	je main_0_12
	xorq %rdi, %rdi
main_0_10:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl main_0_10
main_0_12:
	jmp main_0_8
main_0_8:
	xorq %rsi, %rsi
	movq %r14, %rdi
	call print
	subq $8, %rsp
	movq $3, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $3, 8(%rax)
	movq %rax, -128(%rbp)
	movq $0, %rax
	movq -128(%rbp), %rdi
	movq -120(%rbp), %r15
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	movq %rax, -136(%rbp)
	movq $1, %rax
	movq -136(%rbp), %rdi
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $5, 8(%rax)
	movq %rax, -144(%rbp)
	movq $2, %rax
	movq -144(%rbp), %rdi
	movq %rdi, 16(%r15,%rax,8)
	subq $8, %rsp
	movq $2, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -152(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	movq %rax, -160(%rbp)
	movq $0, %rax
	movq -160(%rbp), %rdi
	movq -152(%rbp), %rsi
	movq %rdi, 16(%rsi,%rax,8)
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $2, 8(%rax)
	movq %rax, -168(%rbp)
	movq $1, %rax
	movq -168(%rbp), %rdi
	movq %rdi, 16(%rsi,%rax,8)
	movq %rsi, -152(%rbp)
	movq %r8, -40(%rbp)
	movq -152(%rbp), %r8
	cmpq $2, (%r15)
	je main_0_20
	cmpq $3, (%r15)
	je main_0_21
	cmpq $4, (%r15)
	je main_0_22
	jmp _Error_gestion
main_0_20:
	cmpq $2, (%r8)
	je main_0_23
	jmp _Error_gestion
main_0_23:
	movq 8(%r8), %r8
	addq %r8, 8(%r15)
	jmp main_0_26
main_0_21:
	cmpq $3, (%r8)
	je main_0_24
	jmp _Error_gestion
main_0_24:
	movq 8(%r15), %rsi
	addq 8(%r8), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r8), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r8
	call _my_strcpy
	leaq 16(%r15), %rsi
	leaq 16(%r8), %rdi
	call _my_strcat
	movq %r8, %r15
	jmp main_0_26
main_0_22:
	cmpq $4, (%r8)
	je main_0_25
	jmp _Error_gestion
main_0_25:
	movq 8(%r15), %rsi
	addq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r15)
	je main_0_29
	xorq %rdi, %rdi
main_0_27:
	movq 16(%r15,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl main_0_27
main_0_29:
	cmpq $0, 8(%r15)
	je main_0_30
	xorq %rdi, %rdi
main_0_28:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl main_0_28
main_0_30:
	jmp main_0_26
main_0_26:
	xorq %rsi, %rsi
	movq %r15, %rdi
	call print
	subq $8, %rsp
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $4, 8(%rax)
	subq $8, %rsp
	movq %rax, -176(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $7, 8(%rax)
	subq $8, %rsp
	movq -176(%rbp), %rdi
	movq %rax, -184(%rbp)
	movq %rdi, %rax
	movq -184(%rbp), %r8
	movq %rdi, -176(%rbp)
	movq %r8, %rdi
	pushq -8(%rbp)
	call f_4
	addq $8, %rsp
	subq $8, %rsp
	xorq %rsi, %rsi
	movq %rax, %rdi
	call print
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -16(%rbp), %rsi
	movq -8(%rbp), %rdi
	movq -40(%rbp), %r8
	xorq %rdi, %rdi
	movq $60, %rax
	syscall
	movq %rbp, %rsp
	popq %rbp
	ret
f_4:
	pushq %rbp
	movq %rsp, %rbp
	subq $104, %rsp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq %rsi, -16(%rbp)
	movq %r14, -96(%rbp)
	movq -16(%rbp), %r14
	cmpq $2, (%r14)
	je f_4_3
	cmpq $3, (%r14)
	je f_4_4
	cmpq $4, (%r14)
	je f_4_5
	cmpq $1, (%r14)
	je f_4_6
	movq %r15, -104(%rbp)
	movq -104(%rbp), %r15
	movq %r14, %r15
	jmp f_4_7
f_4_3:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp f_4_7
f_4_6:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp f_4_7
f_4_4:
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
	jmp f_4_7
f_4_5:
	movq 8(%r8), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r8)
	je f_4_9
f_4_8:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r8)
	je f_4_9
	jmp f_4_8
f_4_9:
	movq %rax, %r8
f_4_7:
	movq %r15, -104(%rbp)
	subq $8, %rsp
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je f_4_11
	cmpq $3, (%r15)
	je f_4_12
	cmpq $4, (%r15)
	je f_4_13
	cmpq $1, (%r15)
	je f_4_14
	movq %r9, -48(%rbp)
	movq -112(%rbp), %r9
	movq %r15, %r9
	jmp f_4_15
f_4_11:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_15
f_4_14:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_15
f_4_12:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rcx, -32(%rbp)
	movq %rax, %rcx
	call _my_strcpy
	subq $16, %rcx
	jmp f_4_15
f_4_13:
	movq 8(%rcx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rcx)
	je f_4_17
f_4_16:
	movq 16(%rcx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rcx)
	je f_4_17
	jmp f_4_16
f_4_17:
	movq %rax, %rcx
f_4_15:
	movq %r9, -112(%rbp)
	movq %rcx, %rdi
	movq %r8, %rsi
	movq $1, %rax
	call _my_compare
	movq $1, (%rcx)
	cmpq $0, %rax
	jl f_4_18
	movq $1, 8(%rcx)
	jmp f_4_19
f_4_18:
	movq $0, 8(%rcx)
f_4_19:
	cmpq $0, 8(%rcx)
	je f_4_0
	subq $8, %rsp
	movq $0, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	movq %rax, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq %rbp, %rsp
	popq %rbp
	ret
	jmp f_4_1
f_4_0:
f_4_1:
	subq $8, %rsp
	movq %rax, -120(%rbp)
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq $1, 8(%rax)
	subq $8, %rsp
	movq %rax, -128(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je f_4_23
	cmpq $3, (%r15)
	je f_4_24
	cmpq $4, (%r15)
	je f_4_25
	cmpq $1, (%r15)
	je f_4_26
	movq -136(%rbp), %r8
	movq %r15, %r8
	jmp f_4_27
f_4_23:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_27
f_4_26:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_27
f_4_24:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp f_4_27
f_4_25:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je f_4_29
f_4_28:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je f_4_29
	jmp f_4_28
f_4_29:
	movq %rax, %r9
f_4_27:
	movq %r8, -136(%rbp)
	movq -128(%rbp), %r8
	cmpq $2, (%r8)
	je f_4_30
	cmpq $3, (%r8)
	je f_4_31
	cmpq $4, (%r8)
	je f_4_32
	jmp _Error_gestion
f_4_30:
	cmpq $2, (%r9)
	je f_4_33
	jmp _Error_gestion
f_4_33:
	movq 8(%r9), %r9
	addq %r9, 8(%r8)
	jmp f_4_36
f_4_31:
	cmpq $3, (%r9)
	je f_4_34
	jmp _Error_gestion
f_4_34:
	movq 8(%r8), %rsi
	addq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	leaq 16(%r8), %rsi
	leaq 16(%r9), %rdi
	call _my_strcat
	movq %r9, %r8
	jmp f_4_36
f_4_32:
	cmpq $4, (%r9)
	je f_4_35
	jmp _Error_gestion
f_4_35:
	movq 8(%r8), %rsi
	addq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je f_4_39
	xorq %rdi, %rdi
f_4_37:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl f_4_37
f_4_39:
	cmpq $0, 8(%r8)
	je f_4_40
	xorq %rdi, %rdi
f_4_38:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl f_4_38
f_4_40:
	jmp f_4_36
f_4_36:
	subq $8, %rsp
	movq %r14, -16(%rbp)
	movq -16(%rbp), %r14
	cmpq $2, (%r14)
	je f_4_42
	cmpq $3, (%r14)
	je f_4_43
	cmpq $4, (%r14)
	je f_4_44
	cmpq $1, (%r14)
	je f_4_45
	movq -144(%rbp), %r9
	movq %r14, %r9
	jmp f_4_46
f_4_42:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp f_4_46
f_4_45:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r14), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r14
	jmp f_4_46
f_4_43:
	movq 8(%r14), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r14), %rsi
	leaq 16(%rax), %rdi
	movq %rbx, -72(%rbp)
	movq %rax, %rbx
	call _my_strcpy
	subq $16, %rbx
	jmp f_4_46
f_4_44:
	movq 8(%rbx), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%rbx)
	je f_4_48
f_4_47:
	movq 16(%rbx,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%rbx)
	je f_4_48
	jmp f_4_47
f_4_48:
	movq %rax, %rbx
f_4_46:
	movq %r9, -144(%rbp)
	subq $8, %rsp
	movq %r8, %rax
	movq %rbx, %rdi
	pushq -8(%rbp)
	call f_4
	addq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	movq %rax, -160(%rbp)
	movq $1, %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	subq $8, %rsp
	movq %rax, -168(%rbp)
	movq %r15, -8(%rbp)
	movq -8(%rbp), %r15
	cmpq $2, (%r15)
	je f_4_53
	cmpq $3, (%r15)
	je f_4_54
	cmpq $4, (%r15)
	je f_4_55
	cmpq $1, (%r15)
	je f_4_56
	movq -176(%rbp), %r8
	movq %r15, %r8
	jmp f_4_57
f_4_53:
	movq $16, %rdi
	call _my_malloc
	movq $2, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_57
f_4_56:
	movq $16, %rdi
	call _my_malloc
	movq $1, (%rax)
	movq 8(%r15), %rdi
	movq %rdi, 8(%rax)
	movq %rax, %r15
	jmp f_4_57
f_4_54:
	movq 8(%r15), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r15), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	subq $16, %r9
	jmp f_4_57
f_4_55:
	movq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	xorq %rdi, %rdi
	cmpq %rdi, 8(%r9)
	je f_4_59
f_4_58:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rdi,8)
	incq %rdi
	cmpq %rdi, 8(%r9)
	je f_4_59
	jmp f_4_58
f_4_59:
	movq %rax, %r9
f_4_57:
	movq %r8, -176(%rbp)
	movq $0, %rax
	movq -168(%rbp), %rdi
	movq %r9, 16(%rdi,%rax,8)
	movq %rdi, -168(%rbp)
	movq -160(%rbp), %r8
	movq -168(%rbp), %r9
	cmpq $2, (%r8)
	je f_4_60
	cmpq $3, (%r8)
	je f_4_61
	cmpq $4, (%r8)
	je f_4_62
	jmp _Error_gestion
f_4_60:
	cmpq $2, (%r9)
	je f_4_63
	jmp _Error_gestion
f_4_63:
	movq 8(%r9), %r9
	addq %r9, 8(%r8)
	jmp f_4_66
f_4_61:
	cmpq $3, (%r9)
	je f_4_64
	jmp _Error_gestion
f_4_64:
	movq 8(%r8), %rsi
	addq 8(%r9), %rsi
	leaq 17(,%rsi,1), %rdi
	call _my_malloc
	movq $3, (%rax)
	movq %rsi, 8(%rax)
	leaq 16(%r9), %rsi
	leaq 16(%rax), %rdi
	movq %rax, %r9
	call _my_strcpy
	leaq 16(%r8), %rsi
	leaq 16(%r9), %rdi
	call _my_strcat
	movq %r9, %r8
	jmp f_4_66
f_4_62:
	cmpq $4, (%r9)
	je f_4_65
	jmp _Error_gestion
f_4_65:
	movq 8(%r8), %rsi
	addq 8(%r9), %rsi
	leaq 16(,%rsi,8), %rdi
	call _my_malloc
	movq $4, (%rax)
	movq %rsi, 8(%rax)
	cmpq $0, 8(%r8)
	je f_4_69
	xorq %rdi, %rdi
f_4_67:
	movq 16(%r8,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl f_4_67
f_4_69:
	cmpq $0, 8(%r8)
	je f_4_70
	xorq %rdi, %rdi
f_4_68:
	movq 16(%r9,%rdi,8), %rsi
	movq %rsi, 16(%rax,%rsi,8)
	incq %rdi
	cmpq %rdi, %rsi
	jl f_4_68
f_4_70:
	jmp f_4_66
f_4_66:
	movq %r8, %rax
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
	movq %rbp, %rsp
	popq %rbp
	ret
	movq -96(%rbp), %r14
	movq -104(%rbp), %r15
	movq -40(%rbp), %r8
	movq -48(%rbp), %r9
	movq -32(%rbp), %rcx
	movq -72(%rbp), %rbx
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
	je _implement_context_5_11
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
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $1, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	jmp _implement_context_5_20
_implement_context_5_19:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_11:
	cmpq $3, (%rdi)
	jl _implement_context_5_21
	jg _implement_context_5_22
	cmpq $3, (%rsi)
	jne _implement_context_5_14
	jmp _implement_context_5_13
_implement_context_5_21:
	cmpq $2, (%rsi)
	jg _implement_context_5_14
	jmp _implement_context_5_12
_implement_context_5_22:
	cmpq $4, (%rsi)
	jne _implement_context_5_14
	xorq %rax, %rax
_implement_context_5_24:
	cmpq %rax, 8(%rdi)
	je _implement_context_5_23
	cmpq %rax, 8(%rsi)
	je _implement_context_5_16
	movq 16(%rdi,%rax,8), %rdi
	movq 16(%rsi,%rax,8), %rsi
	pushq %rax
	movq $0, %rax
	call _my_compare
	cmpq $1, %rax
	je _implement_context_5_14
	jg _implement_context_5_16
	popq %rax
	incq %rax
	jmp _implement_context_5_24
_implement_context_5_23:
	cmpq %rax, 8(%rsi)
	je _implement_context_5_15
	jmp _implement_context_5_14
_implement_context_5_12:
	movq 8(%rdi), %rdi
	cmpq %rdi, 8(%rsi)
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
_Error_gestion:
	xorq %rax, %rax
	movq $_Error_message, %rdi
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
