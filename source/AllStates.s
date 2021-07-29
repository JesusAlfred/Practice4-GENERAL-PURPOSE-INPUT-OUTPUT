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
.global AllStates
//.type OneHot function
AllStates:
OneHot:

MOV r7, #0


inicio1:
//Delay cuenta de 0x7270E0 a 0
LDR r1, =max
LDR r1, [r1]
delay1:
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
BNE delay1

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
BEQ estado1o
CMP r7, #2
BEQ estado2o
CMP r7, #3
BEQ estado3o
CMP r7, #4
MOV r7, #0
BEQ estado4o

estado1o:
LDR r2, [r1]
LDR r3, =red
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]//enciende rojo		1000
B inicio1
estado2o:
LDR r2, [r1]

LDR r3, =green
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r1]		//enciende verde		0100
B inicio1
estado3o:
LDR r2, [r0]

LDR r3, =blue
LDR r3, [r3]

AND r2, r2, r3
STR r2, [r0]		//enciende azul 	0010
B inicio1
estado4o:
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
B inicio1

OneHotR:
B OneHot

Jhonson:


//r0, r5, r7 almacenan el estado de la secuencia siempre
MOV r2, #0
MOV r0, #1
MOV r5, #0
MOV r7, #0
inicio2:
ADD r0, r5
ADD r0, r7
CMP r0, #0
BEQ suma1
CMP r0, #3
BEQ suma0
B endif
suma1:
MOV r2, #1
B endif
suma0:
MOV r2, #0

endif:
MOV r0, r5
MOV r5, r7
MOV r7, r2


CMP r0, #0
BEQ apagarR
BNE encenderR
endifR:
CMP r5, #0
BEQ apagarG
BNE encenderG
endifG:
CMP r7, #0
BEQ apagarB
BNE encenderB
endifB:

LDR r1, =max
LDR r1, [r1]
delay2:
SUB r1, r1, #1
/*
*	registro r4 disponible
*	registros temporales disponibles r3, r6
*	CMP r4, #0
*	BNE RStateMachine1
*/
LDR r4, =p2PDOR
LDR r4, [r4]
LDR r6, [r4]
LDR r3, =buttonbit
LDR r3, [r3]

AND r6, r6, r3
CMP r6, r3
BEQ Bounce
CMP r1, #0
BNE delay2

B inicio2

apagarR:
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =offr
LDR r3, [r3]

ORR r6, r6, r3

STR r6, [r1]
B endifR
apagarG:
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =offg
LDR r3, [r3]

ORR r6, r6, r3

STR r6, [r1]
B endifG
apagarB:
LDR r1, =p2PDOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =offb
LDR r3, [r3]

ORR r6, r6, r3

STR r6, [r1]
B endifB
encenderR:
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =red
LDR r3, [r3]

AND r6, r6, r3
STR r6, [r1]

B endifR
encenderG:
LDR r1, =p2PBOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =green
LDR r3, [r3]

AND r6, r6, r3
STR r6, [r1]

B endifG
encenderB:
LDR r1, =p2PDOR
LDR r1, [r1]
LDR r6, [r1]

LDR r3, =blue
LDR r3, [r3]

AND r6, r6, r3
STR r6, [r1]

B endifB

Bounce:


MOV r7, #3
MOV r0, #1

inicio3:
//Delay cuenta de 0x7270E0 a 0
LDR r1, =max
LDR r1, [r1]

delay3:
SUB r1, r1, #1
LDR r4, =p2PDOR
LDR r4, [r4]
LDR r6, [r4]
LDR r5, =buttonbit
LDR r5, [r5]

AND r6, r6, r5
CMP r6, r5
BEQ OneHotR

CMP r1, #0
BNE delay3

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

