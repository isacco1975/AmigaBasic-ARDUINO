REM --- SliderControl for Arduino   ---
REM --- 2023 by Isaac Garcia Peveri ---
'--------------------------------------'

'Starting with some basics...
OPEN "COM1:9600,N,8,1" AS #1
COLOR 0,1
LOCATE 4,28
PRINT "ARDUINO  SLIDER  CONTROL"

LOCATE 5,28
PRINT "2023 ISAAC GARCIA PEVERI"

COLOR 3,0
LOCATE 8,30
PRINT "  SOUND STOPPED"         

COLOR 1,0
LOCATE 10,24
PRINT "Use Mouse TO set Buzzer frequency"

LOCATE 11,24
PRINT "Click on <Stop Sound> to silence!"

GOSUB InitPgm
'--------------------------------------'  

'Main Thread
WHILE 1
   SLEEP
WEND
'--------------------------------------'

DrawSlider:
    LOCATE 14,13
    PRINT " Frequency: "

    x1(1)=WINDOW(4)+210
    y1(1)=WINDOW(5)-15
    x2(1)=WINDOW(4)+380
    y2(1)=WINDOW(5)-6
  
    x1(2)=WINDOW(4)+250
    y1(2)=WINDOW(5)+12
    x2(2)=WINDOW(4)+350
    y2(2)=WINDOW(5)+30
    
    GOSUB DrawFader    
RETURN
'--------------------------------------'

'Draws the fader inside the slider
DrawFader:
  'Erase old fader position
   LINE (x1(1),y1(1))-(x2(1),y2(1)),3,bf
   x=(curr%(1)-min(1))/(max(1)-min(1))
   x=x1(1)+x*(x2(1)-x1(1))

  'Draw new Fader Position 
   LINE (x-2,y1(1))-(x+10,y2(1)),2,bf

  'Button "Stop Sound":
  'Must be drawn here to not be erased
  'on next call to DrawSlider routine
   LINE (x1(2),y1(2))-(x2(2),y2(2)),2,bf

   COLOR 3,2
   LOCATE 18,33
   PRINT "Stop  Sound"  

  'Shows current value on the screen
   COLOR 1,0
   LOCATE 14,50:PRINT curr%(1)
   LOCATE 14,56:PRINT " Hertz"
RETURN
'--------------------------------------'

'Mouse Thread (event handler)
OnMouseDownEvent:
  WHILE MOUSE(0)<>0      

    mouseX=MOUSE(1)
    mouseY=MOUSE(2)

    IF mouseX>x1(1) AND mouseX<x2(1) THEN
      IF mouseY>y1(1) AND mouseY<y2(1) THEN

         curr%(1)=min(1)+v*(max(1)-min(i))
         PRINT #1,curr%(1)
         v=(mouseX-x1(1))/(x2(1)-x1(1))        

         GOSUB DrawSlider

         COLOR 3,0
         LOCATE 8,30
         PRINT "      SOUND ON       "

      END IF
    END IF

    IF mouseX>x1(2) AND mouseX<x2(2) THEN
      IF mouseY>y1(2) AND mouseY<y2(2) THEN

         PRINT #1,0
         COLOR 3,0
         LOCATE 8,30
         PRINT "  SOUND STOPPED"

      END IF
    END IF

  WEND
RETURN 
'--------------------------------------'

InitPgm:
  READ min(1), max(1), curr%(1)

  GOSUB DrawSlider

  ON MOUSE GOSUB OnMouseDownEvent
  MOUSE ON

  RETURN  
'--------------------------------------'  

'Data for the fader  
DATA 1,5000,300

