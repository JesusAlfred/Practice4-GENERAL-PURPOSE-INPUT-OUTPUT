.text
.global StateMachine
.type StateMachine function

StateMachine:
//B PinInit
//B OneHot
//B Jhonson
//B Bounce

MOV r0, #0
MOV r1, #1
MOV r5, #5
MOV r6, #21
inicio:
ADD r3, r0, r1
MOV r0, r1
MOV r1, r3
CMP r3, r5
BPL sigcond
B inicio
sigcond:
CMP r6, r3
BMI fin
MOV r4, r3
NOP
B inicio
fin:

BX LR //Return
