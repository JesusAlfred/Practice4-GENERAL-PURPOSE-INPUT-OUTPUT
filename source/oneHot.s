.data
p2PDOR: .long 0x400FF0C0
p2PBOR: .long 0x400FF040

red: .long 0xFFFBFFFF
blue: .long 0xFFFFFFFD
green: .long 0xFFF7FFFF

offr: .long 0x40000
offg: .long 0x80000
offb: .long 0x2

buttonbit: .long 0x10

max: .long 0x2DC6C0
//max: .long 0x3
.text
.global OneHot
//.type OneHot function

OneHot:

MOV r7, #0


inicio:
//Delay cuenta de 0x7270E0 a 0
LDR r1, =max
LDR r1, [r1]
delay:
SUB r1, r1, #1
LDR r0, =p2PDOR
LDR r0, [r0]
LDR r6, [r0]
LDR r2, =buttonbit
LDR r2, [r2]

AND r6, r6, r2
CMP r6, r2
BEQ Jhonson

CMP r1, #0
BNE delay

ADD r7, #1

LDR r0, =p2PDOR
LDR r0, [r0]
LDR r6, [r0]
LDR r2, =offb
LDR r2, [r2]
ORR r6, r6, r2
STR r6, [r0]

LDR r1, =p2PBOR
LDR r1, [r1]
LDR r6, [r1]
LDR r2, =offr
LDR r2, [r2]
ORR r6, r6, r2
LDR r2, =offg
LDR r2, [r2]
ORR r6, r6, r2
STR r6, [r1]

CMP r7, #1
BEQ estado1
CMP r7, #2
BEQ estado2
CMP r7, #3
BEQ estado3
CMP r7, #4
MOV r7, #0
BEQ estado4

estado1:
LDR r2, [r1]
LDR r3, =red
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]//enciende rojo		1000
B inicio
estado2:
LDR r2, [r1]

LDR r3, =green
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende verde		0100
B inicio
estado3:
LDR r2, [r0]

LDR r3, =blue
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r0]		//enciende azul 	0010
B inicio
estado4:
LDR r2, [r0]

LDR r3, =blue
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r0]


LDR r2, [r1]

LDR r3, =green
LDR r3, [r3]

AND r2, r2, r3

LDR r3, =red
LDR r3, [r3]

AND r2, r2, r3

STR r2, [r1]
B inicio
