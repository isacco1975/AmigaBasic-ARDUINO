REM --- Arduino Telegraph for Amiga ---
REM --- 2024 by Isaac Garcia Peveri ---
REM --- For educational and fun     ---
REM --- purposes only!              ---
REM ---                             ---
REM --- This software is not inden- ---
REM --- ded to be used as a profes- ---
REM --- sional telegraph nor mili-  ---
REM --- tary scopes!
'--------------------------------------'

'REM 4.9.2024: Add pauses
'              general improvement of
'              translation
'--------------------------------------'
  
'Starting with some basics...
OPEN "COM1:1200,N,8,1" AS #1

COLOR 0,1
LOCATE 4,28
PRINT "ARDUINO MORSE TELEGRAPH "

LOCATE 5,28
PRINT "2024 ISAAC GARCIA PEVERI"

COLOR 3,0
LOCATE 8,30
PRINT "  Version 1.02"         

COLOR 1,0
LOCATE 10,24
PRINT "Press button on your Telegraph"

LOCATE 11,24
PRINT "Click on <Clear Message> to Clear"

LOCATE 12,14
PRINT "(button works when a new transmission is started)"

COLOR 2
LOCATE 14,14
PRINT "       Keep at least 0.5 seconds for a Pause!"

charPos = 11

GOSUB InitPgm
GOSUB DrawMessageWindow
GOSUB DrawClearButton
'--------------------------------------'  

'Main Thread
WHILE 1
   WHILE LOC(1) <> 0
      k$ = ""
      char$ = ""
      
      WHILE k$ <> CHR$(13)
         
         k$=INPUT$(1,1)
         IF k$ <> "" THEN
            char$=char$+k$            
         END IF

      WEND
   
      GOSUB DrawChar           
   WEND
WEND
'--------------------------------------'
  
DrawMessageWindow:
   x1(2)=WINDOW(4)+80
   y1(2)=WINDOW(5)+10
   x2(2)=WINDOW(4)+560
   y2(2)=WINDOW(5)+27

   LINE (x1(2),y1(2))-(x2(2),y2(2)),1,bf
RETURN

'--------------------------------------'  
  
DrawChar:
   TIMER ON
   COLOR 0,1

   IF charPos < 69 THEN
      charPos = charPos + 1
      
      IF charPos = 12 THEN
         fullMsg$ = fullMsg$ + LEFT$(char$,1)
         tc$ = tc$ + LEFT$(char$,1)
         LOCATE 17,charPos:PRINT LEFT$(char$,1)
      ELSE
         fullMsg$ = fullMsg$ + MID$(char$,2,1)
         tc$ = tc$ + MID$(char$,2,1)                   
         LOCATE 17,charPos: Print MID$(char$,2,1)
      END IF
        
      GOSUB TranslateMorseCode
      TIMER OFF
   Else
   	  charPos = 11
      COLOR 3,0
      LOCATE 8,30
      PRINT "  BUFFER FULL!"  
   END IF
   
   char$ = "": k$ = ""
   
   TIMER ON
   ON TIMER(.5) GOSUB ClearTc
   
RETURN 
'--------------------------------------'

ClearTc:
   tc$ = ""
   charPos = charPos + 1
   LOCATE 17,charPos:PRINT  CHR$(32) 
   
RETURN

'--------------------------------------'
TranslateMorseCode:
      IF tc$ = "..." THEN
         LOCATE 18,charPos:PRINT "S"
      END IF  

      IF tc$ = "---" THEN
         LOCATE 18,charPos:PRINT "O" 
      END IF  

      IF tc$ = ".----" THEN
         LOCATE 18,charPos:PRINT "1" 
      END IF  

      IF tc$ = "..---" THEN
         LOCATE 18,charPos:PRINT "2" 
      END IF  
      
      IF tc$ = "...--" THEN
         LOCATE 18,charPos:PRINT "3" 
      END IF  

      IF tc$ = "....-" THEN
         LOCATE 18,charPos:PRINT "4" 
      END IF  

      IF tc$ = "....." THEN
         LOCATE 18,charPos:PRINT "5" 
      END IF  

      IF tc$ = "-...." THEN
         LOCATE 18,charPos:PRINT "6" 
      END IF  

      IF tc$ = "--..." THEN
         LOCATE 18,charPos:PRINT "7" 
      END IF  

      IF tc$ = "---.." THEN
         LOCATE 18,charPos:PRINT "8" 
      END IF  

      IF tc$ = "----." THEN
         LOCATE 18,charPos:PRINT "9" 
      END IF  

      IF tc$ = ".-" THEN
         LOCATE 18,charPos:PRINT "A" 
      END IF  

      IF tc$ = "-..." THEN
         LOCATE 18,charPos:PRINT "B" 
      END IF  

      IF tc$ = "-.-." THEN
         LOCATE 18,charPos:PRINT "C" 
      END IF  

      IF tc$ = "-.." THEN
         LOCATE 18,charPos:PRINT "D" 
      END IF  

      IF tc$ = "." THEN
         LOCATE 18,charPos:PRINT "E" 
      END IF  

      IF tc$ = "..-." THEN
         LOCATE 18,charPos:PRINT "F" 
      END IF  

      IF tc$ = "--." THEN
         LOCATE 18,charPos:PRINT "G"
      END IF  

      IF tc$ = "...." THEN
         LOCATE 18,charPos:PRINT "H" 
      END IF  

      IF tc$ = ".." THEN
         LOCATE 18,charPos:PRINT "I" 
      END IF  

      IF tc$ = ".---" THEN
         LOCATE 18,charPos:PRINT "J" 
      END IF  

      IF tc$ = "-.-" THEN
         LOCATE 18,charPos:PRINT "K" 
      END IF  

      IF tc$ = ".-.." THEN
         LOCATE 18,charPos:PRINT "L" 
      END IF  

      IF tc$ = "--" THEN
         LOCATE 18,charPos:PRINT "M" 
      END IF  

      IF tc$ = "-." THEN
         LOCATE 18,charPos:PRINT "N" 
      END IF  

      IF tc$ = ".--." THEN
         LOCATE 18,charPos:PRINT "P" 
      END IF  

      IF tc$ = "--.-" THEN
         LOCATE 18,charPos:PRINT "Q" 
      END IF  

      IF tc$ = ".-." THEN
         LOCATE 18,charPos:PRINT "R" 
      END IF  

      IF tc$ = "-" THEN
         LOCATE 18,charPos:PRINT "T"
      END IF  

      IF tc$ = "..-" THEN
         LOCATE 18,charPos:PRINT "U" 
      END IF  

      IF tc$ = "...-" THEN
         LOCATE 18,charPos:PRINT "V" 
      END IF  

      IF tc$ = ".--" THEN
         LOCATE 18,charPos:PRINT "W" 
      END IF  

      IF tc$ = "-..-" THEN
         LOCATE 18,charPos:PRINT "X" 
      END IF  

      IF tc$ = "-.--" THEN
         LOCATE 18,charPos:PRINT "Y" 
      END IF  

      IF tc$ = "--.." THEN
         LOCATE 18,charPos:PRINT "Z" 
      END IF  

      LOCATE 18,charPos-1:PRINT " "

RETURN
'------------------------------------'
 
DrawClearButton:    
   x1(1)=WINDOW(4)+230
   y1(1)=WINDOW(5)+42
   x2(1)=WINDOW(4)+385
   y2(1)=WINDOW(5)+65

   LINE (x1(1),y1(1))-(x2(1),y2(1)),2,bf
   COLOR 3,2
   LOCATE 22,33
   PRINT "Clear Message" 
    
RETURN
'--------------------------------------'

DrawTranslateButton:    
   a1(1)=x(1)+355
   b1(1)=y(1)+131
   a2(1)=x(2)+455
   b2(1)=y(2)+149

   LINE (a1(1),b1(1))-(a2(1),b2(1)),2,bf
   COLOR 3,2
   LOCATE 18,47
   PRINT "Translate"  
   
RETURN
'--------------------------------------'

OnMouseDownEvent:
  WHILE MOUSE(0)<>0
             
    mouseX=MOUSE(1)
    mouseY=MOUSE(2)

    IF mouseX>a1(1) AND mouseX<a2(1) THEN
      IF mouseY>b1(1) AND mouseY<b2(1) THEN
         BEEP
      END IF
    END IF       
  
    IF mouseX>x1(1) AND mouseX<x2(1) THEN
      IF mouseY>y1(1) AND mouseY<y2(1) THEN
         PRINT #1,0
         COLOR 3,0
         LOCATE 8,30
         PRINT "  Message Cleared"
         
         msg$="": fullMsg$ = "": char$=""
         COLOR 0,1
         charPos = 11
         FOR idx = 11 TO 69
            LOCATE 17,idx: PRINT CHR$(32)
            LOCATE 18,idx: PRINT CHR$(32)
         NEXT   
      END IF
    END IF

  WEND

RETURN 
'--------------------------------------'
  
InitPgm:
  ON MOUSE GOSUB OnMouseDownEvent
  MOUSE ON
  
RETURN  
'--------------------------------------'  
 

