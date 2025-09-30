; print random colour blocks
get_rand = $d41b
plot     = $fff0
setcolor = $0286
stop     = $ffe1
print    = $ffd2

*= $0801
	.word (+), 10
	.null $9e, ^start
+	.word 0
start   jsr random
; get row between 0 and 24 (inclusive)
get_row lda get_rand
        cmp #25
        bcs get_row; repeat if result is >= 25
        ; store result in X
        tax
; get column number between 0 and 39 (inclusive)
get_col lda get_rand
        cmp #40
        bcs get_col ; repeat if result is >= 40
        tay ; store result in Y
; go to cursor position as specified in X and Y
        clc
        jsr plot
; select random colour for text
; see also https://stackoverflow.com/questions/28597139
        lda get_rand
        sta setcolor
; print block character in that colour
        lda #160
        jsr print
; check for the STOP key pressed to stop
        jsr stop
        bne start ; if key not pressed, repeat execution, otherwise exit
; change text to default light blue colour (14)
        lda #14
        sta setcolor
exit    rts

; sets up random number generator on SID chip
; call this routine once then get random number
; (unsigned integer between 0 and 255)
; by simply doing `lda $d41b`
random  lda #$ff
        sta $d40e
        sta $d40f
        lda #$80
        sta $d412
        rts
