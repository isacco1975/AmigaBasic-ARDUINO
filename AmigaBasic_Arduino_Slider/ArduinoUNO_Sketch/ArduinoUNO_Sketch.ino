String serialValue = "";
int N;

void setup() {
  pinMode(2, OUTPUT);
  Serial.begin(9600,SERIAL_8N1); // opens serial port, sets 
}

void loop() {
  if (Serial.available()) 
  {
    serialValue = Serial.readString();
    N = serialValue.toInt();

    tone(2, N);

    if (N < 10) 
    {
      noTone(7);  
    } 
  }
}
