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

.text
.global Bounce
//.type Bounce function

Bounce:


MOV r7, #3
MOV r0, #1

inicio3:
//Delay cuenta de 0x7270E0 a 0
LDR r1, =max
LDR r1, [r1]

delay:
SUB r1, r1, #1
LDR r4, =p2PDOR
LDR r4, [r4]
LDR r6, [r4]
LDR r5, =buttonbit
LDR r5, [r5]

AND r6, r6, r5
CMP r6, r5
BEQ OneHot

CMP r1, #0
BNE delay

/*//Apagar todos los leds
LDR r1, =p2PBOR
LDR r1, [r1]
STR r6, [r1]
LDR r1, =p2PDOR
LDR r1, [r1]
STR r6, [r1]
*/
LDR r4, =p2PDOR
LDR r4, [r4]
LDR r5, [r4]
LDR r6, =offb
LDR r6, [r6]
ORR r5, r5, r6
STR r5, [r4]

LDR r4, =p2PBOR
LDR r4, [r4]
LDR r5, [r4]
LDR r6, =offr
LDR r6, [r6]
ORR r5, r5, r6
LDR r6, =offg
LDR r6, [r6]
ORR r5, r5, r6
STR r5, [r4]


ADD r7, r0

CMP r7, #1
BEQ estado1
CMP r7, #2
BEQ estado2
CMP r7, #3
BEQ estado3
CMP r7, #4
BEQ estado4

estado1:
ADD r0, #2
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r2, [r1]

LDR r3, =red
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende rojo		1000
B inicio3
estado2:
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r2, [r1]

LDR r3, =green
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende verde		0100
B inicio3
estado3:
LDR r1, =p2PDOR
LDR r1, [r1]
LDR r2, [r1]

LDR r3, =blue
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende azul 	0010
B inicio3
estado4:
SUB r0, #2
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r2, [r1]

LDR r3, =red
LDR r3, [r3]

AND r2, r2, r3

LDR r3, =green
LDR r3, [r3]

AND r2, r2, r3

STR r2, [r1]		//enciende rojo y verde


LDR r1, =p2PDOR
LDR r1, [r1]
LDR r2, [r1]

LDR r3, =blue
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende azul

B inicio3
