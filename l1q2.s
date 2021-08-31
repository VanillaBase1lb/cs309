	.file	"l1q2.c"
	.text
	.globl	isInteger
	.type	isInteger, @function
isInteger:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movss	%xmm0, -20(%rbp)
	movss	-20(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, -8(%rbp)
	pxor	%xmm1, %xmm1
	cvtsi2ssl	-8(%rbp), %xmm1
	movss	-20(%rbp), %xmm0
	subss	%xmm1, %xmm0
	movss	%xmm0, -4(%rbp)
	movss	-4(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	jbe	.L6
	movl	$0, %eax
	jmp	.L4
.L6:
	movl	$1, %eax
.L4:
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	isInteger, .-isInteger
	.globl	strrev
	.type	strrev, @function
strrev:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L8
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L9
.L8:
	movq	-24(%rbp), %rax
	jmp	.L10
.L9:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L11
.L12:
	movl	-8(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	movb	%al, -9(%rbp)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movl	-8(%rbp), %edx
	movslq	%edx, %rcx
	movq	-24(%rbp), %rdx
	addq	%rcx, %rdx
	movzbl	(%rax), %eax
	movb	%al, (%rdx)
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movzbl	-9(%rbp), %eax
	movb	%al, (%rdx)
	subl	$1, -8(%rbp)
	addl	$1, -4(%rbp)
.L11:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L12
	movq	-24(%rbp), %rax
.L10:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	strrev, .-strrev
	.globl	convertint
	.type	convertint, @function
convertint:
.LFB8:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movl	%edi, -116(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$48, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -106(%rbp)
	cmpl	$0, -116(%rbp)
	jns	.L14
	movw	$1, -106(%rbp)
.L14:
	movl	$4, -84(%rbp)
	movl	-116(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -104(%rbp)
	movl	$0, -100(%rbp)
	jmp	.L15
.L18:
	movl	-104(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L16
	movl	$49, %edx
	jmp	.L17
.L16:
	movl	$48, %edx
.L17:
	movl	-100(%rbp), %eax
	cltq
	movb	%dl, -80(%rbp,%rax)
	movl	-104(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -104(%rbp)
	addl	$1, -100(%rbp)
.L15:
	cmpl	$0, -104(%rbp)
	jg	.L18
	movl	-100(%rbp), %eax
	movl	%eax, -96(%rbp)
	jmp	.L19
.L20:
	movl	-96(%rbp), %eax
	cltq
	movb	$48, -80(%rbp,%rax)
	addl	$1, -96(%rbp)
.L19:
	movl	-84(%rbp), %eax
	sall	$3, %eax
	cmpl	%eax, -96(%rbp)
	jl	.L20
	movl	-84(%rbp), %eax
	sall	$3, %eax
	cltq
	movb	$0, -80(%rbp,%rax)
	cmpw	$1, -106(%rbp)
	je	.L21
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L22
.L21:
	movl	$0, -92(%rbp)
	jmp	.L23
.L26:
	movl	-92(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L24
	movl	-92(%rbp), %eax
	cltq
	movb	$49, -80(%rbp,%rax)
	jmp	.L25
.L24:
	movl	-92(%rbp), %eax
	cltq
	movb	$48, -80(%rbp,%rax)
.L25:
	addl	$1, -92(%rbp)
.L23:
	movl	-84(%rbp), %eax
	sall	$3, %eax
	cmpl	%eax, -92(%rbp)
	jl	.L26
	movl	$0, -88(%rbp)
	jmp	.L27
.L28:
	movl	-88(%rbp), %eax
	cltq
	movb	$48, -80(%rbp,%rax)
	addl	$1, -88(%rbp)
.L27:
	movl	-88(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$49, %al
	je	.L28
	movl	-88(%rbp), %eax
	cltq
	movb	$49, -80(%rbp,%rax)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdi
	call	puts@PLT
.L22:
	nop
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L29
	call	__stack_chk_fail@PLT
.L29:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	convertint, .-convertint
	.section	.rodata
	.align 8
.LC1:
	.string	"00000000000000000000000000000000"
.LC4:
	.string	"%c%s%s\n"
	.text
	.globl	convertfloat
	.type	convertfloat, @function
convertfloat:
.LFB9:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$256, %rsp
	movss	%xmm0, -244(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$48, -96(%rbp)
	movq	$0, -88(%rbp)
	movq	$0, -80(%rbp)
	movq	$0, -72(%rbp)
	movb	$0, -64(%rbp)
	movw	$0, -238(%rbp)
	pxor	%xmm0, %xmm0
	comiss	-244(%rbp), %xmm0
	jbe	.L70
	movb	$49, -96(%rbp)
	jmp	.L33
.L70:
	pxor	%xmm0, %xmm0
	ucomiss	-244(%rbp), %xmm0
	jp	.L33
	pxor	%xmm0, %xmm0
	ucomiss	-244(%rbp), %xmm0
	jne	.L33
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L30
.L33:
	movl	$4, -200(%rbp)
	movl	$127, -196(%rbp)
	movss	-244(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -232(%rbp)
	movq	$48, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movb	$0, -16(%rbp)
	movq	$48, -192(%rbp)
	movq	$0, -184(%rbp)
	movq	$0, -176(%rbp)
	movl	$0, -236(%rbp)
	jmp	.L36
.L39:
	movl	-232(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L37
	movl	$49, %edx
	jmp	.L38
.L37:
	movl	$48, %edx
.L38:
	movl	-236(%rbp), %eax
	cltq
	movb	%dl, -48(%rbp,%rax)
	movl	-232(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -232(%rbp)
	addl	$1, -236(%rbp)
.L36:
	cmpl	$0, -232(%rbp)
	jg	.L39
	movl	-236(%rbp), %eax
	movl	%eax, -228(%rbp)
	jmp	.L40
.L41:
	movl	-228(%rbp), %eax
	cltq
	movb	$48, -48(%rbp,%rax)
	addl	$1, -228(%rbp)
.L40:
	movl	-228(%rbp), %eax
	cmpl	$31, %eax
	jbe	.L41
	movb	$0, -64(%rbp)
	leaq	-48(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-48(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movss	-244(%rbp), %xmm0
	movss	.LC2(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movss	-244(%rbp), %xmm1
	cvttss2sil	%xmm1, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -224(%rbp)
	movq	$48, -160(%rbp)
	movq	$0, -152(%rbp)
	movq	$0, -144(%rbp)
	movl	$0, -236(%rbp)
	jmp	.L42
.L46:
	movss	-224(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -224(%rbp)
	movss	-224(%rbp), %xmm0
	movss	.LC3(%rip), %xmm1
	comiss	%xmm1, %xmm0
	jb	.L71
	movl	-236(%rbp), %eax
	cltq
	movb	$49, -160(%rbp,%rax)
	movss	-224(%rbp), %xmm0
	movss	.LC3(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -224(%rbp)
	jmp	.L45
.L71:
	movl	-236(%rbp), %eax
	cltq
	movb	$48, -160(%rbp,%rax)
.L45:
	addl	$1, -236(%rbp)
.L42:
	movss	-224(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	ja	.L46
	movl	-236(%rbp), %eax
	movl	%eax, -220(%rbp)
	jmp	.L47
.L48:
	movl	-220(%rbp), %eax
	cltq
	movb	$48, -160(%rbp,%rax)
	addl	$1, -220(%rbp)
.L47:
	cmpl	$22, -220(%rbp)
	jle	.L48
	movb	$0, -137(%rbp)
	movl	$0, -216(%rbp)
	movl	$0, -236(%rbp)
	jmp	.L49
.L51:
	addl	$1, -236(%rbp)
.L49:
	movl	-236(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L50
	movl	-236(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L51
.L50:
	movl	-236(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$49, %al
	jne	.L52
	movl	-236(%rbp), %edx
	movl	$31, %eax
	subl	%edx, %eax
	movl	%eax, -216(%rbp)
	movl	-236(%rbp), %eax
	addl	$1, %eax
	leaq	-48(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-160(%rbp), %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movb	$0, -105(%rbp)
	leaq	-128(%rbp), %rdx
	leaq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L53
.L52:
	movl	$0, -236(%rbp)
	jmp	.L54
.L56:
	addl	$1, -236(%rbp)
.L54:
	movl	-236(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L55
	movl	-236(%rbp), %eax
	cltq
	movzbl	-160(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L56
.L55:
	movl	-236(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -216(%rbp)
	movl	-236(%rbp), %eax
	addl	$1, %eax
	leaq	-160(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-192(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -212(%rbp)
	jmp	.L57
.L59:
	movl	-212(%rbp), %eax
	cltq
	movzbl	-192(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L58
	movl	-212(%rbp), %eax
	cltq
	movb	$48, -192(%rbp,%rax)
.L58:
	addl	$1, -212(%rbp)
.L57:
	cmpl	$22, -212(%rbp)
	jle	.L59
	movb	$0, -169(%rbp)
.L53:
	movl	-216(%rbp), %edx
	movl	-196(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -208(%rbp)
	movq	$48, -128(%rbp)
	movb	$0, -120(%rbp)
	movl	$0, -236(%rbp)
	jmp	.L60
.L63:
	movl	-208(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L61
	movl	$49, %edx
	jmp	.L62
.L61:
	movl	$48, %edx
.L62:
	movl	-236(%rbp), %eax
	cltq
	movb	%dl, -128(%rbp,%rax)
	movl	-208(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -208(%rbp)
	addl	$1, -236(%rbp)
.L60:
	cmpl	$0, -208(%rbp)
	jg	.L63
	movl	-236(%rbp), %eax
	movl	%eax, -204(%rbp)
	jmp	.L64
.L65:
	movl	-204(%rbp), %eax
	cltq
	movb	$48, -128(%rbp,%rax)
	addl	$1, -204(%rbp)
.L64:
	cmpl	$7, -204(%rbp)
	jle	.L65
	movb	$0, -120(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-128(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movzbl	-96(%rbp), %eax
	movsbl	%al, %eax
	leaq	-192(%rbp), %rcx
	leaq	-128(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L30:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L66
	call	__stack_chk_fail@PLT
.L66:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	convertfloat, .-convertfloat
	.section	.rodata
	.align 8
.LC5:
	.string	"The input should be a 32 bit binary nimber."
	.align 8
.LC6:
	.string	"Enter the type of 1st number and 2nd number: "
.LC7:
	.string	"%c %c"
.LC8:
	.string	"Enter first number: "
.LC9:
	.string	"%s"
.LC10:
	.string	"Enter second number: "
	.align 8
.LC12:
	.string	"Decimal Equivalent of 1st Input: %f\n"
	.align 8
.LC15:
	.string	"Decimal Equivalent of 2nd Input: %f\n"
.LC16:
	.string	"%0.0f\n"
.LC17:
	.string	"%f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$224, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-221(%rbp), %rdx
	leaq	-222(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-96(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	leaq	-48(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	$0, -152(%rbp)
	movl	$0, -148(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -220(%rbp)
	movl	$0, -144(%rbp)
	pxor	%xmm0, %xmm0
	movss	%xmm0, -216(%rbp)
	movl	$0, -212(%rbp)
	movzbl	-222(%rbp), %eax
	cmpb	$105, %al
	jne	.L73
	movzbl	-96(%rbp), %eax
	cmpb	$48, %al
	jne	.L73
	movl	$1, -208(%rbp)
	jmp	.L74
.L77:
	movl	-208(%rbp), %eax
	cltq
	movzbl	-96(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L75
	movss	-220(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
	jmp	.L76
.L75:
	movl	$31, %eax
	subl	-208(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-220(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -220(%rbp)
.L76:
	addl	$1, -208(%rbp)
.L74:
	cmpl	$31, -208(%rbp)
	jle	.L77
	pxor	%xmm2, %xmm2
	cvtss2sd	-220(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L73:
	movzbl	-222(%rbp), %eax
	cmpb	$105, %al
	jne	.L78
	movzbl	-96(%rbp), %eax
	cmpb	$49, %al
	jne	.L78
	movss	.LC13(%rip), %xmm0
	movss	%xmm0, -220(%rbp)
	movl	$1, -204(%rbp)
	jmp	.L79
.L82:
	movl	-204(%rbp), %eax
	cltq
	movzbl	-96(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L80
	movss	-220(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
	jmp	.L81
.L80:
	movl	$31, %eax
	subl	-204(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-220(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -220(%rbp)
.L81:
	addl	$1, -204(%rbp)
.L79:
	cmpl	$31, -204(%rbp)
	jle	.L82
	pxor	%xmm3, %xmm3
	cvtss2sd	-220(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L78:
	movzbl	-222(%rbp), %eax
	cmpb	$102, %al
	jne	.L83
	movl	$1, -200(%rbp)
	jmp	.L84
.L87:
	movl	-200(%rbp), %eax
	cltq
	movzbl	-96(%rbp,%rax), %eax
	cmpb	$48, %al
	je	.L86
	movl	$8, %eax
	subl	-200(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-212(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -212(%rbp)
.L86:
	addl	$1, -200(%rbp)
.L84:
	cmpl	$8, -200(%rbp)
	jle	.L87
	movb	$49, -128(%rbp)
	movl	$9, -196(%rbp)
	jmp	.L88
.L89:
	movl	-196(%rbp), %eax
	leal	-8(%rax), %ecx
	movl	-196(%rbp), %eax
	cltq
	movzbl	-96(%rbp,%rax), %edx
	movslq	%ecx, %rax
	movb	%dl, -128(%rbp,%rax)
	addl	$1, -196(%rbp)
.L88:
	cmpl	$31, -196(%rbp)
	jle	.L89
	movl	-212(%rbp), %eax
	subl	$126, %eax
	movl	%eax, -140(%rbp)
	movl	$0, -192(%rbp)
	jmp	.L90
.L93:
	movl	-192(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L91
	movss	-220(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
	jmp	.L92
.L91:
	movl	-140(%rbp), %eax
	subl	-192(%rbp), %eax
	subl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-220(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -220(%rbp)
.L92:
	addl	$1, -192(%rbp)
.L90:
	movl	-192(%rbp), %eax
	cmpl	-140(%rbp), %eax
	jl	.L93
	movl	-140(%rbp), %eax
	movl	%eax, -188(%rbp)
	movl	$1, -184(%rbp)
	jmp	.L94
.L97:
	movl	-188(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L95
	movss	-220(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
	jmp	.L96
.L95:
	movl	-184(%rbp), %eax
	negl	%eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-220(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -220(%rbp)
.L96:
	addl	$1, -188(%rbp)
	addl	$1, -184(%rbp)
.L94:
	cmpl	$22, -188(%rbp)
	jle	.L97
	movzbl	-96(%rbp), %eax
	cmpb	$48, %al
	je	.L99
	movss	-220(%rbp), %xmm0
	movss	.LC14(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -220(%rbp)
.L99:
	movb	$0, -104(%rbp)
	pxor	%xmm4, %xmm4
	cvtss2sd	-220(%rbp), %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L83:
	movzbl	-221(%rbp), %eax
	cmpb	$105, %al
	jne	.L100
	movzbl	-48(%rbp), %eax
	cmpb	$48, %al
	jne	.L100
	movl	$1, -180(%rbp)
	jmp	.L101
.L104:
	movl	-180(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L102
	movss	-216(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -216(%rbp)
	jmp	.L103
.L102:
	movl	$31, %eax
	subl	-180(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-216(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -216(%rbp)
.L103:
	addl	$1, -180(%rbp)
.L101:
	cmpl	$31, -180(%rbp)
	jle	.L104
	pxor	%xmm5, %xmm5
	cvtss2sd	-216(%rbp), %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L100:
	movzbl	-221(%rbp), %eax
	cmpb	$105, %al
	jne	.L105
	movzbl	-48(%rbp), %eax
	cmpb	$49, %al
	jne	.L105
	movss	.LC13(%rip), %xmm0
	movss	%xmm0, -216(%rbp)
	movl	$1, -176(%rbp)
	jmp	.L106
.L109:
	movl	-176(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L107
	movss	-216(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -216(%rbp)
	jmp	.L108
.L107:
	movl	$31, %eax
	subl	-176(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-216(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -216(%rbp)
.L108:
	addl	$1, -176(%rbp)
.L106:
	cmpl	$31, -176(%rbp)
	jle	.L109
	pxor	%xmm6, %xmm6
	cvtss2sd	-216(%rbp), %xmm6
	movq	%xmm6, %rax
	movq	%rax, %xmm0
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L105:
	movzbl	-221(%rbp), %eax
	cmpb	$102, %al
	jne	.L110
	movl	$0, -212(%rbp)
	movl	$1, -172(%rbp)
	jmp	.L111
.L114:
	movl	-172(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %eax
	cmpb	$48, %al
	je	.L113
	movl	$8, %eax
	subl	-172(%rbp), %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtsi2sdl	-212(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, -212(%rbp)
.L113:
	addl	$1, -172(%rbp)
.L111:
	cmpl	$8, -172(%rbp)
	jle	.L114
	movb	$49, -128(%rbp)
	movl	$9, -168(%rbp)
	jmp	.L115
.L116:
	movl	-168(%rbp), %eax
	leal	-8(%rax), %ecx
	movl	-168(%rbp), %eax
	cltq
	movzbl	-48(%rbp,%rax), %edx
	movslq	%ecx, %rax
	movb	%dl, -128(%rbp,%rax)
	addl	$1, -168(%rbp)
.L115:
	cmpl	$31, -168(%rbp)
	jle	.L116
	movl	-212(%rbp), %eax
	subl	$126, %eax
	movl	%eax, -140(%rbp)
	movl	$0, -164(%rbp)
	jmp	.L117
.L120:
	movl	-164(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L118
	movss	-216(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -216(%rbp)
	jmp	.L119
.L118:
	movl	-140(%rbp), %eax
	subl	-164(%rbp), %eax
	subl	$1, %eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-216(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -216(%rbp)
.L119:
	addl	$1, -164(%rbp)
.L117:
	movl	-164(%rbp), %eax
	cmpl	-140(%rbp), %eax
	jl	.L120
	movl	-140(%rbp), %eax
	movl	%eax, -160(%rbp)
	movl	$1, -156(%rbp)
	jmp	.L121
.L124:
	movl	-160(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L122
	movss	-216(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	addss	%xmm1, %xmm0
	movss	%xmm0, -216(%rbp)
	jmp	.L123
.L122:
	movl	-156(%rbp), %eax
	negl	%eax
	pxor	%xmm0, %xmm0
	cvtsi2sdl	%eax, %xmm0
	movq	.LC11(%rip), %rax
	movapd	%xmm0, %xmm1
	movq	%rax, %xmm0
	call	pow@PLT
	pxor	%xmm1, %xmm1
	cvtss2sd	-216(%rbp), %xmm1
	addsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -216(%rbp)
.L123:
	addl	$1, -160(%rbp)
	addl	$1, -156(%rbp)
.L121:
	cmpl	$22, -160(%rbp)
	jle	.L124
	movzbl	-48(%rbp), %eax
	cmpb	$48, %al
	je	.L126
	movss	-216(%rbp), %xmm0
	movss	.LC14(%rip), %xmm1
	xorps	%xmm1, %xmm0
	movss	%xmm0, -216(%rbp)
.L126:
	movb	$0, -104(%rbp)
	pxor	%xmm7, %xmm7
	cvtss2sd	-216(%rbp), %xmm7
	movq	%xmm7, %rax
	movq	%rax, %xmm0
	leaq	.LC15(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L110:
	movss	-220(%rbp), %xmm0
	addss	-216(%rbp), %xmm0
	movss	%xmm0, -136(%rbp)
	movss	-220(%rbp), %xmm0
	mulss	-216(%rbp), %xmm0
	movss	%xmm0, -132(%rbp)
	movl	-136(%rbp), %eax
	movd	%eax, %xmm0
	call	isInteger
	testb	%al, %al
	je	.L127
	pxor	%xmm2, %xmm2
	cvtss2sd	-136(%rbp), %xmm2
	movq	%xmm2, %rax
	movq	%rax, %xmm0
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L128
.L127:
	pxor	%xmm3, %xmm3
	cvtss2sd	-136(%rbp), %xmm3
	movq	%xmm3, %rax
	movq	%rax, %xmm0
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L128:
	movl	-132(%rbp), %eax
	movd	%eax, %xmm0
	call	isInteger
	testb	%al, %al
	je	.L129
	pxor	%xmm4, %xmm4
	cvtss2sd	-132(%rbp), %xmm4
	movq	%xmm4, %rax
	movq	%rax, %xmm0
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
	jmp	.L130
.L129:
	pxor	%xmm5, %xmm5
	cvtss2sd	-132(%rbp), %xmm5
	movq	%xmm5, %rax
	movq	%rax, %xmm0
	leaq	.LC17(%rip), %rax
	movq	%rax, %rdi
	movl	$1, %eax
	call	printf@PLT
.L130:
	movl	$0, %eax
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L132
	call	__stack_chk_fail@PLT
.L132:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC2:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 4
.LC3:
	.long	1065353216
	.align 8
.LC11:
	.long	0
	.long	1073741824
	.align 4
.LC13:
	.long	-822083584
	.align 16
.LC14:
	.long	-2147483648
	.long	0
	.long	0
	.long	0
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
