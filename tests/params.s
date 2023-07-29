	.file	"params.c"
	.text
	.globl	main
	.type	main, @function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$4, %esp
	movl	$4, %eax
	subl	$1, %eax
	addl	$32, %eax
	movl	$4, %ecx
	movl	$0, %edx
	divl	%ecx
	sall	$2, %eax
	movl	%eax, %ecx
	andl	$-4096, %ecx
	movl	%esp, %edx
	subl	%ecx, %edx
.L2:
	cmpl	%edx, %esp
	je	.L3
	subl	$4096, %esp
	orl	$0, 4092(%esp)
	jmp	.L2
.L3:
	movl	%eax, %edx
	andl	$4095, %edx
	subl	%edx, %esp
	movl	%eax, %edx
	andl	$4095, %edx
	testl	%edx, %edx
	je	.L4
	andl	$4095, %eax
	subl	$4, %eax
	addl	%esp, %eax
	orl	$0, (%eax)
.L4:
	movl	%esp, %eax
	addl	$15, %eax
	shrl	$4, %eax
	sall	$4, %eax
	movl	%eax, -4(%ebp)
	movl	-4(%ebp), %eax
	addl	$5, %eax
	movb	$-86, (%eax)
	movl	$0, %eax
	leave
	ret
	.size	main, .-main
	.section	.note.GNU-stack,"",@progbits
