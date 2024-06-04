
#include <Arduino.h>
#include <WiFi.h>
#include <PubSubClient.h>
#include "credentials.h"
#include <ArduinoJson.h>

// MQTT
String clientId = "ESP32polarapi";
const char *mqtt_server = "116.202.11.192";
const char *mqtt_user = "";
const char *mqtt_password = "";
WiFiClient espClient;
PubSubClient client(espClient);
long lastMsg = 0;
char msg[50];
int value = 0;
String mqttSubscribeTopic ="whattopic";
extern void setDeepSleep();

void reconnect()
{
  // Loop until we're reconnected
  while (!client.connected())
  {
    // Serial.print("Attempting MQTT connection...");
    // Attempt to connect
    clientId += String(random(0xffff), HEX);
    if (client.connect(clientId.c_str(), mqtt_user, mqtt_password))
    {
      // Serial.println("connected");
      client.subscribe(mqttSubscribeTopic.c_str());
    }
    else
    {
      // Serial.print("failed, rc=");
      // Serial.print(client.state());
      // Serial.println(" try again in 5 seconds");
      // Wait 5 seconds before retrying
      delay(5000);
    }
  }
}

void callback(char *topic, byte *message, unsigned int length)
{
  String messageTemp;

  for (int i = 0; i < length; i++)
  {
    messageTemp += (char)message[i];
  }

  if (String(topic) == mqttSubscribeTopic)
  {
    // Serial.println(messageTemp);
    // Stream& input;

     StaticJsonDocument<2048> doc;

    DeserializationError error = deserializeJson(doc, messageTemp);

    if (error)
    {
      // Serial.print("deserializeJson() failed: ");
      // Serial.println(error.c_str());
      return;
    }

  }
}

void connectAP()
{

  // Serial.println("Connecting to WiFi..");
  WiFi.begin(ssid, password);

  int cnt = 0;
  while (WiFi.status() != WL_CONNECTED)
  {
    delay(1000);
    // Serial.print(".");
    cnt++;

    if (cnt > 15)
      ESP.restart();
  }
  // Serial.println(WiFi.localIP());
}