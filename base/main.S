//---------------------------------------------------
# PowerPC asm test 1
//---------------------------------------------------

#define DEF_VECTOR(vecname)	.align 8 ; .global vecname ; vecname: b vecname

//---------------------------------------------------

.section .text.start
.global _entry
_entry:
	b	_start

//---------------------------------------------------

DEF_VECTOR(_VEC_CHK)
DEF_VECTOR(_VEC_DSTORE)
DEF_VECTOR(_VEC_DSEG)
DEF_VECTOR(_VEC_ISTORE)
DEF_VECTOR(_VEC_ISEG)
DEF_VECTOR(_VEC_EXT)
DEF_VECTOR(_VEC_ALIGN)
DEF_VECTOR(_VEC_PROG)
DEF_VECTOR(_VEC_NOFPU)
DEF_VECTOR(_VEC_DEC)
DEF_VECTOR(_VEC_HDEC)
DEF_VECTOR(_VEC_RES1)
DEF_VECTOR(_VEC_RES2)
DEF_VECTOR(_VEC_SC)
DEF_VECTOR(_VEC_TRACE)

//---------------------------------------------------

.section .text
.global _start
_start:
	b	jmp_test

jmp_test:
	b   _start

.section .rodata
str:	.string "PowerPC is pretty swell\n"
