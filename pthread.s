	.text
	.file	"pthread.c"
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
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rdi
	movq	%rdi, -16(%rbp)
	movl	tls, %edi
	movq	-16(%rbp), %rsi
	callq	pthread_setspecific
	movl	%eax, -20(%rbp)
	cmpl	$0, -20(%rbp)
	je	.LBB0_2
# BB#1:
	movabsq	$.L.str, %rdi
	movq	-16(%rbp), %rsi
	movl	-20(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -36(%rbp)         # 4-byte Spill
.LBB0_2:
	movl	tls, %edi
	callq	pthread_getspecific
	movabsq	$.L.str.1, %rdi
	movq	%rax, -32(%rbp)
	movq	-16(%rbp), %rsi
	movq	-32(%rbp), %rdx
	movb	$0, %al
	callq	printf
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movl	%eax, -40(%rbp)         # 4-byte Spill
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
	movabsq	$tls, %rax
	xorl	%ecx, %ecx
	movl	%ecx, %edx
	movl	$0, -4(%rbp)
	movl	%edi, -8(%rbp)
	movq	%rsi, -16(%rbp)
	movl	$8, -20(%rbp)
	movq	%rax, %rdi
	movq	%rdx, %rsi
	callq	pthread_key_create
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB1_2
# BB#1:
	movabsq	$.L.str.2, %rdi
	movl	-36(%rbp), %esi
	movb	$0, %al
	callq	printf
	movl	%eax, -60(%rbp)         # 4-byte Spill
.LBB1_2:
	movabsq	$.L.str.3, %rdi
	movb	$0, %al
	callq	printf
	movslq	-20(%rbp), %rdi
	shlq	$3, %rdi
	movl	%eax, -64(%rbp)         # 4-byte Spill
	callq	malloc
	movq	%rax, -32(%rbp)
	movl	$0, -40(%rbp)
.LBB1_3:                                # =>This Inner Loop Header: Depth=1
	movl	-40(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_8
# BB#4:                                 #   in Loop: Header=BB1_3 Depth=1
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
	je	.LBB1_6
# BB#5:                                 #   in Loop: Header=BB1_3 Depth=1
	movabsq	$.L.str.4, %rdi
	movl	-40(%rbp), %esi
	movl	-36(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -76(%rbp)         # 4-byte Spill
.LBB1_6:                                #   in Loop: Header=BB1_3 Depth=1
	jmp	.LBB1_7
.LBB1_7:                                #   in Loop: Header=BB1_3 Depth=1
	movl	-40(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -40(%rbp)
	jmp	.LBB1_3
.LBB1_8:
	movl	$0, -44(%rbp)
.LBB1_9:                                # =>This Inner Loop Header: Depth=1
	movl	-44(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jge	.LBB1_14
# BB#10:                                #   in Loop: Header=BB1_9 Depth=1
	leaq	-56(%rbp), %rsi
	movq	-32(%rbp), %rax
	movslq	-44(%rbp), %rcx
	movq	(%rax,%rcx,8), %rdi
	callq	pthread_join
	movl	%eax, -36(%rbp)
	cmpl	$0, -36(%rbp)
	je	.LBB1_12
# BB#11:                                #   in Loop: Header=BB1_9 Depth=1
	movabsq	$.L.str.5, %rdi
	movl	-44(%rbp), %esi
	movl	-36(%rbp), %edx
	movb	$0, %al
	callq	printf
	movl	%eax, -80(%rbp)         # 4-byte Spill
.LBB1_12:                               #   in Loop: Header=BB1_9 Depth=1
	jmp	.LBB1_13
.LBB1_13:                               #   in Loop: Header=BB1_9 Depth=1
	movl	-44(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -44(%rbp)
	jmp	.LBB1_9
.LBB1_14:
	movabsq	$.L.str.6, %rdi
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
	.local	tls
	.comm	tls,4,4
	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"Error: tls setting (thread %lu) failed: %d\n"
	.size	.L.str, 44

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"tls getting (thread %lu) got: %lu\n"
	.size	.L.str.1, 35

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"Error: tls creation failed: %d\n"
	.size	.L.str.2, 32

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"Setting up threads.\n"
	.size	.L.str.3, 21

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"Error: thread creation (%d) failed: %d\n"
	.size	.L.str.4, 40

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"Error: thread join (%d) failed: %d\n"
	.size	.L.str.5, 36

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"Joined all threads.\n"
	.size	.L.str.6, 21


	.ident	"clang version 4.0.0-1ubuntu1 (tags/RELEASE_400/rc1)"
	.section	".note.GNU-stack","",@progbits
