REM --- Arduino Telegraph for Amiga ---
REM --- 2024 by Isaac Garcia Peveri ---
REM --- For educational and fun     ---
REM --- purposes only!              ---
REM ---                             ---
REM --- This software is not inten- ---
REM --- ded o be used as a profes-  ---
REM --- sional telegraph nor mili-  ---
REM --- tary scopes!                ---
'-------------------------------------'
'Starting with some basics...

OPEN "COM1:2400,N,8,1" AS #1

COLOR 0, 1
LOCATE 4, 28
PRINT "ARDUINO MORSE TELEGRAPH "

LOCATE 5, 28
PRINT "2024 ISAAC GARCIA PEVERI"

COLOR 3, 0
LOCATE 8, 30
PRINT "  Version 1.00"

COLOR 1, 0
LOCATE 10, 24
PRINT "Press button on your Telegraph"

LOCATE 11, 24
PRINT "Click on <Clear Message> to Clear"

LOCATE 12, 14
PRINT "(button works when a new transmission is started)"

charPos = 11

GOSUB InitPgm
GOSUB DrawMessageWindow
GOSUB DrawClearButton
'--------------------------------------'
'Main Thread
While 1
   While LOC(1) <> 0
      k$ = ""
      char$ = ""

      While k$ <> CHR$(13)

         k$ = INPUT$(1, 1)

         If k$ <> "" Then
            char$ = char$ + k$
         End If

      WEND

      GOSUB DrawChar
  WEND
WEND
'--------------------------------------'

DrawMessageWindow:
   x1(2) = WINDOW(4) + 80
   y1(2) = WINDOW(5) + 17
   x2(2) = WINDOW(4) + 560
   y2(2) = WINDOW(5) + 37

   LINE(x1(2), y1(2))-(x2(2),y2(2)),1,bf
Return
'--------------------------------------'

DrawChar:
   Timer ON

   COLOR 0, 1

   If charPos < 69 Then
      charPos = charPos + 1

      LOCATE 16, charPos:PRINT char$
      If charPos = 12 Then
         fullMsg$ = fullMsg$ + LEFT$(char$, 1)
         tc$ = tc$ + LEFT$(char$, 1)
      Else
         fullMsg$ = fullMsg$ + MID$(char$, 2, 1)
         tc$ = tc$ + MID$(char$, 2, 1)
      End If

      GOSUB TranslateMorseCode
      TIMER OFF

   Else
      COLOR 3, 0
      LOCATE 8, 30
      PRINT "  BUFFER FULL!"
   End If

   char$ = "" : k$ = ""
   TIMER ON

   On TIMER(.5) GOSUB ClearTc

Return
'--------------------------------------'

ClearTc:
   tc$ = ""

Return
'--------------------------------------'

TranslateMorseCode:
   If tc$ = "..." Then
      LOCATE 17, charPos: PRINT "S"
   End If

   If tc$ = "---" Then
      LOCATE 17, charPos: PRINT "O"
   End If

   If tc$ = ".----" Then
     LOCATE 17, charPos: PRINT "1"
   End If

   If tc$ = "..---" Then
      LOCATE 17, charPos: PRINT "2"
   End If

   If tc$ = "...--" Then
      LOCATE 17, charPos: PRINT "3"
   End If

   If tc$ = "....-" Then
      LOCATE 17, charPos: PRINT "4"
   End If

   If tc$ = "....." Then
      LOCATE 17, charPos: PRINT "5"
   End If

   If tc$ = "-...." Then
      LOCATE 17, charPos: PRINT "6"
   End If

   If tc$ = "--..." Then
      LOCATE 17, charPos: PRINT "7"
   End If

   If tc$ = "---.." Then
      LOCATE 17, charPos: PRINT "8"
   End If

   If tc$ = "----." Then
      LOCATE 17, charPos: PRINT "9"
   End If

   If tc$ = ".-" Then
      LOCATE 17, charPos: PRINT "A"
   End If

   If tc$ = "-..." Then
      LOCATE 17, charPos: PRINT "B"
   End If

   If tc$ = "-.-." Then
      LOCATE 17, charPos: PRINT "C"
   End If

   If tc$ = "-.." Then
      LOCATE 17, charPos: PRINT "D"
   End If

   If tc$ = "." Then
      LOCATE 17, charPos: PRINT "E"
   End If

   If tc$ = "..-." Then
      LOCATE 17, charPos: PRINT "F"
   End If

   If tc$ = "--." Then
      LOCATE 17, charPos: PRINT "G"
   End If

   If tc$ = "...." Then
      LOCATE 17, charPos: PRINT "H"
   End If

   If tc$ = ".." Then
      LOCATE 17, charPos: PRINT "I"
   End If

   If tc$ = ".---" Then
      LOCATE 17, charPos: PRINT "J"
   End If

   If tc$ = "-.-" Then
      LOCATE 17, charPos: PRINT "K"
   End If

   If tc$ = ".-.." Then
      LOCATE 17, charPos: PRINT "L"
   End If

   If tc$ = "--" Then
      LOCATE 17, charPos: PRINT "M"
   End If

   If tc$ = "-." Then
      LOCATE 17, charPos: PRINT "N"
   End If

   If tc$ = ".--." Then
      LOCATE 17, charPos: PRINT "P"
   End If

   If tc$ = "--.-" Then
      LOCATE 17, charPos: PRINT "Q"
   End If

   If tc$ = ".-." Then
      LOCATE 17, charPos: PRINT "R"
   End If

   If tc$ = "-" Then
      LOCATE 17, charPos: PRINT "T"
   End If

   If tc$ = "..-" Then
      LOCATE 17, charPos: PRINT "U"
   End If

   If tc$ = "...-" Then
      LOCATE 17, charPos: PRINT "V"
   End If

   If tc$ = ".--" Then
      LOCATE 17, charPos: PRINT "W"
   End If

   If tc$ = "-..-" Then
      LOCATE 17, charPos: PRINT "X"
   End If

   If tc$ = "-.--" Then
      LOCATE 17, charPos: PRINT "Y"
   End If

   If tc$ = "--.." Then
      LOCATE 17, charPos: PRINT "Z"
   End If

   LOCATE 17, charPos - 1: PRINT " "

Return
'------------------------------------'

DrawClearButton:
   x1(1) = WINDOW(4) + 230
   y1(1) = WINDOW(5) + 52
   x2(1) = WINDOW(4) + 385
   y2(1) = WINDOW(5) + 70

   LINE(x1(1), y1(1))-(x2(1),y2(1)),2,bf

   COLOR 3, 2
   LOCATE 21, 33
   PRINT "Clear Message"

Return
'--------------------------------------'

DrawTranslateButton:
   a1(1) = x(1) + 355
   b1(1) = y(1) + 131
   a2(1) = x(2) + 455
   b2(1) = y(2) + 149

   LINE(a1(1), b1(1))-(a2(1),b2(1)),2,bf

   COLOR 3, 2
   LOCATE 18, 47
   PRINT "Translate"

Return
'--------------------------------------'

OnMouseDownEvent:
   While MOUSE(0) <> 0

      mouseX = MOUSE(1)
      mouseY = MOUSE(2)

      If mouseX > a1(1) And mouseX < a2(1) Then
         If mouseY > b1(1) And mouseY < b2(1) Then
            BEEP
         End If
      End If

      If mouseX > x1(1) And mouseX < x2(1) Then
         If mouseY > y1(1) And mouseY < y2(1) Then
            PRINT #1, 0
            COLOR 3, 0
            LOCATE 8, 30
            PRINT "  Message Cleared"

            msg$ = "" : fullMsg$ = "" : char$ = ""

            COLOR 0, 1
            charPos = 11

            For idx = 11 To 69
                LOCATE 16, idx: PRINT CHR$(32)
                LOCATE 17, idx: PRINT CHR$(32)
            Next
         End If
      End If

   Wend

Return
'--------------------------------------'

InitPgm:
  On MOUSE GOSUB OnMouseDownEvent
  MOUSE ON

Return
'--------------------------------------'
