# ESP32 Programmiersprachen & Frameworks - Übersicht

Der TIOBE-Index zeigt, wie populär generell Programmiersprachen (nicht MCU) sind, basierend auf Suchanfragen in verschiedenen Suchmaschinen und Plattformen:
<https://www.tiobe.com/tiobe-index/>

## Warum braucht es überhaupt andere Programmiersprachen als Arduino C++?

Arduino C++ ist einfach und gut für Einsteiger, aber nicht immer optimal für alle Anforderungen. Andere Sprachen bieten z.B. bessere Performance, mehr Flexibilität, schnellere Entwicklung, oder sind moderner und sicherer. Je nach Projekt kann eine andere Sprache oder ein Framework besser passen.

---

## Unterschied: Programmiersprache vs. Framework bei ESP32 & Arduino

- **Programmiersprache:** Die Sprache, in der du schreibst (z.B. C++, Python, Rust, JavaScript).
- **Framework:** Ein Set von Bibliotheken, Tools und APIs, die das Entwickeln auf dem ESP32 erleichtern (z.B. Arduino Framework, ESP-IDF von Espressif).

Arduino nutzt C++ als Sprache + eigenes Framework. Espressif bietet mit ESP-IDF ein eigenes Framework in C/C++, das näher an der Hardware ist und mehr Kontrolle bietet.

---

## Programmiersprachen für ESP32 - Kurzüberblick

### Arduino C++

<https://www.arduino.cc/>

- **Einleitung:** Klassiker, große Community, einfach zu lernen, viele Bibliotheken.
- **Pro:** Einfach, viele Beispiele, großer Support.
- **Contra:** Begrenzte Performance und Kontrolle, teilweise veraltet.

### ESP-IDF (C/C++)

<https://www.espressif.com/en/products/socs/esp32>

- **Einleitung:** Offizielles Espressif Framework, nah an der Hardware.
- **Pro:** Hohe Kontrolle, volle Performance, offizieller Support.
- **Contra:** Steilere Lernkurve, komplexer als Arduino.

### Espruino (JavaScript)

<https://www.espruino.com/ESP32>

- **Einleitung:** Interpretiert JavaScript direkt auf dem ESP32.
- **Pro:** Schnell zu testen, dynamisch, ideal für Web-Dev.
- **Contra:** Eingeschränkte Performance, weniger Bibliotheken.

### MicroPython

<https://micropython.org/download/ESP32_GENERIC/>

- **Einleitung:** Leichtgewichtiges Python für Mikrocontroller.
- **Pro:** Einfach, schnell zum Entwickeln, große Community.
- **Contra:** Langsamer als C/C++, weniger Kontrolle.

### CircuitPython

<https://circuitpython.org/>

- **Einleitung:** Fork von MicroPython, speziell von Adafruit angepasst.
- **Pro:** Fokus auf Einsteiger, einfache Hardwareintegration.
- **Contra:** Weniger flexibel als MicroPython.

### Rust

<https://github.com/espressif/rust-esp32-example>

- **Einleitung:** Moderne Systemsprache mit Fokus auf Sicherheit.
- **Pro:** Speichersicherheit, gute Performance, moderne Features.
- **Contra:** Höhere Einstiegshürde, weniger Beispiele.

### TinyGo

<https://tinygo.org/docs/reference/microcontrollers/>

- **Einleitung:** Go-Compiler für Mikrocontroller.
- **Pro:** Go-Syntax, kleine Binärgrößen, schnell.
- **Contra:** Noch im Wachstum, weniger stabil.

### Zephyr (C)

<https://www.zephyrproject.org/zephyr-rtos-on-esp32/>

- **Einleitung:** Echtzeitbetriebssystem (RTOS) mit Framework.
- **Pro:** Echtzeitfähigkeit, modulare Architektur.
- **Contra:** Komplex, steile Lernkurve.

---

So kannst du je nach Projektanforderung und Kenntnissen die passende Sprache und das Framework wählen.

