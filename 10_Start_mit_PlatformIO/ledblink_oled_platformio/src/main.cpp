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
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64

#define OLED_RESET -1
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

byte ledstate = LOW;
byte cnt = 0;
const byte led = 5;

void toggleLED()
{
  digitalWrite(led, ledstate);
  delay(300);
}

void showMillis()
{
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.println("Laufzeit");
  display.setCursor(0, 10);
  display.println(millis() / 1000);
  display.display();
  Serial.println(millis());
}

void initOled()
{
  if (!display.begin(SSD1306_SWITCHCAPVCC, 0x3C))
  {
    Serial.println(F("SSD1306 allocation failed"));
    for (;;)
      ;
  }
  display.clearDisplay();
  display.setTextSize(1);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(0, 0);
  display.println(F("Hello XIAO!"));
  display.display();
  delay(2000);
}

void setup()
{
  Serial.begin(115200);
  pinMode(led, OUTPUT);
  initOled();
}

void loop()
{

  cnt++;
  if (cnt % 2 == 0)
    ledstate = HIGH;
  else
    ledstate = LOW;

  toggleLED();
  showMillis();
}
