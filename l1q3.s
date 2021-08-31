	.file	"l1q3.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"Enter whether to convert from BCD(b) or decimal(d):"
.LC1:
	.string	"%c"
.LC2:
	.string	"Input:"
.LC3:
	.string	"%s"
.LC4:
	.string	"invalid numerical input"
	.align 8
.LC5:
	.string	"bcd input length should be multiple of 4"
.LC6:
	.string	"%d"
.LC7:
	.string	"invalid bcd input"
	.align 8
.LC8:
	.string	"invalid input, only 'b' or 'd'"
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
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
	movl	$808464432, -192(%rbp)
	movb	$0, -188(%rbp)
	movl	$825241648, -187(%rbp)
	movb	$0, -183(%rbp)
	movl	$808529968, -182(%rbp)
	movb	$0, -178(%rbp)
	movl	$825307184, -177(%rbp)
	movb	$0, -173(%rbp)
	movl	$808464688, -172(%rbp)
	movb	$0, -168(%rbp)
	movl	$825241904, -167(%rbp)
	movb	$0, -163(%rbp)
	movl	$808530224, -162(%rbp)
	movb	$0, -158(%rbp)
	movl	$825307440, -157(%rbp)
	movb	$0, -153(%rbp)
	movl	$808464433, -152(%rbp)
	movb	$0, -148(%rbp)
	movl	$825241649, -147(%rbp)
	movb	$0, -143(%rbp)
	movq	$0, -64(%rbp)
	movq	$0, -56(%rbp)
	movq	$0, -48(%rbp)
	movq	$0, -40(%rbp)
	movq	$0, -32(%rbp)
	movq	$0, -24(%rbp)
	movw	$0, -16(%rbp)
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-211(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	leaq	-128(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_scanf@PLT
	movzbl	-211(%rbp), %eax
	movsbl	%al, %eax
	cmpl	$98, %eax
	je	.L2
	cmpl	$100, %eax
	jne	.L3
	movl	$0, -208(%rbp)
	jmp	.L4
.L7:
	call	__ctype_b_loc@PLT
	movq	(%rax), %rdx
	movl	-208(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	movsbq	%al, %rax
	addq	%rax, %rax
	addq	%rdx, %rax
	movzwl	(%rax), %eax
	movzwl	%ax, %eax
	andl	$2048, %eax
	testl	%eax, %eax
	jne	.L5
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L16
.L5:
	movl	-208(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	movsbl	%al, %eax
	subl	$48, %eax
	movl	%eax, -196(%rbp)
	leaq	-192(%rbp), %rcx
	movl	-196(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	addl	$1, -208(%rbp)
.L4:
	movl	-208(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L7
	jmp	.L8
.L2:
	leaq	-128(%rbp), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	andl	$3, %eax
	testq	%rax, %rax
	je	.L9
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L16
.L9:
	movl	$0, -204(%rbp)
	jmp	.L10
.L15:
	movw	$0, -210(%rbp)
	leaq	-128(%rbp), %rdx
	movl	-204(%rbp), %eax
	cltq
	leaq	(%rdx,%rax), %rcx
	leaq	-133(%rbp), %rax
	movl	$4, %edx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	strncpy@PLT
	movl	$0, -200(%rbp)
	jmp	.L11
.L13:
	leaq	-192(%rbp), %rcx
	movl	-200(%rbp), %eax
	movslq	%eax, %rdx
	movq	%rdx, %rax
	salq	$2, %rax
	addq	%rdx, %rax
	leaq	(%rcx,%rax), %rdx
	leaq	-133(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L12
	movl	-200(%rbp), %edx
	leaq	-135(%rbp), %rax
	leaq	.LC6(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	leaq	-135(%rbp), %rdx
	leaq	-64(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcat@PLT
	movw	$1, -210(%rbp)
.L12:
	addl	$1, -200(%rbp)
.L11:
	cmpl	$9, -200(%rbp)
	jle	.L13
	cmpw	$0, -210(%rbp)
	jne	.L14
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L16
.L14:
	addl	$4, -204(%rbp)
.L10:
	movl	-204(%rbp), %eax
	cltq
	movzbl	-128(%rbp,%rax), %eax
	testb	%al, %al
	jne	.L15
	jmp	.L8
.L3:
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	jmp	.L16
.L8:
	leaq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
.L16:
	movq	-8(%rbp), %rdx
	subq	%fs:40, %rdx
	je	.L17
	call	__stack_chk_fail@PLT
.L17:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.1.0"
	.section	.note.GNU-stack,"",@progbits
