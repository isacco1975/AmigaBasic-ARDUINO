REM AmigaBasic to Arduino. 2023 Isaac Garcia Peveri

PRINT "> Opening COM1 at 300bps..."
OPEN "Com1:300,n,8,1" AS #1: REM #1 is the handle I assigned

WHILE 1: REM loop continuously (like while True in VB)
   PRINT " "

   FOR x=1 TO 10000:NEXT: REM wait a bit before send first msg
   LET a$="1.02": REM means "Turn on Led 1 for 2 seconds"
   PRINT "> Sending msg to turn on GREEN led: ", a$
   PRINT #1, a$: REM Send the message

   FOR x = 1 TO 10000:NEXT: REM Wait before send nex msg
   LET a$="2.02": REM means "Turn on Led 2 for 2 seconds"
   PRINT "> Sending msg to turn on RED led: ", a$
   PRINT #1, a$: REM Send the message

   FOR x = 1 TO 10000:NEXT: REM wait before send next msg
   LET a$="3.02": REM means "Turn on Led 3 for 2 seconds"
   PRINT "> Sending msg to turn on YELLOW led: ", a$
   PRINT #1, a$: REM Send the message
WEND   


