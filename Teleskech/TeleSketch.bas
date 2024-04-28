 REM
 REM --- TELESKECH, for the CBM Amiga ---
 REM --- 2024  by Isaac Garcia Peveri ---
 REM --- VERSION 1.0
 REM --- Date written:   10 April 2024
 REM --- Date Compiled:  17 April 2024
 REM
'--------------------------------------------'

'Main Logic
DefInt xValue, yValue

GOSUB InitPgm
GOSUB CreateCanvas
GoSub DrawButtonClr

COLOR 2,0

OPEN "COM1:9600,N,8,1" AS #1

ON MOUSE GOSUB OnMouseDownEvent
MOUSE ON

'--------------------------------------------'

'Main Thread
WHILE -1
   ' Reading pot values
   While Loc(1)<>0

   k$=""
   msg$=""

   WHILE k$<>CHR$(13)
      k$ = INPUT$(1,1)
      IF k$ <> "" THEN
         msg$ = msg$ + k$
      End If
   WEND

   xValue = VAL(LEFT$(msg$,4)) 
   yValue = VAL(RIGHT$(msg$,4))
        
   LOCATE 2,4: PRINT " CURR POSITION X: "; xValue ; " Y:" ; yValue
   GoSub SetPixel

  Wend
WEND
'--------------------------------------------'

InitPgm:
   SCREEN 1,320,200,5,1
   WINDOW 2,"TeleSketch",(5,14)-(280,186),15,1
'--------------------------------------------'

CreateCanvas:
   COLOR 1,0

   z1(1)=WINDOW(4)+20
   t1(1)=WINDOW(5)+14
   z2(1)=WINDOW(4)+270
   t2(1)=WINDOW(5)+139

   LINE (z1(1),t1(1))-(z2(1),t2(1)),1,b

   x1(1) = z1(1) + 2: oldx1 = x1(1)
   y1(1) = t1(1) + 2: oldy1 = y1(1)
   x2(1) = z2(1) - 2: oldx2 = x2(1)
   y2(1) = t2(1) - 2: oldy2 = y2(1)

   LINE (x1(1),y1(1))-(x2(1),y2(1)),2,bf

Return
'--------------------------------------------'

DrawButtonClr:
   x11(1)=WINDOW(4)+100
   y11(1)=WINDOW(5)+143
   x21(1)=WINDOW(4)+180
   y21(1)=WINDOW(5)+157

   LINE (x11(1),y11(1))-(x21(1),y21(1)),3,bf

   COLOR 2,3
   LOCATE 20,16: PRINT "CLEAR"

Return
'--------------------------------------'

SetPixel:
    IF xValue <= 25 Then xValue = 25
    If yValue <= 23 Then yValue = 23
    If xValue >= 265 Then xValue = 265
    If yValue >= 140 Then yValue = 140

    PSET(xValue, yValue),1
    
    REM SOUND xPos+300,.2,255,0
    REM SOUND yPos+300,.2,255,2
Return
'--------------------------------------'

OnMouseDownEvent:
  WHILE MOUSE(0) <> 0

    mouseX=MOUSE(1)
    mouseY=MOUSE(2)

    IF mouseX > x11(1) AND mouseX < x21(1) THEN
       IF mouseY > y11(1) AND mouseY < y21(1) THEN
          LINE (x1(1),y1(1))-(x2(1),y2(1)),2,bf
       End if
    End If
  Wend

Return