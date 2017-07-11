	.text
	.file	"tls.c"
	.globl	thread_proc
	.p2align	4, 0x90
	.type	thread_proc,@function
thread_proc:                            # @thread_proc
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi0:
	.cfi_def_cfa_offset 16
.Lcfi1:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi2:
	.cfi_def_cfa_register %rbp
	subq	$48, %rsp
	movabsq	$.L.str, %rax
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movq	-16(%rbp), %rdi
	movq	%rdi, %fs:tls@TPOFF
	movq	%fs:tls@TPOFF, %rdi
	movq	%rdi, -32(%rbp)
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rdx
	movq	%rax, %rdi
	movb	$0, %al
	callq	printf
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movl	%eax, -36(%rbp)         # 4-byte Spill
	movq	%rdx, %rax
	addq	$48, %rsp
	popq	%rbp
	retq
.Lfunc_end0:
	.size	thread_proc, .Lfunc_end0-thread_proc
	.cfi_endproc

	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rbp
.Lcfi3:
	.cfi_def_cfa_offset 16
.Lcfi4:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
.Lcfi5:
	.cfi_def_cfa_register %rbp
	subq	$96, %rsp
	movabsq	$.L.str.1, %rax
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$8, -20(%rbp)
	movq	%rax, %rdi
	movb	$0, %al
	callq	printf
	movslq	-20(%rbp), %rsi
	shlq	$3, %rsi
	movq	%rsi, %rdi
	movl	%eax, -60(%rbp)         # 4-byte Spill
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -40(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_6
# BB#2:                                 #   in Loop: Header=BB1_1 Depth=1
	xorl	%eax, %eax
	movl	%eax, %esi
	movabsq	$thread_proc, %rdx
	movq	-32(%rbp), %rcx
	movslq	-40(%rbp), %rdi
	shlq	$3, %rdi
	addq	%rdi, %rcx
	movslq	-40(%rbp), %rdi
	movq	%rdi, -72(%rbp)         # 8-byte Spill
	movq	%rcx, %rdi
	movq	-72(%rbp), %rcx         # 8-byte Reload
	callq	pthread_create
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB1_4
# BB#3:                                 #   in Loop: Header=BB1_1 Depth=1
	movabsq	$.L.str.2, %rdi
	movl	-40(%rbp), %esi
	movl	-36(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -76(%rbp)         # 4-byte Spill
.LBB1_4:                                #   in Loop: Header=BB1_1 Depth=1
	jmp	.LBB1_5
.LBB1_5:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB1_1
.LBB1_6:
	movl	$0, -44(%rbp)
.LBB1_7:                                # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_12
# BB#8:                                 #   in Loop: Header=BB1_7 Depth=1
	leaq	-56(%rbp), %rsi
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	pthread_join
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB1_10
# BB#9:                                 #   in Loop: Header=BB1_7 Depth=1
	movabsq	$.L.str.3, %rdi
	movl	-44(%rbp), %esi
	movl	-36(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -80(%rbp)         # 4-byte Spill
.LBB1_10:                               #   in Loop: Header=BB1_7 Depth=1
	jmp	.LBB1_11
.LBB1_11:                               #   in Loop: Header=BB1_7 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB1_7
.LBB1_12:
	movabsq	$.L.str.4, %rdi
	movb	$0, %al
	callq	printf
	xorl	%ecx, %ecx
	movl	%eax, -84(%rbp)         # 4-byte Spill
	movl	%ecx, %eax
	addq	$96, %rsp
	popq	%rbp
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc

	.type	tls,@object             # @tls
	.section	.tbss,"awT",@nobits
	.p2align	3
tls:
	.quad	0                       # 0x0
	.size	tls, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"tls getting (thread %lu) got: %lu\n"
	.size	.L.str, 35

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"Setting up threads.\n"
	.size	.L.str.1, 21

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Error: thread creation (%d) failed: %d\n"
	.size	.L.str.2, 40

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"Error: thread join (%d) failed: %d\n"
	.size	.L.str.3, 36

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"Joined all threads.\n"
	.size	.L.str.4, 21


	.ident	"clang version 4.0.0-1ubuntu1 (tags/RELEASE_400/rc1)"
	.section	".note.GNU-stack","",@progbits
