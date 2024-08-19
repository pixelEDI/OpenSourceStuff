/*
        _          _ ______ _____ _____
       (_)        | |  ____|  __ \_   _|
  _ __  ___  _____| | |__  | |  | || |
 | '_ \| \ \/ / _ \ |  __| | |  | || |
 | |_) | |>  <  __/ | |____| |__| || |_
 | .__/|_/_/\_\___|_|______|_____/_____|
 | |
 |_|

https://links.pixeledi.eu
PlatformIO  | V1.0 | 08.2024

*/

#include <Arduino.h>

byte ledstate = LOW;
byte cnt = 0;

const byte led = 10;

void toggleLED(){
  digitalWrite(led, ledstate); 
  delay(300);  
}

void setup() {
  pinMode(led, OUTPUT);  
}

void loop() {
  
  cnt++;
  if(cnt % 2 == 0) ledstate=HIGH;
  else ledstate=LOW;   

  toggleLED();

}



