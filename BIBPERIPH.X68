HARDWARE:
    move #32,D0
    trap #15
    rts
RESOLUTION:
    move #33,D0
    trap #15
    rts
GET_MOUSE:
    move #61,D0
    trap #15
    rts
MOUSE_IRQ:
    move #60,D0
    trap #15
    rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
