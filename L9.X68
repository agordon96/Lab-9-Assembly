*-----------------------------------------------------------
* Title      : L9_1
* Written by : Aaron Gordon
* Date       : November 17th, 2015
*-----------------------------------------------------------
     ORG  $8000
START   MOVE B,D0
        DIVS #2,D0
        NEG D0
        MOVE D0,D
        MOVE B,D1
        MULS D1,D1
        MOVE C,D2
        MULS #4,D2
        SUB D2,D1
        MOVE D1,DELTA
        CMPI #0,DELTA
        BLT IF
        CMPI #0,DELTA
        BNE ELSE
        MOVE D,D3
        MOVE #-100,D4
        BRA END
IF      
        BRA END
ELSE    JSR SQRT
        MOVE D,D3
        MOVE D,D4
        SUB SQR,D3
        ADD SQR,D4
END     MOVE B,D0
        MOVE C,D1
        TRAP #14

********** SUBROUTINE SQRT ***********

SQRT    MOVE DELTA,D7
        CLR.L D2
LOOP    MOVE COUNT,D5
        MOVE COUNT,D6
        MULU #2,D5
        SUB #1,D5
        ANDI.B #1,COUNT
        BEQ SUBT
        ADD D5,D2
        BRA CHECK
SUBT    SUB D5,D2
CHECK   MULU COUNT,D6
        ADD #1,COUNT
        CMP DELTA,D6
        BLT LOOP
        DIVS #2,D2
        MOVE D2,SQR
        RTS
    
     ORG  $9000
B       DC -4
C       DC -3
COUNT   DC 1
D       DS 1
DELTA   DS 1
SQR     DS 1
     END START




*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
