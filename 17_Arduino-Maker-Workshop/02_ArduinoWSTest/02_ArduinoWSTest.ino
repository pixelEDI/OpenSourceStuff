
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
DEVBoard ESP32 XIAO OLED Test | V1.0 | 04.2024

*/

#include <Arduino.h>
#include "leds.h"
#include "button.h"
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

leds led1(10);
leds led2(9);
leds led3(8);
leds led4(20);

Button btn1(4);
Button btn2(5);

const byte poti = A0;
int smoothedValue = 0;
int lastValue = 0;
const int threshold = 10; // Schwellenwert für Änderungen

void checkButtons()
{
  switch (btn1.checkBTN())
  {
  case 1:
    led1.turnOn();
    led2.turnOn();
    break;
  case 2:
    led1.turnOff();
    led2.turnOff();
    break;
  }

  switch (btn2.checkBTN())
  {
  case 1:
    led3.turnOn();
    led4.turnOn();
    break;
  case 2:
    led3.turnOff();
    led4.turnOff();
    break;
  }
}

void showPotiValue()
{
  int sensorValue = analogRead(poti);

  if (abs(sensorValue - lastValue) > threshold)
  {
    delay(10);
    display.clearDisplay();
    display.setCursor(0, 0);
    display.print(F("Poti"));
    display.setCursor(0, 20);
    display.print(sensorValue);
    display.display();
    lastValue = sensorValue;
  }
  
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
  initOled();
}

void loop()
{
  checkButtons();
  showPotiValue();
}