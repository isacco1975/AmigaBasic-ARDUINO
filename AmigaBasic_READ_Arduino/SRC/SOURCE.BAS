SCREEN 1,320,200,5,1
WINDOW 2,"IGP",(20,20)-(270,180),15,1

LOCATE 2,4
COLOR 0,1
Print "    READING SERIAL PORT    "
LOCATE 3,4
Print "2023 ISAAC GARCIA PEVERI   "

Open "COM1:9600,N,8,1" As #1

GoSub InitPgm
'-----------------------------------------------'

While 1
  While Loc(1)<>0

  k$=""
  msg$=""

  While k$<>CHR$(13)
    k$=INPUT$(1,1)
    If k$<>"" Then
      msg$=msg$+k$
    End If
  Wend
  
  curr%(1) = Val(msg$)
  GoSub DrawFader
  
  Wend
Wend
'-----------------------------------------------'

DrawSlider:
   LOCATE 7,4
   COLOR 1,0
   Print "Value from sensor: " curr%(1)
   
   x1(1)=WINDOW(4)+60
   y1(1)=WINDOW(5)+10
   x2(1)=WINDOW(4)+210
   y2(1)=WINDOW(5)+20
Return
'-----------------------------------------------'

'Draws the changing bar
DrawFader:
   'Draw bar
   Line (x1(1),y1(1))-(x2(1),y2(1)),3,bf
   x=curr%(1)-Min(1))/(Max(1)-Min(1))
   x=x1(1)+x*(x2(1)-x1(1))
   
   'Draw progress bar inside
   Line (x1(1),y1(1))-(x(2)+x,y2(1)),2,bf
   
   'Shows current value on the screen
   COLOR 1,0
   LOCATE 7,23:Print curr%(1)
Return
'-----------------------------------------------'

InitPgm:
   READ Min(1), Max(1), curr%(1)
   GoSub DrawSlider
Return
'-----------------------------------------------'

'Data for the fader
DATA 1, 1300, 10

End
