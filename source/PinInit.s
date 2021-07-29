.data
//Para encender clocks
p2SIM5: .long 0x40048038
v2SIM5: .long 0x1400

p2PCRR: .long 0x4004A048
v2PCRR: .long 0X100
p2PCRG: .long 0X4004A04C
v2PCRG: .long 0X100
p2PCRB: .long 0X4004C004
v2PCRB: .long 0X100

p2PCRButton: .long 0x4004C010
v2PCRButton: .long 0X100

p2PDDR: .long 0x400FF0D4
v2PDDR: .long 0x2
p2PDBR: .long 0x400FF054
v2PDBR: .long 0xC0000
/*
p2PDOR: .long 0x400FF0C0
p2PBOR: .long 0x400FF040

red: .long 0x40000
blue: .long 0x2
green: .long 0x80000
*/
.text
.global PinInit
//.type PinInit function

PinInit:

LDR r0, =p2SIM5
LDR r0, [r0]
LDR r1, =v2SIM5
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PCRR
LDR r0, [r0]
LDR r1, =v2PCRR
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PCRG
LDR r0, [r0]
LDR r1, =v2PCRG
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PCRB
LDR r0, [r0]
LDR r1, =v2PCRB
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PCRButton
LDR r0, [r0]
LDR r1, =v2PCRButton
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PDDR
LDR r0, [r0]
LDR r1, =v2PDDR
LDR r1, [r1]
STR r1, [r0]

LDR r0, =p2PDBR
LDR r0, [r0]
LDR r1, =v2PDBR
LDR r1, [r1]
STR r1, [r0]

B AllStates //Return
