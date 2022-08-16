	.text
	.file	"silver.silver"
	.globl	"=="                            # -- Begin function ==
	.p2align	4, 0x90
	.type	"==",@function
"==":                                   # @"=="
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	sete	%al
	retq
.Lfunc_end0:
	.size	"==", .Lfunc_end0-"=="
	.cfi_endproc
                                        # -- End function
	.globl	"!="                            # -- Begin function !=
	.p2align	4, 0x90
	.type	"!=",@function
"!=":                                   # @"!="
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	setne	%al
	retq
.Lfunc_end1:
	.size	"!=", .Lfunc_end1-"!="
	.cfi_endproc
                                        # -- End function
	.globl	"<"                             # -- Begin function <
	.p2align	4, 0x90
	.type	"<",@function
"<":                                    # @"<"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	setb	%al
	retq
.Lfunc_end2:
	.size	"<", .Lfunc_end2-"<"
	.cfi_endproc
                                        # -- End function
	.globl	">"                             # -- Begin function >
	.p2align	4, 0x90
	.type	">",@function
">":                                    # @">"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	seta	%al
	retq
.Lfunc_end3:
	.size	">", .Lfunc_end3-">"
	.cfi_endproc
                                        # -- End function
	.globl	"<="                            # -- Begin function <=
	.p2align	4, 0x90
	.type	"<=",@function
"<=":                                   # @"<="
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	setbe	%al
	retq
.Lfunc_end4:
	.size	"<=", .Lfunc_end4-"<="
	.cfi_endproc
                                        # -- End function
	.globl	">="                            # -- Begin function >=
	.p2align	4, 0x90
	.type	">=",@function
">=":                                   # @">="
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	cmpq	%rsi, %rdi
	setae	%al
	retq
.Lfunc_end5:
	.size	">=", .Lfunc_end5-">="
	.cfi_endproc
                                        # -- End function
	.globl	"&&"                            # -- Begin function &&
	.p2align	4, 0x90
	.type	"&&",@function
"&&":                                   # @"&&"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, %rax
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	andq	%rsi, %rax
	retq
.Lfunc_end6:
	.size	"&&", .Lfunc_end6-"&&"
	.cfi_endproc
                                        # -- End function
	.globl	"||"                            # -- Begin function ||
	.p2align	4, 0x90
	.type	"||",@function
"||":                                   # @"||"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, %rax
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	orq	%rsi, %rax
	retq
.Lfunc_end7:
	.size	"||", .Lfunc_end7-"||"
	.cfi_endproc
                                        # -- End function
	.globl	"==.1"                          # -- Begin function ==.1
	.p2align	4, 0x90
	.type	"==.1",@function
"==.1":                                 # @"==.1"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	sete	%al
	retq
.Lfunc_end8:
	.size	"==.1", .Lfunc_end8-"==.1"
	.cfi_endproc
                                        # -- End function
	.globl	"!=.2"                          # -- Begin function !=.2
	.p2align	4, 0x90
	.type	"!=.2",@function
"!=.2":                                 # @"!=.2"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	setne	%al
	retq
.Lfunc_end9:
	.size	"!=.2", .Lfunc_end9-"!=.2"
	.cfi_endproc
                                        # -- End function
	.globl	"<.3"                           # -- Begin function <.3
	.p2align	4, 0x90
	.type	"<.3",@function
"<.3":                                  # @"<.3"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	setb	%al
	retq
.Lfunc_end10:
	.size	"<.3", .Lfunc_end10-"<.3"
	.cfi_endproc
                                        # -- End function
	.globl	">.4"                           # -- Begin function >.4
	.p2align	4, 0x90
	.type	">.4",@function
">.4":                                  # @">.4"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	seta	%al
	retq
.Lfunc_end11:
	.size	">.4", .Lfunc_end11-">.4"
	.cfi_endproc
                                        # -- End function
	.globl	"<=.5"                          # -- Begin function <=.5
	.p2align	4, 0x90
	.type	"<=.5",@function
"<=.5":                                 # @"<=.5"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	setbe	%al
	retq
.Lfunc_end12:
	.size	"<=.5", .Lfunc_end12-"<=.5"
	.cfi_endproc
                                        # -- End function
	.globl	">=.6"                          # -- Begin function >=.6
	.p2align	4, 0x90
	.type	">=.6",@function
">=.6":                                 # @">=.6"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movb	%dil, -2(%rsp)
	movb	%sil, -1(%rsp)
	cmpb	%sil, %dil
	setae	%al
	retq
.Lfunc_end13:
	.size	">=.6", .Lfunc_end13-">=.6"
	.cfi_endproc
                                        # -- End function
	.globl	"&&.7"                          # -- Begin function &&.7
	.p2align	4, 0x90
	.type	"&&.7",@function
"&&.7":                                 # @"&&.7"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movl	%edi, %eax
	movb	%al, -2(%rsp)
	movb	%sil, -1(%rsp)
	andb	%sil, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end14:
	.size	"&&.7", .Lfunc_end14-"&&.7"
	.cfi_endproc
                                        # -- End function
	.globl	"||.8"                          # -- Begin function ||.8
	.p2align	4, 0x90
	.type	"||.8",@function
"||.8":                                 # @"||.8"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movl	%edi, %eax
	movb	%al, -2(%rsp)
	movb	%sil, -1(%rsp)
	orb	%sil, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end15:
	.size	"||.8", .Lfunc_end15-"||.8"
	.cfi_endproc
                                        # -- End function
	.globl	"&&.9"                          # -- Begin function &&.9
	.p2align	4, 0x90
	.type	"&&.9",@function
"&&.9":                                 # @"&&.9"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movl	%edi, %eax
	movl	%eax, %ecx
	andb	$1, %cl
	movb	%cl, -2(%rsp)
	andb	%sil, %al
	andb	$1, %sil
	movb	%sil, -1(%rsp)
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end16:
	.size	"&&.9", .Lfunc_end16-"&&.9"
	.cfi_endproc
                                        # -- End function
	.globl	"||.10"                         # -- Begin function ||.10
	.p2align	4, 0x90
	.type	"||.10",@function
"||.10":                                # @"||.10"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movl	%edi, %eax
	movl	%eax, %ecx
	andb	$1, %cl
	movb	%cl, -2(%rsp)
	orb	%sil, %al
	andb	$1, %sil
	movb	%sil, -1(%rsp)
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end17:
	.size	"||.10", .Lfunc_end17-"||.10"
	.cfi_endproc
                                        # -- End function
	.globl	"!"                             # -- Begin function !
	.p2align	4, 0x90
	.type	"!",@function
"!":                                    # @"!"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movl	%edi, %eax
	movl	%eax, %ecx
	andb	$1, %cl
	movb	%cl, -1(%rsp)
	xorb	$1, %al
                                        # kill: def $al killed $al killed $eax
	retq
.Lfunc_end18:
	.size	"!", .Lfunc_end18-"!"
	.cfi_endproc
                                        # -- End function
	.globl	"+"                             # -- Begin function +
	.p2align	4, 0x90
	.type	"+",@function
"+":                                    # @"+"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	leaq	(%rdi,%rsi), %rax
	retq
.Lfunc_end19:
	.size	"+", .Lfunc_end19-"+"
	.cfi_endproc
                                        # -- End function
	.globl	"-"                             # -- Begin function -
	.p2align	4, 0x90
	.type	"-",@function
"-":                                    # @-
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, %rax
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	subq	%rsi, %rax
	retq
.Lfunc_end20:
	.size	"-", .Lfunc_end20-"-"
	.cfi_endproc
                                        # -- End function
	.globl	assert                          # -- Begin function assert
	.p2align	4, 0x90
	.type	assert,@function
assert:                                 # @assert
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movl	%edi, %eax
	andl	$1, %eax
	movb	%al, 15(%rsp)
	movq	%rsi, 16(%rsp)
	callq	"!"@PLT
	testb	$1, %al
	je	.LBB21_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str, %edi
	callq	printf@PLT
	movq	16(%rsp), %rdi
	callq	printf@PLT
	movl	$.Lglobal_str.11, %edi
	callq	printf@PLT
	movl	$1, %edi
	callq	exit@PLT
.LBB21_2:                               # %if_cont_block
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end21:
	.size	assert, .Lfunc_end21-assert
	.cfi_endproc
                                        # -- End function
	.globl	assertVerbose                   # -- Begin function assertVerbose
	.p2align	4, 0x90
	.type	assertVerbose,@function
assertVerbose:                          # @assertVerbose
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	andb	$1, %dil
	movb	%dil, 15(%rsp)
	movq	%rsi, 16(%rsp)
	je	.LBB22_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.12, %edi
	callq	printf@PLT
	movq	16(%rsp), %rdi
	callq	printf@PLT
	movl	$.Lglobal_str.13, %edi
	callq	printf@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB22_2:                               # %if_else_block
	.cfi_def_cfa_offset 32
	movl	$.Lglobal_str.14, %edi
	callq	printf@PLT
	movq	16(%rsp), %rdi
	callq	printf@PLT
	movl	$.Lglobal_str.15, %edi
	callq	printf@PLT
	movl	$1, %edi
	callq	exit@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end22:
	.size	assertVerbose, .Lfunc_end22-assertVerbose
	.cfi_endproc
                                        # -- End function
	.globl	panic                           # -- Begin function panic
	.p2align	4, 0x90
	.type	panic,@function
panic:                                  # @panic
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movl	$.Lglobal_str.16, %edi
	callq	printf@PLT
	movq	(%rsp), %rdi
	callq	printf@PLT
	movl	$1, %edi
	callq	exit@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end23:
	.size	panic, .Lfunc_end23-panic
	.cfi_endproc
                                        # -- End function
	.globl	panic.17                        # -- Begin function panic.17
	.p2align	4, 0x90
	.type	panic.17,@function
panic.17:                               # @panic.17
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	$.Lglobal_str.18, %edi
	callq	printf@PLT
	movl	$1, %edi
	callq	exit@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end24:
	.size	panic.17, .Lfunc_end24-panic.17
	.cfi_endproc
                                        # -- End function
	.globl	"brackets-[-]"                  # -- Begin function brackets-[-]
	.p2align	4, 0x90
	.type	"brackets-[-]",@function
"brackets-[-]":                         # @"brackets-[-]"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -16(%rsp)
	movq	%rsi, -8(%rsp)
	leaq	(%rdi,%rsi), %rax
	retq
.Lfunc_end25:
	.size	"brackets-[-]", .Lfunc_end25-"brackets-[-]"
	.cfi_endproc
                                        # -- End function
	.globl	"==.19"                         # -- Begin function ==.19
	.p2align	4, 0x90
	.type	"==.19",@function
"==.19":                                # @"==.19"
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	callq	strcmp@PLT
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	"=="@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end26:
	.size	"==.19", .Lfunc_end26-"==.19"
	.cfi_endproc
                                        # -- End function
	.globl	"!=.20"                         # -- Begin function !=.20
	.p2align	4, 0x90
	.type	"!=.20",@function
"!=.20":                                # @"!=.20"
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	movq	%rsi, 16(%rsp)
	callq	strcmp@PLT
	movq	%rax, %rdi
	xorl	%esi, %esi
	callq	"!="@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end27:
	.size	"!=.20", .Lfunc_end27-"!=.20"
	.cfi_endproc
                                        # -- End function
	.globl	copy                            # -- Begin function copy
	.p2align	4, 0x90
	.type	copy,@function
copy:                                   # @copy
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, (%rsp)
	callq	strlen@PLT
	movl	$1, %esi
	movq	%rax, %rdi
	callq	"+"@PLT
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	%rax, 16(%rsp)
	movq	%rax, 8(%rsp)
	movq	(%rsp), %rsi
	movq	%rax, %rdi
	callq	strcpy@PLT
	movq	8(%rsp), %rax
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end28:
	.size	copy, .Lfunc_end28-copy
	.cfi_endproc
                                        # -- End function
	.globl	contains                        # -- Begin function contains
	.p2align	4, 0x90
	.type	contains,@function
contains:                               # @contains
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 16(%rsp)
	movb	%sil, 7(%rsp)
	callq	strlen@PLT
	movq	%rax, 32(%rsp)
	movq	%rax, 24(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 8(%rsp)
	.p2align	4, 0x90
.LBB29_1:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rdi
	movq	24(%rsp), %rsi
	callq	"!="@PLT
	testb	$1, %al
	je	.LBB29_4
# %bb.2:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB29_1 Depth=1
	movq	16(%rsp), %rdi
	movq	8(%rsp), %rsi
	callq	"brackets-[-]"@PLT
	movzbl	(%rax), %edi
	movzbl	7(%rsp), %esi
	callq	"==.1"@PLT
	testb	$1, %al
	jne	.LBB29_5
# %bb.3:                                # %if_cont_block
                                        #   in Loop: Header=BB29_1 Depth=1
	movq	8(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, 8(%rsp)
	jmp	.LBB29_1
.LBB29_4:                               # %while_loop_cont_basic_block
	xorl	%eax, %eax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.LBB29_5:                               # %if_then_block
	.cfi_def_cfa_offset 64
	movb	$1, %al
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end29:
	.size	contains, .Lfunc_end29-contains
	.cfi_endproc
                                        # -- End function
	.globl	isNumeric                       # -- Begin function isNumeric
	.p2align	4, 0x90
	.type	isNumeric,@function
isNumeric:                              # @isNumeric
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movb	%dil, 15(%rsp)
	movl	$48, %esi
	callq	">=.6"@PLT
	movl	%eax, %ebx
	movzbl	15(%rsp), %edi
	movl	$57, %esi
	callq	"<=.5"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"&&.9"@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end30:
	.size	isNumeric, .Lfunc_end30-isNumeric
	.cfi_endproc
                                        # -- End function
	.globl	isAlpha                         # -- Begin function isAlpha
	.p2align	4, 0x90
	.type	isAlpha,@function
isAlpha:                                # @isAlpha
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movb	%dil, 15(%rsp)
	movl	$65, %esi
	callq	">=.6"@PLT
	movl	%eax, %ebx
	movzbl	15(%rsp), %edi
	movl	$90, %esi
	callq	"<=.5"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"&&.9"@PLT
	movl	%eax, %ebx
	movzbl	15(%rsp), %edi
	movl	$97, %esi
	callq	">=.6"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"||.10"@PLT
	movl	%eax, %ebx
	movzbl	15(%rsp), %edi
	movl	$122, %esi
	callq	"<=.5"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"&&.9"@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end31:
	.size	isAlpha, .Lfunc_end31-isAlpha
	.cfi_endproc
                                        # -- End function
	.globl	isAlphanumeric                  # -- Begin function isAlphanumeric
	.p2align	4, 0x90
	.type	isAlphanumeric,@function
isAlphanumeric:                         # @isAlphanumeric
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$16, %rsp
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -16
	movb	%dil, 15(%rsp)
	callq	isNumeric@PLT
	movl	%eax, %ebx
	movzbl	15(%rsp), %edi
	callq	isAlpha@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"||.10"@PLT
	addq	$16, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end32:
	.size	isAlphanumeric, .Lfunc_end32-isAlphanumeric
	.cfi_endproc
                                        # -- End function
	.globl	isWhitespace                    # -- Begin function isWhitespace
	.p2align	4, 0x90
	.type	isWhitespace,@function
isWhitespace:                           # @isWhitespace
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %esi
	movb	%sil, 7(%rsp)
	movl	$.Lglobal_str.21, %edi
	callq	contains@PLT
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end33:
	.size	isWhitespace, .Lfunc_end33-isWhitespace
	.cfi_endproc
                                        # -- End function
	.globl	"lexer#new"                     # -- Begin function lexer#new
	.p2align	4, 0x90
	.type	"lexer#new",@function
"lexer#new":                            # @"lexer#new"
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 32(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 16(%rsp)
	movq	%rdi, 8(%rsp)
	callq	strlen@PLT
	movq	%rax, %rcx
	movq	%rax, 48(%rsp)
	movq	%rax, 24(%rsp)
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end34:
	.size	"lexer#new", .Lfunc_end34-"lexer#new"
	.cfi_endproc
                                        # -- End function
	.globl	peek                            # -- Begin function peek
	.p2align	4, 0x90
	.type	peek,@function
peek:                                   # @peek
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, -32(%rsp)
	movq	(%rdi), %rax
	movq	%rax, -24(%rsp)
	movq	8(%rdi), %rdx
	movq	%rdx, -16(%rsp)
	movq	16(%rdi), %rcx
	movq	%rcx, -8(%rsp)
	retq
.Lfunc_end35:
	.size	peek, .Lfunc_end35-peek
	.cfi_endproc
                                        # -- End function
	.globl	peekChar                        # -- Begin function peekChar
	.p2align	4, 0x90
	.type	peekChar,@function
peekChar:                               # @peekChar
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movq	8(%rdi), %rax
	movq	16(%rdi), %rsi
	movq	%rax, %rdi
	callq	">="@PLT
	testb	$1, %al
	je	.LBB36_2
# %bb.1:                                # %if_then_block
	xorl	%eax, %eax
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.LBB36_2:                               # %if_cont_block
	.cfi_def_cfa_offset 16
	movq	(%rsp), %rax
	movq	(%rax), %rdi
	movq	8(%rax), %rsi
	callq	"brackets-[-]"@PLT
	movb	(%rax), %al
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end36:
	.size	peekChar, .Lfunc_end36-peekChar
	.cfi_endproc
                                        # -- End function
	.globl	takeChar                        # -- Begin function takeChar
	.p2align	4, 0x90
	.type	takeChar,@function
takeChar:                               # @takeChar
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$32, %rsp
	.cfi_def_cfa_offset 48
	.cfi_offset %rbx, -16
	movq	%rdi, 16(%rsp)
	callq	peekChar@PLT
	movb	%al, 15(%rsp)
	movb	%al, 14(%rsp)
	movq	16(%rsp), %rbx
	movq	8(%rbx), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 24(%rsp)
	movq	%rax, 8(%rbx)
	movb	14(%rsp), %al
	addq	$32, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end37:
	.size	takeChar, .Lfunc_end37-takeChar
	.cfi_endproc
                                        # -- End function
	.globl	"+.22"                          # -- Begin function +.22
	.p2align	4, 0x90
	.type	"+.22",@function
"+.22":                                 # @"+.22"
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdx, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdi, 8(%rsp)
	movq	%rcx, 32(%rsp)
	movq	%r8, 40(%rsp)
	movq	%r9, 48(%rsp)
	movq	%rsi, %rdi
	movq	%rdx, %rsi
	callq	"+"@PLT
	movq	40(%rsp), %rsi
	movq	%rax, %rdi
	callq	"!="@PLT
	testb	$1, %al
	je	.LBB38_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.23, %edi
	callq	panic@PLT
.LBB38_2:                               # %if_cont_block
	movq	16(%rsp), %rax
	movq	24(%rsp), %rdi
	movq	%rax, 64(%rsp)
	movq	48(%rsp), %rsi
	callq	"+"@PLT
	movq	%rax, %rcx
	movq	%rax, 80(%rsp)
	movq	%rax, 72(%rsp)
	movq	8(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	64(%rsp), %rdx
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end38:
	.size	"+.22", .Lfunc_end38-"+.22"
	.cfi_endproc
                                        # -- End function
	.globl	render                          # -- Begin function render
	.p2align	4, 0x90
	.type	render,@function
render:                                 # @render
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$48, %rsp
	.cfi_def_cfa_offset 64
	.cfi_offset %rbx, -16
	movq	%rdi, 16(%rsp)
	movq	16(%rdi), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, %rdi
	callq	malloc@PLT
	movq	%rax, %rbx
	movq	%rax, 32(%rsp)
	movq	%rax, 24(%rsp)
	movq	16(%rsp), %rax
	movq	(%rax), %rcx
	movq	8(%rax), %rsi
	movq	(%rcx), %rdi
	callq	"brackets-[-]"@PLT
	movq	16(%rsp), %rcx
	movq	16(%rcx), %rdx
	movq	%rbx, %rdi
	movq	%rax, %rsi
	callq	strncpy@PLT
	movq	24(%rsp), %rdi
	movq	16(%rsp), %rax
	movq	16(%rax), %rsi
	callq	"brackets-[-]"@PLT
	movq	%rax, 40(%rsp)
	movb	$0, 15(%rsp)
	movb	$0, (%rax)
	movq	24(%rsp), %rax
	addq	$48, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end39:
	.size	render, .Lfunc_end39-render
	.cfi_endproc
                                        # -- End function
	.globl	debug                           # -- Begin function debug
	.p2align	4, 0x90
	.type	debug,@function
debug:                                  # @debug
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rdi, 8(%rsp)
	callq	render@PLT
	movq	%rax, 16(%rsp)
	movq	%rax, (%rsp)
	movq	%rax, %rdi
	callq	printf@PLT
	movq	(%rsp), %rdi
	callq	free@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end40:
	.size	debug, .Lfunc_end40-debug
	.cfi_endproc
                                        # -- End function
	.globl	takeNumber                      # -- Begin function takeNumber
	.p2align	4, 0x90
	.type	takeNumber,@function
takeNumber:                             # @takeNumber
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	%rdi, 16(%rsp)
	movq	8(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	%rdi, 24(%rsp)
	movb	$1, 14(%rsp)
	movb	$1, 13(%rsp)
	.p2align	4, 0x90
.LBB41_1:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	callq	isNumeric@PLT
	movl	%eax, %ebx
	movq	16(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	movl	$46, %esi
	callq	"==.1"@PLT
	movzbl	%al, %edi
	movzbl	13(%rsp), %esi
	callq	"&&.9"@PLT
	movzbl	%al, %esi
	movzbl	%bl, %edi
	callq	"||.10"@PLT
	testb	$1, %al
	je	.LBB41_4
# %bb.2:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB41_1 Depth=1
	movq	40(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 56(%rsp)
	movq	%rax, 40(%rsp)
	movq	16(%rsp), %rdi
	callq	takeChar@PLT
	movzbl	%al, %edi
	movl	$46, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB41_1
# %bb.3:                                # %if_then_block
                                        #   in Loop: Header=BB41_1 Depth=1
	movb	$0, 15(%rsp)
	movb	$0, 13(%rsp)
	jmp	.LBB41_1
.LBB41_4:                               # %while_loop_cont_basic_block
	movq	24(%rsp), %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	addq	$64, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end41:
	.size	takeNumber, .Lfunc_end41-takeNumber
	.cfi_endproc
                                        # -- End function
	.globl	isConventionalId                # -- Begin function isConventionalId
	.p2align	4, 0x90
	.type	isConventionalId,@function
isConventionalId:                       # @isConventionalId
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbp
	.cfi_def_cfa_offset 16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	pushq	%rax
	.cfi_def_cfa_offset 32
	.cfi_offset %rbx, -24
	.cfi_offset %rbp, -16
	movb	%dil, 6(%rsp)
	andl	$1, %esi
	movb	%sil, 7(%rsp)
	callq	isAlpha@PLT
	movl	%eax, %ebp
	movzbl	6(%rsp), %edi
	callq	isNumeric@PLT
	movl	%eax, %ebx
	movzbl	7(%rsp), %edi
	callq	"!"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"&&.9"@PLT
	movzbl	%al, %esi
	movzbl	%bpl, %edi
	callq	"||.10"@PLT
	movl	%eax, %ebx
	movzbl	6(%rsp), %edi
	movl	$95, %esi
	callq	"==.1"@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"||.10"@PLT
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end42:
	.size	isConventionalId, .Lfunc_end42-isConventionalId
	.cfi_endproc
                                        # -- End function
	.globl	isSpecialId                     # -- Begin function isSpecialId
	.p2align	4, 0x90
	.type	isSpecialId,@function
isSpecialId:                            # @isSpecialId
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movl	%edi, %esi
	movb	%sil, 7(%rsp)
	movl	$.Lglobal_str.24, %edi
	callq	contains@PLT
	popq	%rcx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end43:
	.size	isSpecialId, .Lfunc_end43-isSpecialId
	.cfi_endproc
                                        # -- End function
	.globl	takeIdentifier                  # -- Begin function takeIdentifier
	.p2align	4, 0x90
	.type	takeIdentifier,@function
takeIdentifier:                         # @takeIdentifier
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 16(%rsp)
	movq	8(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	$0, 48(%rsp)
	movq	$0, 40(%rsp)
	movq	%rdi, 24(%rsp)
	movb	$1, 14(%rsp)
	movb	$1, 13(%rsp)
	jmp	.LBB44_1
	.p2align	4, 0x90
.LBB44_4:                               # %if_cont_block
                                        #   in Loop: Header=BB44_1 Depth=1
	movq	16(%rsp), %rdi
	callq	takeChar@PLT
.LBB44_1:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	13(%rsp), %esi
	movzbl	%al, %edi
	callq	isConventionalId@PLT
	testb	$1, %al
	je	.LBB44_5
# %bb.2:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB44_1 Depth=1
	movq	40(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 56(%rsp)
	movq	%rax, 40(%rsp)
	cmpb	$0, 13(%rsp)
	je	.LBB44_4
# %bb.3:                                # %if_then_block
                                        #   in Loop: Header=BB44_1 Depth=1
	movb	$0, 15(%rsp)
	movb	$0, 13(%rsp)
	jmp	.LBB44_4
.LBB44_5:                               # %while_loop_cont_basic_block
	movq	40(%rsp), %rdi
	xorl	%esi, %esi
	callq	"=="@PLT
	testb	$1, %al
	je	.LBB44_8
	.p2align	4, 0x90
.LBB44_6:                               # %while_loop_cond_check_basic_block20
                                        # =>This Inner Loop Header: Depth=1
	movq	16(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	callq	isSpecialId@PLT
	testb	$1, %al
	je	.LBB44_8
# %bb.7:                                # %while_loop_body_basic_block21
                                        #   in Loop: Header=BB44_6 Depth=1
	movq	40(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 64(%rsp)
	movq	%rax, 40(%rsp)
	movq	16(%rsp), %rdi
	callq	takeChar@PLT
	jmp	.LBB44_6
.LBB44_8:                               # %if_cont_block19
	movq	24(%rsp), %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end44:
	.size	takeIdentifier, .Lfunc_end44-takeIdentifier
	.cfi_endproc
                                        # -- End function
	.globl	takeOnlyWhitespace              # -- Begin function takeOnlyWhitespace
	.p2align	4, 0x90
	.type	takeOnlyWhitespace,@function
takeOnlyWhitespace:                     # @takeOnlyWhitespace
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 8(%rsp)
	movq	8(%rdi), %rax
	movq	%rax, 24(%rsp)
	movq	$0, 40(%rsp)
	movq	$0, 32(%rsp)
	movq	%rdi, 16(%rsp)
	.p2align	4, 0x90
.LBB45_1:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	8(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	callq	isWhitespace@PLT
	testb	$1, %al
	je	.LBB45_3
# %bb.2:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB45_1 Depth=1
	movq	32(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, 32(%rsp)
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	jmp	.LBB45_1
.LBB45_3:                               # %while_loop_cont_basic_block
	movq	16(%rsp), %rax
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rcx
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end45:
	.size	takeOnlyWhitespace, .Lfunc_end45-takeOnlyWhitespace
	.cfi_endproc
                                        # -- End function
	.globl	takeComment                     # -- Begin function takeComment
	.p2align	4, 0x90
	.type	takeComment,@function
takeComment:                            # @takeComment
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$184, %rsp
	.cfi_def_cfa_offset 192
	movq	%rdi, 8(%rsp)
	movq	8(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	$0, 80(%rsp)
	movq	$0, 40(%rsp)
	movq	%rdi, 24(%rsp)
	callq	peekChar@PLT
	movzbl	%al, %edi
	movl	$47, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB46_11
# %bb.1:                                # %if_then_block
	movq	8(%rsp), %rdi
	callq	peek@PLT
	movq	%rax, 88(%rsp)
	movq	%rdx, 96(%rsp)
	movq	%rcx, 104(%rsp)
	movq	%rax, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	leaq	56(%rsp), %rdi
	movq	%rdi, 112(%rsp)
	movq	%rdi, 48(%rsp)
	callq	takeChar@PLT
	movq	48(%rsp), %rdi
	callq	peekChar@PLT
	movb	%al, 23(%rsp)
	movb	%al, 7(%rsp)
	movzbl	%al, %edi
	movl	$47, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB46_5
# %bb.2:                                # %if_then_block15
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movq	$2, 120(%rsp)
	movq	40(%rsp), %rdi
	movl	$2, %esi
	callq	"+"@PLT
	movq	%rax, 128(%rsp)
	.p2align	4, 0x90
.LBB46_3:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 40(%rsp)
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movzbl	%al, %edi
	movl	$10, %esi
	callq	"!=.2"@PLT
	testb	$1, %al
	je	.LBB46_11
# %bb.4:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB46_3 Depth=1
	movq	40(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 136(%rsp)
	jmp	.LBB46_3
.LBB46_5:                               # %if_else_block
	movzbl	7(%rsp), %edi
	movl	$42, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB46_11
# %bb.6:                                # %if_then_block32
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movq	$2, 144(%rsp)
	movq	40(%rsp), %rdi
	movl	$2, %esi
	callq	"+"@PLT
	movq	%rax, 152(%rsp)
	jmp	.LBB46_7
	.p2align	4, 0x90
.LBB46_9:                               # %if_cont_block49
                                        #   in Loop: Header=BB46_7 Depth=1
	movq	40(%rsp), %rdi
	movl	$1, %esi
	callq	"+"@PLT
	movq	%rax, 176(%rsp)
.LBB46_7:                               # %while_loop_cond_check_basic_block44
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, 40(%rsp)
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movzbl	%al, %edi
	movl	$42, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB46_9
# %bb.8:                                # %if_then_block48
                                        #   in Loop: Header=BB46_7 Depth=1
	movq	8(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	movl	$47, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB46_9
# %bb.10:                               # %if_then_block51
	movq	8(%rsp), %rdi
	callq	takeChar@PLT
	movq	$2, 160(%rsp)
	movq	40(%rsp), %rdi
	movl	$2, %esi
	callq	"+"@PLT
	movq	%rax, 168(%rsp)
	movq	%rax, 40(%rsp)
.LBB46_11:                              # %if_cont_block
	movq	24(%rsp), %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	addq	$184, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end46:
	.size	takeComment, .Lfunc_end46-takeComment
	.cfi_endproc
                                        # -- End function
	.globl	takeWhitespace                  # -- Begin function takeWhitespace
	.p2align	4, 0x90
	.type	takeWhitespace,@function
takeWhitespace:                         # @takeWhitespace
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$152, %rsp
	.cfi_def_cfa_offset 160
	movq	%rdi, 24(%rsp)
	callq	takeOnlyWhitespace@PLT
	movq	%rax, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	.p2align	4, 0x90
.LBB47_1:                               # %while_loop_cond_check_basic_block
                                        # =>This Inner Loop Header: Depth=1
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	peekChar@PLT
	movzbl	%al, %edi
	movl	$47, %esi
	callq	"==.1"@PLT
	testb	$1, %al
	je	.LBB47_3
# %bb.2:                                # %while_loop_body_basic_block
                                        #   in Loop: Header=BB47_1 Depth=1
	movq	24(%rsp), %rdi
	callq	takeComment@PLT
	movq	%rdx, %r8
	movq	%rcx, %r9
	movq	%rax, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	%rax, %rcx
	callq	"+.22"@PLT
	movq	%rax, 80(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%rcx, 96(%rsp)
	movq	%rax, (%rsp)
	movq	%rdx, 8(%rsp)
	movq	%rcx, 16(%rsp)
	movq	24(%rsp), %rdi
	callq	takeOnlyWhitespace@PLT
	movq	%rdx, %r8
	movq	%rcx, %r9
	movq	%rax, 104(%rsp)
	movq	%rdx, 112(%rsp)
	movq	%rcx, 120(%rsp)
	movq	(%rsp), %rdi
	movq	8(%rsp), %rsi
	movq	16(%rsp), %rdx
	movq	%rax, %rcx
	callq	"+.22"@PLT
	movq	%rax, 128(%rsp)
	movq	%rdx, 136(%rsp)
	movq	%rcx, 144(%rsp)
	jmp	.LBB47_1
.LBB47_3:                               # %while_loop_cont_basic_block
	movq	(%rsp), %rax
	movq	8(%rsp), %rdx
	movq	16(%rsp), %rcx
	addq	$152, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end47:
	.size	takeWhitespace, .Lfunc_end47-takeWhitespace
	.cfi_endproc
                                        # -- End function
	.globl	require                         # -- Begin function require
	.p2align	4, 0x90
	.type	require,@function
require:                                # @require
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdi, 16(%rsp)
	movb	%sil, 15(%rsp)
	callq	takeWhitespace@PLT
	movq	16(%rsp), %rdi
	movq	8(%rdi), %rax
	movq	%rax, 32(%rsp)
	movq	%rdi, 24(%rsp)
	movq	$1, 48(%rsp)
	movq	$1, 40(%rsp)
	callq	takeChar@PLT
	movzbl	15(%rsp), %esi
	movzbl	%al, %edi
	callq	"!=.2"@PLT
	testb	$1, %al
	je	.LBB48_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.25, %edi
	callq	printf@PLT
	movzbl	15(%rsp), %edi
	callq	putchar@PLT
	movl	$.Lglobal_str.26, %edi
	callq	printf@PLT
	movzbl	15(%rsp), %edi
	callq	putchar@PLT
	movl	$.Lglobal_str.27, %edi
	callq	printf@PLT
	movl	$.Lglobal_str.28, %edi
	callq	panic@PLT
.LBB48_2:                               # %if_cont_block
	movq	24(%rsp), %rax
	movq	32(%rsp), %rdx
	movq	40(%rsp), %rcx
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end48:
	.size	require, .Lfunc_end48-require
	.cfi_endproc
                                        # -- End function
	.globl	require.29                      # -- Begin function require.29
	.p2align	4, 0x90
	.type	require.29,@function
require.29:                             # @require.29
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	movq	%rdi, 40(%rsp)
	movq	%rsi, 8(%rsp)
	callq	takeWhitespace@PLT
	movq	40(%rsp), %rdi
	callq	takeIdentifier@PLT
	movq	%rax, 48(%rsp)
	movq	%rdx, 56(%rsp)
	movq	%rcx, 64(%rsp)
	movq	%rax, 16(%rsp)
	movq	%rdx, 24(%rsp)
	movq	%rcx, 32(%rsp)
	leaq	16(%rsp), %rdi
	callq	render@PLT
	movq	8(%rsp), %rsi
	movq	%rax, %rdi
	callq	"!=.20"@PLT
	testb	$1, %al
	je	.LBB49_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.30, %edi
	callq	printf@PLT
	movq	8(%rsp), %rdi
	callq	printf@PLT
	movl	$.Lglobal_str.31, %edi
	callq	printf@PLT
	leaq	16(%rsp), %rdi
	callq	render@PLT
	movq	%rax, %rdi
	callq	printf@PLT
	movl	$.Lglobal_str.32, %edi
	callq	printf@PLT
	movl	$.Lglobal_str.33, %edi
	callq	panic@PLT
.LBB49_2:                               # %if_cont_block
	movq	16(%rsp), %rax
	movq	24(%rsp), %rdx
	movq	32(%rsp), %rcx
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end49:
	.size	require.29, .Lfunc_end49-require.29
	.cfi_endproc
                                        # -- End function
	.globl	"parser#new"                    # -- Begin function parser#new
	.p2align	4, 0x90
	.type	"parser#new",@function
"parser#new":                           # @"parser#new"
	.cfi_startproc
# %bb.0:                                # %entry_block
	movq	%rdi, %rax
	movq	%rdi, -16(%rsp)
	movq	%rdi, -8(%rsp)
	retq
.Lfunc_end50:
	.size	"parser#new", .Lfunc_end50-"parser#new"
	.cfi_endproc
                                        # -- End function
	.globl	debug.34                        # -- Begin function debug.34
	.p2align	4, 0x90
	.type	debug.34,@function
debug.34:                               # @debug.34
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	movq	(%rdi), %rdi
	movl	$1, %esi
	callq	"=="@PLT
	testb	$1, %al
	je	.LBB51_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.35, %edi
	callq	printf@PLT
.LBB51_2:                               # %if_cont_block
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end51:
	.size	debug.34, .Lfunc_end51-debug.34
	.cfi_endproc
                                        # -- End function
	.globl	drop                            # -- Begin function drop
	.p2align	4, 0x90
	.type	drop,@function
drop:                                   # @drop
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$24, %rsp
	.cfi_def_cfa_offset 32
	movq	%rsi, 16(%rsp)
	movq	%rdi, 8(%rsp)
	callq	free@PLT
	addq	$24, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end52:
	.size	drop, .Lfunc_end52-drop
	.cfi_endproc
                                        # -- End function
	.globl	debug.36                        # -- Begin function debug.36
	.p2align	4, 0x90
	.type	debug.36,@function
debug.36:                               # @debug.36
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	debug@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end53:
	.size	debug.36, .Lfunc_end53-debug.36
	.cfi_endproc
                                        # -- End function
	.globl	parseNumberExpr                 # -- Begin function parseNumberExpr
	.p2align	4, 0x90
	.type	parseNumberExpr,@function
parseNumberExpr:                        # @parseNumberExpr
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$96, %rsp
	.cfi_def_cfa_offset 112
	.cfi_offset %rbx, -16
	movq	%rdi, %rbx
	movq	%rsi, 32(%rsp)
	movq	(%rsi), %rdi
	callq	takeNumber@PLT
	movq	%rax, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rcx, %rdi
	xorl	%esi, %esi
	callq	"=="@PLT
	testb	$1, %al
	je	.LBB54_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.37, %edi
	callq	panic@PLT
.LBB54_2:                               # %if_cont_block
	movq	24(%rsp), %rax
	movq	8(%rsp), %rcx
	movq	16(%rsp), %rdx
	movq	%rcx, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rax, 80(%rsp)
	movq	88(%rsp), %rsi
	movq	%rsi, 24(%rbx)
	movq	%rax, 16(%rbx)
	movq	%rdx, 8(%rbx)
	movq	%rcx, (%rbx)
	movq	%rbx, %rax
	addq	$96, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end54:
	.size	parseNumberExpr, .Lfunc_end54-parseNumberExpr
	.cfi_endproc
                                        # -- End function
	.globl	copy.38                         # -- Begin function copy.38
	.p2align	4, 0x90
	.type	copy.38,@function
copy.38:                                # @copy.38
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdi, 16(%rsp)
	movl	$32, %edi
	callq	malloc@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, 8(%rsp)
	leaq	16(%rsp), %rdi
	movl	$32, %edx
	movq	%rax, %rsi
	callq	memcpy@PLT
	movq	8(%rsp), %rax
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end55:
	.size	copy.38, .Lfunc_end55-copy.38
	.cfi_endproc
                                        # -- End function
	.globl	asExpr                          # -- Begin function asExpr
	.p2align	4, 0x90
	.type	asExpr,@function
asExpr:                                 # @asExpr
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rcx, 40(%rsp)
	movq	%rdx, 32(%rsp)
	movq	%rsi, 24(%rsp)
	movq	%rdi, 16(%rsp)
	movq	$1, 8(%rsp)
	callq	copy.38@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, (%rsp)
	movq	8(%rsp), %rdx
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end56:
	.size	asExpr, .Lfunc_end56-asExpr
	.cfi_endproc
                                        # -- End function
	.globl	debug.39                        # -- Begin function debug.39
	.p2align	4, 0x90
	.type	debug.39,@function
debug.39:                               # @debug.39
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rax
	.cfi_def_cfa_offset 16
	movq	%rdi, (%rsp)
	callq	debug@PLT
	popq	%rax
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end57:
	.size	debug.39, .Lfunc_end57-debug.39
	.cfi_endproc
                                        # -- End function
	.globl	parseIdentifierExpr             # -- Begin function parseIdentifierExpr
	.p2align	4, 0x90
	.type	parseIdentifierExpr,@function
parseIdentifierExpr:                    # @parseIdentifierExpr
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$88, %rsp
	.cfi_def_cfa_offset 96
	movq	%rdi, 32(%rsp)
	movq	(%rdi), %rdi
	callq	takeIdentifier@PLT
	movq	%rax, 40(%rsp)
	movq	%rdx, 48(%rsp)
	movq	%rcx, 56(%rsp)
	movq	%rax, 8(%rsp)
	movq	%rdx, 16(%rsp)
	movq	%rcx, 24(%rsp)
	movq	%rcx, %rdi
	xorl	%esi, %esi
	callq	"=="@PLT
	testb	$1, %al
	je	.LBB58_2
# %bb.1:                                # %if_then_block
	movl	$.Lglobal_str.40, %edi
	callq	panic@PLT
.LBB58_2:                               # %if_cont_block
	movq	24(%rsp), %rcx
	movq	8(%rsp), %rax
	movq	16(%rsp), %rdx
	movq	%rax, 64(%rsp)
	movq	%rdx, 72(%rsp)
	movq	%rcx, 80(%rsp)
	addq	$88, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end58:
	.size	parseIdentifierExpr, .Lfunc_end58-parseIdentifierExpr
	.cfi_endproc
                                        # -- End function
	.globl	copy.41                         # -- Begin function copy.41
	.p2align	4, 0x90
	.type	copy.41,@function
copy.41:                                # @copy.41
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$40, %rsp
	.cfi_def_cfa_offset 48
	movq	%rdx, 24(%rsp)
	movq	%rsi, 16(%rsp)
	movq	%rdi, 8(%rsp)
	movl	$24, %edi
	callq	malloc@PLT
	movq	%rax, 32(%rsp)
	movq	%rax, (%rsp)
	leaq	8(%rsp), %rdi
	movl	$24, %edx
	movq	%rax, %rsi
	callq	memcpy@PLT
	movq	(%rsp), %rax
	addq	$40, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end59:
	.size	copy.41, .Lfunc_end59-copy.41
	.cfi_endproc
                                        # -- End function
	.globl	asExpr.42                       # -- Begin function asExpr.42
	.p2align	4, 0x90
	.type	asExpr.42,@function
asExpr.42:                              # @asExpr.42
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	movq	%rdx, 40(%rsp)
	movq	%rsi, 32(%rsp)
	movq	%rdi, 24(%rsp)
	movq	$2, 16(%rsp)
	callq	copy.41@PLT
	movq	%rax, 48(%rsp)
	movq	%rax, 8(%rsp)
	movq	16(%rsp), %rdx
	addq	$56, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end60:
	.size	asExpr.42, .Lfunc_end60-asExpr.42
	.cfi_endproc
                                        # -- End function
	.globl	parseExpr                       # -- Begin function parseExpr
	.p2align	4, 0x90
	.type	parseExpr,@function
parseExpr:                              # @parseExpr
	.cfi_startproc
# %bb.0:                                # %entry_block
	pushq	%rbx
	.cfi_def_cfa_offset 16
	subq	$64, %rsp
	.cfi_def_cfa_offset 80
	.cfi_offset %rbx, -16
	movq	%rdi, 8(%rsp)
	movq	(%rdi), %rdi
	callq	takeWhitespace@PLT
	movq	8(%rsp), %rax
	movq	(%rax), %rdi
	callq	peekChar@PLT
	movb	%al, 7(%rsp)
	movb	%al, 6(%rsp)
	movl	$.Lglobal_str.43, %edi
	callq	printf@PLT
	movzbl	6(%rsp), %edi
	callq	putchar@PLT
	movl	$.Lglobal_str.44, %edi
	callq	printf@PLT
	movzbl	6(%rsp), %edi
	callq	isNumeric@PLT
	testb	$1, %al
	je	.LBB61_4
# %bb.1:                                # %if_then_block
	movq	8(%rsp), %rsi
	leaq	16(%rsp), %rdi
	callq	parseNumberExpr@PLT
	movq	40(%rsp), %rcx
	movq	32(%rsp), %rdx
	movq	16(%rsp), %rdi
	movq	24(%rsp), %rsi
	callq	asExpr@PLT
	jmp	.LBB61_2
.LBB61_4:                               # %if_else_block
	movzbl	6(%rsp), %edi
	movl	$1, %esi
	callq	isConventionalId@PLT
	movl	%eax, %ebx
	movzbl	6(%rsp), %edi
	callq	isSpecialId@PLT
	movzbl	%bl, %edi
	movzbl	%al, %esi
	callq	"||.10"@PLT
	testb	$1, %al
	je	.LBB61_5
# %bb.3:                                # %if_then_block8
	movq	8(%rsp), %rdi
	callq	parseIdentifierExpr@PLT
	movq	%rax, %rdi
	movq	%rdx, %rsi
	movq	%rcx, %rdx
	callq	asExpr.42@PLT
	jmp	.LBB61_2
.LBB61_5:                               # %if_else_block9
	movl	$.Lglobal_str.45, %edi
	callq	printf@PLT
	movzbl	6(%rsp), %edi
	callq	putchar@PLT
	movl	$.Lglobal_str.46, %edi
	callq	printf@PLT
	callq	panic.17@PLT
	movq	48(%rsp), %rax
	movq	56(%rsp), %rdx
.LBB61_2:                               # %if_cont_block
	addq	$64, %rsp
	.cfi_def_cfa_offset 16
	popq	%rbx
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end61:
	.size	parseExpr, .Lfunc_end61-parseExpr
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:                                # %entry_block
	subq	$216, %rsp
	.cfi_def_cfa_offset 224
	movl	$.Lglobal_str.47, %edi
	callq	printf@PLT
	movq	$.Lglobal_str.48, 112(%rsp)
	movq	$.Lglobal_str.48, 104(%rsp)
	movl	$.Lglobal_str.48, %edi
	callq	"lexer#new"@PLT
	movq	%rax, 32(%rsp)
	movq	%rdx, 40(%rsp)
	movq	%rcx, 48(%rsp)
	leaq	32(%rsp), %rdi
	movq	%rdi, 120(%rsp)
	movq	%rdi, (%rsp)
	callq	takeNumber@PLT
	movq	%rax, 56(%rsp)
	movq	%rdx, 64(%rsp)
	movq	%rcx, 72(%rsp)
	leaq	56(%rsp), %rdi
	movq	%rdi, 128(%rsp)
	movq	%rdi, 8(%rsp)
	callq	render@PLT
	movq	%rax, %rdi
	callq	printf@PLT
	movl	$10, %edi
	callq	putchar@PLT
	movq	(%rsp), %rdi
	callq	takeWhitespace@PLT
	movq	(%rsp), %rdi
	callq	takeIdentifier@PLT
	movq	%rax, 80(%rsp)
	movq	%rdx, 88(%rsp)
	movq	%rcx, 96(%rsp)
	leaq	80(%rsp), %rdi
	movq	%rdi, 136(%rsp)
	movq	%rdi, 8(%rsp)
	callq	render@PLT
	movq	%rax, %rdi
	callq	printf@PLT
	movl	$10, %edi
	callq	putchar@PLT
	movq	(%rsp), %rdi
	callq	"parser#new"@PLT
	movq	%rax, 24(%rsp)
	leaq	24(%rsp), %rsi
	movq	%rsi, 144(%rsp)
	movq	%rsi, 16(%rsp)
	leaq	184(%rsp), %rdi
	callq	parseNumberExpr@PLT
	movq	16(%rsp), %rsi
	leaq	152(%rsp), %rdi
	callq	parseNumberExpr@PLT
	xorl	%edi, %edi
	callq	exit@PLT
	xorl	%eax, %eax
	addq	$216, %rsp
	.cfi_def_cfa_offset 8
	retq
.Lfunc_end62:
	.size	main, .Lfunc_end62-main
	.cfi_endproc
                                        # -- End function
	.type	.Lglobal_str,@object            # @global_str
	.section	.rodata.str1.1,"aMS",@progbits,1
.Lglobal_str:
	.asciz	"Assertion failed: "
	.size	.Lglobal_str, 19

	.type	.Lglobal_str.11,@object         # @global_str.11
.Lglobal_str.11:
	.asciz	"\n"
	.size	.Lglobal_str.11, 2

	.type	.Lglobal_str.12,@object         # @global_str.12
.Lglobal_str.12:
	.asciz	"Assertion succeeded: "
	.size	.Lglobal_str.12, 22

	.type	.Lglobal_str.13,@object         # @global_str.13
.Lglobal_str.13:
	.asciz	"\n"
	.size	.Lglobal_str.13, 2

	.type	.Lglobal_str.14,@object         # @global_str.14
.Lglobal_str.14:
	.asciz	"Assertion failed: "
	.size	.Lglobal_str.14, 19

	.type	.Lglobal_str.15,@object         # @global_str.15
.Lglobal_str.15:
	.asciz	"\n"
	.size	.Lglobal_str.15, 2

	.type	.Lglobal_str.16,@object         # @global_str.16
.Lglobal_str.16:
	.asciz	"Panic!\n"
	.size	.Lglobal_str.16, 8

	.type	.Lglobal_str.18,@object         # @global_str.18
.Lglobal_str.18:
	.asciz	"Panic!\n"
	.size	.Lglobal_str.18, 8

	.type	.Lglobal_str.21,@object         # @global_str.21
.Lglobal_str.21:
	.asciz	" t\n"
	.size	.Lglobal_str.21, 4

	.type	.Lglobal_str.23,@object         # @global_str.23
.Lglobal_str.23:
	.asciz	"Trying to add two non-contiguous LexStrings"
	.size	.Lglobal_str.23, 44

	.type	.Lglobal_str.24,@object         # @global_str.24
.Lglobal_str.24:
	.asciz	"+-><*/=%!&.[]|"
	.size	.Lglobal_str.24, 15

	.type	.Lglobal_str.25,@object         # @global_str.25
.Lglobal_str.25:
	.asciz	"Expected `"
	.size	.Lglobal_str.25, 11

	.type	.Lglobal_str.26,@object         # @global_str.26
.Lglobal_str.26:
	.asciz	"` but got `"
	.size	.Lglobal_str.26, 12

	.type	.Lglobal_str.27,@object         # @global_str.27
.Lglobal_str.27:
	.asciz	"`\n"
	.size	.Lglobal_str.27, 3

	.type	.Lglobal_str.28,@object         # @global_str.28
.Lglobal_str.28:
	.asciz	"invalid character"
	.size	.Lglobal_str.28, 18

	.type	.Lglobal_str.30,@object         # @global_str.30
.Lglobal_str.30:
	.asciz	"Expected `"
	.size	.Lglobal_str.30, 11

	.type	.Lglobal_str.31,@object         # @global_str.31
.Lglobal_str.31:
	.asciz	"` but got `"
	.size	.Lglobal_str.31, 12

	.type	.Lglobal_str.32,@object         # @global_str.32
.Lglobal_str.32:
	.asciz	"`\n"
	.size	.Lglobal_str.32, 3

	.type	.Lglobal_str.33,@object         # @global_str.33
.Lglobal_str.33:
	.asciz	"invalid character"
	.size	.Lglobal_str.33, 18

	.type	.Lglobal_str.35,@object         # @global_str.35
.Lglobal_str.35:
	.asciz	"ExprType#Number"
	.size	.Lglobal_str.35, 16

	.type	.Lglobal_str.37,@object         # @global_str.37
.Lglobal_str.37:
	.asciz	"Expected number"
	.size	.Lglobal_str.37, 16

	.type	.Lglobal_str.40,@object         # @global_str.40
.Lglobal_str.40:
	.asciz	"Expected valid identifier"
	.size	.Lglobal_str.40, 26

	.type	.Lglobal_str.43,@object         # @global_str.43
.Lglobal_str.43:
	.asciz	"Peeked char: `"
	.size	.Lglobal_str.43, 15

	.type	.Lglobal_str.44,@object         # @global_str.44
.Lglobal_str.44:
	.asciz	"`\n"
	.size	.Lglobal_str.44, 3

	.type	.Lglobal_str.45,@object         # @global_str.45
.Lglobal_str.45:
	.asciz	"Cannot parse: `"
	.size	.Lglobal_str.45, 16

	.type	.Lglobal_str.46,@object         # @global_str.46
.Lglobal_str.46:
	.asciz	"`\n"
	.size	.Lglobal_str.46, 3

	.type	.Lglobal_str.47,@object         # @global_str.47
.Lglobal_str.47:
	.asciz	"begin\n"
	.size	.Lglobal_str.47, 7

	.type	.Lglobal_str.48,@object         # @global_str.48
.Lglobal_str.48:
	.asciz	"178.7492 aa 786 bcd"
	.size	.Lglobal_str.48, 20

	.section	".note.GNU-stack","",@progbits
