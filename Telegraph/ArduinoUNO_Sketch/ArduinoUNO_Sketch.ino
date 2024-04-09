/*
 **********************************************************************
 * Name:    Telegraph.ino                                             *
 * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  *
 * Created: 05.04.2024 10:01:49                                       *
 * Edit:    09.04.2024 10:01:49                                       *
 * Author:  Isaac Garcia Peveri                                       *
 *          isacco1975gp@gmail.com                                    *
 *          compatible with BASIC V2 (c64) and AmigaBasic             *
 * - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  *
 **********************************************************************
*/

#pragma region "Working-Storage"
const int PUSH_BUTTON = 7;
const int BUZZER_PIN = 3;
byte buttonValue;
#pragma endregion

void setup()
{  
   Serial.begin(1200);
   pinMode(BUZZER_PIN, OUTPUT);
   pinMode(PUSH_BUTTON, INPUT);
}

///
/// Reading Loop
///
void loop()
{
   bool isStartSignal = false;
   byte startTime = 0;
   byte endTime = 0;
   byte diffTime = 0;

   buttonValue = digitalRead(PUSH_BUTTON); 

   if (buttonValue == 0)
   {
      startTime = millis(); 
   }
   
   while (buttonValue == 0)
   {
      isStartSignal = true;
      tone(BUZZER_PIN, 600);
      endTime = 0;    
      buttonValue = digitalRead(PUSH_BUTTON); 

      if (buttonValue != 0) 
      {
         endTime = millis();  
         diffTime = endTime - startTime; 
         exit;
      }
   }

   if (diffTime > 0 && diffTime >= 120)
   {
      Serial.println("-");
   } 
   else
   {
     if (diffTime > 0 && diffTime < 120)
     {
        Serial.println(".");
     } 
   }     

   noTone(BUZZER_PIN);
 
   delay(20);
}
