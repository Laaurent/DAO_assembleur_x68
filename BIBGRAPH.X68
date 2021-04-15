SET_PEN_COLOR:
    move #80,D0
    trap #15
    rts
SET_FILL_COLOR:
    move #81,D0
    trap #15
    rts
DRAW_PIX:
    move #82,D0
    trap #15
    rts
GET_PIX_COLOR:
    move #83,D0
    trap #15
    rts
DRAW_LINE:
    move #84,D0
    trap #15
    rts
DRAW_TO:
    move #85,D0
    trap #15
    rts
MOVE_TO:
    move #86,D0
    trap #15
    rts
DRAW_FILL_RECT:
    move #87,D0
    trap #15
    rts
DRAW_FILL_ELLIPSE:
    move #88,D0
    trap #15
    rts
POT_DE_PEINTURE:
    move #89,D0
    trap #15
    rts
DRAW_RECT:
    move #90,D0
    trap #15
    rts
DRAW_ELLIPSE:
    move #91,D0
    trap #15
    rts
WIDTH_PEN:
    move #93,D0
    trap #15
    rts
DRAW_STRING:
    move #95,D0
    trap #15
    rts
SWAP_STRING:
    move #94,D0
    trap #15
    rts
DRAW_MODE:
    move #92,D0
    trap #15
    rts

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
