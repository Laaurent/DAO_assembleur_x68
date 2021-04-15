*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG $400
    
    * Création de la fenêtre : 1280*720 
    move.l #$050002D0,D1
    jsr resolution
    
    * Remplissage de l'arrière plan en blanc 
    move.l BLANC,D1
    jsr set_fill_color
    move #$0000,D1
    move #$0000,D2
    move #$0500,D3
    move #$02D0,D4
    jsr draw_fill_rect
    
    * Barre de tâches
    move.l GRIS_F,D1
    jsr set_pen_color
    move.l GRIS_C,D1
    jsr set_fill_color
    move #$0000,D1 * X
    move #$0000,D2 * Y
    move #$0500,D3 * X1
    move #$0040,D4 * Y1
    jsr draw_fill_rect
    
    * CASES DANS LA BARRE DES TACHES
    
    * PREMIERE CASE
    move #$0000,D1
    move #$0000,D2
    move #$0040,D3
    move #$0040,D4
    jsr draw_fill_rect 
    * MOINS DESSINE
    move.l GRIS_F,D1
    jsr set_fill_color
    move #$000A,D1
    move #$001B,D2
    move #$0036,D3
    move #$0023,D4
    jsr draw_fill_rect

    * DEUXIEME CASE
    move.l GRIS_F,D1
    jsr set_pen_color
    move.l GRIS_C,D1
    jsr set_fill_color 
    move #$0040,D1
    move #$0000,D2
    move #$0080,D3
    move #$0040,D4
    jsr draw_fill_rect 
    * PLUS DESSINE
    move.l GRIS_F,D1
    jsr set_fill_color
    move #$005B,D1
    move #$000A,D2
    move #$0065,D3
    move #$0036,D4
    jsr draw_fill_rect
    move #$004A,D1
    move #$001B,D2
    move #$0076,D3
    move #$0025,D4
    jsr draw_fill_rect
    
    
    * Utilisation de la souris 
SOURIS_LOOP:
    jsr get_mouse
    move.w D1,X  * récupérer coordonnée X de la souris 
    lsr.l #$8,D1 * décalage de 16 bits pour récupérer Y 
    lsr.l #$8,D1
    move.w D1,Y
    cmp TAILLE_TB,D1
    blt TASKBAR
    * clic gauche appuyé 
    cmp.b #1,D0 
    beq PIXEL_DESSIN
    * clic droit appuyé 
    cmp.b #2,D0
    beq PIXEL_EFFACE
    bra SOURIS_LOOP

    * souris dans la barre de tache
TASKBAR:
    cmp.w #$0040,X
    blt TASKBAR_ICO_1
    cmp.w #$0080,X
    blt TASKBAR_ICO_2
    bra SOURIS_LOOP
    
TASKBAR_ICO_1:
    * si clic gauche
    cmp.b #1,D0 
    bne SOURIS_LOOP
TASKBAR_ICO_1_ATTENTE:
    jsr get_mouse
    cmp.b #0,D0
    bne TASKBAR_ICO_1_ATTENTE
    move.b #$5,TAILLE_CRAYON
    move.b #$5,TAILLE_GOMME
    bra SOURIS_LOOP
    
TASKBAR_ICO_2:
    cmp.b #1,D0 
    bne SOURIS_LOOP
    jsr get_mouse
    cmp.b #0,D0
    bne SOURIS_LOOP
    move.b #$40,TAILLE_CRAYON
    move.b #$40,TAILLE_GOMME
    bra SOURIS_LOOP

    * souris dans la zone de dessin * 
PIXEL_DESSIN:

    move.l NOIR,D1
    jsr set_pen_color
    move.b TAILLE_CRAYON,D1
    jsr width_pen
    move.l NOIR,D1
    jsr set_fill_color
    
    move.w X,D1
    move.w Y,D2
    move.w X,D3
    move.w Y,D4
    jsr draw_fill_ellipse
    
    bra SOURIS_LOOP
   
PIXEL_EFFACE:
    move.l BLANC,D1
    jsr set_pen_color
    move.b TAILLE_GOMME,D1
    jsr width_pen
    move.l BLANC,D1
    jsr set_fill_color
    
    move.w X,D1
    move.w Y,D2
    move.w X,D3
    move.w Y,D4
    jsr draw_fill_ellipse
    
    bra SOURIS_LOOP





FIN:
    jsr FINPRG
    include 'BIBLIO.X68'
    include 'BIBPERIPH.X68'
    include 'BIBGRAPH.X68'
    
    ORG $800
GRIS_C: DC.L $00F1F1F1
GRIS_F: DC.L $00D4D4D4
ROUGE:  DC.L $000000FF
BLANC:  DC.L $00FFFFFF
NOIR:   DC.L $00000000
X:      DS.W 1
Y:      DS.W 1
TAILLE_CRAYON:  DC.b $10
TAILLE_GOMME:   DC.b $10
TAILLE_TB:      DC.w $0040
    END $400









*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
