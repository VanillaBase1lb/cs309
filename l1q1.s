	.file	"l1q1.c"
	.text
	.globl	strrev
	.type	strrev, @function
strrev:
.LFB6:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	cmpq	$0, -24(%rbp)
	je	.L2
	movq	-24(%rbp), %rax
	movzbl	(%rax), %eax
	testb	%al, %al
	jne	.L3
.L2:
	movq	-24(%rbp), %rax
	jmp	.L4
.L3:
	movq	-24(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	subl	$1, %eax
	movl	%eax, -8(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L5
.L6:
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
.L5:
	movl	-8(%rbp), %eax
	cmpl	-4(%rbp), %eax
	jg	.L6
	movq	-24(%rbp), %rax
.L4:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	strrev, .-strrev
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter the datatype: Integer(i), Float(f), Double(d)"
.LC1:
	.string	"%s"
	.align 8
.LC2:
	.string	"Enter the value in decimal form:"
.LC3:
	.string	"%d"
.LC4:
	.string	"%f"
	.align 8
.LC6:
	.string	"00000000000000000000000000000000"
.LC9:
	.string	"%c%s%s\n"
.LC10:
	.string	"%lf"
.LC13:
	.string	"invalid input"
	.text
	.globl	main
	.type	main, @function
main:
.LFB7:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$432, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movq	$48, -144(%rbp)
	movq	$0, -136(%rbp)
	movq	$0, -128(%rbp)
	movq	$0, -120(%rbp)
	movq	$0, -112(%rbp)
	movq	$0, -104(%rbp)
	movq	$0, -96(%rbp)
	movq	$0, -88(%rbp)
	movw	$0, -430(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-431(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movzbl	-431(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$105, %eax
	je	.L8
	cmpl	$105, %eax
	jg	.L9
	cmpl	$100, %eax
	je	.L10
	cmpl	$102, %eax
	je	.L11
	jmp	.L9
.L8:
	leaq	-428(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movl	-428(%rbp), %eax
	testl	%eax, %eax
	jns	.L12
	movw	$1, -430(%rbp)
.L12:
	movl	$4, -352(%rbp)
	movl	-428(%rbp), %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -420(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L13
.L16:
	movl	-420(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L14
	movl	$49, %edx
	jmp	.L15
.L14:
	movl	$48, %edx
.L15:
	movl	-416(%rbp), %eax
	cltq
	movb	%dl, -144(%rbp,%rax)
	movl	-420(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -420(%rbp)
	addl	$1, -416(%rbp)
.L13:
	cmpl	$0, -420(%rbp)
	jg	.L16
	movl	-416(%rbp), %eax
	movl	%eax, -412(%rbp)
	jmp	.L17
.L18:
	movl	-412(%rbp), %eax
	cltq
	movb	$48, -144(%rbp,%rax)
	addl	$1, -412(%rbp)
.L17:
	movl	-352(%rbp), %eax
	sall	$3, %eax
	cmpl	%eax, -412(%rbp)
	jl	.L18
	movl	-352(%rbp), %eax
	sall	$3, %eax
	cltq
	movb	$0, -144(%rbp,%rax)
	cmpw	$1, -430(%rbp)
	je	.L19
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L27
.L19:
	movl	$0, -408(%rbp)
	jmp	.L21
.L24:
	movl	-408(%rbp), %eax
	cltq
	movzbl	-144(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L22
	movl	-408(%rbp), %eax
	cltq
	movb	$49, -144(%rbp,%rax)
	jmp	.L23
.L22:
	movl	-408(%rbp), %eax
	cltq
	movb	$48, -144(%rbp,%rax)
.L23:
	addl	$1, -408(%rbp)
.L21:
	movl	-352(%rbp), %eax
	sall	$3, %eax
	cmpl	%eax, -408(%rbp)
	jl	.L24
	movl	$0, -404(%rbp)
	jmp	.L25
.L26:
	movl	-404(%rbp), %eax
	cltq
	movb	$48, -144(%rbp,%rax)
	addl	$1, -404(%rbp)
.L25:
	movl	-404(%rbp), %eax
	cltq
	movzbl	-144(%rbp,%rax), %eax
	cmpb	$49, %al
	je	.L26
	movl	-404(%rbp), %eax
	cltq
	movb	$49, -144(%rbp,%rax)
	leaq	-144(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdi
	call	puts@PLT
	jmp	.L27
.L11:
	leaq	-424(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movss	-424(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	comiss	%xmm1, %xmm0
	jbe	.L106
	movb	$49, -144(%rbp)
	jmp	.L30
.L106:
	movss	-424(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L30
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L30
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L98
.L30:
	movl	$4, -352(%rbp)
	movl	$127, -348(%rbp)
	movss	-424(%rbp), %xmm0
	cvttss2sil	%xmm0, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -420(%rbp)
	movq	$48, -80(%rbp)
	movq	$0, -72(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L33
.L36:
	movl	-420(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L34
	movl	$49, %edx
	jmp	.L35
.L34:
	movl	$48, %edx
.L35:
	movl	-416(%rbp), %eax
	cltq
	movb	%dl, -80(%rbp,%rax)
	movl	-420(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -420(%rbp)
	addl	$1, -416(%rbp)
.L33:
	cmpl	$0, -420(%rbp)
	jg	.L36
	movl	-416(%rbp), %eax
	movl	%eax, -400(%rbp)
	jmp	.L37
.L38:
	movl	-400(%rbp), %eax
	cltq
	movb	$48, -80(%rbp,%rax)
	addl	$1, -400(%rbp)
.L37:
	movl	-400(%rbp), %eax
	cmpl	$31, %eax
	jbe	.L38
	movb	$0, -112(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movss	-424(%rbp), %xmm0
	movss	.LC7(%rip), %xmm1
	andps	%xmm1, %xmm0
	cvtss2sd	%xmm0, %xmm0
	movss	-424(%rbp), %xmm1
	cvttss2sil	%xmm1, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -396(%rbp)
	movq	$48, -272(%rbp)
	movq	$0, -264(%rbp)
	movq	$0, -256(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L39
.L43:
	movss	-396(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -396(%rbp)
	movss	-396(%rbp), %xmm0
	movss	.LC8(%rip), %xmm1
	comiss	%xmm1, %xmm0
	jb	.L107
	movl	-416(%rbp), %eax
	cltq
	movb	$49, -272(%rbp,%rax)
	movss	-396(%rbp), %xmm0
	movss	.LC8(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -396(%rbp)
	jmp	.L42
.L107:
	movl	-416(%rbp), %eax
	cltq
	movb	$48, -272(%rbp,%rax)
.L42:
	addl	$1, -416(%rbp)
.L39:
	movss	-396(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	ja	.L43
	movl	-416(%rbp), %eax
	movl	%eax, -392(%rbp)
	jmp	.L44
.L45:
	movl	-392(%rbp), %eax
	cltq
	movb	$48, -272(%rbp,%rax)
	addl	$1, -392(%rbp)
.L44:
	cmpl	$22, -392(%rbp)
	jle	.L45
	movb	$0, -249(%rbp)
	movl	$0, -388(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L46
.L48:
	addl	$1, -416(%rbp)
.L46:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L47
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L48
.L47:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$49, %al
	jne	.L49
	movl	-416(%rbp), %edx
	movl	$31, %eax
	subl	%edx, %eax
	movl	%eax, -388(%rbp)
	movl	-416(%rbp), %eax
	addl	$1, %eax
	leaq	-80(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-272(%rbp), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movb	$0, -185(%rbp)
	leaq	-208(%rbp), %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L50
.L49:
	movl	$0, -416(%rbp)
	jmp	.L51
.L53:
	addl	$1, -416(%rbp)
.L51:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-272(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L52
	movl	-416(%rbp), %eax
	cltq
	movzbl	-272(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L53
.L52:
	movl	-416(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -388(%rbp)
	movl	-416(%rbp), %eax
	addl	$1, %eax
	leaq	-272(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -384(%rbp)
	jmp	.L54
.L56:
	movl	-384(%rbp), %eax
	cltq
	movzbl	-336(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L55
	movl	-384(%rbp), %eax
	cltq
	movb	$48, -336(%rbp,%rax)
.L55:
	addl	$1, -384(%rbp)
.L54:
	cmpl	$22, -384(%rbp)
	jle	.L56
	movb	$0, -313(%rbp)
.L50:
	movl	-388(%rbp), %edx
	movl	-348(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -380(%rbp)
	movq	$48, -208(%rbp)
	movb	$0, -200(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L57
.L60:
	movl	-380(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L58
	movl	$49, %edx
	jmp	.L59
.L58:
	movl	$48, %edx
.L59:
	movl	-416(%rbp), %eax
	cltq
	movb	%dl, -208(%rbp,%rax)
	movl	-380(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -380(%rbp)
	addl	$1, -416(%rbp)
.L57:
	cmpl	$0, -380(%rbp)
	jg	.L60
	movl	-416(%rbp), %eax
	movl	%eax, -376(%rbp)
	jmp	.L61
.L62:
	movl	-376(%rbp), %eax
	cltq
	movb	$48, -208(%rbp,%rax)
	addl	$1, -376(%rbp)
.L61:
	cmpl	$7, -376(%rbp)
	jle	.L62
	movb	$0, -200(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movzbl	-144(%rbp), %eax
	movsbl	%al, %eax
	leaq	-336(%rbp), %rcx
	leaq	-208(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L27
.L10:
	leaq	-344(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movsd	-344(%rbp), %xmm1
	pxor	%xmm0, %xmm0
	comisd	%xmm1, %xmm0
	jbe	.L108
	movb	$49, -144(%rbp)
	jmp	.L65
.L108:
	movss	-424(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jp	.L65
	pxor	%xmm1, %xmm1
	ucomiss	%xmm1, %xmm0
	jne	.L65
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L98
.L65:
	movl	$8, -352(%rbp)
	movl	$1023, -348(%rbp)
	movsd	-344(%rbp), %xmm0
	cvttsd2sil	%xmm0, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	movl	%eax, -420(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L67
.L70:
	movl	-420(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L68
	movl	$49, %edx
	jmp	.L69
.L68:
	movl	$48, %edx
.L69:
	movl	-416(%rbp), %eax
	cltq
	movb	%dl, -80(%rbp,%rax)
	movl	-420(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -420(%rbp)
	addl	$1, -416(%rbp)
.L67:
	cmpl	$0, -420(%rbp)
	jg	.L70
	movl	-416(%rbp), %eax
	movl	%eax, -372(%rbp)
	jmp	.L71
.L72:
	movl	-372(%rbp), %eax
	cltq
	movb	$48, -80(%rbp,%rax)
	addl	$1, -372(%rbp)
.L71:
	movl	-372(%rbp), %eax
	cmpl	$31, %eax
	jbe	.L72
	movb	$0, -112(%rbp)
	leaq	-80(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-80(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movsd	-344(%rbp), %xmm0
	movq	.LC12(%rip), %xmm1
	andpd	%xmm1, %xmm0
	movsd	-344(%rbp), %xmm1
	cvttsd2sil	%xmm1, %eax
	movl	%eax, %edx
	negl	%edx
	cmovns	%edx, %eax
	pxor	%xmm1, %xmm1
	cvtsi2sdl	%eax, %xmm1
	subsd	%xmm1, %xmm0
	cvtsd2ss	%xmm0, %xmm0
	movss	%xmm0, -368(%rbp)
	movq	$48, -272(%rbp)
	movq	$0, -264(%rbp)
	movq	$0, -256(%rbp)
	movq	$0, -248(%rbp)
	movq	$0, -240(%rbp)
	movq	$0, -232(%rbp)
	movl	$0, -224(%rbp)
	movb	$0, -220(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L73
.L77:
	movss	-368(%rbp), %xmm0
	addss	%xmm0, %xmm0
	movss	%xmm0, -368(%rbp)
	movss	-368(%rbp), %xmm0
	movss	.LC8(%rip), %xmm1
	comiss	%xmm1, %xmm0
	jb	.L109
	movl	-416(%rbp), %eax
	cltq
	movb	$49, -272(%rbp,%rax)
	movss	-368(%rbp), %xmm0
	movss	.LC8(%rip), %xmm1
	subss	%xmm1, %xmm0
	movss	%xmm0, -368(%rbp)
	jmp	.L76
.L109:
	movl	-416(%rbp), %eax
	cltq
	movb	$48, -272(%rbp,%rax)
.L76:
	addl	$1, -416(%rbp)
.L73:
	movss	-368(%rbp), %xmm0
	pxor	%xmm1, %xmm1
	comiss	%xmm1, %xmm0
	ja	.L77
	movl	-416(%rbp), %eax
	movl	%eax, -364(%rbp)
	jmp	.L78
.L79:
	movl	-364(%rbp), %eax
	cltq
	movb	$48, -272(%rbp,%rax)
	addl	$1, -364(%rbp)
.L78:
	cmpl	$51, -364(%rbp)
	jle	.L79
	movb	$0, -220(%rbp)
	movl	$0, -388(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L80
.L82:
	addl	$1, -416(%rbp)
.L80:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L81
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L82
.L81:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-80(%rbp,%rax), %eax
	cmpb	$49, %al
	jne	.L83
	movl	-416(%rbp), %edx
	movl	$31, %eax
	subl	%edx, %eax
	movl	%eax, -388(%rbp)
	movl	-416(%rbp), %eax
	addl	$1, %eax
	leaq	-80(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	leaq	-272(%rbp), %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movb	$0, -156(%rbp)
	leaq	-208(%rbp), %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	jmp	.L84
.L83:
	movl	$0, -416(%rbp)
	jmp	.L85
.L87:
	addl	$1, -416(%rbp)
.L85:
	movl	-416(%rbp), %eax
	cltq
	movzbl	-272(%rbp,%rax), %eax
	cmpb	$48, %al
	jne	.L86
	movl	-416(%rbp), %eax
	cltq
	movzbl	-272(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L87
.L86:
	movl	-416(%rbp), %eax
	subl	$1, %eax
	movl	%eax, -388(%rbp)
	movl	-416(%rbp), %eax
	addl	$1, %eax
	leaq	-272(%rbp), %rdx
	cltq
	addq	%rax, %rdx
	leaq	-336(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movl	$0, -360(%rbp)
	jmp	.L88
.L90:
	movl	-360(%rbp), %eax
	cltq
	movzbl	-336(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L89
	movl	-360(%rbp), %eax
	cltq
	movb	$48, -336(%rbp,%rax)
.L89:
	addl	$1, -360(%rbp)
.L88:
	cmpl	$51, -360(%rbp)
	jle	.L90
	movb	$0, -284(%rbp)
.L84:
	movl	-388(%rbp), %edx
	movl	-348(%rbp), %eax
	addl	%edx, %eax
	movl	%eax, -380(%rbp)
	movq	$48, -208(%rbp)
	movl	$0, -200(%rbp)
	movl	$0, -416(%rbp)
	jmp	.L91
.L94:
	movl	-380(%rbp), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L92
	movl	$49, %edx
	jmp	.L93
.L92:
	movl	$48, %edx
.L93:
	movl	-416(%rbp), %eax
	cltq
	movb	%dl, -208(%rbp,%rax)
	movl	-380(%rbp), %eax
	movl	%eax, %edx
	shrl	$31, %edx
	addl	%edx, %eax
	sarl	%eax
	movl	%eax, -380(%rbp)
	addl	$1, -416(%rbp)
.L91:
	cmpl	$0, -380(%rbp)
	jg	.L94
	movl	-416(%rbp), %eax
	movl	%eax, -356(%rbp)
	jmp	.L95
.L96:
	movl	-356(%rbp), %eax
	cltq
	movb	$48, -208(%rbp,%rax)
	addl	$1, -356(%rbp)
.L95:
	cmpl	$10, -356(%rbp)
	jle	.L96
	movb	$0, -197(%rbp)
	leaq	-208(%rbp), %rax
	movq	%rax, %rdi
	call	strrev
	movq	%rax, %rdx
	leaq	-208(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movzbl	-144(%rbp), %eax
	movsbl	%al, %eax
	leaq	-336(%rbp), %rcx
	leaq	-208(%rbp), %rdx
	movl	%eax, %esi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	jmp	.L27
.L9:
	leaq	.LC13(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	nop
.L27:
	movl	$0, %eax
.L98:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L99
	call	__stack_chk_fail@PLT
.L99:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.section	.rodata
	.align 16
.LC7:
	.long	2147483647
	.long	0
	.long	0
	.long	0
	.align 4
.LC8:
	.long	1065353216
	.align 16
.LC12:
	.long	-1
	.long	2147483647
	.long	0
	.long	0
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
