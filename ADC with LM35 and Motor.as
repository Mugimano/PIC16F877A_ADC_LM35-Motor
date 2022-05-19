opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_lcd_init
	FNCALL	_main,_adc_init
	FNCALL	_main,_adc_value
	FNCALL	_main,_command
	FNCALL	_main,_adc_hex
	FNCALL	_main,_temperature
	FNCALL	_main,___ftge
	FNCALL	_main,_lcd_send
	FNCALL	_temperature,___fttol
	FNCALL	_temperature,___awmod
	FNCALL	_temperature,___awdiv
	FNCALL	_temperature,___awtoft
	FNCALL	_temperature,___ftneg
	FNCALL	_temperature,___ftadd
	FNCALL	_temperature,___ftmul
	FNCALL	_temperature,_lcd_data
	FNCALL	_adc_hex,___lwdiv
	FNCALL	_adc_hex,___lwmod
	FNCALL	_adc_hex,_lcd_data
	FNCALL	_adc_value,___lwtoft
	FNCALL	_adc_value,___ftmul
	FNCALL	_adc_value,___ftdiv
	FNCALL	_lcd_send,_lcd_data
	FNCALL	_lcd_init,_command
	FNCALL	___lwtoft,___ftpack
	FNCALL	___awtoft,___ftpack
	FNCALL	___ftmul,___ftpack
	FNCALL	___ftdiv,___ftpack
	FNCALL	___ftadd,___ftpack
	FNROOT	_main
	global	_f
	global	_tempr
	global	_volt
	global	temperature@f1
	global	_a
	global	_b
	global	_h
	global	_hr
	global	_o
	global	_t
	global	_th
	global	_thr
	global	_val
	global	_ADCON0
psect	text424,local,class=CODE,delta=2
global __ptext424
__ptext424:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTA
_PORTA	set	5
	global	_PORTB
_PORTB	set	6
	global	_PORTD
_PORTD	set	8
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB4
_RB4	set	52
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	
STR_2:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	45	;'-'
	retlw	78	;'N'
	retlw	111	;'o'
	retlw	114	;'r'
	retlw	109	;'m'
	retlw	97	;'a'
	retlw	108	;'l'
	retlw	0
psect	strings
	
STR_1:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	45	;'-'
	retlw	76	;'L'
	retlw	111	;'o'
	retlw	119	;'w'
	retlw	32	;' '
	retlw	0
psect	strings
	
STR_3:	
	retlw	84	;'T'
	retlw	101	;'e'
	retlw	109	;'m'
	retlw	112	;'p'
	retlw	101	;'e'
	retlw	114	;'r'
	retlw	97	;'a'
	retlw	116	;'t'
	retlw	117	;'u'
	retlw	114	;'r'
	retlw	101	;'e'
	retlw	45	;'-'
	retlw	72	;'H'
	retlw	105	;'i'
	retlw	103	;'g'
	retlw	104	;'h'
	retlw	0
psect	strings
	file	"ADC with LM35 and Motor.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_f:
       ds      3

_tempr:
       ds      3

_volt:
       ds      3

temperature@f1:
       ds      3

_a:
       ds      2

_b:
       ds      2

_h:
       ds      2

_hr:
       ds      2

_o:
       ds      2

_t:
       ds      2

_th:
       ds      2

_thr:
       ds      2

_val:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Eh)
	fcall	clear_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_command
?_command:	; 0 bytes @ 0x0
	global	??_command
??_command:	; 0 bytes @ 0x0
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_data
?_lcd_data:	; 0 bytes @ 0x0
	global	??_lcd_data
??_lcd_data:	; 0 bytes @ 0x0
	global	?_lcd_send
?_lcd_send:	; 0 bytes @ 0x0
	global	?_adc_init
?_adc_init:	; 0 bytes @ 0x0
	global	??_adc_init
??_adc_init:	; 0 bytes @ 0x0
	global	?_adc_value
?_adc_value:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?___ftge
?___ftge:	; 1 bit 
	global	?___lwdiv
?___lwdiv:	; 2 bytes @ 0x0
	global	?___lwmod
?___lwmod:	; 2 bytes @ 0x0
	global	?___awdiv
?___awdiv:	; 2 bytes @ 0x0
	global	?___awmod
?___awmod:	; 2 bytes @ 0x0
	global	?___ftpack
?___ftpack:	; 3 bytes @ 0x0
	global	___lwdiv@divisor
___lwdiv@divisor:	; 2 bytes @ 0x0
	global	___lwmod@divisor
___lwmod@divisor:	; 2 bytes @ 0x0
	global	___awdiv@divisor
___awdiv@divisor:	; 2 bytes @ 0x0
	global	___awmod@divisor
___awmod@divisor:	; 2 bytes @ 0x0
	global	___ftge@ff1
___ftge@ff1:	; 3 bytes @ 0x0
	global	___ftpack@arg
___ftpack@arg:	; 3 bytes @ 0x0
	ds	2
	global	command@com
command@com:	; 1 bytes @ 0x2
	global	lcd_data@rec
lcd_data@rec:	; 1 bytes @ 0x2
	global	___lwdiv@dividend
___lwdiv@dividend:	; 2 bytes @ 0x2
	global	___lwmod@dividend
___lwmod@dividend:	; 2 bytes @ 0x2
	global	___awdiv@dividend
___awdiv@dividend:	; 2 bytes @ 0x2
	global	___awmod@dividend
___awmod@dividend:	; 2 bytes @ 0x2
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x3
	global	??_lcd_send
??_lcd_send:	; 0 bytes @ 0x3
	global	___ftpack@exp
___ftpack@exp:	; 1 bytes @ 0x3
	global	___ftge@ff2
___ftge@ff2:	; 3 bytes @ 0x3
	ds	1
	global	??___lwdiv
??___lwdiv:	; 0 bytes @ 0x4
	global	??___lwmod
??___lwmod:	; 0 bytes @ 0x4
	global	??___awdiv
??___awdiv:	; 0 bytes @ 0x4
	global	??___awmod
??___awmod:	; 0 bytes @ 0x4
	global	___ftpack@sign
___ftpack@sign:	; 1 bytes @ 0x4
	ds	1
	global	??___ftpack
??___ftpack:	; 0 bytes @ 0x5
	global	lcd_send@word
lcd_send@word:	; 1 bytes @ 0x5
	global	___lwmod@counter
___lwmod@counter:	; 1 bytes @ 0x5
	global	___awdiv@counter
___awdiv@counter:	; 1 bytes @ 0x5
	global	___awmod@counter
___awmod@counter:	; 1 bytes @ 0x5
	global	___lwdiv@quotient
___lwdiv@quotient:	; 2 bytes @ 0x5
	ds	1
	global	??___ftge
??___ftge:	; 0 bytes @ 0x6
	global	___awdiv@sign
___awdiv@sign:	; 1 bytes @ 0x6
	global	___awmod@sign
___awmod@sign:	; 1 bytes @ 0x6
	ds	1
	global	___lwdiv@counter
___lwdiv@counter:	; 1 bytes @ 0x7
	global	___awdiv@quotient
___awdiv@quotient:	; 2 bytes @ 0x7
	ds	1
	global	?_adc_hex
?_adc_hex:	; 0 bytes @ 0x8
	global	?___ftneg
?___ftneg:	; 3 bytes @ 0x8
	global	?___lwtoft
?___lwtoft:	; 3 bytes @ 0x8
	global	?___fttol
?___fttol:	; 4 bytes @ 0x8
	global	adc_hex@val
adc_hex@val:	; 2 bytes @ 0x8
	global	___lwtoft@c
___lwtoft@c:	; 2 bytes @ 0x8
	global	___fttol@f1
___fttol@f1:	; 3 bytes @ 0x8
	global	___ftneg@f1
___ftneg@f1:	; 3 bytes @ 0x8
	ds	2
	global	??_adc_hex
??_adc_hex:	; 0 bytes @ 0xA
	ds	1
	global	??___ftneg
??___ftneg:	; 0 bytes @ 0xB
	global	??___lwtoft
??___lwtoft:	; 0 bytes @ 0xB
	global	?___awtoft
?___awtoft:	; 3 bytes @ 0xB
	global	___awtoft@c
___awtoft@c:	; 2 bytes @ 0xB
	ds	1
	global	??_adc_value
??_adc_value:	; 0 bytes @ 0xC
	ds	2
	global	??_temperature
??_temperature:	; 0 bytes @ 0xE
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??___fttol
??___fttol:	; 0 bytes @ 0x0
	global	??___awtoft
??___awtoft:	; 0 bytes @ 0x0
	ds	2
	global	___awtoft@sign
___awtoft@sign:	; 1 bytes @ 0x2
	ds	1
	global	?___ftadd
?___ftadd:	; 3 bytes @ 0x3
	global	___ftadd@f1
___ftadd@f1:	; 3 bytes @ 0x3
	ds	1
	global	___fttol@sign1
___fttol@sign1:	; 1 bytes @ 0x4
	ds	1
	global	___fttol@lval
___fttol@lval:	; 4 bytes @ 0x5
	ds	1
	global	___ftadd@f2
___ftadd@f2:	; 3 bytes @ 0x6
	ds	3
	global	??___ftadd
??___ftadd:	; 0 bytes @ 0x9
	global	___fttol@exp1
___fttol@exp1:	; 1 bytes @ 0x9
	ds	1
	global	?___ftmul
?___ftmul:	; 3 bytes @ 0xA
	global	___ftmul@f1
___ftmul@f1:	; 3 bytes @ 0xA
	ds	3
	global	___ftadd@sign
___ftadd@sign:	; 1 bytes @ 0xD
	global	___ftmul@f2
___ftmul@f2:	; 3 bytes @ 0xD
	ds	1
	global	___ftadd@exp2
___ftadd@exp2:	; 1 bytes @ 0xE
	ds	1
	global	___ftadd@exp1
___ftadd@exp1:	; 1 bytes @ 0xF
	ds	1
	global	??___ftmul
??___ftmul:	; 0 bytes @ 0x10
	ds	4
	global	___ftmul@exp
___ftmul@exp:	; 1 bytes @ 0x14
	ds	1
	global	___ftmul@f3_as_product
___ftmul@f3_as_product:	; 3 bytes @ 0x15
	ds	3
	global	___ftmul@cntr
___ftmul@cntr:	; 1 bytes @ 0x18
	ds	1
	global	___ftmul@sign
___ftmul@sign:	; 1 bytes @ 0x19
	ds	1
	global	?_temperature
?_temperature:	; 0 bytes @ 0x1A
	global	?___ftdiv
?___ftdiv:	; 3 bytes @ 0x1A
	global	temperature@num
temperature@num:	; 3 bytes @ 0x1A
	global	___ftdiv@f2
___ftdiv@f2:	; 3 bytes @ 0x1A
	ds	3
	global	temperature@x1
temperature@x1:	; 2 bytes @ 0x1D
	global	___ftdiv@f1
___ftdiv@f1:	; 3 bytes @ 0x1D
	ds	2
	global	temperature@x2
temperature@x2:	; 2 bytes @ 0x1F
	ds	1
	global	??___ftdiv
??___ftdiv:	; 0 bytes @ 0x20
	ds	1
	global	temperature@x3
temperature@x3:	; 2 bytes @ 0x21
	ds	2
	global	temperature@x4
temperature@x4:	; 2 bytes @ 0x23
	ds	1
	global	___ftdiv@cntr
___ftdiv@cntr:	; 1 bytes @ 0x24
	ds	1
	global	temperature@temp
temperature@temp:	; 2 bytes @ 0x25
	global	___ftdiv@f3
___ftdiv@f3:	; 3 bytes @ 0x25
	ds	2
	global	temperature@n
temperature@n:	; 2 bytes @ 0x27
	ds	1
	global	___ftdiv@exp
___ftdiv@exp:	; 1 bytes @ 0x28
	ds	1
	global	___ftdiv@sign
___ftdiv@sign:	; 1 bytes @ 0x29
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x2A
	ds	2
;;Data sizes: Strings 53, constant 0, data 0, bss 30, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80     44      74
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?___ftpack	float  size(1) Largest target is 0
;;
;; ?___ftadd	float  size(1) Largest target is 0
;;
;; ?___ftneg	float  size(1) Largest target is 0
;;
;; ?___awtoft	float  size(1) Largest target is 0
;;
;; ?___awdiv	int  size(1) Largest target is 0
;;
;; ?___awmod	int  size(1) Largest target is 0
;;
;; ?___fttol	long  size(1) Largest target is 0
;;
;; ?___lwmod	unsigned int  size(1) Largest target is 0
;;
;; ?___lwdiv	unsigned int  size(1) Largest target is 0
;;
;; ?___ftmul	float  size(1) Largest target is 0
;;
;; ?___ftdiv	float  size(1) Largest target is 0
;;
;; ?___lwtoft	float  size(1) Largest target is 0
;;
;; lcd_send@word	PTR const unsigned char  size(1) Largest target is 19
;;		 -> STR_3(CODE[17]), STR_2(CODE[19]), STR_1(CODE[17]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_adc_value
;;   _temperature->___awtoft
;;   _adc_hex->___lwdiv
;;   _adc_value->___lwtoft
;;   _lcd_send->_lcd_data
;;   _lcd_init->_command
;;   ___lwtoft->___ftpack
;;   ___awtoft->___ftneg
;;   ___ftmul->___fttol
;;   ___ftadd->___awtoft
;;   ___ftneg->___ftpack
;;   ___fttol->___ftpack
;;
;; Critical Paths under _main in BANK0
;;
;;   _temperature->___ftmul
;;   _adc_value->___ftdiv
;;   ___ftmul->___fttol
;;   ___ftdiv->___ftmul
;;   ___ftadd->___awtoft
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0    4982
;;                                             42 BANK0      2     2      0
;;                           _lcd_init
;;                           _adc_init
;;                          _adc_value
;;                            _command
;;                            _adc_hex
;;                        _temperature
;;                             ___ftge
;;                           _lcd_send
;; ---------------------------------------------------------------------------------
;; (1) _temperature                                         15    12      3    3093
;;                                             26 BANK0     15    12      3
;;                            ___fttol
;;                            ___awmod
;;                            ___awdiv
;;                           ___awtoft
;;                            ___ftneg
;;                            ___ftadd
;;                            ___ftmul
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _adc_hex                                              2     0      2     387
;;                                              8 COMMON     2     0      2
;;                            ___lwdiv
;;                            ___lwmod
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _adc_value                                            2     2      0    1255
;;                                             12 COMMON     2     2      0
;;                           ___lwtoft
;;                            ___ftmul
;;                            ___ftdiv
;; ---------------------------------------------------------------------------------
;; (1) _lcd_send                                             3     3      0      67
;;                                              3 COMMON     3     3      0
;;                           _lcd_data
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             0     0      0      22
;;                            _command
;; ---------------------------------------------------------------------------------
;; (2) ___lwtoft                                             4     1      3     231
;;                                              8 COMMON     4     1      3
;;                           ___ftpack
;; ---------------------------------------------------------------------------------
;; (2) ___awtoft                                             6     3      3     300
;;                                             11 COMMON     3     0      3
;;                                              0 BANK0      3     3      0
;;                           ___ftpack
;;                            ___ftneg (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftmul                                             16    10      6     535
;;                                             10 BANK0     16    10      6
;;                           ___ftpack
;;                            ___fttol (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftdiv                                             16    10      6     489
;;                                             26 BANK0     16    10      6
;;                           ___ftpack
;;                            ___ftmul (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___ftadd                                             13     7      6    1049
;;                                              3 BANK0     13     7      6
;;                           ___ftpack
;;                            ___ftneg (ARG)
;;                           ___awtoft (ARG)
;; ---------------------------------------------------------------------------------
;; (2) _lcd_data                                             3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _command                                              3     3      0      22
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (2) ___awmod                                              7     3      4     296
;;                                              0 COMMON     7     3      4
;; ---------------------------------------------------------------------------------
;; (1) ___ftge                                              12     6      6     136
;;                                              0 COMMON    12     6      6
;; ---------------------------------------------------------------------------------
;; (2) ___ftneg                                              3     0      3      45
;;                                              8 COMMON     3     0      3
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (2) ___awdiv                                              9     5      4     300
;;                                              0 COMMON     9     5      4
;; ---------------------------------------------------------------------------------
;; (2) ___fttol                                             14    10      4     252
;;                                              8 COMMON     4     0      4
;;                                              0 BANK0     10    10      0
;;                           ___ftpack (ARG)
;; ---------------------------------------------------------------------------------
;; (3) ___ftpack                                             8     3      5     209
;;                                              0 COMMON     8     3      5
;; ---------------------------------------------------------------------------------
;; (2) ___lwmod                                              6     2      4     159
;;                                              0 COMMON     6     2      4
;; ---------------------------------------------------------------------------------
;; (2) ___lwdiv                                              8     4      4     162
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; (1) _adc_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _command
;;   _adc_init
;;   _adc_value
;;     ___lwtoft
;;       ___ftpack
;;     ___ftmul
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     ___ftdiv
;;       ___ftpack
;;       ___ftmul (ARG)
;;         ___ftpack
;;         ___fttol (ARG)
;;           ___ftpack (ARG)
;;   _command
;;   _adc_hex
;;     ___lwdiv
;;     ___lwmod
;;     _lcd_data
;;   _temperature
;;     ___fttol
;;       ___ftpack (ARG)
;;     ___awmod
;;     ___awdiv
;;     ___awtoft
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;     ___ftneg
;;       ___ftpack (ARG)
;;     ___ftadd
;;       ___ftpack
;;       ___ftneg (ARG)
;;         ___ftpack (ARG)
;;       ___awtoft (ARG)
;;         ___ftpack
;;         ___ftneg (ARG)
;;           ___ftpack (ARG)
;;     ___ftmul
;;       ___ftpack
;;       ___fttol (ARG)
;;         ___ftpack (ARG)
;;     _lcd_data
;;   ___ftge
;;   _lcd_send
;;     _lcd_data
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       3       2        0.0%
;;ABS                  0      0      58       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     2C      4A       5       92.5%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      5B      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 121 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_init
;;		_adc_init
;;		_adc_value
;;		_command
;;		_adc_hex
;;		_temperature
;;		___ftge
;;		_lcd_send
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	121
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 5
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	122
	
l3723:	
;ADC with LM35 and Motor.c: 122: TRISA = 0x01;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	123
	
l3725:	
;ADC with LM35 and Motor.c: 123: PORTA = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(5)	;volatile
	line	125
	
l3727:	
;ADC with LM35 and Motor.c: 125: TRISB = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	126
	
l3729:	
;ADC with LM35 and Motor.c: 126: PORTB = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	131
	
l3731:	
;ADC with LM35 and Motor.c: 131: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	132
	
l3733:	
;ADC with LM35 and Motor.c: 132: PORTD = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	134
	
l3735:	
;ADC with LM35 and Motor.c: 134: lcd_init();
	fcall	_lcd_init
	line	135
	
l3737:	
;ADC with LM35 and Motor.c: 135: adc_init();
	fcall	_adc_init
	goto	l3739
	line	137
;ADC with LM35 and Motor.c: 137: while(1)
	
l742:	
	line	139
	
l3739:	
;ADC with LM35 and Motor.c: 138: {
;ADC with LM35 and Motor.c: 139: adc_value();
	fcall	_adc_value
	line	142
	
l3741:	
;ADC with LM35 and Motor.c: 142: command(0xc3);
	movlw	(0C3h)
	fcall	_command
	line	143
	
l3743:	
;ADC with LM35 and Motor.c: 143: adc_hex(val);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_val+1),w
	clrf	(?_adc_hex+1)
	addwf	(?_adc_hex+1)
	movf	(_val),w
	clrf	(?_adc_hex)
	addwf	(?_adc_hex)

	fcall	_adc_hex
	line	144
	
l3745:	
;ADC with LM35 and Motor.c: 144: command(0xCA);
	movlw	(0CAh)
	fcall	_command
	line	145
	
l3747:	
;ADC with LM35 and Motor.c: 145: temperature(tempr);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tempr),w
	movwf	(?_temperature)
	movf	(_tempr+1),w
	movwf	(?_temperature+1)
	movf	(_tempr+2),w
	movwf	(?_temperature+2)
	fcall	_temperature
	line	146
	
l3749:	
;ADC with LM35 and Motor.c: 146: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u3467:
	decfsz	((??_main+0)+0),f
	goto	u3467
	decfsz	((??_main+0)+0+1),f
	goto	u3467
	clrwdt
opt asmopt_on

	line	150
	
l3751:	
;ADC with LM35 and Motor.c: 150: RB4 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(52/8),(52)&7
	line	152
	
l3753:	
;ADC with LM35 and Motor.c: 152: if(tempr < 25)
	movf	(_tempr),w
	movwf	(?___ftge)
	movf	(_tempr+1),w
	movwf	(?___ftge+1)
	movf	(_tempr+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0xc8
	movwf	1+(?___ftge)+03h
	movlw	0x41
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3421
	goto	u3420
u3421:
	goto	l3761
u3420:
	line	154
	
l3755:	
;ADC with LM35 and Motor.c: 153: {
;ADC with LM35 and Motor.c: 154: RB4 = 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	155
	
l3757:	
;ADC with LM35 and Motor.c: 155: command(0x80);
	movlw	(080h)
	fcall	_command
	line	156
	
l3759:	
;ADC with LM35 and Motor.c: 156: lcd_send("Temperature-Low ");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_send
	goto	l3761
	line	157
	
l743:	
	line	159
	
l3761:	
;ADC with LM35 and Motor.c: 157: }
;ADC with LM35 and Motor.c: 159: if(tempr > 25 && tempr < 75)
	movlw	0x0
	movwf	(?___ftge)
	movlw	0xc8
	movwf	(?___ftge+1)
	movlw	0x41
	movwf	(?___ftge+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tempr),w
	movwf	0+(?___ftge)+03h
	movf	(_tempr+1),w
	movwf	1+(?___ftge)+03h
	movf	(_tempr+2),w
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3431
	goto	u3430
u3431:
	goto	l3769
u3430:
	
l3763:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tempr),w
	movwf	(?___ftge)
	movf	(_tempr+1),w
	movwf	(?___ftge+1)
	movf	(_tempr+2),w
	movwf	(?___ftge+2)
	movlw	0x0
	movwf	0+(?___ftge)+03h
	movlw	0x96
	movwf	1+(?___ftge)+03h
	movlw	0x42
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3441
	goto	u3440
u3441:
	goto	l3769
u3440:
	line	161
	
l3765:	
;ADC with LM35 and Motor.c: 160: {
;ADC with LM35 and Motor.c: 161: command(0x80);
	movlw	(080h)
	fcall	_command
	line	162
	
l3767:	
;ADC with LM35 and Motor.c: 162: lcd_send("Temperature-Normal");
	movlw	((STR_2-__stringbase))&0ffh
	fcall	_lcd_send
	goto	l3769
	line	163
	
l744:	
	line	165
	
l3769:	
;ADC with LM35 and Motor.c: 163: }
;ADC with LM35 and Motor.c: 165: if(tempr > 75)
	movlw	0x0
	movwf	(?___ftge)
	movlw	0x96
	movwf	(?___ftge+1)
	movlw	0x42
	movwf	(?___ftge+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_tempr),w
	movwf	0+(?___ftge)+03h
	movf	(_tempr+1),w
	movwf	1+(?___ftge)+03h
	movf	(_tempr+2),w
	movwf	2+(?___ftge)+03h
	fcall	___ftge
	btfsc	status,0
	goto	u3451
	goto	u3450
u3451:
	goto	l3739
u3450:
	line	167
	
l3771:	
;ADC with LM35 and Motor.c: 166: {
;ADC with LM35 and Motor.c: 167: RB4 = 0x01;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(52/8),(52)&7
	line	168
	
l3773:	
;ADC with LM35 and Motor.c: 168: command(0x80);
	movlw	(080h)
	fcall	_command
	line	169
	
l3775:	
;ADC with LM35 and Motor.c: 169: lcd_send("Temperature-High");
	movlw	((STR_3-__stringbase))&0ffh
	fcall	_lcd_send
	goto	l3739
	line	170
	
l745:	
	goto	l3739
	line	200
	
l746:	
	line	137
	goto	l3739
	
l747:	
	line	201
	
l748:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_temperature
psect	text425,local,class=CODE,delta=2
global __ptext425
__ptext425:

;; *************** function _temperature *****************
;; Defined at:
;;		line 97 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;  num             3   26[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  n               2   39[BANK0 ] int 
;;  temp            2   37[BANK0 ] int 
;;  x4              2   35[BANK0 ] int 
;;  x3              2   33[BANK0 ] int 
;;  x2              2   31[BANK0 ] int 
;;  x1              2   29[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0      12       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0      15       0       0       0
;;Total ram usage:       15 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___fttol
;;		___awmod
;;		___awdiv
;;		___awtoft
;;		___ftneg
;;		___ftadd
;;		___ftmul
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text425
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	97
	global	__size_of_temperature
	__size_of_temperature	equ	__end_of_temperature-_temperature
	
_temperature:	
	opt	stack 5
; Regs used in _temperature: [wreg+status,2+status,0+pclath+cstack]
	line	100
	
l3721:	
;ADC with LM35 and Motor.c: 98: static float f1;
;ADC with LM35 and Motor.c: 99: int x1,x2,x3,x4,n,temp;
;ADC with LM35 and Motor.c: 100: n = num;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(temperature@num),w
	movwf	(?___fttol)
	movf	(temperature@num+1),w
	movwf	(?___fttol+1)
	movf	(temperature@num+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@n+1)
	addwf	(temperature@n+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(temperature@n)
	addwf	(temperature@n)

	line	101
;ADC with LM35 and Motor.c: 101: temp = num;
	movf	(temperature@num),w
	movwf	(?___fttol)
	movf	(temperature@num+1),w
	movwf	(?___fttol+1)
	movf	(temperature@num+2),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@temp+1)
	addwf	(temperature@temp+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(temperature@temp)
	addwf	(temperature@temp)

	line	102
;ADC with LM35 and Motor.c: 102: x1 = n%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(temperature@n+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(temperature@n),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@x1+1)
	addwf	(temperature@x1+1)
	movf	(0+(?___awmod)),w
	clrf	(temperature@x1)
	addwf	(temperature@x1)

	line	103
;ADC with LM35 and Motor.c: 103: n = n/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(temperature@n+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(temperature@n),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@n+1)
	addwf	(temperature@n+1)
	movf	(0+(?___awdiv)),w
	clrf	(temperature@n)
	addwf	(temperature@n)

	line	104
;ADC with LM35 and Motor.c: 104: x2 = n%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(temperature@n+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(temperature@n),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@x2+1)
	addwf	(temperature@x2+1)
	movf	(0+(?___awmod)),w
	clrf	(temperature@x2)
	addwf	(temperature@x2)

	line	105
;ADC with LM35 and Motor.c: 105: n = n/10;
	movlw	low(0Ah)
	movwf	(?___awdiv)
	movlw	high(0Ah)
	movwf	((?___awdiv))+1
	movf	(temperature@n+1),w
	clrf	1+(?___awdiv)+02h
	addwf	1+(?___awdiv)+02h
	movf	(temperature@n),w
	clrf	0+(?___awdiv)+02h
	addwf	0+(?___awdiv)+02h

	fcall	___awdiv
	movf	(1+(?___awdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@n+1)
	addwf	(temperature@n+1)
	movf	(0+(?___awdiv)),w
	clrf	(temperature@n)
	addwf	(temperature@n)

	line	106
;ADC with LM35 and Motor.c: 106: x3 = n%10;
	movlw	low(0Ah)
	movwf	(?___awmod)
	movlw	high(0Ah)
	movwf	((?___awmod))+1
	movf	(temperature@n+1),w
	clrf	1+(?___awmod)+02h
	addwf	1+(?___awmod)+02h
	movf	(temperature@n),w
	clrf	0+(?___awmod)+02h
	addwf	0+(?___awmod)+02h

	fcall	___awmod
	movf	(1+(?___awmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@x3+1)
	addwf	(temperature@x3+1)
	movf	(0+(?___awmod)),w
	clrf	(temperature@x3)
	addwf	(temperature@x3)

	line	107
;ADC with LM35 and Motor.c: 107: f1 = num - temp;
	movf	(temperature@num),w
	movwf	(?___ftadd)
	movf	(temperature@num+1),w
	movwf	(?___ftadd+1)
	movf	(temperature@num+2),w
	movwf	(?___ftadd+2)
	movf	(temperature@temp+1),w
	clrf	(?___awtoft+1)
	addwf	(?___awtoft+1)
	movf	(temperature@temp),w
	clrf	(?___awtoft)
	addwf	(?___awtoft)

	fcall	___awtoft
	movf	(0+(?___awtoft)),w
	movwf	(?___ftneg)
	movf	(1+(?___awtoft)),w
	movwf	(?___ftneg+1)
	movf	(2+(?___awtoft)),w
	movwf	(?___ftneg+2)
	fcall	___ftneg
	movf	(0+(?___ftneg)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	0+(?___ftadd)+03h
	movf	(1+(?___ftneg)),w
	movwf	1+(?___ftadd)+03h
	movf	(2+(?___ftneg)),w
	movwf	2+(?___ftadd)+03h
	fcall	___ftadd
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftadd)),w
	movwf	(temperature@f1)
	movf	(1+(?___ftadd)),w
	movwf	(temperature@f1+1)
	movf	(2+(?___ftadd)),w
	movwf	(temperature@f1+2)
	line	108
;ADC with LM35 and Motor.c: 108: x4 = f1*10;
	movf	(temperature@f1),w
	movwf	0+(?___ftmul)+03h
	movf	(temperature@f1+1),w
	movwf	1+(?___ftmul)+03h
	movf	(temperature@f1+2),w
	movwf	2+(?___ftmul)+03h
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x20
	movwf	(?___ftmul+1)
	movlw	0x41
	movwf	(?___ftmul+2)
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(?___fttol)
	movf	(1+(?___ftmul)),w
	movwf	(?___fttol+1)
	movf	(2+(?___ftmul)),w
	movwf	(?___fttol+2)
	fcall	___fttol
	movf	1+(((0+(?___fttol)))),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(temperature@x4+1)
	addwf	(temperature@x4+1)
	movf	0+(((0+(?___fttol)))),w
	clrf	(temperature@x4)
	addwf	(temperature@x4)

	line	109
;ADC with LM35 and Motor.c: 109: lcd_data(x3+0x30);
	movf	(temperature@x3),w
	addlw	030h
	fcall	_lcd_data
	line	110
;ADC with LM35 and Motor.c: 110: lcd_data(x2+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(temperature@x2),w
	addlw	030h
	fcall	_lcd_data
	line	111
;ADC with LM35 and Motor.c: 111: lcd_data(x1+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(temperature@x1),w
	addlw	030h
	fcall	_lcd_data
	line	112
;ADC with LM35 and Motor.c: 112: lcd_data(0x2e);
	movlw	(02Eh)
	fcall	_lcd_data
	line	113
;ADC with LM35 and Motor.c: 113: lcd_data(x4+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(temperature@x4),w
	addlw	030h
	fcall	_lcd_data
	line	114
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_temperature
	__end_of_temperature:
;; =============== function _temperature ends ============

	signat	_temperature,4216
	global	_adc_hex
psect	text426,local,class=CODE,delta=2
global __ptext426
__ptext426:

;; *************** function _adc_hex *****************
;; Defined at:
;;		line 83 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;  val             2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___lwdiv
;;		___lwmod
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text426
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	83
	global	__size_of_adc_hex
	__size_of_adc_hex	equ	__end_of_adc_hex-_adc_hex
	
_adc_hex:	
	opt	stack 6
; Regs used in _adc_hex: [wreg+status,2+status,0+pclath+cstack]
	line	84
	
l3719:	
;ADC with LM35 and Motor.c: 84: h=val/1000;
	movlw	low(03E8h)
	movwf	(?___lwdiv)
	movlw	high(03E8h)
	movwf	((?___lwdiv))+1
	movf	(adc_hex@val+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(adc_hex@val),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_h+1)
	addwf	(_h+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_h)
	addwf	(_h)

	line	85
;ADC with LM35 and Motor.c: 85: hr=val%1000;
	movlw	low(03E8h)
	movwf	(?___lwmod)
	movlw	high(03E8h)
	movwf	((?___lwmod))+1
	movf	(adc_hex@val+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(adc_hex@val),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_hr+1)
	addwf	(_hr+1)
	movf	(0+(?___lwmod)),w
	clrf	(_hr)
	addwf	(_hr)

	line	86
;ADC with LM35 and Motor.c: 86: t=hr/100;
	movlw	low(064h)
	movwf	(?___lwdiv)
	movlw	high(064h)
	movwf	((?___lwdiv))+1
	movf	(_hr+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_hr),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_t+1)
	addwf	(_t+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_t)
	addwf	(_t)

	line	87
;ADC with LM35 and Motor.c: 87: o=hr%100;
	movlw	low(064h)
	movwf	(?___lwmod)
	movlw	high(064h)
	movwf	((?___lwmod))+1
	movf	(_hr+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_hr),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_o+1)
	addwf	(_o+1)
	movf	(0+(?___lwmod)),w
	clrf	(_o)
	addwf	(_o)

	line	88
;ADC with LM35 and Motor.c: 88: th=o/10;
	movlw	low(0Ah)
	movwf	(?___lwdiv)
	movlw	high(0Ah)
	movwf	((?___lwdiv))+1
	movf	(_o+1),w
	clrf	1+(?___lwdiv)+02h
	addwf	1+(?___lwdiv)+02h
	movf	(_o),w
	clrf	0+(?___lwdiv)+02h
	addwf	0+(?___lwdiv)+02h

	fcall	___lwdiv
	movf	(1+(?___lwdiv)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_th+1)
	addwf	(_th+1)
	movf	(0+(?___lwdiv)),w
	clrf	(_th)
	addwf	(_th)

	line	89
;ADC with LM35 and Motor.c: 89: thr=o%10;
	movlw	low(0Ah)
	movwf	(?___lwmod)
	movlw	high(0Ah)
	movwf	((?___lwmod))+1
	movf	(_o+1),w
	clrf	1+(?___lwmod)+02h
	addwf	1+(?___lwmod)+02h
	movf	(_o),w
	clrf	0+(?___lwmod)+02h
	addwf	0+(?___lwmod)+02h

	fcall	___lwmod
	movf	(1+(?___lwmod)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(_thr+1)
	addwf	(_thr+1)
	movf	(0+(?___lwmod)),w
	clrf	(_thr)
	addwf	(_thr)

	line	90
;ADC with LM35 and Motor.c: 90: lcd_data(h+0x30);
	movf	(_h),w
	addlw	030h
	fcall	_lcd_data
	line	91
;ADC with LM35 and Motor.c: 91: lcd_data(t+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_t),w
	addlw	030h
	fcall	_lcd_data
	line	92
;ADC with LM35 and Motor.c: 92: lcd_data(th+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_th),w
	addlw	030h
	fcall	_lcd_data
	line	93
;ADC with LM35 and Motor.c: 93: lcd_data(thr+0x30);
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_thr),w
	addlw	030h
	fcall	_lcd_data
	line	94
	
l734:	
	return
	opt stack 0
GLOBAL	__end_of_adc_hex
	__end_of_adc_hex:
;; =============== function _adc_hex ends ============

	signat	_adc_hex,4216
	global	_adc_value
psect	text427,local,class=CODE,delta=2
global __ptext427
__ptext427:

;; *************** function _adc_value *****************
;; Defined at:
;;		line 69 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		___lwtoft
;;		___ftmul
;;		___ftdiv
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text427
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	69
	global	__size_of_adc_value
	__size_of_adc_value	equ	__end_of_adc_value-_adc_value
	
_adc_value:	
	opt	stack 5
; Regs used in _adc_value: [wreg+status,2+status,0+pclath+cstack]
	line	70
	
l3709:	
;ADC with LM35 and Motor.c: 70: ADCON0 = 0xC5;
	movlw	(0C5h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	72
;ADC with LM35 and Motor.c: 72: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_adc_value+0)+0+1),f
	movlw	238
movwf	((??_adc_value+0)+0),f
u3477:
	decfsz	((??_adc_value+0)+0),f
	goto	u3477
	decfsz	((??_adc_value+0)+0+1),f
	goto	u3477
	clrwdt
opt asmopt_on

	line	73
;ADC with LM35 and Motor.c: 73: a = ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(??_adc_value+0)+0
	clrf	(??_adc_value+0)+0+1
	movf	0+(??_adc_value+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_a)
	movf	1+(??_adc_value+0)+0,w
	movwf	(_a+1)
	line	74
;ADC with LM35 and Motor.c: 74: b = ADRESH;
	movf	(30),w	;volatile
	movwf	(??_adc_value+0)+0
	clrf	(??_adc_value+0)+0+1
	movf	0+(??_adc_value+0)+0,w
	movwf	(_b)
	movf	1+(??_adc_value+0)+0,w
	movwf	(_b+1)
	line	75
;ADC with LM35 and Motor.c: 75: b = b*256;
	movf	(_b),w
	movwf	(??_adc_value+0)+0+1
	clrf	(??_adc_value+0)+0
	movf	0+(??_adc_value+0)+0,w
	movwf	(_b)
	movf	1+(??_adc_value+0)+0,w
	movwf	(_b+1)
	line	76
	
l3711:	
;ADC with LM35 and Motor.c: 76: val = (b+a);
	movf	(_a),w
	addwf	(_b),w
	movwf	(_val)
	movf	(_a+1),w
	skipnc
	incf	(_a+1),w
	addwf	(_b+1),w
	movwf	1+(_val)
	line	77
	
l3713:	
;ADC with LM35 and Motor.c: 77: f = val;
	movf	(_val+1),w
	clrf	(?___lwtoft+1)
	addwf	(?___lwtoft+1)
	movf	(_val),w
	clrf	(?___lwtoft)
	addwf	(?___lwtoft)

	fcall	___lwtoft
	movf	(0+(?___lwtoft)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_f)
	movf	(1+(?___lwtoft)),w
	movwf	(_f+1)
	movf	(2+(?___lwtoft)),w
	movwf	(_f+2)
	line	78
	
l3715:	
;ADC with LM35 and Motor.c: 78: volt = (f*5) / 1023;
	movlw	0xc0
	movwf	(?___ftdiv)
	movlw	0x7f
	movwf	(?___ftdiv+1)
	movlw	0x44
	movwf	(?___ftdiv+2)
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xa0
	movwf	(?___ftmul+1)
	movlw	0x40
	movwf	(?___ftmul+2)
	movf	(_f),w
	movwf	0+(?___ftmul)+03h
	movf	(_f+1),w
	movwf	1+(?___ftmul)+03h
	movf	(_f+2),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	0+(?___ftdiv)+03h
	movf	(1+(?___ftmul)),w
	movwf	1+(?___ftdiv)+03h
	movf	(2+(?___ftmul)),w
	movwf	2+(?___ftdiv)+03h
	fcall	___ftdiv
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftdiv)),w
	movwf	(_volt)
	movf	(1+(?___ftdiv)),w
	movwf	(_volt+1)
	movf	(2+(?___ftdiv)),w
	movwf	(_volt+2)
	line	79
	
l3717:	
;ADC with LM35 and Motor.c: 79: tempr = volt * 100;
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0xc8
	movwf	(?___ftmul+1)
	movlw	0x42
	movwf	(?___ftmul+2)
	movf	(_volt),w
	movwf	0+(?___ftmul)+03h
	movf	(_volt+1),w
	movwf	1+(?___ftmul)+03h
	movf	(_volt+2),w
	movwf	2+(?___ftmul)+03h
	fcall	___ftmul
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(0+(?___ftmul)),w
	movwf	(_tempr)
	movf	(1+(?___ftmul)),w
	movwf	(_tempr+1)
	movf	(2+(?___ftmul)),w
	movwf	(_tempr+2)
	line	80
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_adc_value
	__end_of_adc_value:
;; =============== function _adc_value ends ============

	signat	_adc_value,88
	global	_lcd_send
psect	text428,local,class=CODE,delta=2
global __ptext428
__ptext428:

;; *************** function _lcd_send *****************
;; Defined at:
;;		line 55 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;  word            1    wreg     PTR const unsigned char 
;;		 -> STR_3(17), STR_2(19), STR_1(17), 
;; Auto vars:     Size  Location     Type
;;  word            1    5[COMMON] PTR const unsigned char 
;;		 -> STR_3(17), STR_2(19), STR_1(17), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_lcd_data
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text428
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	55
	global	__size_of_lcd_send
	__size_of_lcd_send	equ	__end_of_lcd_send-_lcd_send
	
_lcd_send:	
	opt	stack 6
; Regs used in _lcd_send: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_send@word stored from wreg
	movwf	(lcd_send@word)
	line	56
	
l3699:	
;ADC with LM35 and Motor.c: 56: while(*word)
	goto	l3707
	
l723:	
	line	58
	
l3701:	
;ADC with LM35 and Motor.c: 57: {
;ADC with LM35 and Motor.c: 58: lcd_data(*word++);
	movf	(lcd_send@word),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_data
	
l3703:	
	movlw	(01h)
	movwf	(??_lcd_send+0)+0
	movf	(??_lcd_send+0)+0,w
	addwf	(lcd_send@word),f
	line	59
	
l3705:	
;ADC with LM35 and Motor.c: 59: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_lcd_send+0)+0+1),f
	movlw	238
movwf	((??_lcd_send+0)+0),f
u3487:
	decfsz	((??_lcd_send+0)+0),f
	goto	u3487
	decfsz	((??_lcd_send+0)+0+1),f
	goto	u3487
	clrwdt
opt asmopt_on

	goto	l3707
	line	60
	
l722:	
	line	56
	
l3707:	
	movf	(lcd_send@word),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u3411
	goto	u3410
u3411:
	goto	l3701
u3410:
	goto	l725
	
l724:	
	line	61
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_send
	__end_of_lcd_send:
;; =============== function _lcd_send ends ============

	signat	_lcd_send,4216
	global	_lcd_init
psect	text429,local,class=CODE,delta=2
global __ptext429
__ptext429:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 29 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_command
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text429
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	29
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 6
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3697:	
;ADC with LM35 and Motor.c: 30: command(0x01);
	movlw	(01h)
	fcall	_command
	line	31
;ADC with LM35 and Motor.c: 31: command(0x06);
	movlw	(06h)
	fcall	_command
	line	32
;ADC with LM35 and Motor.c: 32: command(0x0C);
	movlw	(0Ch)
	fcall	_command
	line	33
;ADC with LM35 and Motor.c: 33: command(0x38);
	movlw	(038h)
	fcall	_command
	line	34
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	___lwtoft
psect	text430,local,class=CODE,delta=2
global __ptext430
__ptext430:

;; *************** function ___lwtoft *****************
;; Defined at:
;;		line 29 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2    8[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_adc_value
;; This function uses a non-reentrant model
;;
psect	text430
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwtoft.c"
	line	29
	global	__size_of___lwtoft
	__size_of___lwtoft	equ	__end_of___lwtoft-___lwtoft
	
___lwtoft:	
	opt	stack 5
; Regs used in ___lwtoft: [wreg+status,2+status,0+pclath+cstack]
	line	30
	
l3693:	
	movf	(___lwtoft@c),w
	movwf	(?___ftpack)
	movf	(___lwtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___lwtoft+0)+0
	movf	(??___lwtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	clrf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___lwtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___lwtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___lwtoft+2)
	goto	l1654
	
l3695:	
	line	31
	
l1654:	
	return
	opt stack 0
GLOBAL	__end_of___lwtoft
	__end_of___lwtoft:
;; =============== function ___lwtoft ends ============

	signat	___lwtoft,4219
	global	___awtoft
psect	text431,local,class=CODE,delta=2
global __ptext431
__ptext431:

;; *************** function ___awtoft *****************
;; Defined at:
;;		line 33 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
;; Parameters:    Size  Location     Type
;;  c               2   11[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   11[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         3       3       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text431
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awtoft.c"
	line	33
	global	__size_of___awtoft
	__size_of___awtoft	equ	__end_of___awtoft-___awtoft
	
___awtoft:	
	opt	stack 5
; Regs used in ___awtoft: [wreg+status,2+status,0+pclath+cstack]
	line	36
	
l3685:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(___awtoft@sign)
	line	37
	btfss	(___awtoft@c+1),7
	goto	u3401
	goto	u3400
u3401:
	goto	l3689
u3400:
	line	38
	
l3687:	
	comf	(___awtoft@c),f
	comf	(___awtoft@c+1),f
	incf	(___awtoft@c),f
	skipnz
	incf	(___awtoft@c+1),f
	line	39
	clrf	(___awtoft@sign)
	bsf	status,0
	rlf	(___awtoft@sign),f
	goto	l3689
	line	40
	
l1567:	
	line	41
	
l3689:	
	movf	(___awtoft@c),w
	movwf	(?___ftpack)
	movf	(___awtoft@c+1),w
	movwf	(?___ftpack+1)
	clrf	(?___ftpack+2)
	movlw	(08Eh)
	movwf	(??___awtoft+0)+0
	movf	(??___awtoft+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___awtoft@sign),w
	movwf	(??___awtoft+1)+0
	movf	(??___awtoft+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	movwf	(?___awtoft)
	movf	(1+(?___ftpack)),w
	movwf	(?___awtoft+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___awtoft+2)
	goto	l1568
	
l3691:	
	line	42
	
l1568:	
	return
	opt stack 0
GLOBAL	__end_of___awtoft
	__end_of___awtoft:
;; =============== function ___awtoft ends ============

	signat	___awtoft,4219
	global	___ftmul
psect	text432,local,class=CODE,delta=2
global __ptext432
__ptext432:

;; *************** function ___ftmul *****************
;; Defined at:
;;		line 52 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
;; Parameters:    Size  Location     Type
;;  f1              3   10[BANK0 ] float 
;;  f2              3   13[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3_as_produc    3   21[BANK0 ] unsigned um
;;  sign            1   25[BANK0 ] unsigned char 
;;  cntr            1   24[BANK0 ] unsigned char 
;;  exp             1   20[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   10[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_adc_value
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text432
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftmul.c"
	line	52
	global	__size_of___ftmul
	__size_of___ftmul	equ	__end_of___ftmul-___ftmul
	
___ftmul:	
	opt	stack 5
; Regs used in ___ftmul: [wreg+status,2+status,0+pclath+cstack]
	line	56
	
l3635:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@exp)
	movf	((___ftmul@exp)),f
	skipz
	goto	u3261
	goto	u3260
u3261:
	goto	l3641
u3260:
	line	57
	
l3637:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1530
	
l3639:	
	goto	l1530
	
l1529:	
	line	58
	
l3641:	
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	clrc
	rlf	(??___ftmul+0)+1,w
	rlf	(??___ftmul+0)+2,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	movf	((___ftmul@sign)),f
	skipz
	goto	u3271
	goto	u3270
u3271:
	goto	l3647
u3270:
	line	59
	
l3643:	
	movlw	0x0
	movwf	(?___ftmul)
	movlw	0x0
	movwf	(?___ftmul+1)
	movlw	0x0
	movwf	(?___ftmul+2)
	goto	l1530
	
l3645:	
	goto	l1530
	
l1531:	
	line	60
	
l3647:	
	movf	(___ftmul@sign),w
	addlw	07Bh
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	addwf	(___ftmul@exp),f
	line	61
	movf	(___ftmul@f1),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f1+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f1+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3285:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3280:
	addlw	-1
	skipz
	goto	u3285
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	movwf	(___ftmul@sign)
	line	62
	movf	(___ftmul@f2),w
	movwf	((??___ftmul+0)+0)
	movf	(___ftmul@f2+1),w
	movwf	((??___ftmul+0)+0+1)
	movf	(___ftmul@f2+2),w
	movwf	((??___ftmul+0)+0+2)
	movlw	010h
u3295:
	clrc
	rrf	(??___ftmul+0)+2,f
	rrf	(??___ftmul+0)+1,f
	rrf	(??___ftmul+0)+0,f
u3290:
	addlw	-1
	skipz
	goto	u3295
	movf	0+(??___ftmul+0)+0,w
	movwf	(??___ftmul+3)+0
	movf	(??___ftmul+3)+0,w
	xorwf	(___ftmul@sign),f
	line	63
	movlw	(080h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	andwf	(___ftmul@sign),f
	line	64
	
l3649:	
	bsf	(___ftmul@f1)+(15/8),(15)&7
	line	66
	
l3651:	
	bsf	(___ftmul@f2)+(15/8),(15)&7
	line	67
	
l3653:	
	movlw	0FFh
	andwf	(___ftmul@f2),f
	movlw	0FFh
	andwf	(___ftmul@f2+1),f
	movlw	0
	andwf	(___ftmul@f2+2),f
	line	68
	
l3655:	
	movlw	0
	movwf	(___ftmul@f3_as_product)
	movlw	0
	movwf	(___ftmul@f3_as_product+1)
	movlw	0
	movwf	(___ftmul@f3_as_product+2)
	line	69
	
l3657:	
	movlw	(07h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3659
	line	70
	
l1532:	
	line	71
	
l3659:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3301
	goto	u3300
u3301:
	goto	l3663
u3300:
	line	72
	
l3661:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3311
	addwf	(___ftmul@f3_as_product+1),f
u3311:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3312
	addwf	(___ftmul@f3_as_product+2),f
u3312:

	goto	l3663
	
l1533:	
	line	73
	
l3663:	
	movlw	01h
u3325:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3325

	line	74
	
l3665:	
	movlw	01h
u3335:
	clrc
	rlf	(___ftmul@f2),f
	rlf	(___ftmul@f2+1),f
	rlf	(___ftmul@f2+2),f
	addlw	-1
	skipz
	goto	u3335
	line	75
	
l3667:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3341
	goto	u3340
u3341:
	goto	l3659
u3340:
	goto	l3669
	
l1534:	
	line	76
	
l3669:	
	movlw	(09h)
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	(___ftmul@cntr)
	goto	l3671
	line	77
	
l1535:	
	line	78
	
l3671:	
	btfss	(___ftmul@f1),(0)&7
	goto	u3351
	goto	u3350
u3351:
	goto	l3675
u3350:
	line	79
	
l3673:	
	movf	(___ftmul@f2),w
	addwf	(___ftmul@f3_as_product),f
	movf	(___ftmul@f2+1),w
	clrz
	skipnc
	incf	(___ftmul@f2+1),w
	skipnz
	goto	u3361
	addwf	(___ftmul@f3_as_product+1),f
u3361:
	movf	(___ftmul@f2+2),w
	clrz
	skipnc
	incf	(___ftmul@f2+2),w
	skipnz
	goto	u3362
	addwf	(___ftmul@f3_as_product+2),f
u3362:

	goto	l3675
	
l1536:	
	line	80
	
l3675:	
	movlw	01h
u3375:
	clrc
	rrf	(___ftmul@f1+2),f
	rrf	(___ftmul@f1+1),f
	rrf	(___ftmul@f1),f
	addlw	-1
	skipz
	goto	u3375

	line	81
	
l3677:	
	movlw	01h
u3385:
	clrc
	rrf	(___ftmul@f3_as_product+2),f
	rrf	(___ftmul@f3_as_product+1),f
	rrf	(___ftmul@f3_as_product),f
	addlw	-1
	skipz
	goto	u3385

	line	82
	
l3679:	
	movlw	low(01h)
	subwf	(___ftmul@cntr),f
	btfss	status,2
	goto	u3391
	goto	u3390
u3391:
	goto	l3671
u3390:
	goto	l3681
	
l1537:	
	line	83
	
l3681:	
	movf	(___ftmul@f3_as_product),w
	movwf	(?___ftpack)
	movf	(___ftmul@f3_as_product+1),w
	movwf	(?___ftpack+1)
	movf	(___ftmul@f3_as_product+2),w
	movwf	(?___ftpack+2)
	movf	(___ftmul@exp),w
	movwf	(??___ftmul+0)+0
	movf	(??___ftmul+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftmul@sign),w
	movwf	(??___ftmul+1)+0
	movf	(??___ftmul+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftmul)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftmul+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftmul+2)
	goto	l1530
	
l3683:	
	line	84
	
l1530:	
	return
	opt stack 0
GLOBAL	__end_of___ftmul
	__end_of___ftmul:
;; =============== function ___ftmul ends ============

	signat	___ftmul,8315
	global	___ftdiv
psect	text433,local,class=CODE,delta=2
global __ptext433
__ptext433:

;; *************** function ___ftdiv *****************
;; Defined at:
;;		line 50 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
;; Parameters:    Size  Location     Type
;;  f2              3   26[BANK0 ] float 
;;  f1              3   29[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  f3              3   37[BANK0 ] float 
;;  sign            1   41[BANK0 ] unsigned char 
;;  exp             1   40[BANK0 ] unsigned char 
;;  cntr            1   36[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3   26[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      16       0       0       0
;;Total ram usage:       16 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_adc_value
;; This function uses a non-reentrant model
;;
psect	text433
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftdiv.c"
	line	50
	global	__size_of___ftdiv
	__size_of___ftdiv	equ	__end_of___ftdiv-___ftdiv
	
___ftdiv:	
	opt	stack 5
; Regs used in ___ftdiv: [wreg+status,2+status,0+pclath+cstack]
	line	55
	
l3593:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@exp)
	movf	((___ftdiv@exp)),f
	skipz
	goto	u3181
	goto	u3180
u3181:
	goto	l3599
u3180:
	line	56
	
l3595:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1520
	
l3597:	
	goto	l1520
	
l1519:	
	line	57
	
l3599:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	clrc
	rlf	(??___ftdiv+0)+1,w
	rlf	(??___ftdiv+0)+2,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	movf	((___ftdiv@sign)),f
	skipz
	goto	u3191
	goto	u3190
u3191:
	goto	l3605
u3190:
	line	58
	
l3601:	
	movlw	0x0
	movwf	(?___ftdiv)
	movlw	0x0
	movwf	(?___ftdiv+1)
	movlw	0x0
	movwf	(?___ftdiv+2)
	goto	l1520
	
l3603:	
	goto	l1520
	
l1521:	
	line	59
	
l3605:	
	movlw	0
	movwf	(___ftdiv@f3)
	movlw	0
	movwf	(___ftdiv@f3+1)
	movlw	0
	movwf	(___ftdiv@f3+2)
	line	60
	
l3607:	
	movlw	(089h)
	addwf	(___ftdiv@sign),w
	movwf	(??___ftdiv+0)+0
	movf	0+(??___ftdiv+0)+0,w
	subwf	(___ftdiv@exp),f
	line	61
	
l3609:	
	movf	(___ftdiv@f1),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f1+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f1+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3205:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3200:
	addlw	-1
	skipz
	goto	u3205
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	movwf	(___ftdiv@sign)
	line	62
	
l3611:	
	movf	(___ftdiv@f2),w
	movwf	((??___ftdiv+0)+0)
	movf	(___ftdiv@f2+1),w
	movwf	((??___ftdiv+0)+0+1)
	movf	(___ftdiv@f2+2),w
	movwf	((??___ftdiv+0)+0+2)
	movlw	010h
u3215:
	clrc
	rrf	(??___ftdiv+0)+2,f
	rrf	(??___ftdiv+0)+1,f
	rrf	(??___ftdiv+0)+0,f
u3210:
	addlw	-1
	skipz
	goto	u3215
	movf	0+(??___ftdiv+0)+0,w
	movwf	(??___ftdiv+3)+0
	movf	(??___ftdiv+3)+0,w
	xorwf	(___ftdiv@sign),f
	line	63
	
l3613:	
	movlw	(080h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	andwf	(___ftdiv@sign),f
	line	64
	
l3615:	
	bsf	(___ftdiv@f1)+(15/8),(15)&7
	line	65
	movlw	0FFh
	andwf	(___ftdiv@f1),f
	movlw	0FFh
	andwf	(___ftdiv@f1+1),f
	movlw	0
	andwf	(___ftdiv@f1+2),f
	line	66
	
l3617:	
	bsf	(___ftdiv@f2)+(15/8),(15)&7
	line	67
	movlw	0FFh
	andwf	(___ftdiv@f2),f
	movlw	0FFh
	andwf	(___ftdiv@f2+1),f
	movlw	0
	andwf	(___ftdiv@f2+2),f
	line	68
	movlw	(018h)
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	(___ftdiv@cntr)
	goto	l3619
	line	69
	
l1522:	
	line	70
	
l3619:	
	movlw	01h
u3225:
	clrc
	rlf	(___ftdiv@f3),f
	rlf	(___ftdiv@f3+1),f
	rlf	(___ftdiv@f3+2),f
	addlw	-1
	skipz
	goto	u3225
	line	71
	
l3621:	
	movf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),w
	skipz
	goto	u3235
	movf	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),w
	skipz
	goto	u3235
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),w
u3235:
	skipc
	goto	u3231
	goto	u3230
u3231:
	goto	l3627
u3230:
	line	72
	
l3623:	
	movf	(___ftdiv@f2),w
	subwf	(___ftdiv@f1),f
	movf	(___ftdiv@f2+1),w
	skipc
	incfsz	(___ftdiv@f2+1),w
	subwf	(___ftdiv@f1+1),f
	movf	(___ftdiv@f2+2),w
	skipc
	incf	(___ftdiv@f2+2),w
	subwf	(___ftdiv@f1+2),f
	line	73
	
l3625:	
	bsf	(___ftdiv@f3)+(0/8),(0)&7
	goto	l3627
	line	74
	
l1523:	
	line	75
	
l3627:	
	movlw	01h
u3245:
	clrc
	rlf	(___ftdiv@f1),f
	rlf	(___ftdiv@f1+1),f
	rlf	(___ftdiv@f1+2),f
	addlw	-1
	skipz
	goto	u3245
	line	76
	
l3629:	
	movlw	low(01h)
	subwf	(___ftdiv@cntr),f
	btfss	status,2
	goto	u3251
	goto	u3250
u3251:
	goto	l3619
u3250:
	goto	l3631
	
l1524:	
	line	77
	
l3631:	
	movf	(___ftdiv@f3),w
	movwf	(?___ftpack)
	movf	(___ftdiv@f3+1),w
	movwf	(?___ftpack+1)
	movf	(___ftdiv@f3+2),w
	movwf	(?___ftpack+2)
	movf	(___ftdiv@exp),w
	movwf	(??___ftdiv+0)+0
	movf	(??___ftdiv+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftdiv@sign),w
	movwf	(??___ftdiv+1)+0
	movf	(??___ftdiv+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftdiv)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftdiv+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftdiv+2)
	goto	l1520
	
l3633:	
	line	78
	
l1520:	
	return
	opt stack 0
GLOBAL	__end_of___ftdiv
	__end_of___ftdiv:
;; =============== function ___ftdiv ends ============

	signat	___ftdiv,8315
	global	___ftadd
psect	text434,local,class=CODE,delta=2
global __ptext434
__ptext434:

;; *************** function ___ftadd *****************
;; Defined at:
;;		line 87 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
;; Parameters:    Size  Location     Type
;;  f1              3    3[BANK0 ] float 
;;  f2              3    6[BANK0 ] float 
;; Auto vars:     Size  Location     Type
;;  exp1            1   15[BANK0 ] unsigned char 
;;  exp2            1   14[BANK0 ] unsigned char 
;;  sign            1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  3    3[BANK0 ] float 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       6       0       0       0
;;      Locals:         0       3       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		___ftpack
;; This function is called by:
;;		_temperature
;;		___ftsub
;; This function uses a non-reentrant model
;;
psect	text434
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftadd.c"
	line	87
	global	__size_of___ftadd
	__size_of___ftadd	equ	__end_of___ftadd-___ftadd
	
___ftadd:	
	opt	stack 5
; Regs used in ___ftadd: [wreg+status,2+status,0+pclath+cstack]
	line	90
	
l3523:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(___ftadd@f1),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f1+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f1+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp1)
	line	91
	movf	(___ftadd@f2),w
	movwf	((??___ftadd+0)+0)
	movf	(___ftadd@f2+1),w
	movwf	((??___ftadd+0)+0+1)
	movf	(___ftadd@f2+2),w
	movwf	((??___ftadd+0)+0+2)
	clrc
	rlf	(??___ftadd+0)+1,w
	rlf	(??___ftadd+0)+2,w
	movwf	(??___ftadd+3)+0
	movf	(??___ftadd+3)+0,w
	movwf	(___ftadd@exp2)
	line	92
	
l3525:	
	movf	(___ftadd@exp1),w
	skipz
	goto	u2940
	goto	l3531
u2940:
	
l3527:	
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u2951
	goto	u2950
u2951:
	goto	l3535
u2950:
	
l3529:	
	decf	(___ftadd@exp1),w
	xorlw	0ffh
	addwf	(___ftadd@exp2),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2961
	goto	u2960
u2961:
	goto	l3535
u2960:
	goto	l3531
	
l1477:	
	line	93
	
l3531:	
	movf	(___ftadd@f2),w
	movwf	(?___ftadd)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftadd+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftadd+2)
	goto	l1478
	
l3533:	
	goto	l1478
	
l1475:	
	line	94
	
l3535:	
	movf	(___ftadd@exp2),w
	skipz
	goto	u2970
	goto	l1481
u2970:
	
l3537:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u2981
	goto	u2980
u2981:
	goto	l3541
u2980:
	
l3539:	
	decf	(___ftadd@exp2),w
	xorlw	0ffh
	addwf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movlw	(019h)
	subwf	0+(??___ftadd+0)+0,w
	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l3541
u2990:
	
l1481:	
	line	95
	goto	l1478
	
l1479:	
	line	96
	
l3541:	
	movlw	(06h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	(___ftadd@sign)
	line	97
	
l3543:	
	btfss	(___ftadd@f1+2),(23)&7
	goto	u3001
	goto	u3000
u3001:
	goto	l1482
u3000:
	line	98
	
l3545:	
	bsf	(___ftadd@sign)+(7/8),(7)&7
	
l1482:	
	line	99
	btfss	(___ftadd@f2+2),(23)&7
	goto	u3011
	goto	u3010
u3011:
	goto	l1483
u3010:
	line	100
	
l3547:	
	bsf	(___ftadd@sign)+(6/8),(6)&7
	
l1483:	
	line	101
	bsf	(___ftadd@f1)+(15/8),(15)&7
	line	102
	
l3549:	
	movlw	0FFh
	andwf	(___ftadd@f1),f
	movlw	0FFh
	andwf	(___ftadd@f1+1),f
	movlw	0
	andwf	(___ftadd@f1+2),f
	line	103
	
l3551:	
	bsf	(___ftadd@f2)+(15/8),(15)&7
	line	104
	movlw	0FFh
	andwf	(___ftadd@f2),f
	movlw	0FFh
	andwf	(___ftadd@f2+1),f
	movlw	0
	andwf	(___ftadd@f2+2),f
	line	106
	movf	(___ftadd@exp2),w
	subwf	(___ftadd@exp1),w
	skipnc
	goto	u3021
	goto	u3020
u3021:
	goto	l3563
u3020:
	goto	l3553
	line	109
	
l1485:	
	line	110
	
l3553:	
	movlw	01h
u3035:
	clrc
	rlf	(___ftadd@f2),f
	rlf	(___ftadd@f2+1),f
	rlf	(___ftadd@f2+2),f
	addlw	-1
	skipz
	goto	u3035
	line	111
	movlw	low(01h)
	subwf	(___ftadd@exp2),f
	line	112
	
l3555:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u3041
	goto	u3040
u3041:
	goto	l3561
u3040:
	
l3557:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3051
	goto	u3050
u3051:
	goto	l3553
u3050:
	goto	l3561
	
l1487:	
	goto	l3561
	
l1488:	
	line	113
	goto	l3561
	
l1490:	
	line	114
	
l3559:	
	movlw	01h
u3065:
	clrc
	rrf	(___ftadd@f1+2),f
	rrf	(___ftadd@f1+1),f
	rrf	(___ftadd@f1),f
	addlw	-1
	skipz
	goto	u3065

	line	115
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp1),f
	goto	l3561
	line	116
	
l1489:	
	line	113
	
l3561:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l3559
u3070:
	goto	l1492
	
l1491:	
	line	117
	goto	l1492
	
l1484:	
	
l3563:	
	movf	(___ftadd@exp1),w
	subwf	(___ftadd@exp2),w
	skipnc
	goto	u3081
	goto	u3080
u3081:
	goto	l1492
u3080:
	goto	l3565
	line	120
	
l1494:	
	line	121
	
l3565:	
	movlw	01h
u3095:
	clrc
	rlf	(___ftadd@f1),f
	rlf	(___ftadd@f1+1),f
	rlf	(___ftadd@f1+2),f
	addlw	-1
	skipz
	goto	u3095
	line	122
	movlw	low(01h)
	subwf	(___ftadd@exp1),f
	line	123
	
l3567:	
	movf	(___ftadd@exp2),w
	xorwf	(___ftadd@exp1),w
	skipnz
	goto	u3101
	goto	u3100
u3101:
	goto	l3573
u3100:
	
l3569:	
	movlw	low(01h)
	subwf	(___ftadd@sign),f
	movf	((___ftadd@sign)),w
	andlw	07h
	btfss	status,2
	goto	u3111
	goto	u3110
u3111:
	goto	l3565
u3110:
	goto	l3573
	
l1496:	
	goto	l3573
	
l1497:	
	line	124
	goto	l3573
	
l1499:	
	line	125
	
l3571:	
	movlw	01h
u3125:
	clrc
	rrf	(___ftadd@f2+2),f
	rrf	(___ftadd@f2+1),f
	rrf	(___ftadd@f2),f
	addlw	-1
	skipz
	goto	u3125

	line	126
	movlw	(01h)
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	addwf	(___ftadd@exp2),f
	goto	l3573
	line	127
	
l1498:	
	line	124
	
l3573:	
	movf	(___ftadd@exp1),w
	xorwf	(___ftadd@exp2),w
	skipz
	goto	u3131
	goto	u3130
u3131:
	goto	l3571
u3130:
	goto	l1492
	
l1500:	
	goto	l1492
	line	128
	
l1493:	
	line	129
	
l1492:	
	btfss	(___ftadd@sign),(7)&7
	goto	u3141
	goto	u3140
u3141:
	goto	l3577
u3140:
	line	131
	
l3575:	
	movlw	0FFh
	xorwf	(___ftadd@f1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+1),f
	movlw	0FFh
	xorwf	(___ftadd@f1+2),f
	line	132
	movlw	01h
	addwf	(___ftadd@f1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f1+2),f
	goto	l3577
	line	133
	
l1501:	
	line	134
	
l3577:	
	btfss	(___ftadd@sign),(6)&7
	goto	u3151
	goto	u3150
u3151:
	goto	l3581
u3150:
	line	136
	
l3579:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	137
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	goto	l3581
	line	138
	
l1502:	
	line	139
	
l3581:	
	clrf	(___ftadd@sign)
	line	140
	movf	(___ftadd@f1),w
	addwf	(___ftadd@f2),f
	movf	(___ftadd@f1+1),w
	clrz
	skipnc
	incf	(___ftadd@f1+1),w
	skipnz
	goto	u3161
	addwf	(___ftadd@f2+1),f
u3161:
	movf	(___ftadd@f1+2),w
	clrz
	skipnc
	incf	(___ftadd@f1+2),w
	skipnz
	goto	u3162
	addwf	(___ftadd@f2+2),f
u3162:

	line	141
	
l3583:	
	btfss	(___ftadd@f2+2),(23)&7
	goto	u3171
	goto	u3170
u3171:
	goto	l3589
u3170:
	line	142
	
l3585:	
	movlw	0FFh
	xorwf	(___ftadd@f2),f
	movlw	0FFh
	xorwf	(___ftadd@f2+1),f
	movlw	0FFh
	xorwf	(___ftadd@f2+2),f
	line	143
	movlw	01h
	addwf	(___ftadd@f2),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftadd@f2+2),f
	line	144
	
l3587:	
	clrf	(___ftadd@sign)
	bsf	status,0
	rlf	(___ftadd@sign),f
	goto	l3589
	line	145
	
l1503:	
	line	146
	
l3589:	
	movf	(___ftadd@f2),w
	movwf	(?___ftpack)
	movf	(___ftadd@f2+1),w
	movwf	(?___ftpack+1)
	movf	(___ftadd@f2+2),w
	movwf	(?___ftpack+2)
	movf	(___ftadd@exp1),w
	movwf	(??___ftadd+0)+0
	movf	(??___ftadd+0)+0,w
	movwf	0+(?___ftpack)+03h
	movf	(___ftadd@sign),w
	movwf	(??___ftadd+1)+0
	movf	(??___ftadd+1)+0,w
	movwf	0+(?___ftpack)+04h
	fcall	___ftpack
	movf	(0+(?___ftpack)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?___ftadd)
	movf	(1+(?___ftpack)),w
	movwf	(?___ftadd+1)
	movf	(2+(?___ftpack)),w
	movwf	(?___ftadd+2)
	goto	l1478
	
l3591:	
	line	148
	
l1478:	
	return
	opt stack 0
GLOBAL	__end_of___ftadd
	__end_of___ftadd:
;; =============== function ___ftadd ends ============

	signat	___ftadd,8315
	global	_lcd_data
psect	text435,local,class=CODE,delta=2
global __ptext435
__ptext435:

;; *************** function _lcd_data *****************
;; Defined at:
;;		line 46 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;  rec             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  rec             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_send
;;		_adc_hex
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text435
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	46
	global	__size_of_lcd_data
	__size_of_lcd_data	equ	__end_of_lcd_data-_lcd_data
	
_lcd_data:	
	opt	stack 6
; Regs used in _lcd_data: [wreg]
;lcd_data@rec stored from wreg
	movwf	(lcd_data@rec)
	line	47
	
l3515:	
;ADC with LM35 and Motor.c: 47: PORTD = rec;
	movf	(lcd_data@rec),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	48
	
l3517:	
;ADC with LM35 and Motor.c: 48: RB1 = 1;
	bsf	(49/8),(49)&7
	line	49
	
l3519:	
;ADC with LM35 and Motor.c: 49: RB2 = 1;
	bsf	(50/8),(50)&7
	line	50
;ADC with LM35 and Motor.c: 50: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_lcd_data+0)+0+1),f
	movlw	238
movwf	((??_lcd_data+0)+0),f
u3497:
	decfsz	((??_lcd_data+0)+0),f
	goto	u3497
	decfsz	((??_lcd_data+0)+0+1),f
	goto	u3497
	clrwdt
opt asmopt_on

	line	51
	
l3521:	
;ADC with LM35 and Motor.c: 51: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	52
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_data
	__end_of_lcd_data:
;; =============== function _lcd_data ends ============

	signat	_lcd_data,4216
	global	_command
psect	text436,local,class=CODE,delta=2
global __ptext436
__ptext436:

;; *************** function _command *****************
;; Defined at:
;;		line 37 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;  com             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  com             1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_lcd_init
;;		_main
;; This function uses a non-reentrant model
;;
psect	text436
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	37
	global	__size_of_command
	__size_of_command	equ	__end_of_command-_command
	
_command:	
	opt	stack 7
; Regs used in _command: [wreg]
;command@com stored from wreg
	movwf	(command@com)
	line	38
	
l3507:	
;ADC with LM35 and Motor.c: 38: PORTD = com;
	movf	(command@com),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	39
	
l3509:	
;ADC with LM35 and Motor.c: 39: RB1 = 0;
	bcf	(49/8),(49)&7
	line	40
	
l3511:	
;ADC with LM35 and Motor.c: 40: RB2 = 1;
	bsf	(50/8),(50)&7
	line	41
;ADC with LM35 and Motor.c: 41: _delay((unsigned long)((10)*(20e6/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_command+0)+0+1),f
	movlw	238
movwf	((??_command+0)+0),f
u3507:
	decfsz	((??_command+0)+0),f
	goto	u3507
	decfsz	((??_command+0)+0+1),f
	goto	u3507
	clrwdt
opt asmopt_on

	line	42
	
l3513:	
;ADC with LM35 and Motor.c: 42: RB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(50/8),(50)&7
	line	43
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_command
	__end_of_command:
;; =============== function _command ends ============

	signat	_command,4216
	global	___awmod
psect	text437,local,class=CODE,delta=2
global __ptext437
__ptext437:

;; *************** function ___awmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text437
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awmod.c"
	line	5
	global	__size_of___awmod
	__size_of___awmod	equ	__end_of___awmod-___awmod
	
___awmod:	
	opt	stack 6
; Regs used in ___awmod: [wreg+status,2+status,0]
	line	8
	
l3431:	
	clrf	(___awmod@sign)
	line	9
	btfss	(___awmod@dividend+1),7
	goto	u2791
	goto	u2790
u2791:
	goto	l3435
u2790:
	line	10
	
l3433:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	line	11
	clrf	(___awmod@sign)
	bsf	status,0
	rlf	(___awmod@sign),f
	goto	l3435
	line	12
	
l1639:	
	line	13
	
l3435:	
	btfss	(___awmod@divisor+1),7
	goto	u2801
	goto	u2800
u2801:
	goto	l3439
u2800:
	line	14
	
l3437:	
	comf	(___awmod@divisor),f
	comf	(___awmod@divisor+1),f
	incf	(___awmod@divisor),f
	skipnz
	incf	(___awmod@divisor+1),f
	goto	l3439
	
l1640:	
	line	15
	
l3439:	
	movf	(___awmod@divisor+1),w
	iorwf	(___awmod@divisor),w
	skipnz
	goto	u2811
	goto	u2810
u2811:
	goto	l3457
u2810:
	line	16
	
l3441:	
	clrf	(___awmod@counter)
	bsf	status,0
	rlf	(___awmod@counter),f
	line	17
	goto	l3447
	
l1643:	
	line	18
	
l3443:	
	movlw	01h
	
u2825:
	clrc
	rlf	(___awmod@divisor),f
	rlf	(___awmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2825
	line	19
	
l3445:	
	movlw	(01h)
	movwf	(??___awmod+0)+0
	movf	(??___awmod+0)+0,w
	addwf	(___awmod@counter),f
	goto	l3447
	line	20
	
l1642:	
	line	17
	
l3447:	
	btfss	(___awmod@divisor+1),(15)&7
	goto	u2831
	goto	u2830
u2831:
	goto	l3443
u2830:
	goto	l3449
	
l1644:	
	goto	l3449
	line	21
	
l1645:	
	line	22
	
l3449:	
	movf	(___awmod@divisor+1),w
	subwf	(___awmod@dividend+1),w
	skipz
	goto	u2845
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),w
u2845:
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l3453
u2840:
	line	23
	
l3451:	
	movf	(___awmod@divisor),w
	subwf	(___awmod@dividend),f
	movf	(___awmod@divisor+1),w
	skipc
	decf	(___awmod@dividend+1),f
	subwf	(___awmod@dividend+1),f
	goto	l3453
	
l1646:	
	line	24
	
l3453:	
	movlw	01h
	
u2855:
	clrc
	rrf	(___awmod@divisor+1),f
	rrf	(___awmod@divisor),f
	addlw	-1
	skipz
	goto	u2855
	line	25
	
l3455:	
	movlw	low(01h)
	subwf	(___awmod@counter),f
	btfss	status,2
	goto	u2861
	goto	u2860
u2861:
	goto	l3449
u2860:
	goto	l3457
	
l1647:	
	goto	l3457
	line	26
	
l1641:	
	line	27
	
l3457:	
	movf	(___awmod@sign),w
	skipz
	goto	u2870
	goto	l3461
u2870:
	line	28
	
l3459:	
	comf	(___awmod@dividend),f
	comf	(___awmod@dividend+1),f
	incf	(___awmod@dividend),f
	skipnz
	incf	(___awmod@dividend+1),f
	goto	l3461
	
l1648:	
	line	29
	
l3461:	
	movf	(___awmod@dividend+1),w
	clrf	(?___awmod+1)
	addwf	(?___awmod+1)
	movf	(___awmod@dividend),w
	clrf	(?___awmod)
	addwf	(?___awmod)

	goto	l1649
	
l3463:	
	line	30
	
l1649:	
	return
	opt stack 0
GLOBAL	__end_of___awmod
	__end_of___awmod:
;; =============== function ___awmod ends ============

	signat	___awmod,8314
	global	___ftge
psect	text438,local,class=CODE,delta=2
global __ptext438
__ptext438:

;; *************** function ___ftge *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
;; Parameters:    Size  Location     Type
;;  ff1             3    0[COMMON] float 
;;  ff2             3    3[COMMON] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         6       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          6       0       0       0       0
;;      Totals:        12       0       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text438
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftge.c"
	line	5
	global	__size_of___ftge
	__size_of___ftge	equ	__end_of___ftge-___ftge
	
___ftge:	
	opt	stack 7
; Regs used in ___ftge: [wreg+status,2+status,0]
	line	6
	
l3411:	
	btfss	(___ftge@ff1+2),(23)&7
	goto	u2741
	goto	u2740
u2741:
	goto	l3415
u2740:
	line	7
	
l3413:	
	movlw	0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff1),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff1+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff1+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u2751
	goto	u2752
u2751:
	addwf	(??___ftge+0)+1,f
	
u2752:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2753
	goto	u2754
u2753:
	addwf	(??___ftge+0)+2,f
	
u2754:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff1)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff1+2)
	goto	l3415
	
l1598:	
	line	8
	
l3415:	
	btfss	(___ftge@ff2+2),(23)&7
	goto	u2761
	goto	u2760
u2761:
	goto	l3419
u2760:
	line	9
	
l3417:	
	movlw	0
	movwf	((??___ftge+0)+0)
	movlw	0
	movwf	((??___ftge+0)+0+1)
	movlw	080h
	movwf	((??___ftge+0)+0+2)
	comf	(___ftge@ff2),w
	movwf	(??___ftge+3)+0
	comf	(___ftge@ff2+1),w
	movwf	((??___ftge+3)+0+1)
	comf	(___ftge@ff2+2),w
	movwf	((??___ftge+3)+0+2)
	incf	(??___ftge+3)+0,f
	skipnz
	incf	((??___ftge+3)+0+1),f
	skipnz
	incf	((??___ftge+3)+0+2),f
	movf	0+(??___ftge+3)+0,w
	addwf	(??___ftge+0)+0,f
	movf	1+(??___ftge+3)+0,w
	skipnc
	incfsz	1+(??___ftge+3)+0,w
	goto	u2771
	goto	u2772
u2771:
	addwf	(??___ftge+0)+1,f
	
u2772:
	movf	2+(??___ftge+3)+0,w
	skipnc
	incfsz	2+(??___ftge+3)+0,w
	goto	u2773
	goto	u2774
u2773:
	addwf	(??___ftge+0)+2,f
	
u2774:
	movf	0+(??___ftge+0)+0,w
	movwf	(___ftge@ff2)
	movf	1+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+1)
	movf	2+(??___ftge+0)+0,w
	movwf	(___ftge@ff2+2)
	goto	l3419
	
l1599:	
	line	10
	
l3419:	
	movlw	080h
	xorwf	(___ftge@ff1+2),f
	line	11
	
l3421:	
	movlw	080h
	xorwf	(___ftge@ff2+2),f
	line	12
	
l3423:	
	movf	(___ftge@ff2+2),w
	subwf	(___ftge@ff1+2),w
	skipz
	goto	u2785
	movf	(___ftge@ff2+1),w
	subwf	(___ftge@ff1+1),w
	skipz
	goto	u2785
	movf	(___ftge@ff2),w
	subwf	(___ftge@ff1),w
u2785:
	skipnc
	goto	u2781
	goto	u2780
u2781:
	goto	l3427
u2780:
	
l3425:	
	clrc
	
	goto	l1600
	
l3217:	
	
l3427:	
	setc
	
	goto	l1600
	
l3219:	
	goto	l1600
	
l3429:	
	line	13
	
l1600:	
	return
	opt stack 0
GLOBAL	__end_of___ftge
	__end_of___ftge:
;; =============== function ___ftge ends ============

	signat	___ftge,8312
	global	___ftneg
psect	text439,local,class=CODE,delta=2
global __ptext439
__ptext439:

;; *************** function ___ftneg *****************
;; Defined at:
;;		line 16 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    8[COMMON] float 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text439
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\ftneg.c"
	line	16
	global	__size_of___ftneg
	__size_of___ftneg	equ	__end_of___ftneg-___ftneg
	
___ftneg:	
	opt	stack 6
; Regs used in ___ftneg: [wreg]
	line	17
	
l3403:	
	movf	(___ftneg@f1+2),w
	iorwf	(___ftneg@f1+1),w
	iorwf	(___ftneg@f1),w
	skipnz
	goto	u2731
	goto	u2730
u2731:
	goto	l3407
u2730:
	line	18
	
l3405:	
	movlw	080h
	xorwf	(___ftneg@f1+2),f
	goto	l3407
	
l1594:	
	line	19
	
l3407:	
	goto	l1595
	
l3409:	
	line	20
	
l1595:	
	return
	opt stack 0
GLOBAL	__end_of___ftneg
	__end_of___ftneg:
;; =============== function ___ftneg ends ============

	signat	___ftneg,4219
	global	___awdiv
psect	text440,local,class=CODE,delta=2
global __ptext440
__ptext440:

;; *************** function ___awdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] int 
;;  dividend        2    2[COMMON] int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    7[COMMON] int 
;;  sign            1    6[COMMON] unsigned char 
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         9       0       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text440
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\awdiv.c"
	line	5
	global	__size_of___awdiv
	__size_of___awdiv	equ	__end_of___awdiv-___awdiv
	
___awdiv:	
	opt	stack 6
; Regs used in ___awdiv: [wreg+status,2+status,0]
	line	9
	
l3363:	
	clrf	(___awdiv@sign)
	line	10
	btfss	(___awdiv@divisor+1),7
	goto	u2631
	goto	u2630
u2631:
	goto	l3367
u2630:
	line	11
	
l3365:	
	comf	(___awdiv@divisor),f
	comf	(___awdiv@divisor+1),f
	incf	(___awdiv@divisor),f
	skipnz
	incf	(___awdiv@divisor+1),f
	line	12
	clrf	(___awdiv@sign)
	bsf	status,0
	rlf	(___awdiv@sign),f
	goto	l3367
	line	13
	
l1571:	
	line	14
	
l3367:	
	btfss	(___awdiv@dividend+1),7
	goto	u2641
	goto	u2640
u2641:
	goto	l3373
u2640:
	line	15
	
l3369:	
	comf	(___awdiv@dividend),f
	comf	(___awdiv@dividend+1),f
	incf	(___awdiv@dividend),f
	skipnz
	incf	(___awdiv@dividend+1),f
	line	16
	
l3371:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	xorwf	(___awdiv@sign),f
	goto	l3373
	line	17
	
l1572:	
	line	18
	
l3373:	
	clrf	(___awdiv@quotient)
	clrf	(___awdiv@quotient+1)
	line	19
	
l3375:	
	movf	(___awdiv@divisor+1),w
	iorwf	(___awdiv@divisor),w
	skipnz
	goto	u2651
	goto	u2650
u2651:
	goto	l3395
u2650:
	line	20
	
l3377:	
	clrf	(___awdiv@counter)
	bsf	status,0
	rlf	(___awdiv@counter),f
	line	21
	goto	l3383
	
l1575:	
	line	22
	
l3379:	
	movlw	01h
	
u2665:
	clrc
	rlf	(___awdiv@divisor),f
	rlf	(___awdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2665
	line	23
	
l3381:	
	movlw	(01h)
	movwf	(??___awdiv+0)+0
	movf	(??___awdiv+0)+0,w
	addwf	(___awdiv@counter),f
	goto	l3383
	line	24
	
l1574:	
	line	21
	
l3383:	
	btfss	(___awdiv@divisor+1),(15)&7
	goto	u2671
	goto	u2670
u2671:
	goto	l3379
u2670:
	goto	l3385
	
l1576:	
	goto	l3385
	line	25
	
l1577:	
	line	26
	
l3385:	
	movlw	01h
	
u2685:
	clrc
	rlf	(___awdiv@quotient),f
	rlf	(___awdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2685
	line	27
	movf	(___awdiv@divisor+1),w
	subwf	(___awdiv@dividend+1),w
	skipz
	goto	u2695
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),w
u2695:
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l3391
u2690:
	line	28
	
l3387:	
	movf	(___awdiv@divisor),w
	subwf	(___awdiv@dividend),f
	movf	(___awdiv@divisor+1),w
	skipc
	decf	(___awdiv@dividend+1),f
	subwf	(___awdiv@dividend+1),f
	line	29
	
l3389:	
	bsf	(___awdiv@quotient)+(0/8),(0)&7
	goto	l3391
	line	30
	
l1578:	
	line	31
	
l3391:	
	movlw	01h
	
u2705:
	clrc
	rrf	(___awdiv@divisor+1),f
	rrf	(___awdiv@divisor),f
	addlw	-1
	skipz
	goto	u2705
	line	32
	
l3393:	
	movlw	low(01h)
	subwf	(___awdiv@counter),f
	btfss	status,2
	goto	u2711
	goto	u2710
u2711:
	goto	l3385
u2710:
	goto	l3395
	
l1579:	
	goto	l3395
	line	33
	
l1573:	
	line	34
	
l3395:	
	movf	(___awdiv@sign),w
	skipz
	goto	u2720
	goto	l3399
u2720:
	line	35
	
l3397:	
	comf	(___awdiv@quotient),f
	comf	(___awdiv@quotient+1),f
	incf	(___awdiv@quotient),f
	skipnz
	incf	(___awdiv@quotient+1),f
	goto	l3399
	
l1580:	
	line	36
	
l3399:	
	movf	(___awdiv@quotient+1),w
	clrf	(?___awdiv+1)
	addwf	(?___awdiv+1)
	movf	(___awdiv@quotient),w
	clrf	(?___awdiv)
	addwf	(?___awdiv)

	goto	l1581
	
l3401:	
	line	37
	
l1581:	
	return
	opt stack 0
GLOBAL	__end_of___awdiv
	__end_of___awdiv:
;; =============== function ___awdiv ends ============

	signat	___awdiv,8314
	global	___fttol
psect	text441,local,class=CODE,delta=2
global __ptext441
__ptext441:

;; *************** function ___fttol *****************
;; Defined at:
;;		line 45 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
;; Parameters:    Size  Location     Type
;;  f1              3    8[COMMON] float 
;; Auto vars:     Size  Location     Type
;;  lval            4    5[BANK0 ] unsigned long 
;;  exp1            1    9[BANK0 ] unsigned char 
;;  sign1           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  4    8[COMMON] long 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_temperature
;; This function uses a non-reentrant model
;;
psect	text441
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\fttol.c"
	line	45
	global	__size_of___fttol
	__size_of___fttol	equ	__end_of___fttol-___fttol
	
___fttol:	
	opt	stack 6
; Regs used in ___fttol: [wreg+status,2+status,0]
	line	49
	
l3307:	
	movf	(___fttol@f1),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	clrc
	rlf	(??___fttol+0)+1,w
	rlf	(??___fttol+0)+2,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@exp1)
	movf	((___fttol@exp1)),f
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l3313
u2520:
	line	50
	
l3309:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1541
	
l3311:	
	goto	l1541
	
l1540:	
	line	51
	
l3313:	
	movf	(___fttol@f1),w
	movwf	((??___fttol+0)+0)
	movf	(___fttol@f1+1),w
	movwf	((??___fttol+0)+0+1)
	movf	(___fttol@f1+2),w
	movwf	((??___fttol+0)+0+2)
	movlw	017h
u2535:
	clrc
	rrf	(??___fttol+0)+2,f
	rrf	(??___fttol+0)+1,f
	rrf	(??___fttol+0)+0,f
u2530:
	addlw	-1
	skipz
	goto	u2535
	movf	0+(??___fttol+0)+0,w
	movwf	(??___fttol+3)+0
	movf	(??___fttol+3)+0,w
	movwf	(___fttol@sign1)
	line	52
	
l3315:	
	bsf	(___fttol@f1)+(15/8),(15)&7
	line	53
	
l3317:	
	movlw	0FFh
	andwf	(___fttol@f1),f
	movlw	0FFh
	andwf	(___fttol@f1+1),f
	movlw	0
	andwf	(___fttol@f1+2),f
	line	54
	
l3319:	
	movf	(___fttol@f1),w
	movwf	(___fttol@lval)
	movf	(___fttol@f1+1),w
	movwf	((___fttol@lval))+1
	movf	(___fttol@f1+2),w
	movwf	((___fttol@lval))+2
	clrf	((___fttol@lval))+3
	line	55
	
l3321:	
	movlw	low(08Eh)
	subwf	(___fttol@exp1),f
	line	56
	
l3323:	
	btfss	(___fttol@exp1),7
	goto	u2541
	goto	u2540
u2541:
	goto	l3333
u2540:
	line	57
	
l3325:	
	movf	(___fttol@exp1),w
	xorlw	80h
	addlw	-((-15)^80h)
	skipnc
	goto	u2551
	goto	u2550
u2551:
	goto	l3331
u2550:
	line	58
	
l3327:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1541
	
l3329:	
	goto	l1541
	
l1543:	
	goto	l3331
	line	59
	
l1544:	
	line	60
	
l3331:	
	movlw	01h
u2565:
	clrc
	rrf	(___fttol@lval+3),f
	rrf	(___fttol@lval+2),f
	rrf	(___fttol@lval+1),f
	rrf	(___fttol@lval),f
	addlw	-1
	skipz
	goto	u2565

	line	61
	movlw	(01h)
	movwf	(??___fttol+0)+0
	movf	(??___fttol+0)+0,w
	addwf	(___fttol@exp1),f
	btfss	status,2
	goto	u2571
	goto	u2570
u2571:
	goto	l3331
u2570:
	goto	l3343
	
l1545:	
	line	62
	goto	l3343
	
l1542:	
	line	63
	
l3333:	
	movlw	(018h)
	subwf	(___fttol@exp1),w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l3341
u2580:
	line	64
	
l3335:	
	movlw	0
	movwf	(?___fttol+3)
	movlw	0
	movwf	(?___fttol+2)
	movlw	0
	movwf	(?___fttol+1)
	movlw	0
	movwf	(?___fttol)

	goto	l1541
	
l3337:	
	goto	l1541
	
l1547:	
	line	65
	goto	l3341
	
l1549:	
	line	66
	
l3339:	
	movlw	01h
	movwf	(??___fttol+0)+0
u2595:
	clrc
	rlf	(___fttol@lval),f
	rlf	(___fttol@lval+1),f
	rlf	(___fttol@lval+2),f
	rlf	(___fttol@lval+3),f
	decfsz	(??___fttol+0)+0
	goto	u2595
	line	67
	movlw	low(01h)
	subwf	(___fttol@exp1),f
	goto	l3341
	line	68
	
l1548:	
	line	65
	
l3341:	
	movf	(___fttol@exp1),f
	skipz
	goto	u2601
	goto	u2600
u2601:
	goto	l3339
u2600:
	goto	l3343
	
l1550:	
	goto	l3343
	line	69
	
l1546:	
	line	70
	
l3343:	
	movf	(___fttol@sign1),w
	skipz
	goto	u2610
	goto	l3347
u2610:
	line	71
	
l3345:	
	comf	(___fttol@lval),f
	comf	(___fttol@lval+1),f
	comf	(___fttol@lval+2),f
	comf	(___fttol@lval+3),f
	incf	(___fttol@lval),f
	skipnz
	incf	(___fttol@lval+1),f
	skipnz
	incf	(___fttol@lval+2),f
	skipnz
	incf	(___fttol@lval+3),f
	goto	l3347
	
l1551:	
	line	72
	
l3347:	
	movf	(___fttol@lval+3),w
	movwf	(?___fttol+3)
	movf	(___fttol@lval+2),w
	movwf	(?___fttol+2)
	movf	(___fttol@lval+1),w
	movwf	(?___fttol+1)
	movf	(___fttol@lval),w
	movwf	(?___fttol)

	goto	l1541
	
l3349:	
	line	73
	
l1541:	
	return
	opt stack 0
GLOBAL	__end_of___fttol
	__end_of___fttol:
;; =============== function ___fttol ends ============

	signat	___fttol,4220
	global	___ftpack
psect	text442,local,class=CODE,delta=2
global __ptext442
__ptext442:

;; *************** function ___ftpack *****************
;; Defined at:
;;		line 63 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
;; Parameters:    Size  Location     Type
;;  arg             3    0[COMMON] unsigned um
;;  exp             1    3[COMMON] unsigned char 
;;  sign            1    4[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  3    0[COMMON] float 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         5       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		___ftadd
;;		___ftdiv
;;		___ftmul
;;		___awtoft
;;		___lwtoft
;;		___lbtoft
;;		___abtoft
;;		___altoft
;;		___lltoft
;;		___attoft
;;		___lttoft
;; This function uses a non-reentrant model
;;
psect	text442
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\float.c"
	line	63
	global	__size_of___ftpack
	__size_of___ftpack	equ	__end_of___ftpack-___ftpack
	
___ftpack:	
	opt	stack 5
; Regs used in ___ftpack: [wreg+status,2+status,0]
	line	64
	
l3271:	
	movf	(___ftpack@exp),w
	skipz
	goto	u2410
	goto	l3275
u2410:
	
l3273:	
	movf	(___ftpack@arg+2),w
	iorwf	(___ftpack@arg+1),w
	iorwf	(___ftpack@arg),w
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l3281
u2420:
	goto	l3275
	
l1765:	
	line	65
	
l3275:	
	movlw	0x0
	movwf	(?___ftpack)
	movlw	0x0
	movwf	(?___ftpack+1)
	movlw	0x0
	movwf	(?___ftpack+2)
	goto	l1766
	
l3277:	
	goto	l1766
	
l1763:	
	line	66
	goto	l3281
	
l1768:	
	line	67
	
l3279:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	68
	movlw	01h
u2435:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2435

	goto	l3281
	line	69
	
l1767:	
	line	66
	
l3281:	
	movlw	low highword(0FE0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2441
	goto	u2440
u2441:
	goto	l3279
u2440:
	goto	l1770
	
l1769:	
	line	70
	goto	l1770
	
l1771:	
	line	71
	
l3283:	
	movlw	(01h)
	movwf	(??___ftpack+0)+0
	movf	(??___ftpack+0)+0,w
	addwf	(___ftpack@exp),f
	line	72
	
l3285:	
	movlw	01h
	addwf	(___ftpack@arg),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+1),f
	movlw	0
	skipnc
movlw 1
	addwf	(___ftpack@arg+2),f
	line	73
	
l3287:	
	movlw	01h
u2455:
	clrc
	rrf	(___ftpack@arg+2),f
	rrf	(___ftpack@arg+1),f
	rrf	(___ftpack@arg),f
	addlw	-1
	skipz
	goto	u2455

	line	74
	
l1770:	
	line	70
	movlw	low highword(0FF0000h)
	andwf	(___ftpack@arg+2),w
	btfss	status,2
	goto	u2461
	goto	u2460
u2461:
	goto	l3283
u2460:
	goto	l3291
	
l1772:	
	line	75
	goto	l3291
	
l1774:	
	line	76
	
l3289:	
	movlw	low(01h)
	subwf	(___ftpack@exp),f
	line	77
	movlw	01h
u2475:
	clrc
	rlf	(___ftpack@arg),f
	rlf	(___ftpack@arg+1),f
	rlf	(___ftpack@arg+2),f
	addlw	-1
	skipz
	goto	u2475
	goto	l3291
	line	78
	
l1773:	
	line	75
	
l3291:	
	btfss	(___ftpack@arg+1),(15)&7
	goto	u2481
	goto	u2480
u2481:
	goto	l3289
u2480:
	
l1775:	
	line	79
	btfsc	(___ftpack@exp),(0)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l1776
u2490:
	line	80
	
l3293:	
	movlw	0FFh
	andwf	(___ftpack@arg),f
	movlw	07Fh
	andwf	(___ftpack@arg+1),f
	movlw	0FFh
	andwf	(___ftpack@arg+2),f
	
l1776:	
	line	81
	clrc
	rrf	(___ftpack@exp),f

	line	82
	
l3295:	
	movf	(___ftpack@exp),w
	movwf	((??___ftpack+0)+0)
	clrf	((??___ftpack+0)+0+1)
	clrf	((??___ftpack+0)+0+2)
	movlw	010h
u2505:
	clrc
	rlf	(??___ftpack+0)+0,f
	rlf	(??___ftpack+0)+1,f
	rlf	(??___ftpack+0)+2,f
u2500:
	addlw	-1
	skipz
	goto	u2505
	movf	0+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg),f
	movf	1+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+1),f
	movf	2+(??___ftpack+0)+0,w
	iorwf	(___ftpack@arg+2),f
	line	83
	
l3297:	
	movf	(___ftpack@sign),w
	skipz
	goto	u2510
	goto	l1777
u2510:
	line	84
	
l3299:	
	bsf	(___ftpack@arg)+(23/8),(23)&7
	
l1777:	
	line	85
	line	86
	
l1766:	
	return
	opt stack 0
GLOBAL	__end_of___ftpack
	__end_of___ftpack:
;; =============== function ___ftpack ends ============

	signat	___ftpack,12411
	global	___lwmod
psect	text443,local,class=CODE,delta=2
global __ptext443
__ptext443:

;; *************** function ___lwmod *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  counter         1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_hex
;; This function uses a non-reentrant model
;;
psect	text443
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwmod.c"
	line	5
	global	__size_of___lwmod
	__size_of___lwmod	equ	__end_of___lwmod-___lwmod
	
___lwmod:	
	opt	stack 6
; Regs used in ___lwmod: [wreg+status,2+status,0]
	line	8
	
l3249:	
	movf	(___lwmod@divisor+1),w
	iorwf	(___lwmod@divisor),w
	skipnz
	goto	u2351
	goto	u2350
u2351:
	goto	l3267
u2350:
	line	9
	
l3251:	
	clrf	(___lwmod@counter)
	bsf	status,0
	rlf	(___lwmod@counter),f
	line	10
	goto	l3257
	
l1449:	
	line	11
	
l3253:	
	movlw	01h
	
u2365:
	clrc
	rlf	(___lwmod@divisor),f
	rlf	(___lwmod@divisor+1),f
	addlw	-1
	skipz
	goto	u2365
	line	12
	
l3255:	
	movlw	(01h)
	movwf	(??___lwmod+0)+0
	movf	(??___lwmod+0)+0,w
	addwf	(___lwmod@counter),f
	goto	l3257
	line	13
	
l1448:	
	line	10
	
l3257:	
	btfss	(___lwmod@divisor+1),(15)&7
	goto	u2371
	goto	u2370
u2371:
	goto	l3253
u2370:
	goto	l3259
	
l1450:	
	goto	l3259
	line	14
	
l1451:	
	line	15
	
l3259:	
	movf	(___lwmod@divisor+1),w
	subwf	(___lwmod@dividend+1),w
	skipz
	goto	u2385
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),w
u2385:
	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l3263
u2380:
	line	16
	
l3261:	
	movf	(___lwmod@divisor),w
	subwf	(___lwmod@dividend),f
	movf	(___lwmod@divisor+1),w
	skipc
	decf	(___lwmod@dividend+1),f
	subwf	(___lwmod@dividend+1),f
	goto	l3263
	
l1452:	
	line	17
	
l3263:	
	movlw	01h
	
u2395:
	clrc
	rrf	(___lwmod@divisor+1),f
	rrf	(___lwmod@divisor),f
	addlw	-1
	skipz
	goto	u2395
	line	18
	
l3265:	
	movlw	low(01h)
	subwf	(___lwmod@counter),f
	btfss	status,2
	goto	u2401
	goto	u2400
u2401:
	goto	l3259
u2400:
	goto	l3267
	
l1453:	
	goto	l3267
	line	19
	
l1447:	
	line	20
	
l3267:	
	movf	(___lwmod@dividend+1),w
	clrf	(?___lwmod+1)
	addwf	(?___lwmod+1)
	movf	(___lwmod@dividend),w
	clrf	(?___lwmod)
	addwf	(?___lwmod)

	goto	l1454
	
l3269:	
	line	21
	
l1454:	
	return
	opt stack 0
GLOBAL	__end_of___lwmod
	__end_of___lwmod:
;; =============== function ___lwmod ends ============

	signat	___lwmod,8314
	global	___lwdiv
psect	text444,local,class=CODE,delta=2
global __ptext444
__ptext444:

;; *************** function ___lwdiv *****************
;; Defined at:
;;		line 5 in file "C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
;; Parameters:    Size  Location     Type
;;  divisor         2    0[COMMON] unsigned int 
;;  dividend        2    2[COMMON] unsigned int 
;; Auto vars:     Size  Location     Type
;;  quotient        2    5[COMMON] unsigned int 
;;  counter         1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         3       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_adc_hex
;; This function uses a non-reentrant model
;;
psect	text444
	file	"C:\Program Files (x86)\HI-TECH Software\PICC\9.82\sources\lwdiv.c"
	line	5
	global	__size_of___lwdiv
	__size_of___lwdiv	equ	__end_of___lwdiv-___lwdiv
	
___lwdiv:	
	opt	stack 6
; Regs used in ___lwdiv: [wreg+status,2+status,0]
	line	9
	
l3223:	
	clrf	(___lwdiv@quotient)
	clrf	(___lwdiv@quotient+1)
	line	10
	
l3225:	
	movf	(___lwdiv@divisor+1),w
	iorwf	(___lwdiv@divisor),w
	skipnz
	goto	u2281
	goto	u2280
u2281:
	goto	l3245
u2280:
	line	11
	
l3227:	
	clrf	(___lwdiv@counter)
	bsf	status,0
	rlf	(___lwdiv@counter),f
	line	12
	goto	l3233
	
l1439:	
	line	13
	
l3229:	
	movlw	01h
	
u2295:
	clrc
	rlf	(___lwdiv@divisor),f
	rlf	(___lwdiv@divisor+1),f
	addlw	-1
	skipz
	goto	u2295
	line	14
	
l3231:	
	movlw	(01h)
	movwf	(??___lwdiv+0)+0
	movf	(??___lwdiv+0)+0,w
	addwf	(___lwdiv@counter),f
	goto	l3233
	line	15
	
l1438:	
	line	12
	
l3233:	
	btfss	(___lwdiv@divisor+1),(15)&7
	goto	u2301
	goto	u2300
u2301:
	goto	l3229
u2300:
	goto	l3235
	
l1440:	
	goto	l3235
	line	16
	
l1441:	
	line	17
	
l3235:	
	movlw	01h
	
u2315:
	clrc
	rlf	(___lwdiv@quotient),f
	rlf	(___lwdiv@quotient+1),f
	addlw	-1
	skipz
	goto	u2315
	line	18
	movf	(___lwdiv@divisor+1),w
	subwf	(___lwdiv@dividend+1),w
	skipz
	goto	u2325
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),w
u2325:
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l3241
u2320:
	line	19
	
l3237:	
	movf	(___lwdiv@divisor),w
	subwf	(___lwdiv@dividend),f
	movf	(___lwdiv@divisor+1),w
	skipc
	decf	(___lwdiv@dividend+1),f
	subwf	(___lwdiv@dividend+1),f
	line	20
	
l3239:	
	bsf	(___lwdiv@quotient)+(0/8),(0)&7
	goto	l3241
	line	21
	
l1442:	
	line	22
	
l3241:	
	movlw	01h
	
u2335:
	clrc
	rrf	(___lwdiv@divisor+1),f
	rrf	(___lwdiv@divisor),f
	addlw	-1
	skipz
	goto	u2335
	line	23
	
l3243:	
	movlw	low(01h)
	subwf	(___lwdiv@counter),f
	btfss	status,2
	goto	u2341
	goto	u2340
u2341:
	goto	l3235
u2340:
	goto	l3245
	
l1443:	
	goto	l3245
	line	24
	
l1437:	
	line	25
	
l3245:	
	movf	(___lwdiv@quotient+1),w
	clrf	(?___lwdiv+1)
	addwf	(?___lwdiv+1)
	movf	(___lwdiv@quotient),w
	clrf	(?___lwdiv)
	addwf	(?___lwdiv)

	goto	l1444
	
l3247:	
	line	26
	
l1444:	
	return
	opt stack 0
GLOBAL	__end_of___lwdiv
	__end_of___lwdiv:
;; =============== function ___lwdiv ends ============

	signat	___lwdiv,8314
	global	_adc_init
psect	text445,local,class=CODE,delta=2
global __ptext445
__ptext445:

;; *************** function _adc_init *****************
;; Defined at:
;;		line 64 in file "C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text445
	file	"C:\Users\Mugi\Desktop\Mugi storage\Program files\Mp Lab Programs\ADC with LM35 and Motor\ADC with LM35 and Motor.c"
	line	64
	global	__size_of_adc_init
	__size_of_adc_init	equ	__end_of_adc_init-_adc_init
	
_adc_init:	
	opt	stack 7
; Regs used in _adc_init: [wreg]
	line	65
	
l3221:	
;ADC with LM35 and Motor.c: 65: ADCON1 = 0x80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(159)^080h	;volatile
	line	66
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_adc_init
	__end_of_adc_init:
;; =============== function _adc_init ends ============

	signat	_adc_init,88
psect	text446,local,class=CODE,delta=2
global __ptext446
__ptext446:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
