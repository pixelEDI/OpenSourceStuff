#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include "wifimqtt.h"
#include <ArduinoJson.h>

unsigned long previousMillis = millis();

void setup()
{
  connectAP();
  client.setServer(mqtt_server, 1883);
  client.setCallback(callback);
  client.setBufferSize(1024);
}

void loop()
{
  if (!client.connected())
  {
    reconnect();
  }
  client.loop();

  unsigned long currentMillis = millis();

  if (currentMillis - previousMillis >= (1000 * 3))
  {
    previousMillis = currentMillis;
    // Erstelle ein JSON-Objekt
    StaticJsonDocument<200> doc;

    // Füge Daten hinzu
    doc["sensor"] = "temperatur";
    doc["wert"] = random(0,40);

    // Konvertiere das JSON-Objekt in einen String
    char jsonBuffer[200];
    serializeJson(doc, jsonBuffer);

    client.publish("messwerte/office", jsonBuffer);
  }
}