.data
p2PDOR: .long 0x400FF0C0
p2PBOR: .long 0x400FF040

red: .long 0xFFFBFFFF
green: .long 0xFFF7FFFF
blue: .long 0xFFFFFFFD

offr: .long 0x40000
offg: .long 0x80000
offb: .long 0x2

buttonbit: .long 0x10

max: .long 0x2DC6C0

.text
.global Jhonson
//.type Jhonson function

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
delay:
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
BNE delay

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

