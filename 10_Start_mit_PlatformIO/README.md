# PlatformIO Start

### Installation

- VSCode Download: https://code.visualstudio.com/download
- PlatformIO: Extension -> PlatformIO 
- Restart VScode
- Im linken Menü PlatformIO Icon für weitere Einstellungen

### Platform installieren:

- PlatformIO -> Platforms -> Embedded -> "Espressif 32" suchen und installieren
- \-> "Atmel AVR" für Arduino
- Alle unterstützen MCUs: https://docs.platformio.org/en/latest/boards/atmelavr/uno.html
- Nach späterer Nutzung auch die Updates der "Platforms" ab und an checken

### Einstellungen

- Nach Hause telefonieren deaktivieren: Einstellungen -> telemetry suchen und ausstellen
- Schriftgröße: Font Size
- Splitscreen

### Erstes Projekt anlegen mit PlatformIO Dialog

- PlatformIO Icon -> Project -> Create new Project
  - Projektname: PlatformIO_LED_Blink
  - Board: Seeed Studio XIAO ESP32C3
  - Framework: Arduino
  - Location: Pfad angeben
- Paar Sekunden warten

### PlatformIO Struktur:

PlatformIO arbeitet nicht "nur" mit Dateien sondern immer mit "Ordnern". Deshalb öffnet man am besten immer den gesamten Projekt Ordner

```

├── platformio.ini
└── src
    └── main.cpp
```

Die Platformio.ini enthält die wichtigsten Informationen zur Hardware:

Beispiel für den Seeedstudio XIAO:

```
[env:seeed_xiao_esp32c3]
platform = espressif32
board = seeed_xiao_esp32c3
framework = arduino
monitor_speed = 115200
upload_port = /dev/ttyACM0
monitor_port = /dev/ttyACM0
lib_deps =
```

Im Ordner src befindet sich die Datei main.cpp, in der der eigentliche Code geschrieben wird. 

Wichtig ist das #include-Statement in der ersten Zeile, damit die Arduino-spezifischen Funktionen und Befehle 
korrekt genutzt werden können. Außerdem ist zu beachten, dass der Compiler in PlatformIO strenger ist und verlangt, 
dass Funktionen entweder deklariert oder definiert werden, bevor sie zum ersten Mal aufgerufen werden.


### Bibliotheken einbinden

- Zuerst Projekt kopieren und alle Ordner außer src löschen. 
- Die Datei platformio.ini bleibt ebenfalls
- PlatformIO->Librarys -> SSD1306 suchen
- unter platformio.ini den neuen Eintrag unter lib_deps = ergänzen

```yaml
[env:seeed_xiao_esp32c3]
platform = espressif32
board = seeed_xiao_esp32c3
framework = arduino
monitor_speed = 115200
upload_port = COM3
monitor_port = COM3
lib_deps =
  adafruit/Adafruit SSD1306 @ ^2.5.11
```

  
