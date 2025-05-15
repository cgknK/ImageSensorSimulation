	.file	"flat-data_vs_nested_7.c"
 # GNU C17 (Rev6, Built by MSYS2 project) version 13.1.0 (x86_64-w64-mingw32)
 #	compiled by GNU C version 13.1.0, GMP version 6.2.1, MPFR version 4.2.0-p4, MPC version 1.3.1, isl version isl-0.26-GMP

 # warning: MPFR header version 4.2.0-p4 differs from library version 4.2.0-p9.
 # GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
 # options passed: -mtune=generic -march=nocona -O3
	.text
	.section .rdata,"dr"
.LC0:
	.ascii "malloc ba\376ar\375s\375z: %zu byte\12\0"
	.align 8
.LC1:
	.ascii "malloc ba\376ar\375l\375: ... byte (... MB)\0"
	.text
	.p2align 4
	.globl	create_flat_data
	.def	create_flat_data;	.scl	2;	.type	32;	.endef
	.seh_proc	create_flat_data
create_flat_data:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$40, %rsp	 #,
	.seh_stackalloc	40
	.seh_endprologue
 # flat-data_vs_nested_7.c:21: Pixel *create_flat_data(int width, int height) {
	movslq	%ecx, %rsi	 # tmp133,
	movslq	%edx, %rax	 # tmp134,
	movq	%rsi, %rbx	 #,
 # flat-data_vs_nested_7.c:22:     Pixel *data = malloc(sizeof(Pixel) * width * height);
	imulq	%rax, %rsi	 # height, tmp107
 # flat-data_vs_nested_7.c:21: Pixel *create_flat_data(int width, int height) {
	movq	%rax, %rbp	 #,
 # flat-data_vs_nested_7.c:22:     Pixel *data = malloc(sizeof(Pixel) * width * height);
	salq	$2, %rsi	 #, _4
	movq	%rsi, %rcx	 # _4,
	call	malloc	 #
	movq	%rax, %rdi	 # tmp135, <retval>
 # flat-data_vs_nested_7.c:23:     if (!data) {
	testq	%rax, %rax	 # <retval>
	je	.L7	 #,
 # flat-data_vs_nested_7.c:27:     printf("%s", "malloc baþarýlý: ... byte (... MB)\n");
	leaq	.LC1(%rip), %rcx	 #, tmp111
	call	puts	 #
 # flat-data_vs_nested_7.c:28:     for (int i = 0; i < width * height; i++) {
	movl	%ebx, %eax	 # width, width
	imull	%ebp, %eax	 # height, width
 # flat-data_vs_nested_7.c:28:     for (int i = 0; i < width * height; i++) {
	testl	%eax, %eax	 # _39
	jle	.L1	 #,
	cltq
	movq	%rdi, %rbx	 # <retval>, ivtmp.16
	leaq	(%rdi,%rax,4), %rsi	 #, _48
	.p2align 4,,10
	.p2align 3
.L4:
 # flat-data_vs_nested_7.c:29:         data[i].r = rand() % 256;
	call	rand	 #
 # flat-data_vs_nested_7.c:28:     for (int i = 0; i < width * height; i++) {
	addq	$4, %rbx	 #, ivtmp.16
 # flat-data_vs_nested_7.c:29:         data[i].r = rand() % 256;
	cltd
	shrl	$24, %edx	 #, tmp116
	addl	%edx, %eax	 # tmp116, tmp117
	movzbl	%al, %eax	 # tmp117, tmp118
	subl	%edx, %eax	 # tmp116, tmp119
 # flat-data_vs_nested_7.c:29:         data[i].r = rand() % 256;
	movb	%al, -4(%rbx)	 # tmp119, MEM[(unsigned char *)_37]
 # flat-data_vs_nested_7.c:30:         data[i].g = rand() % 256;
	call	rand	 #
 # flat-data_vs_nested_7.c:30:         data[i].g = rand() % 256;
	cltd
	shrl	$24, %edx	 #, tmp122
	addl	%edx, %eax	 # tmp122, tmp123
	movzbl	%al, %eax	 # tmp123, tmp124
	subl	%edx, %eax	 # tmp122, tmp125
 # flat-data_vs_nested_7.c:30:         data[i].g = rand() % 256;
	movb	%al, -3(%rbx)	 # tmp125, MEM[(unsigned char *)_37 + 1B]
 # flat-data_vs_nested_7.c:31:         data[i].b = rand() % 256;
	call	rand	 #
 # flat-data_vs_nested_7.c:31:         data[i].b = rand() % 256;
	cltd
	shrl	$24, %edx	 #, tmp128
	addl	%edx, %eax	 # tmp128, tmp129
	movzbl	%al, %eax	 # tmp129, tmp130
	subl	%edx, %eax	 # tmp128, tmp131
 # flat-data_vs_nested_7.c:31:         data[i].b = rand() % 256;
	movb	%al, -2(%rbx)	 # tmp131, MEM[(unsigned char *)_37 + 2B]
 # flat-data_vs_nested_7.c:28:     for (int i = 0; i < width * height; i++) {
	cmpq	%rsi, %rbx	 # _48, ivtmp.16
	jne	.L4	 #,
.L1:
 # flat-data_vs_nested_7.c:34: }
	movq	%rdi, %rax	 # <retval>,
	addq	$40, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	ret	
.L7:
 # flat-data_vs_nested_7.c:24:         fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * (size_t)width * height);
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # flat-data_vs_nested_7.c:24:         fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * (size_t)width * height);
	movq	%rsi, %r8	 # _4,
	leaq	.LC0(%rip), %rdx	 #, tmp110
 # flat-data_vs_nested_7.c:24:         fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * (size_t)width * height);
	movq	%rax, %rcx	 # tmp136, _5
 # flat-data_vs_nested_7.c:24:         fprintf(stderr, "malloc baþarýsýz: %zu byte\n", sizeof(Pixel) * (size_t)width * height);
	call	fprintf	 #
 # flat-data_vs_nested_7.c:25:         exit(EXIT_FAILURE);
	movl	$1, %ecx	 #,
	call	exit	 #
	nop	
	.seh_endproc
	.p2align 4
	.globl	create_nested_data
	.def	create_nested_data;	.scl	2;	.type	32;	.endef
	.seh_proc	create_nested_data
create_nested_data:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$40, %rsp	 #,
	.seh_stackalloc	40
	.seh_endprologue
 # flat-data_vs_nested_7.c:36: Pixel **create_nested_data(Pixel *flat_data, int width, int height) {
	movslq	%r8d, %r9	 # tmp101,
	movq	%rcx, %rbx	 # tmp99, flat_data
	movl	%edx, %esi	 # tmp100, width
 # flat-data_vs_nested_7.c:37:     Pixel **data = malloc(sizeof(Pixel *) * height);
	leaq	0(,%r9,8), %rdi	 #, _2
 # flat-data_vs_nested_7.c:36: Pixel **create_nested_data(Pixel *flat_data, int width, int height) {
	movq	%r9, %rbp	 #,
 # flat-data_vs_nested_7.c:37:     Pixel **data = malloc(sizeof(Pixel *) * height);
	movq	%rdi, %rcx	 # _2,
	call	malloc	 #
 # flat-data_vs_nested_7.c:38:     if (!data) return NULL;
	testq	%rax, %rax	 # <retval>
	je	.L8	 #,
 # flat-data_vs_nested_7.c:39:     for (int i = 0; i < height; i++) {
	testl	%ebp, %ebp	 # height
	jle	.L8	 #,
	movslq	%esi, %rdx	 # width, width
	movq	%rbx, %rcx	 # flat_data, ivtmp.26
	leaq	(%rdi,%rax), %r9	 #, _34
	leaq	0(,%rdx,4), %r8	 #, _31
	movq	%rax, %rdx	 # <retval>, ivtmp.27
	.p2align 4,,10
	.p2align 3
.L10:
 # flat-data_vs_nested_7.c:40:         data[i] = &flat_data[i * width];
	movq	%rcx, (%rdx)	 # ivtmp.26, MEM[(struct Pixel * *)_21]
 # flat-data_vs_nested_7.c:39:     for (int i = 0; i < height; i++) {
	addq	$8, %rdx	 #, ivtmp.27
	addq	%r8, %rcx	 # _31, ivtmp.26
	cmpq	%r9, %rdx	 # _34, ivtmp.27
	jne	.L10	 #,
.L8:
 # flat-data_vs_nested_7.c:43: }
	addq	$40, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	ret	
	.seh_endproc
	.p2align 4
	.globl	test_flat
	.def	test_flat;	.scl	2;	.type	32;	.endef
	.seh_proc	test_flat
test_flat:
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$64, %rsp	 #,
	.seh_stackalloc	64
	movups	%xmm6, (%rsp)	 #,
	.seh_savexmm	%xmm6, 0
	movups	%xmm7, 16(%rsp)	 #,
	.seh_savexmm	%xmm7, 16
	movups	%xmm8, 32(%rsp)	 #,
	.seh_savexmm	%xmm8, 32
	movups	%xmm9, 48(%rsp)	 #,
	.seh_savexmm	%xmm9, 48
	.seh_endprologue
 # flat-data_vs_nested_7.c:45: unsigned long long test_flat(Pixel *flat_data, int width, int height) {
	movq	%rcx, %r10	 # tmp365, flat_data
	movl	%edx, %r9d	 # tmp366, width
	movl	%r8d, %ebx	 # tmp367, height
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	testl	%r8d, %r8d	 # height
	jle	.L23	 #,
	leal	-1(%rdx), %ebp	 #, _30
	movslq	%edx, %rdi	 # width, _228
	movdqu	.LC2(%rip), %xmm3	 #, tmp360
 # flat-data_vs_nested_7.c:46:     unsigned long long total = 0;
	xorl	%edx, %edx	 # <retval>
	movl	%ebp, %esi	 # _30, bnd.36
	movl	%ebp, %r13d	 # _30, tmp.38
	movq	%rcx, %r11	 # flat_data, ivtmp.63
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	xorl	%r8d, %r8d	 # i
	shrl	$4, %esi	 #,
	andl	$-16, %r13d	 #, tmp.38
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	pxor	%xmm6, %xmm6	 # tmp361
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	xorl	%ecx, %ecx	 # ivtmp.62
	leaq	0(,%rdi,4), %r12	 #, _139
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	pxor	%xmm4, %xmm4	 # tmp362
	salq	$6, %rsi	 #, _24
	pxor	%xmm2, %xmm2	 # tmp363
	.p2align 4,,10
	.p2align 3
.L22:
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	testl	%r9d, %r9d	 # width
	jle	.L17	 #,
	cmpl	$15, %ebp	 #, _30
	jbe	.L24	 #,
	leaq	(%rsi,%r11), %r14	 #, _46
	movq	%r11, %rax	 # ivtmp.63, ivtmp.55
	pxor	%xmm5, %xmm5	 # vect_total_20.49
	.p2align 4,,10
	.p2align 3
.L19:
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_108], tmp250
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_108 + 16B], tmp251
	addq	$64, %rax	 #, ivtmp.55
	movdqu	-16(%rax), %xmm7	 # MEM <vector(16) unsigned char> [(unsigned char *)_108 + 48B], tmp257
	pand	%xmm3, %xmm1	 # tmp360, tmp251
	pand	%xmm3, %xmm0	 # tmp360, tmp250
	packuswb	%xmm1, %xmm0	 # tmp251, tmp249
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_108 + 32B], tmp256
	pand	%xmm3, %xmm7	 # tmp360, tmp257
	pand	%xmm3, %xmm0	 # tmp360, tmp259
	pand	%xmm3, %xmm1	 # tmp360, tmp256
	packuswb	%xmm7, %xmm1	 # tmp257, tmp255
	pand	%xmm3, %xmm1	 # tmp360, tmp260
	packuswb	%xmm1, %xmm0	 # tmp260, vect_perm_even_61
	movdqa	%xmm0, %xmm1	 # vect_perm_even_61, tmp263
	punpckhbw	%xmm6, %xmm0	 # tmp361, tmp265
	punpcklbw	%xmm6, %xmm1	 # tmp361, tmp263
	movdqa	%xmm0, %xmm7	 # tmp265, tmp271
	punpckhwd	%xmm4, %xmm0	 # tmp362, tmp273
	movdqa	%xmm1, %xmm8	 # tmp263, tmp267
	punpckhwd	%xmm4, %xmm1	 # tmp362, tmp269
	punpcklwd	%xmm4, %xmm7	 # tmp362, tmp271
	movdqa	%xmm1, %xmm9	 # tmp269, tmp276
	punpcklwd	%xmm4, %xmm8	 # tmp362, tmp267
	punpckhdq	%xmm2, %xmm1	 # tmp363, tmp279
	punpckldq	%xmm2, %xmm9	 # tmp363, tmp276
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm9, %xmm1	 # tmp276, tmp280
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm8, %xmm9	 # tmp267, tmp283
	punpckhdq	%xmm2, %xmm8	 # tmp363, tmp286
	punpckldq	%xmm2, %xmm9	 # tmp363, tmp283
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm9, %xmm8	 # tmp283, tmp287
	paddq	%xmm8, %xmm1	 # tmp287, tmp288
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm7, %xmm8	 # tmp271, tmp291
	punpckhdq	%xmm2, %xmm7	 # tmp363, tmp294
	punpckldq	%xmm2, %xmm8	 # tmp363, tmp291
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm8, %xmm7	 # tmp291, tmp295
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm0, %xmm8	 # tmp273, tmp298
	punpckhdq	%xmm2, %xmm0	 # tmp363, tmp303
	punpckldq	%xmm2, %xmm8	 # tmp363, tmp298
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm5, %xmm0	 # vect_total_20.49, tmp304
	paddq	%xmm8, %xmm7	 # tmp298, tmp299
	paddq	%xmm7, %xmm1	 # tmp299, tmp300
	movdqa	%xmm1, %xmm5	 # tmp300, tmp300
	paddq	%xmm0, %xmm5	 # tmp304, tmp300
	cmpq	%rax, %r14	 # ivtmp.55, _46
	jne	.L19	 #,
	movdqa	%xmm5, %xmm0	 # vect_total_20.49, tmp306
	psrldq	$8, %xmm0	 #, tmp306
	paddq	%xmm0, %xmm5	 # tmp306, tmp307
	movq	%xmm5, %rax	 # tmp307, stmp_total_20.50
	addq	%rax, %rdx	 # stmp_total_20.50, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	movl	%r13d, %eax	 # tmp.38, j
.L18:
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%eax, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp310
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _3->r, _3->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _3->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	1(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp313
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _32->r, _32->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _32->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	2(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp316
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _103->r, _103->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _103->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	3(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp319
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _113->r, _113->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _113->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	4(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp322
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _123->r, _123->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _123->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	5(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp325
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _133->r, _133->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _133->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	6(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp328
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _143->r, _143->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _143->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	7(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp331
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _153->r, _153->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _153->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	8(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp334
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _163->r, _163->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _163->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	9(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp337
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _173->r, _173->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _173->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	10(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp340
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _183->r, _183->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _183->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	11(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp343
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _193->r, _193->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _193->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	12(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp346
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _203->r, _203->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _203->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	13(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
	addq	%rcx, %r14	 # ivtmp.62, tmp349
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _213->r, _213->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _213->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	leal	14(%rax), %r14d	 #, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%r14d, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movslq	%r14d, %r14	 # j, j
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	addl	$15, %eax	 #, j
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%rcx, %r14	 # ivtmp.62, tmp352
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%r14,4), %r14d	 # _223->r, _223->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%r14, %rdx	 # _223->r, <retval>
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	cmpl	%eax, %r9d	 # j, width
	jle	.L17	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	cltq
	addq	%rcx, %rax	 # ivtmp.62, tmp355
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	(%r10,%rax,4), %eax	 # _37->r, _37->r
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	addq	%rax, %rdx	 # _37->r, <retval>
	.p2align 4,,10
	.p2align 3
.L17:
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	addl	$1, %r8d	 #, i
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	addq	%rdi, %rcx	 # _228, ivtmp.62
	addq	%r12, %r11	 # _139, ivtmp.63
	cmpl	%r8d, %ebx	 # i, height
	jne	.L22	 #,
.L15:
 # flat-data_vs_nested_7.c:56: }
	movups	(%rsp), %xmm6	 #,
	movups	16(%rsp), %xmm7	 #,
	movq	%rdx, %rax	 # <retval>,
	movups	32(%rsp), %xmm8	 #,
	movups	48(%rsp), %xmm9	 #,
	addq	$64, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	ret	
.L24:
 # flat-data_vs_nested_7.c:50:         for (int j = 0; j < width; j++) {
	xorl	%eax, %eax	 # j
	jmp	.L18	 #
.L23:
 # flat-data_vs_nested_7.c:46:     unsigned long long total = 0;
	xorl	%edx, %edx	 # <retval>
 # flat-data_vs_nested_7.c:55:     return total;
	jmp	.L15	 #
	.seh_endproc
	.p2align 4
	.globl	test_flat_pt_aritm
	.def	test_flat_pt_aritm;	.scl	2;	.type	32;	.endef
	.seh_proc	test_flat_pt_aritm
test_flat_pt_aritm:
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	movups	%xmm6, (%rsp)	 #,
	.seh_savexmm	%xmm6, 0
	movups	%xmm7, 16(%rsp)	 #,
	.seh_savexmm	%xmm7, 16
	movups	%xmm8, 32(%rsp)	 #,
	.seh_savexmm	%xmm8, 32
	movups	%xmm9, 48(%rsp)	 #,
	.seh_savexmm	%xmm9, 48
	.seh_endprologue
 # flat-data_vs_nested_7.c:58: unsigned long long test_flat_pt_aritm(Pixel *flat_data, int width, int height) {
	movl	%r8d, %esi	 # tmp289, height
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	testl	%r8d, %r8d	 # height
	jle	.L35	 #,
 # flat-data_vs_nested_7.c:64:         Pixel *row_end = row + width;       // Satýr sonu
	movslq	%edx, %rdx	 # width, width
	movq	%rcx, %r11	 # flat_data, ivtmp.98
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	xorl	%r8d, %r8d	 # i
 # flat-data_vs_nested_7.c:59:     unsigned long long total = 0;
	xorl	%r9d, %r9d	 # <retval>
 # flat-data_vs_nested_7.c:64:         Pixel *row_end = row + width;       // Satýr sonu
	leaq	0(,%rdx,4), %rbx	 #, _5
	movdqu	.LC2(%rip), %xmm3	 #, tmp283
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm6, %xmm6	 # tmp284
	pxor	%xmm4, %xmm4	 # tmp285
	leaq	(%rcx,%rbx), %r10	 #, ivtmp.99
	pxor	%xmm2, %xmm2	 # tmp286
	.p2align 4,,10
	.p2align 3
.L34:
 # flat-data_vs_nested_7.c:63:         Pixel *row = &flat_data[i * width]; // Satýr baþlangýcý
	movq	%r11, %rax	 # ivtmp.98, tmp.74
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %r11	 # ivtmp.99, ivtmp.98
	jnb	.L29	 #,
	leaq	-1(%r10), %rdx	 #, tmp183
	subq	%r11, %rdx	 # ivtmp.98, _12
	cmpq	$63, %rdx	 #, _12
	jbe	.L30	 #,
	movq	%rdx, %rcx	 # _12, bnd.72
	andq	$-64, %rdx	 #, tmp184
	pxor	%xmm5, %xmm5	 # vect_total_21.85
	shrq	$6, %rcx	 #, bnd.72
	addq	%r11, %rdx	 # ivtmp.98, _177
	.p2align 4,,10
	.p2align 3
.L31:
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_51], tmp188
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_51 + 16B], tmp189
	addq	$64, %rax	 #, ivtmp.91
	movdqu	-16(%rax), %xmm7	 # MEM <vector(16) unsigned char> [(unsigned char *)_51 + 48B], tmp195
	pand	%xmm3, %xmm1	 # tmp283, tmp189
	pand	%xmm3, %xmm0	 # tmp283, tmp188
	packuswb	%xmm1, %xmm0	 # tmp189, tmp187
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_51 + 32B], tmp194
	pand	%xmm3, %xmm7	 # tmp283, tmp195
	pand	%xmm3, %xmm0	 # tmp283, tmp197
	pand	%xmm3, %xmm1	 # tmp283, tmp194
	packuswb	%xmm7, %xmm1	 # tmp195, tmp193
	pand	%xmm3, %xmm1	 # tmp283, tmp198
	packuswb	%xmm1, %xmm0	 # tmp198, vect_perm_even_66
	movdqa	%xmm0, %xmm7	 # vect_perm_even_66, tmp201
	punpckhbw	%xmm6, %xmm0	 # tmp284, tmp203
	punpcklbw	%xmm6, %xmm7	 # tmp284, tmp201
	movdqa	%xmm0, %xmm8	 # tmp203, tmp209
	punpckhwd	%xmm4, %xmm0	 # tmp285, tmp211
	movdqa	%xmm7, %xmm1	 # tmp201, tmp205
	punpckhwd	%xmm4, %xmm7	 # tmp285, tmp207
	punpcklwd	%xmm4, %xmm8	 # tmp285, tmp209
	punpcklwd	%xmm4, %xmm1	 # tmp285, tmp205
	movdqa	%xmm1, %xmm9	 # tmp205, tmp214
	punpckhdq	%xmm2, %xmm1	 # tmp286, tmp217
	punpckldq	%xmm2, %xmm9	 # tmp286, tmp214
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm9, %xmm1	 # tmp214, tmp218
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm7, %xmm9	 # tmp207, tmp221
	punpckhdq	%xmm2, %xmm7	 # tmp286, tmp224
	punpckldq	%xmm2, %xmm9	 # tmp286, tmp221
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm9, %xmm7	 # tmp221, tmp225
	paddq	%xmm7, %xmm1	 # tmp225, tmp226
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm8, %xmm7	 # tmp209, tmp229
	punpckhdq	%xmm2, %xmm8	 # tmp286, tmp232
	punpckldq	%xmm2, %xmm7	 # tmp286, tmp229
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm7, %xmm8	 # tmp229, tmp233
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm0, %xmm7	 # tmp211, tmp236
	punpckhdq	%xmm2, %xmm0	 # tmp286, tmp241
	punpckldq	%xmm2, %xmm7	 # tmp286, tmp236
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm5, %xmm0	 # vect_total_21.85, tmp242
	paddq	%xmm7, %xmm8	 # tmp236, tmp237
	paddq	%xmm8, %xmm1	 # tmp237, tmp238
	movdqa	%xmm1, %xmm5	 # tmp238, tmp238
	paddq	%xmm0, %xmm5	 # tmp242, tmp238
	cmpq	%rdx, %rax	 # _177, ivtmp.91
	jne	.L31	 #,
	movdqa	%xmm5, %xmm0	 # vect_total_21.85, tmp244
	movq	%rcx, %rax	 # bnd.72, bnd.72
	psrldq	$8, %xmm0	 #, tmp244
	salq	$6, %rax	 #, bnd.72
	paddq	%xmm0, %xmm5	 # tmp244, tmp245
	addq	%r11, %rax	 # ivtmp.98, tmp.74
	movq	%xmm5, %rdx	 # tmp245, stmp_total_21.86
	addq	%rdx, %r9	 # stmp_total_21.86, <retval>
.L30:
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	(%rax), %edx	 # ptr_43->r, ptr_43->r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # ptr_43->r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	4(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	4(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 4B].r, MEM[(struct Pixel *)ptr_43 + 4B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 4B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	8(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	8(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 8B].r, MEM[(struct Pixel *)ptr_43 + 8B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 8B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	12(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	12(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 12B].r, MEM[(struct Pixel *)ptr_43 + 12B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 12B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	16(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	16(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 16B].r, MEM[(struct Pixel *)ptr_43 + 16B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 16B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	20(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	20(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 20B].r, MEM[(struct Pixel *)ptr_43 + 20B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 20B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	24(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	24(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 24B].r, MEM[(struct Pixel *)ptr_43 + 24B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 24B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	28(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	28(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 28B].r, MEM[(struct Pixel *)ptr_43 + 28B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 28B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	32(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	32(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 32B].r, MEM[(struct Pixel *)ptr_43 + 32B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 32B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	36(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	36(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 36B].r, MEM[(struct Pixel *)ptr_43 + 36B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 36B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	40(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	40(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 40B].r, MEM[(struct Pixel *)ptr_43 + 40B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 40B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	44(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	44(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 44B].r, MEM[(struct Pixel *)ptr_43 + 44B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 44B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	48(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	48(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 48B].r, MEM[(struct Pixel *)ptr_43 + 48B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 48B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	52(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	52(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 52B].r, MEM[(struct Pixel *)ptr_43 + 52B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 52B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	56(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	56(%rax), %edx	 # MEM[(struct Pixel *)ptr_43 + 56B].r, MEM[(struct Pixel *)ptr_43 + 56B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rdx, %r9	 # MEM[(struct Pixel *)ptr_43 + 56B].r, <retval>
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	60(%rax), %rdx	 #, ptr
 # flat-data_vs_nested_7.c:65:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r10, %rdx	 # ivtmp.99, ptr
	jnb	.L29	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	60(%rax), %eax	 # MEM[(struct Pixel *)ptr_43 + 60B].r, MEM[(struct Pixel *)ptr_43 + 60B].r
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %r9	 # MEM[(struct Pixel *)ptr_43 + 60B].r, <retval>
	.p2align 4,,10
	.p2align 3
.L29:
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	addl	$1, %r8d	 #, i
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	addq	%rbx, %r11	 # _5, ivtmp.98
	addq	%rbx, %r10	 # _5, ivtmp.99
	cmpl	%r8d, %esi	 # i, height
	jne	.L34	 #,
.L27:
 # flat-data_vs_nested_7.c:70: }
	movups	(%rsp), %xmm6	 #,
	movups	16(%rsp), %xmm7	 #,
	movq	%r9, %rax	 # <retval>,
	movups	32(%rsp), %xmm8	 #,
	movups	48(%rsp), %xmm9	 #,
	addq	$72, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	ret	
.L35:
 # flat-data_vs_nested_7.c:59:     unsigned long long total = 0;
	xorl	%r9d, %r9d	 # <retval>
 # flat-data_vs_nested_7.c:69:     return total;
	jmp	.L27	 #
	.seh_endproc
	.p2align 4
	.globl	test_nested
	.def	test_nested;	.scl	2;	.type	32;	.endef
	.seh_proc	test_nested
test_nested:
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$72, %rsp	 #,
	.seh_stackalloc	72
	movups	%xmm6, (%rsp)	 #,
	.seh_savexmm	%xmm6, 0
	movups	%xmm7, 16(%rsp)	 #,
	.seh_savexmm	%xmm7, 16
	movups	%xmm8, 32(%rsp)	 #,
	.seh_savexmm	%xmm8, 32
	movups	%xmm9, 48(%rsp)	 #,
	.seh_savexmm	%xmm9, 48
	.seh_endprologue
 # flat-data_vs_nested_7.c:72: unsigned long long test_nested(Pixel **nested_data, int width, int height) {
	movl	%edx, %r9d	 # tmp322, width
 # flat-data_vs_nested_7.c:74:     for (int i = 0; i < height; i++) {
	testl	%r8d, %r8d	 # height
	jle	.L48	 #,
	leal	-1(%rdx), %esi	 #, _11
	movslq	%r8d, %r8	 # height, height
	movq	%rcx, %r10	 # nested_data, ivtmp.136
	movl	%esi, %ebx	 # _11, bnd.109
	movl	%esi, %ebp	 # _11, tmp.111
	leaq	(%rcx,%r8,8), %rdi	 #, _185
	shrl	$4, %ebx	 #,
	andl	$-16, %ebp	 #, tmp.111
	salq	$6, %rbx	 #, _214
.L40:
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	testl	%r9d, %r9d	 # width
	jle	.L53	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	pxor	%xmm6, %xmm6	 # tmp317
	pxor	%xmm4, %xmm4	 # tmp318
	pxor	%xmm2, %xmm2	 # tmp319
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	xorl	%edx, %edx	 # <retval>
	movdqu	.LC2(%rip), %xmm3	 #, tmp316
	.p2align 4,,10
	.p2align 3
.L44:
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movq	(%r10), %rcx	 # MEM[(struct Pixel * *)_184], _4
	cmpl	$15, %esi	 #, _11
	jbe	.L47	 #,
	movq	%rcx, %rax	 # _4, ivtmp.128
	leaq	(%rbx,%rcx), %r8	 #, _212
	pxor	%xmm5, %xmm5	 # vect_total_21.122
	.p2align 4,,10
	.p2align 3
.L42:
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_219], tmp222
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_219 + 16B], tmp223
	addq	$64, %rax	 #, ivtmp.128
	movdqu	-16(%rax), %xmm7	 # MEM <vector(16) unsigned char> [(unsigned char *)_219 + 48B], tmp229
	pand	%xmm3, %xmm1	 # tmp316, tmp223
	pand	%xmm3, %xmm0	 # tmp316, tmp222
	packuswb	%xmm1, %xmm0	 # tmp223, tmp221
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_219 + 32B], tmp228
	pand	%xmm3, %xmm7	 # tmp316, tmp229
	pand	%xmm3, %xmm0	 # tmp316, tmp231
	pand	%xmm3, %xmm1	 # tmp316, tmp228
	packuswb	%xmm7, %xmm1	 # tmp229, tmp227
	pand	%xmm3, %xmm1	 # tmp316, tmp232
	packuswb	%xmm1, %xmm0	 # tmp232, vect_perm_even_62
	movdqa	%xmm0, %xmm1	 # vect_perm_even_62, tmp235
	punpckhbw	%xmm6, %xmm0	 # tmp317, tmp237
	punpcklbw	%xmm6, %xmm1	 # tmp317, tmp235
	movdqa	%xmm0, %xmm7	 # tmp237, tmp243
	punpckhwd	%xmm4, %xmm0	 # tmp318, tmp245
	movdqa	%xmm1, %xmm8	 # tmp235, tmp239
	punpckhwd	%xmm4, %xmm1	 # tmp318, tmp241
	punpcklwd	%xmm4, %xmm7	 # tmp318, tmp243
	movdqa	%xmm1, %xmm9	 # tmp241, tmp248
	punpcklwd	%xmm4, %xmm8	 # tmp318, tmp239
	punpckhdq	%xmm2, %xmm1	 # tmp319, tmp251
	punpckldq	%xmm2, %xmm9	 # tmp319, tmp248
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm9, %xmm1	 # tmp248, tmp252
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm8, %xmm9	 # tmp239, tmp255
	punpckhdq	%xmm2, %xmm8	 # tmp319, tmp258
	punpckldq	%xmm2, %xmm9	 # tmp319, tmp255
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm9, %xmm8	 # tmp255, tmp259
	paddq	%xmm8, %xmm1	 # tmp259, tmp260
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm7, %xmm8	 # tmp243, tmp263
	punpckhdq	%xmm2, %xmm7	 # tmp319, tmp266
	punpckldq	%xmm2, %xmm8	 # tmp319, tmp263
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm8, %xmm7	 # tmp263, tmp267
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm0, %xmm8	 # tmp245, tmp270
	punpckhdq	%xmm2, %xmm0	 # tmp319, tmp275
	punpckldq	%xmm2, %xmm8	 # tmp319, tmp270
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm5, %xmm0	 # vect_total_21.122, tmp276
	paddq	%xmm8, %xmm7	 # tmp270, tmp271
	paddq	%xmm7, %xmm1	 # tmp271, tmp272
	movdqa	%xmm1, %xmm5	 # tmp272, tmp272
	paddq	%xmm0, %xmm5	 # tmp276, tmp272
	cmpq	%rax, %r8	 # ivtmp.128, _212
	jne	.L42	 #,
	movdqa	%xmm5, %xmm0	 # vect_total_21.122, tmp278
	psrldq	$8, %xmm0	 #, tmp278
	paddq	%xmm0, %xmm5	 # tmp278, tmp279
	movq	%xmm5, %rax	 # tmp279, stmp_total_21.123
	addq	%rax, %rdx	 # stmp_total_21.123, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	movl	%ebp, %eax	 # tmp.111, j
.L41:
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movslq	%eax, %r11	 # j, j
	leaq	0(,%r11,4), %r8	 #, _6
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	(%rcx,%r11,4), %r11d	 # _7->r, _7->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _7->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	1(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	4(%rcx,%r8), %r11d	 # _22->r, _22->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _22->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	2(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	8(%rcx,%r8), %r11d	 # _98->r, _98->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _98->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	3(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	12(%rcx,%r8), %r11d	 # _107->r, _107->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _107->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	4(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	16(%rcx,%r8), %r11d	 # _116->r, _116->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _116->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	5(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	20(%rcx,%r8), %r11d	 # _125->r, _125->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _125->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	6(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	24(%rcx,%r8), %r11d	 # _134->r, _134->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _134->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	7(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	28(%rcx,%r8), %r11d	 # _143->r, _143->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _143->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	8(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	32(%rcx,%r8), %r11d	 # _152->r, _152->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _152->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	9(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	36(%rcx,%r8), %r11d	 # _161->r, _161->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _161->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	10(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	40(%rcx,%r8), %r11d	 # _170->r, _170->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _170->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	11(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	44(%rcx,%r8), %r11d	 # _179->r, _179->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _179->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	12(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	48(%rcx,%r8), %r11d	 # _188->r, _188->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _188->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	13(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	52(%rcx,%r8), %r11d	 # _197->r, _197->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _197->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	leal	14(%rax), %r11d	 #, j
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%r11d, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	56(%rcx,%r8), %r11d	 # _206->r, _206->r
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	addl	$15, %eax	 #, j
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%r11, %rdx	 # _206->r, <retval>
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	cmpl	%eax, %r9d	 # j, width
	jle	.L43	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	60(%rcx,%r8), %eax	 # _31->r, _31->r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	addq	%rax, %rdx	 # _31->r, <retval>
	.p2align 4,,10
	.p2align 3
.L43:
 # flat-data_vs_nested_7.c:74:     for (int i = 0; i < height; i++) {
	addq	$8, %r10	 #, ivtmp.136
	cmpq	%r10, %rdi	 # ivtmp.136, _185
	jne	.L44	 #,
.L38:
 # flat-data_vs_nested_7.c:80: }
	movups	(%rsp), %xmm6	 #,
	movups	16(%rsp), %xmm7	 #,
	movq	%rdx, %rax	 # <retval>,
	movups	32(%rsp), %xmm8	 #,
	movups	48(%rsp), %xmm9	 #,
	addq	$72, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	ret	
.L53:
 # flat-data_vs_nested_7.c:74:     for (int i = 0; i < height; i++) {
	addq	$8, %r10	 #, ivtmp.136
	cmpq	%rdi, %r10	 # _185, ivtmp.136
	jne	.L40	 #,
.L48:
	xorl	%edx, %edx	 # <retval>
 # flat-data_vs_nested_7.c:79:     return total;
	jmp	.L38	 #
.L47:
 # flat-data_vs_nested_7.c:75:         for (int j = 0; j < width; j++) {
	xorl	%eax, %eax	 # j
	jmp	.L41	 #
	.seh_endproc
	.p2align 4
	.globl	test_nested_ptr
	.def	test_nested_ptr;	.scl	2;	.type	32;	.endef
	.seh_proc	test_nested_ptr
test_nested_ptr:
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$64, %rsp	 #,
	.seh_stackalloc	64
	movups	%xmm6, (%rsp)	 #,
	.seh_savexmm	%xmm6, 0
	movups	%xmm7, 16(%rsp)	 #,
	.seh_savexmm	%xmm7, 16
	movups	%xmm8, 32(%rsp)	 #,
	.seh_savexmm	%xmm8, 32
	movups	%xmm9, 48(%rsp)	 #,
	.seh_savexmm	%xmm9, 48
	.seh_endprologue
 # flat-data_vs_nested_7.c:86:     for (int i = 0; i < height; i++) {
	testl	%r8d, %r8d	 # height
	jle	.L62	 #,
 # flat-data_vs_nested_7.c:88:         Pixel *row_end = row + width;     // Satýr sonu
	movslq	%edx, %rdx	 # width, width
	movslq	%r8d, %r8	 # height, height
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm6, %xmm6	 # tmp288
	movq	%rcx, %r10	 # nested_data, ivtmp.170
 # flat-data_vs_nested_7.c:88:         Pixel *row_end = row + width;     // Satýr sonu
	leaq	0(,%rdx,4), %r11	 #, _5
	movdqu	.LC2(%rip), %xmm3	 #, tmp287
	leaq	(%rcx,%r8,8), %rsi	 #, _115
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm4, %xmm4	 # tmp289
	leaq	-1(%r11), %rdi	 #, _13
 # flat-data_vs_nested_7.c:83:     unsigned long long total = 0;
	xorl	%ecx, %ecx	 # <retval>
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm2, %xmm2	 # tmp290
	movq	%rdi, %rbx	 # _13, tmp285
	andq	$-64, %rbx	 #, tmp285
	.p2align 4,,10
	.p2align 3
.L61:
 # flat-data_vs_nested_7.c:87:         Pixel *row = nested_data[i];      // Satýr baþlangýcý
	movq	(%r10), %rdx	 # MEM[(struct Pixel * *)_103], tmp.146
 # flat-data_vs_nested_7.c:88:         Pixel *row_end = row + width;     // Satýr sonu
	leaq	(%rdx,%r11), %r8	 #, row_end
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rdx	 # row_end, tmp.146
	jnb	.L56	 #,
	movq	%rdx, %rax	 # tmp.146, ivtmp.163
	cmpq	$63, %rdi	 #, _13
	jbe	.L57	 #,
	leaq	(%rbx,%rdx), %r9	 #, _174
	pxor	%xmm5, %xmm5	 # vect_total_21.157
	.p2align 4,,10
	.p2align 3
.L58:
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_30], tmp189
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_30 + 16B], tmp190
	addq	$64, %rax	 #, ivtmp.163
	movdqu	-16(%rax), %xmm7	 # MEM <vector(16) unsigned char> [(unsigned char *)_30 + 48B], tmp196
	pand	%xmm3, %xmm1	 # tmp287, tmp190
	pand	%xmm3, %xmm0	 # tmp287, tmp189
	packuswb	%xmm1, %xmm0	 # tmp190, tmp188
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_30 + 32B], tmp195
	pand	%xmm3, %xmm7	 # tmp287, tmp196
	pand	%xmm3, %xmm0	 # tmp287, tmp198
	pand	%xmm3, %xmm1	 # tmp287, tmp195
	packuswb	%xmm7, %xmm1	 # tmp196, tmp194
	pand	%xmm3, %xmm1	 # tmp287, tmp199
	packuswb	%xmm1, %xmm0	 # tmp199, vect_perm_even_63
	movdqa	%xmm0, %xmm1	 # vect_perm_even_63, tmp202
	punpckhbw	%xmm6, %xmm0	 # tmp288, tmp204
	punpcklbw	%xmm6, %xmm1	 # tmp288, tmp202
	movdqa	%xmm0, %xmm7	 # tmp204, tmp210
	punpckhwd	%xmm4, %xmm0	 # tmp289, tmp212
	movdqa	%xmm1, %xmm8	 # tmp202, tmp206
	punpckhwd	%xmm4, %xmm1	 # tmp289, tmp208
	punpcklwd	%xmm4, %xmm7	 # tmp289, tmp210
	movdqa	%xmm1, %xmm9	 # tmp208, tmp215
	punpcklwd	%xmm4, %xmm8	 # tmp289, tmp206
	punpckhdq	%xmm2, %xmm1	 # tmp290, tmp218
	punpckldq	%xmm2, %xmm9	 # tmp290, tmp215
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm9, %xmm1	 # tmp215, tmp219
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm8, %xmm9	 # tmp206, tmp222
	punpckhdq	%xmm2, %xmm8	 # tmp290, tmp225
	punpckldq	%xmm2, %xmm9	 # tmp290, tmp222
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm9, %xmm8	 # tmp222, tmp226
	paddq	%xmm8, %xmm1	 # tmp226, tmp227
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm7, %xmm8	 # tmp210, tmp230
	punpckhdq	%xmm2, %xmm7	 # tmp290, tmp233
	punpckldq	%xmm2, %xmm8	 # tmp290, tmp230
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm8, %xmm7	 # tmp230, tmp234
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm0, %xmm8	 # tmp212, tmp237
	punpckhdq	%xmm2, %xmm0	 # tmp290, tmp242
	punpckldq	%xmm2, %xmm8	 # tmp290, tmp237
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm5, %xmm0	 # vect_total_21.157, tmp243
	paddq	%xmm8, %xmm7	 # tmp237, tmp238
	paddq	%xmm7, %xmm1	 # tmp238, tmp239
	movdqa	%xmm1, %xmm5	 # tmp239, tmp239
	paddq	%xmm0, %xmm5	 # tmp243, tmp239
	cmpq	%r9, %rax	 # _174, ivtmp.163
	jne	.L58	 #,
	movdqa	%xmm5, %xmm0	 # vect_total_21.157, tmp245
	addq	%rbx, %rdx	 # tmp285, tmp.146
	psrldq	$8, %xmm0	 #, tmp245
	paddq	%xmm0, %xmm5	 # tmp245, tmp246
	movq	%xmm5, %rax	 # tmp246, stmp_total_21.158
	addq	%rax, %rcx	 # stmp_total_21.158, <retval>
.L57:
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	(%rdx), %eax	 # ptr_43->r, ptr_43->r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # ptr_43->r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	4(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	4(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 4B].r, MEM[(struct Pixel *)ptr_43 + 4B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 4B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	8(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	8(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 8B].r, MEM[(struct Pixel *)ptr_43 + 8B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 8B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	12(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	12(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 12B].r, MEM[(struct Pixel *)ptr_43 + 12B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 12B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	16(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	16(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 16B].r, MEM[(struct Pixel *)ptr_43 + 16B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 16B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	20(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	20(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 20B].r, MEM[(struct Pixel *)ptr_43 + 20B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 20B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	24(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	24(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 24B].r, MEM[(struct Pixel *)ptr_43 + 24B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 24B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	28(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	28(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 28B].r, MEM[(struct Pixel *)ptr_43 + 28B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 28B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	32(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	32(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 32B].r, MEM[(struct Pixel *)ptr_43 + 32B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 32B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	36(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	36(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 36B].r, MEM[(struct Pixel *)ptr_43 + 36B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 36B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	40(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	40(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 40B].r, MEM[(struct Pixel *)ptr_43 + 40B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 40B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	44(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	44(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 44B].r, MEM[(struct Pixel *)ptr_43 + 44B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 44B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	48(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	48(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 48B].r, MEM[(struct Pixel *)ptr_43 + 48B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 48B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	52(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	52(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 52B].r, MEM[(struct Pixel *)ptr_43 + 52B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 52B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	56(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	56(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 56B].r, MEM[(struct Pixel *)ptr_43 + 56B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 56B].r, <retval>
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	leaq	60(%rdx), %rax	 #, ptr
 # flat-data_vs_nested_7.c:89:         for (Pixel *ptr = row; ptr < row_end; ptr++) {
	cmpq	%r8, %rax	 # row_end, ptr
	jnb	.L56	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	60(%rdx), %eax	 # MEM[(struct Pixel *)ptr_43 + 60B].r, MEM[(struct Pixel *)ptr_43 + 60B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	addq	%rax, %rcx	 # MEM[(struct Pixel *)ptr_43 + 60B].r, <retval>
	.p2align 4,,10
	.p2align 3
.L56:
 # flat-data_vs_nested_7.c:86:     for (int i = 0; i < height; i++) {
	addq	$8, %r10	 #, ivtmp.170
	cmpq	%rsi, %r10	 # _115, ivtmp.170
	jne	.L61	 #,
.L54:
 # flat-data_vs_nested_7.c:94: }
	movups	(%rsp), %xmm6	 #,
	movups	16(%rsp), %xmm7	 #,
	movq	%rcx, %rax	 # <retval>,
	movups	32(%rsp), %xmm8	 #,
	movups	48(%rsp), %xmm9	 #,
	addq	$64, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	ret	
.L62:
 # flat-data_vs_nested_7.c:83:     unsigned long long total = 0;
	xorl	%ecx, %ecx	 # <retval>
 # flat-data_vs_nested_7.c:93:     return total;
	jmp	.L54	 #
	.seh_endproc
	.p2align 4
	.globl	get_time_seconds
	.def	get_time_seconds;	.scl	2;	.type	32;	.endef
	.seh_proc	get_time_seconds
get_time_seconds:
	subq	$56, %rsp	 #,
	.seh_stackalloc	56
	.seh_endprologue
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %eax	 # initialized,
	testl	%eax, %eax	 #
	je	.L67	 #,
.L66:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	leaq	40(%rsp), %rcx	 #, tmp90
	call	*__imp_QueryPerformanceCounter(%rip)	 #
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp92
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm1, %xmm1	 # tmp93
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	40(%rsp), %xmm0	 # now.QuadPart, tmp92
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm1	 # frequency.QuadPart, tmp93
	divsd	%xmm1, %xmm0	 # tmp93, <retval>
 # flat-data_vs_nested_7.c:115: }
	addq	$56, %rsp	 #,
	ret	
	.p2align 4,,10
	.p2align 3
.L67:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp88
	call	*__imp_QueryPerformanceFrequency(%rip)	 #
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L66	 #
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC4:
	.ascii "flat_data malloc ba\376ar\375s\375z!\12\0"
	.align 8
.LC5:
	.ascii "nested_data malloc ba\376ar\375s\375z!\12\0"
	.align 8
.LC7:
	.ascii "Nested eri\376im ortalama s\374resi: %.6f saniye\12\0"
	.align 8
.LC8:
	.ascii "Flat eri\376im ortalama s\374resi:   %.6f saniye\12\0"
	.align 8
.LC9:
	.ascii "Nested_ptr eri\376im ortalama s\374resi: %.6f saniye\12\0"
	.align 8
.LC10:
	.ascii "Flat_ptr eri\376im ortalama s\374resi:   %.6f saniye\12\0"
	.section	.text.startup,"x"
	.p2align 4
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%r15	 #
	.seh_pushreg	%r15
	pushq	%r14	 #
	.seh_pushreg	%r14
	pushq	%r13	 #
	.seh_pushreg	%r13
	pushq	%r12	 #
	.seh_pushreg	%r12
	pushq	%rbp	 #
	.seh_pushreg	%rbp
	pushq	%rdi	 #
	.seh_pushreg	%rdi
	pushq	%rsi	 #
	.seh_pushreg	%rsi
	pushq	%rbx	 #
	.seh_pushreg	%rbx
	subq	$232, %rsp	 #,
	.seh_stackalloc	232
	movups	%xmm6, 80(%rsp)	 #,
	.seh_savexmm	%xmm6, 80
	movups	%xmm7, 96(%rsp)	 #,
	.seh_savexmm	%xmm7, 96
	movups	%xmm8, 112(%rsp)	 #,
	.seh_savexmm	%xmm8, 112
	movups	%xmm9, 128(%rsp)	 #,
	.seh_savexmm	%xmm9, 128
	movups	%xmm10, 144(%rsp)	 #,
	.seh_savexmm	%xmm10, 144
	movups	%xmm11, 160(%rsp)	 #,
	.seh_savexmm	%xmm11, 160
	movups	%xmm12, 176(%rsp)	 #,
	.seh_savexmm	%xmm12, 176
	movups	%xmm13, 192(%rsp)	 #,
	.seh_savexmm	%xmm13, 192
	movups	%xmm14, 208(%rsp)	 #,
	.seh_savexmm	%xmm14, 208
	.seh_endprologue
 # flat-data_vs_nested_7.c:117: int main() {
	call	__main	 #
 # C:/msys64/ucrt64/include/time.h:256: static __inline time_t __CRTDECL time(time_t *_Time) { return _time64(_Time); }
	xorl	%ecx, %ecx	 #
	call	*__imp__time64(%rip)	 #
 # flat-data_vs_nested_7.c:118:     srand((unsigned int)time(NULL));
	movl	%eax, %ecx	 # tmp874, _47
	call	srand	 #
 # flat-data_vs_nested_7.c:123:     Pixel *flat_data = create_flat_data(width, height);
	movl	$15000, %edx	 #,
	movl	$15000, %ecx	 #,
	call	create_flat_data	 #
	movq	%rax, %rdi	 # tmp875, flat_data
 # flat-data_vs_nested_7.c:124:     if (!flat_data) {
	testq	%rax, %rax	 # flat_data
	je	.L123	 #,
 # flat-data_vs_nested_7.c:129:     Pixel **nested_data = create_nested_data(flat_data, width, height);
	movl	$15000, %r8d	 #,
	movl	$15000, %edx	 #,
	movq	%rax, %rcx	 # flat_data,
	call	create_nested_data	 #
	movq	%rax, %r12	 # tmp877, nested_data
 # flat-data_vs_nested_7.c:130:     if (!nested_data) {
	testq	%rax, %rax	 # nested_data
	je	.L124	 #,
	movl	$5, %ebp	 #, ivtmp_100
 # flat-data_vs_nested_7.c:136:     double flat_total_time = 0.0, nested_total_time = 0.0;
	pxor	%xmm10, %xmm10	 # nested_total_time
	leaq	72(%rsp), %rsi	 #, tmp853
	movq	__imp_QueryPerformanceCounter(%rip), %rbx	 #, tmp852
	movdqu	.LC2(%rip), %xmm6	 #, tmp854
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	movq	__imp_QueryPerformanceFrequency(%rip), %r13	 #, tmp871
	leaq	120000(%rax), %r14	 #, _549
	.p2align 4,,10
	.p2align 3
.L70:
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %r15d	 # initialized,
	testl	%r15d, %r15d	 #
	je	.L125	 #,
.L71:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm7, %xmm7	 # tmp443
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp444
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm7	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp443
	movq	%r12, %rcx	 # nested_data, ivtmp.326
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	pxor	%xmm5, %xmm5	 # tmp479
	pxor	%xmm3, %xmm3	 # tmp483
	pxor	%xmm2, %xmm2	 # tmp492
 # flat-data_vs_nested_7.c:73:     unsigned long long total = 0;
	xorl	%r9d, %r9d	 # total
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm0	 # frequency.QuadPart, tmp444
	divsd	%xmm0, %xmm7	 # tmp444, _149
	.p2align 4,,10
	.p2align 3
.L72:
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movq	(%rcx), %r8	 # MEM[(struct Pixel * *)_547], _85
	pxor	%xmm4, %xmm4	 # vect_total_93.244
	movq	%r8, %rax	 # _85, ivtmp.316
	leaq	59968(%r8), %r10	 #, _537
	.p2align 4,,10
	.p2align 3
.L74:
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_532], tmp467
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_532 + 16B], tmp468
	addq	$64, %rax	 #, ivtmp.316
	movdqu	-16(%rax), %xmm8	 # MEM <vector(16) unsigned char> [(unsigned char *)_532 + 48B], tmp474
	pand	%xmm6, %xmm1	 # tmp854, tmp468
	pand	%xmm6, %xmm0	 # tmp854, tmp467
	packuswb	%xmm1, %xmm0	 # tmp468, tmp466
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_532 + 32B], tmp473
	pand	%xmm6, %xmm8	 # tmp854, tmp474
	pand	%xmm6, %xmm0	 # tmp854, tmp476
	pand	%xmm6, %xmm1	 # tmp854, tmp473
	packuswb	%xmm8, %xmm1	 # tmp474, tmp472
	pand	%xmm6, %xmm1	 # tmp854, tmp477
	packuswb	%xmm1, %xmm0	 # tmp477, vect_perm_even_463
	movdqa	%xmm0, %xmm8	 # vect_perm_even_463, tmp480
	punpckhbw	%xmm5, %xmm0	 # tmp479, tmp482
	punpcklbw	%xmm5, %xmm8	 # tmp479, tmp480
	movdqa	%xmm0, %xmm9	 # tmp482, tmp488
	punpckhwd	%xmm3, %xmm0	 # tmp483, tmp490
	movdqa	%xmm8, %xmm1	 # tmp480, tmp484
	punpckhwd	%xmm3, %xmm8	 # tmp483, tmp486
	punpcklwd	%xmm3, %xmm9	 # tmp483, tmp488
	punpcklwd	%xmm3, %xmm1	 # tmp483, tmp484
	movdqa	%xmm1, %xmm11	 # tmp484, tmp493
	punpckhdq	%xmm2, %xmm1	 # tmp492, tmp496
	punpckldq	%xmm2, %xmm11	 # tmp492, tmp493
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm11, %xmm1	 # tmp493, tmp497
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm8, %xmm11	 # tmp486, tmp500
	punpckhdq	%xmm2, %xmm8	 # tmp492, tmp503
	punpckldq	%xmm2, %xmm11	 # tmp492, tmp500
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm11, %xmm8	 # tmp500, tmp504
	paddq	%xmm8, %xmm1	 # tmp504, tmp505
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm9, %xmm8	 # tmp488, tmp508
	punpckhdq	%xmm2, %xmm9	 # tmp492, tmp511
	punpckldq	%xmm2, %xmm8	 # tmp492, tmp508
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm8, %xmm9	 # tmp508, tmp512
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm0, %xmm8	 # tmp490, tmp515
	punpckhdq	%xmm2, %xmm0	 # tmp492, tmp520
	punpckldq	%xmm2, %xmm8	 # tmp492, tmp515
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	paddq	%xmm4, %xmm0	 # vect_total_93.244, tmp521
	paddq	%xmm8, %xmm9	 # tmp515, tmp516
	paddq	%xmm9, %xmm1	 # tmp516, tmp517
	movdqa	%xmm1, %xmm4	 # tmp517, tmp517
	paddq	%xmm0, %xmm4	 # tmp521, tmp517
	cmpq	%r10, %rax	 # _537, ivtmp.316
	jne	.L74	 #,
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	59968(%r8), %eax	 # MEM[(struct Pixel *)_85 + 59968B].r, MEM[(struct Pixel *)_85 + 59968B].r
	movzbl	59972(%r8), %r10d	 # MEM[(struct Pixel *)_85 + 59972B].r, MEM[(struct Pixel *)_85 + 59972B].r
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movdqa	%xmm4, %xmm0	 # vect_total_93.244, tmp461
 # flat-data_vs_nested_7.c:74:     for (int i = 0; i < height; i++) {
	addq	$8, %rcx	 #, ivtmp.326
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	psrldq	$8, %xmm0	 #, tmp461
	addq	%r10, %rax	 # MEM[(struct Pixel *)_85 + 59972B].r, tmp447
	paddq	%xmm4, %xmm0	 # vect_total_93.244, tmp462
	addq	%r9, %rax	 # total, tmp448
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movzbl	59976(%r8), %r9d	 # MEM[(struct Pixel *)_85 + 59976B].r, MEM[(struct Pixel *)_85 + 59976B].r
	addq	%r9, %rax	 # MEM[(struct Pixel *)_85 + 59976B].r, tmp450
	movzbl	59980(%r8), %r9d	 # MEM[(struct Pixel *)_85 + 59980B].r, MEM[(struct Pixel *)_85 + 59980B].r
	addq	%r9, %rax	 # MEM[(struct Pixel *)_85 + 59980B].r, tmp452
	movzbl	59984(%r8), %r9d	 # MEM[(struct Pixel *)_85 + 59984B].r, MEM[(struct Pixel *)_85 + 59984B].r
	addq	%r9, %rax	 # MEM[(struct Pixel *)_85 + 59984B].r, tmp454
	movzbl	59988(%r8), %r9d	 # MEM[(struct Pixel *)_85 + 59988B].r, MEM[(struct Pixel *)_85 + 59988B].r
	addq	%r9, %rax	 # MEM[(struct Pixel *)_85 + 59988B].r, tmp456
	movzbl	59992(%r8), %r9d	 # MEM[(struct Pixel *)_85 + 59992B].r, MEM[(struct Pixel *)_85 + 59992B].r
	movzbl	59996(%r8), %r8d	 # MEM[(struct Pixel *)_85 + 59996B].r, MEM[(struct Pixel *)_85 + 59996B].r
	addq	%r9, %rax	 # MEM[(struct Pixel *)_85 + 59992B].r, tmp458
 # flat-data_vs_nested_7.c:76:             total += nested_data[i][j].r;
	movq	%xmm0, %r9	 # tmp462, stmp_total_93.245
	addq	%r8, %rax	 # MEM[(struct Pixel *)_85 + 59996B].r, _110
	addq	%rax, %r9	 # _110, total
 # flat-data_vs_nested_7.c:74:     for (int i = 0; i < height; i++) {
	cmpq	%r14, %rcx	 # _549, ivtmp.326
	jne	.L72	 #,
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %r11d	 # initialized,
 # flat-data_vs_nested_7.c:141:         volatile unsigned long long nested_sum = test_nested(nested_data, width, height);
	movq	%r9, 40(%rsp)	 # total, nested_sum
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	testl	%r11d, %r11d	 #
	je	.L126	 #,
.L76:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp531
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm1, %xmm1	 # tmp532
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm0	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp531
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm1	 # frequency.QuadPart, tmp532
	divsd	%xmm1, %xmm0	 # tmp532, _155
 # flat-data_vs_nested_7.c:143:         nested_total_time += (end - start);
	subsd	%xmm7, %xmm0	 # _149, tmp533
 # flat-data_vs_nested_7.c:143:         nested_total_time += (end - start);
	addsd	%xmm0, %xmm10	 # tmp533, nested_total_time
 # flat-data_vs_nested_7.c:139: 	for (int i = 0; i < ITERATIONS; i++) {
	subl	$1, %ebp	 #, ivtmp_100
	jne	.L70	 #,
 # flat-data_vs_nested_7.c:73:     unsigned long long total = 0;
	movl	$5, %ebp	 #, ivtmp_88
 # flat-data_vs_nested_7.c:136:     double flat_total_time = 0.0, nested_total_time = 0.0;
	pxor	%xmm9, %xmm9	 # flat_total_time
	leaq	59968(%rdi), %r13	 #, ivtmp.305
	leaq	900059968(%rdi), %r15	 #, _522
	.p2align 4,,10
	.p2align 3
.L85:
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %r10d	 # initialized,
	testl	%r10d, %r10d	 #
	je	.L127	 #,
.L79:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm7, %xmm7	 # tmp538
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp539
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm7	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp538
	movq	%rdi, %r9	 # flat_data, ivtmp.306
	movq	%r13, %rax	 # ivtmp.305, ivtmp.305
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	pxor	%xmm5, %xmm5	 # tmp555
	pxor	%xmm3, %xmm3	 # tmp559
 # flat-data_vs_nested_7.c:46:     unsigned long long total = 0;
	xorl	%r10d, %r10d	 # total
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm0	 # frequency.QuadPart, tmp539
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	pxor	%xmm2, %xmm2	 # tmp568
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	divsd	%xmm0, %xmm7	 # tmp539, _161
	.p2align 4,,10
	.p2align 3
.L81:
 # flat-data_vs_nested_7.c:46:     unsigned long long total = 0;
	movq	%r9, %rcx	 # ivtmp.306, ivtmp.295
	pxor	%xmm4, %xmm4	 # vect_total_108.230
	.p2align 4,,10
	.p2align 3
.L80:
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqu	(%rcx), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_367], tmp543
	movdqu	16(%rcx), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_367 + 16B], tmp544
	addq	$64, %rcx	 #, ivtmp.295
	movdqu	-16(%rcx), %xmm8	 # MEM <vector(16) unsigned char> [(unsigned char *)_367 + 48B], tmp550
	pand	%xmm6, %xmm1	 # tmp854, tmp544
	pand	%xmm6, %xmm0	 # tmp854, tmp543
	packuswb	%xmm1, %xmm0	 # tmp544, tmp542
	movdqu	-32(%rcx), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_367 + 32B], tmp549
	pand	%xmm6, %xmm8	 # tmp854, tmp550
	pand	%xmm6, %xmm0	 # tmp854, tmp552
	pand	%xmm6, %xmm1	 # tmp854, tmp549
	packuswb	%xmm8, %xmm1	 # tmp550, tmp548
	pand	%xmm6, %xmm1	 # tmp854, tmp553
	packuswb	%xmm1, %xmm0	 # tmp553, vect_perm_even_400
	movdqa	%xmm0, %xmm8	 # vect_perm_even_400, tmp556
	punpckhbw	%xmm5, %xmm0	 # tmp555, tmp558
	punpcklbw	%xmm5, %xmm8	 # tmp555, tmp556
	movdqa	%xmm0, %xmm11	 # tmp558, tmp564
	punpckhwd	%xmm3, %xmm0	 # tmp559, tmp566
	movdqa	%xmm8, %xmm1	 # tmp556, tmp560
	punpckhwd	%xmm3, %xmm8	 # tmp559, tmp562
	punpcklwd	%xmm3, %xmm11	 # tmp559, tmp564
	punpcklwd	%xmm3, %xmm1	 # tmp559, tmp560
	movdqa	%xmm1, %xmm12	 # tmp560, tmp569
	punpckhdq	%xmm2, %xmm1	 # tmp568, tmp572
	punpckldq	%xmm2, %xmm12	 # tmp568, tmp569
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm12, %xmm1	 # tmp569, tmp573
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm8, %xmm12	 # tmp562, tmp576
	punpckhdq	%xmm2, %xmm8	 # tmp568, tmp579
	punpckldq	%xmm2, %xmm12	 # tmp568, tmp576
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm12, %xmm8	 # tmp576, tmp580
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm11, %xmm12	 # tmp564, tmp584
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm8, %xmm1	 # tmp580, tmp581
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm11, %xmm8	 # tmp564, tmp587
	punpckldq	%xmm2, %xmm12	 # tmp568, tmp584
	movdqa	%xmm0, %xmm11	 # tmp566, tmp591
	punpckhdq	%xmm2, %xmm8	 # tmp568, tmp587
	punpckhdq	%xmm2, %xmm0	 # tmp568, tmp596
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm12, %xmm8	 # tmp584, tmp588
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	punpckldq	%xmm2, %xmm11	 # tmp568, tmp591
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm4, %xmm0	 # vect_total_108.230, tmp597
	paddq	%xmm11, %xmm8	 # tmp591, tmp592
	paddq	%xmm8, %xmm1	 # tmp592, tmp593
	movdqa	%xmm1, %xmm4	 # tmp593, tmp593
	paddq	%xmm0, %xmm4	 # tmp597, tmp593
	cmpq	%rax, %rcx	 # ivtmp.305, ivtmp.295
	jne	.L80	 #,
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	4(%rcx), %eax	 # MEM[(unsigned char *)_514 + 4B], MEM[(unsigned char *)_514 + 4B]
	movzbl	(%rcx), %r8d	 # MEM[(unsigned char *)_514], MEM[(unsigned char *)_514]
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movdqa	%xmm4, %xmm0	 # vect_total_108.230, tmp614
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	addq	$60000, %r9	 #, ivtmp.306
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	psrldq	$8, %xmm0	 #, tmp614
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 4B], tmp600
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	8(%rcx), %eax	 # MEM[(unsigned char *)_514 + 8B], MEM[(unsigned char *)_514 + 8B]
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	paddq	%xmm0, %xmm4	 # tmp614, tmp615
	addq	%r10, %r8	 # total, tmp601
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 8B], tmp603
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movzbl	12(%rcx), %eax	 # MEM[(unsigned char *)_514 + 12B], MEM[(unsigned char *)_514 + 12B]
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 12B], tmp605
	movzbl	16(%rcx), %eax	 # MEM[(unsigned char *)_514 + 16B], MEM[(unsigned char *)_514 + 16B]
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 16B], tmp607
	movzbl	20(%rcx), %eax	 # MEM[(unsigned char *)_514 + 20B], MEM[(unsigned char *)_514 + 20B]
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 20B], tmp609
	movzbl	24(%rcx), %eax	 # MEM[(unsigned char *)_514 + 24B], MEM[(unsigned char *)_514 + 24B]
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 24B], tmp611
	movzbl	28(%rcx), %eax	 # MEM[(unsigned char *)_514 + 28B], MEM[(unsigned char *)_514 + 28B]
	addq	%rax, %r8	 # MEM[(unsigned char *)_514 + 28B], _33
 # flat-data_vs_nested_7.c:52:             total += row[j].r;
	movq	%xmm4, %rax	 # tmp615, stmp_total_108.231
	leaq	(%rax,%r8), %r10	 #, total
 # flat-data_vs_nested_7.c:47:     for (int i = 0; i < height; i++) {
	leaq	60000(%rcx), %rax	 #, ivtmp.305
	cmpq	%r15, %rax	 # _522, ivtmp.305
	jne	.L81	 #,
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %r9d	 # initialized,
 # flat-data_vs_nested_7.c:148:         volatile unsigned long long flat_sum = test_flat(flat_data, width, height);
	movq	%r10, 48(%rsp)	 # total, flat_sum
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	testl	%r9d, %r9d	 #
	je	.L128	 #,
.L82:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp626
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm1, %xmm1	 # tmp627
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm0	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp626
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm1	 # frequency.QuadPart, tmp627
	divsd	%xmm1, %xmm0	 # tmp627, _167
 # flat-data_vs_nested_7.c:150:         flat_total_time += (end - start);
	subsd	%xmm7, %xmm0	 # _161, tmp628
 # flat-data_vs_nested_7.c:150:         flat_total_time += (end - start);
	addsd	%xmm0, %xmm9	 # tmp628, flat_total_time
 # flat-data_vs_nested_7.c:146:     for (int i = 0; i < ITERATIONS; i++) {
	subl	$1, %ebp	 #, ivtmp_88
	jne	.L85	 #,
 # flat-data_vs_nested_7.c:46:     unsigned long long total = 0;
	movl	$5, %ebp	 #, ivtmp_91
 # flat-data_vs_nested_7.c:137:     double flat_ptr_total_time = 0.0, nested_ptr_total_time = 0.0;
	pxor	%xmm8, %xmm8	 # nested_ptr_total_time
	.p2align 4,,10
	.p2align 3
.L92:
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %r8d	 # initialized,
	testl	%r8d, %r8d	 #
	je	.L129	 #,
.L86:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm7, %xmm7	 # tmp633
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp634
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm7	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp633
	movq	%r12, %r8	 # nested_data, ivtmp.287
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm5, %xmm5	 # tmp650
	pxor	%xmm3, %xmm3	 # tmp654
	pxor	%xmm2, %xmm2	 # tmp663
 # flat-data_vs_nested_7.c:83:     unsigned long long total = 0;
	xorl	%r10d, %r10d	 # total
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm0	 # frequency.QuadPart, tmp634
	divsd	%xmm0, %xmm7	 # tmp634, _173
	.p2align 4,,10
	.p2align 3
.L88:
 # flat-data_vs_nested_7.c:87:         Pixel *row = nested_data[i];      // Satýr baþlangýcý
	movq	(%r8), %r9	 # MEM[(struct Pixel * *)_16], row
	pxor	%xmm4, %xmm4	 # vect_total_122.216
	movq	%r9, %rax	 # row, ivtmp.277
	leaq	59968(%r9), %rcx	 #, _131
	.p2align 4,,10
	.p2align 3
.L87:
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_460], tmp638
	movdqu	16(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_460 + 16B], tmp639
	addq	$64, %rax	 #, ivtmp.277
	movdqu	-16(%rax), %xmm11	 # MEM <vector(16) unsigned char> [(unsigned char *)_460 + 48B], tmp645
	pand	%xmm6, %xmm1	 # tmp854, tmp639
	pand	%xmm6, %xmm0	 # tmp854, tmp638
	packuswb	%xmm1, %xmm0	 # tmp639, tmp637
	movdqu	-32(%rax), %xmm1	 # MEM <vector(16) unsigned char> [(unsigned char *)_460 + 32B], tmp644
	pand	%xmm6, %xmm11	 # tmp854, tmp645
	pand	%xmm6, %xmm0	 # tmp854, tmp647
	pand	%xmm6, %xmm1	 # tmp854, tmp644
	packuswb	%xmm11, %xmm1	 # tmp645, tmp643
	pand	%xmm6, %xmm1	 # tmp854, tmp648
	packuswb	%xmm1, %xmm0	 # tmp648, vect_perm_even_331
	movdqa	%xmm0, %xmm1	 # vect_perm_even_331, tmp651
	punpckhbw	%xmm5, %xmm0	 # tmp650, tmp653
	punpcklbw	%xmm5, %xmm1	 # tmp650, tmp651
	movdqa	%xmm0, %xmm11	 # tmp653, tmp659
	punpckhwd	%xmm3, %xmm0	 # tmp654, tmp661
	movdqa	%xmm1, %xmm12	 # tmp651, tmp655
	punpckhwd	%xmm3, %xmm1	 # tmp654, tmp657
	punpcklwd	%xmm3, %xmm11	 # tmp654, tmp659
	punpcklwd	%xmm3, %xmm12	 # tmp654, tmp655
	movdqa	%xmm12, %xmm13	 # tmp655, tmp664
	punpckhdq	%xmm2, %xmm12	 # tmp663, tmp667
	punpckldq	%xmm2, %xmm13	 # tmp663, tmp664
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm13, %xmm12	 # tmp664, tmp668
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm1, %xmm13	 # tmp657, tmp671
	punpckhdq	%xmm2, %xmm1	 # tmp663, tmp674
	punpckldq	%xmm2, %xmm13	 # tmp663, tmp671
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm13, %xmm1	 # tmp671, tmp675
	paddq	%xmm1, %xmm12	 # tmp675, tmp676
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm11, %xmm1	 # tmp659, tmp679
	punpckhdq	%xmm2, %xmm11	 # tmp663, tmp682
	punpckldq	%xmm2, %xmm1	 # tmp663, tmp679
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm1, %xmm11	 # tmp679, tmp683
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm0, %xmm1	 # tmp661, tmp686
	punpckhdq	%xmm2, %xmm0	 # tmp663, tmp691
	punpckldq	%xmm2, %xmm1	 # tmp663, tmp686
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm4, %xmm0	 # vect_total_122.216, tmp692
	paddq	%xmm1, %xmm11	 # tmp686, tmp687
	paddq	%xmm11, %xmm12	 # tmp687, tmp688
	movdqa	%xmm12, %xmm4	 # tmp688, tmp688
	paddq	%xmm0, %xmm4	 # tmp692, tmp688
	cmpq	%rax, %rcx	 # ivtmp.277, _131
	jne	.L87	 #,
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	59968(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59968B].r, MEM[(struct Pixel *)row_116 + 59968B].r
	movzbl	59972(%r9), %ecx	 # MEM[(struct Pixel *)row_116 + 59972B].r, MEM[(struct Pixel *)row_116 + 59972B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm4, %xmm0	 # vect_total_122.216, tmp709
 # flat-data_vs_nested_7.c:86:     for (int i = 0; i < height; i++) {
	addq	$8, %r8	 #, ivtmp.287
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	psrldq	$8, %xmm0	 #, tmp709
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59968B].r, tmp695
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	59976(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59976B].r, MEM[(struct Pixel *)row_116 + 59976B].r
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm0, %xmm4	 # tmp709, tmp710
	addq	%r10, %rcx	 # total, tmp696
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59976B].r, tmp698
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	59980(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59980B].r, MEM[(struct Pixel *)row_116 + 59980B].r
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59980B].r, tmp700
	movzbl	59984(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59984B].r, MEM[(struct Pixel *)row_116 + 59984B].r
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59984B].r, tmp702
	movzbl	59988(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59988B].r, MEM[(struct Pixel *)row_116 + 59988B].r
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59988B].r, tmp704
	movzbl	59992(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59992B].r, MEM[(struct Pixel *)row_116 + 59992B].r
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59992B].r, tmp706
	movzbl	59996(%r9), %eax	 # MEM[(struct Pixel *)row_116 + 59996B].r, MEM[(struct Pixel *)row_116 + 59996B].r
	addq	%rax, %rcx	 # MEM[(struct Pixel *)row_116 + 59996B].r, _129
 # flat-data_vs_nested_7.c:90:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movq	%xmm4, %rax	 # tmp710, stmp_total_122.217
	leaq	(%rax,%rcx), %r10	 #, total
 # flat-data_vs_nested_7.c:86:     for (int i = 0; i < height; i++) {
	cmpq	%r14, %r8	 # _549, ivtmp.287
	jne	.L88	 #,
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %ecx	 # initialized,
 # flat-data_vs_nested_7.c:155:         volatile unsigned long long nested_sum = test_nested_ptr(nested_data, width, height);
	movq	%r10, 56(%rsp)	 # total, nested_sum
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	testl	%ecx, %ecx	 #
	je	.L130	 #,
.L89:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp721
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm1, %xmm1	 # tmp722
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm0	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp721
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm1	 # frequency.QuadPart, tmp722
	divsd	%xmm1, %xmm0	 # tmp722, _179
 # flat-data_vs_nested_7.c:157:         nested_ptr_total_time += (end - start);
	subsd	%xmm7, %xmm0	 # _173, tmp723
 # flat-data_vs_nested_7.c:157:         nested_ptr_total_time += (end - start);
	addsd	%xmm0, %xmm8	 # tmp723, nested_ptr_total_time
 # flat-data_vs_nested_7.c:153:     for (int i = 0; i < ITERATIONS; i++) {
	subl	$1, %ebp	 #, ivtmp_91
	jne	.L92	 #,
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	movq	__imp_QueryPerformanceFrequency(%rip), %r14	 #, tmp859
 # flat-data_vs_nested_7.c:87:         Pixel *row = nested_data[i];      // Satýr baþlangýcý
	movl	$5, %ebp	 #, ivtmp_214
 # flat-data_vs_nested_7.c:137:     double flat_ptr_total_time = 0.0, nested_ptr_total_time = 0.0;
	pxor	%xmm11, %xmm11	 # flat_ptr_total_time
	.p2align 4,,10
	.p2align 3
.L99:
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %edx	 # initialized,
	testl	%edx, %edx	 #
	je	.L131	 #,
.L93:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm7, %xmm7	 # tmp728
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp729
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm7	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp728
	movq	%rdi, %r8	 # flat_data, ivtmp.267
	movq	%r13, %rdx	 # ivtmp.305, ivtmp.266
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm4, %xmm4	 # tmp745
	pxor	%xmm2, %xmm2	 # tmp749
 # flat-data_vs_nested_7.c:59:     unsigned long long total = 0;
	xorl	%r9d, %r9d	 # total
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm0	 # frequency.QuadPart, tmp729
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	pxor	%xmm1, %xmm1	 # tmp758
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	divsd	%xmm0, %xmm7	 # tmp729, _185
	.p2align 4,,10
	.p2align 3
.L95:
 # flat-data_vs_nested_7.c:59:     unsigned long long total = 0;
	movq	%r8, %rax	 # ivtmp.267, ivtmp.258
	pxor	%xmm3, %xmm3	 # vect_total_136.202
	.p2align 4,,10
	.p2align 3
.L94:
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqu	(%rax), %xmm0	 # MEM <vector(16) unsigned char> [(unsigned char *)_74], tmp733
	movdqu	16(%rax), %xmm5	 # MEM <vector(16) unsigned char> [(unsigned char *)_74 + 16B], tmp734
	addq	$64, %rax	 #, ivtmp.258
	movdqu	-16(%rax), %xmm12	 # MEM <vector(16) unsigned char> [(unsigned char *)_74 + 48B], tmp740
	pand	%xmm6, %xmm5	 # tmp854, tmp734
	pand	%xmm6, %xmm0	 # tmp854, tmp733
	packuswb	%xmm5, %xmm0	 # tmp734, tmp732
	movdqu	-32(%rax), %xmm5	 # MEM <vector(16) unsigned char> [(unsigned char *)_74 + 32B], tmp739
	pand	%xmm6, %xmm12	 # tmp854, tmp740
	pand	%xmm6, %xmm0	 # tmp854, tmp742
	pand	%xmm6, %xmm5	 # tmp854, tmp739
	packuswb	%xmm12, %xmm5	 # tmp740, tmp738
	pand	%xmm6, %xmm5	 # tmp854, tmp743
	packuswb	%xmm5, %xmm0	 # tmp743, vect_perm_even_19
	movdqa	%xmm0, %xmm12	 # vect_perm_even_19, tmp746
	punpckhbw	%xmm4, %xmm0	 # tmp745, tmp748
	punpcklbw	%xmm4, %xmm12	 # tmp745, tmp746
	movdqa	%xmm0, %xmm5	 # tmp748, tmp754
	punpckhwd	%xmm2, %xmm0	 # tmp749, tmp756
	movdqa	%xmm12, %xmm13	 # tmp746, tmp750
	punpckhwd	%xmm2, %xmm12	 # tmp749, tmp752
	punpcklwd	%xmm2, %xmm5	 # tmp749, tmp754
	movdqa	%xmm12, %xmm14	 # tmp752, tmp759
	punpcklwd	%xmm2, %xmm13	 # tmp749, tmp750
	punpckhdq	%xmm1, %xmm12	 # tmp758, tmp762
	punpckldq	%xmm1, %xmm14	 # tmp758, tmp759
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm14, %xmm12	 # tmp759, tmp763
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm13, %xmm14	 # tmp750, tmp766
	punpckhdq	%xmm1, %xmm13	 # tmp758, tmp769
	punpckldq	%xmm1, %xmm14	 # tmp758, tmp766
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm14, %xmm13	 # tmp766, tmp770
	paddq	%xmm13, %xmm12	 # tmp770, tmp771
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm5, %xmm13	 # tmp754, tmp774
	punpckhdq	%xmm1, %xmm5	 # tmp758, tmp777
	punpckldq	%xmm1, %xmm13	 # tmp758, tmp774
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm13, %xmm5	 # tmp774, tmp778
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm0, %xmm13	 # tmp756, tmp781
	punpckhdq	%xmm1, %xmm0	 # tmp758, tmp786
	punpckldq	%xmm1, %xmm13	 # tmp758, tmp781
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm3, %xmm0	 # vect_total_136.202, tmp787
	paddq	%xmm13, %xmm5	 # tmp781, tmp782
	paddq	%xmm5, %xmm12	 # tmp782, tmp783
	movdqa	%xmm12, %xmm3	 # tmp783, tmp783
	paddq	%xmm0, %xmm3	 # tmp787, tmp783
	cmpq	%rdx, %rax	 # ivtmp.266, ivtmp.258
	jne	.L94	 #,
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	4(%rax), %edx	 # MEM[(unsigned char *)_106 + 4B], MEM[(unsigned char *)_106 + 4B]
	movzbl	(%rax), %ecx	 # MEM[(unsigned char *)_106], MEM[(unsigned char *)_106]
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movdqa	%xmm3, %xmm0	 # vect_total_136.202, tmp804
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	addq	$60000, %r8	 #, ivtmp.267
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	psrldq	$8, %xmm0	 #, tmp804
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 4B], tmp790
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	8(%rax), %edx	 # MEM[(unsigned char *)_106 + 8B], MEM[(unsigned char *)_106 + 8B]
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	paddq	%xmm0, %xmm3	 # tmp804, tmp805
	addq	%r9, %rcx	 # total, tmp791
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 8B], tmp793
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movzbl	12(%rax), %edx	 # MEM[(unsigned char *)_106 + 12B], MEM[(unsigned char *)_106 + 12B]
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 12B], tmp795
	movzbl	16(%rax), %edx	 # MEM[(unsigned char *)_106 + 16B], MEM[(unsigned char *)_106 + 16B]
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 16B], tmp797
	movzbl	20(%rax), %edx	 # MEM[(unsigned char *)_106 + 20B], MEM[(unsigned char *)_106 + 20B]
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 20B], tmp799
	movzbl	24(%rax), %edx	 # MEM[(unsigned char *)_106 + 24B], MEM[(unsigned char *)_106 + 24B]
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 24B], tmp801
	movzbl	28(%rax), %edx	 # MEM[(unsigned char *)_106 + 28B], MEM[(unsigned char *)_106 + 28B]
	addq	%rdx, %rcx	 # MEM[(unsigned char *)_106 + 28B], _279
 # flat-data_vs_nested_7.c:66:             total += ptr->r; // Pointer artýrma ile j indeksini kaldýr
	movq	%xmm3, %rdx	 # tmp805, stmp_total_136.203
	leaq	(%rdx,%rcx), %r9	 #, total
 # flat-data_vs_nested_7.c:62:     for (int i = 0; i < height; i++) {
	leaq	60000(%rax), %rdx	 #, ivtmp.266
	cmpq	%r15, %rdx	 # _522, ivtmp.266
	jne	.L95	 #,
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	movl	initialized.1(%rip), %eax	 # initialized,
 # flat-data_vs_nested_7.c:162:         volatile unsigned long long nested_sum = test_flat_pt_aritm(flat_data, width, height);
	movq	%r9, 64(%rsp)	 # total, nested_sum
 # flat-data_vs_nested_7.c:102:     if (!initialized) {
	testl	%eax, %eax	 #
	je	.L132	 #,
.L96:
 # flat-data_vs_nested_7.c:107:     QueryPerformanceCounter(&now);
	movq	%rsi, %rcx	 # tmp853,
	call	*%rbx	 # tmp852
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm0, %xmm0	 # tmp816
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	pxor	%xmm1, %xmm1	 # tmp817
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	72(%rsp), %xmm0	 # MEM[(union _LARGE_INTEGER *)_512].QuadPart, tmp816
 # flat-data_vs_nested_7.c:108:     return (double)now.QuadPart / frequency.QuadPart;
	cvtsi2sdq	frequency.0(%rip), %xmm1	 # frequency.QuadPart, tmp817
	divsd	%xmm1, %xmm0	 # tmp817, _191
 # flat-data_vs_nested_7.c:164:         flat_ptr_total_time += (end - start);
	subsd	%xmm7, %xmm0	 # _185, tmp818
 # flat-data_vs_nested_7.c:164:         flat_ptr_total_time += (end - start);
	addsd	%xmm0, %xmm11	 # tmp818, flat_ptr_total_time
 # flat-data_vs_nested_7.c:160:     for (int i = 0; i < ITERATIONS; i++) {
	subl	$1, %ebp	 #, ivtmp_214
	jne	.L99	 #,
 # flat-data_vs_nested_7.c:167:     printf("Nested eriþim ortalama süresi: %.6f saniye\n", nested_total_time / ITERATIONS);
	movsd	.LC6(%rip), %xmm6	 #, tmp820
	movapd	%xmm10, %xmm1	 # nested_total_time, nested_total_time
	leaq	.LC7(%rip), %rcx	 #, tmp826
	divsd	%xmm6, %xmm1	 # tmp820, nested_total_time
	movq	%xmm1, %rdx	 # tmp819,
	call	printf	 #
 # flat-data_vs_nested_7.c:168:     printf("Flat eriþim ortalama süresi:   %.6f saniye\n", flat_total_time / ITERATIONS);
	movapd	%xmm9, %xmm1	 # flat_total_time, flat_total_time
	leaq	.LC8(%rip), %rcx	 #, tmp834
	divsd	%xmm6, %xmm1	 # tmp820, flat_total_time
	movq	%xmm1, %rdx	 # tmp827,
	call	printf	 #
 # flat-data_vs_nested_7.c:169:     printf("Nested_ptr eriþim ortalama süresi: %.6f saniye\n", nested_ptr_total_time / ITERATIONS);
	movapd	%xmm8, %xmm1	 # nested_ptr_total_time, nested_ptr_total_time
	leaq	.LC9(%rip), %rcx	 #, tmp842
	divsd	%xmm6, %xmm1	 # tmp820, nested_ptr_total_time
	movq	%xmm1, %rdx	 # tmp835,
	call	printf	 #
 # flat-data_vs_nested_7.c:170:     printf("Flat_ptr eriþim ortalama süresi:   %.6f saniye\n", flat_ptr_total_time / ITERATIONS);
	movapd	%xmm11, %xmm1	 # flat_ptr_total_time, flat_ptr_total_time
	leaq	.LC10(%rip), %rcx	 #, tmp850
	divsd	%xmm6, %xmm1	 # tmp820, flat_ptr_total_time
	movq	%xmm1, %rdx	 # tmp843,
	call	printf	 #
 # flat-data_vs_nested_7.c:174:     free(flat_data);
	movq	%rdi, %rcx	 # flat_data,
	call	free	 #
 # flat-data_vs_nested_7.c:175:     free(nested_data);
	movq	%r12, %rcx	 # nested_data,
	call	free	 #
	nop	
 # flat-data_vs_nested_7.c:178: }
	movups	80(%rsp), %xmm6	 #,
	movups	96(%rsp), %xmm7	 #,
	xorl	%eax, %eax	 #
	movups	128(%rsp), %xmm9	 #,
	movups	112(%rsp), %xmm8	 #,
	movups	144(%rsp), %xmm10	 #,
	movups	160(%rsp), %xmm11	 #,
	movups	176(%rsp), %xmm12	 #,
	movups	192(%rsp), %xmm13	 #,
	movups	208(%rsp), %xmm14	 #,
	addq	$232, %rsp	 #,
	popq	%rbx	 #
	popq	%rsi	 #
	popq	%rdi	 #
	popq	%rbp	 #
	popq	%r12	 #
	popq	%r13	 #
	popq	%r14	 #
	popq	%r15	 #
	ret	
.L132:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp807
	call	*%r14	 # tmp859
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L96	 #
.L131:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp724
	call	*%r14	 # tmp859
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L93	 #
.L130:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp712
	call	*__imp_QueryPerformanceFrequency(%rip)	 #
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L89	 #
.L129:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp629
	call	*__imp_QueryPerformanceFrequency(%rip)	 #
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L86	 #
.L128:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp617
	call	*__imp_QueryPerformanceFrequency(%rip)	 #
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L82	 #
.L127:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp534
	call	*__imp_QueryPerformanceFrequency(%rip)	 #
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L79	 #
.L126:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp522
	call	*%r13	 # tmp871
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L76	 #
.L125:
 # flat-data_vs_nested_7.c:103:         QueryPerformanceFrequency(&frequency);
	leaq	frequency.0(%rip), %rcx	 #, tmp439
	call	*%r13	 # tmp871
 # flat-data_vs_nested_7.c:104:         initialized = 1;
	movl	$1, initialized.1(%rip)	 #, initialized
	jmp	.L71	 #
.L123:
 # flat-data_vs_nested_7.c:125:         fprintf(stderr, "flat_data malloc baþarýsýz!\n");
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # flat-data_vs_nested_7.c:125:         fprintf(stderr, "flat_data malloc baþarýsýz!\n");
	movl	$28, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	.LC4(%rip), %rcx	 #, tmp436
 # flat-data_vs_nested_7.c:125:         fprintf(stderr, "flat_data malloc baþarýsýz!\n");
	movq	%rax, %r9	 #, tmp876
 # flat-data_vs_nested_7.c:125:         fprintf(stderr, "flat_data malloc baþarýsýz!\n");
	call	fwrite	 #
 # flat-data_vs_nested_7.c:126:         exit(1);
	movl	$1, %ecx	 #,
	call	exit	 #
.L124:
 # flat-data_vs_nested_7.c:131:         fprintf(stderr, "nested_data malloc baþarýsýz!\n");
	movl	$2, %ecx	 #,
	call	*__imp___acrt_iob_func(%rip)	 #
 # flat-data_vs_nested_7.c:131:         fprintf(stderr, "nested_data malloc baþarýsýz!\n");
	movl	$30, %r8d	 #,
	movl	$1, %edx	 #,
	leaq	.LC5(%rip), %rcx	 #, tmp438
 # flat-data_vs_nested_7.c:131:         fprintf(stderr, "nested_data malloc baþarýsýz!\n");
	movq	%rax, %r9	 #, tmp878
 # flat-data_vs_nested_7.c:131:         fprintf(stderr, "nested_data malloc baþarýsýz!\n");
	call	fwrite	 #
 # flat-data_vs_nested_7.c:132:         free(flat_data);
	movq	%rdi, %rcx	 # flat_data,
	call	free	 #
 # flat-data_vs_nested_7.c:133:         exit(1);
	movl	$1, %ecx	 #,
	call	exit	 #
	nop	
	.seh_endproc
.lcomm frequency.0,8,8
.lcomm initialized.1,4,4
	.section .rdata,"dr"
	.align 16
.LC2:
	.word	255
	.word	255
	.word	255
	.word	255
	.word	255
	.word	255
	.word	255
	.word	255
	.align 8
.LC6:
	.long	0
	.long	1075052544
	.ident	"GCC: (Rev6, Built by MSYS2 project) 13.1.0"
	.def	malloc;	.scl	2;	.type	32;	.endef
	.def	puts;	.scl	2;	.type	32;	.endef
	.def	rand;	.scl	2;	.type	32;	.endef
	.def	fprintf;	.scl	2;	.type	32;	.endef
	.def	exit;	.scl	2;	.type	32;	.endef
	.def	srand;	.scl	2;	.type	32;	.endef
	.def	printf;	.scl	2;	.type	32;	.endef
	.def	free;	.scl	2;	.type	32;	.endef
	.def	fwrite;	.scl	2;	.type	32;	.endef
