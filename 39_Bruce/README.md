# Bruce Firmware

Offizielle Webseite
[https://bruce.computer/](https://bruce.computer/)

Installation und Flasher
[https://bruce.computer/flasher](https://bruce.computer/flasher)

## 🎥 Video

Dazu gibt es ein passendes Video mit erstem Überblick und Praxisdemo
[https://youtu.be/5HdmTrzZL_M](https://youtu.be/5HdmTrzZL_M)

## 🔌 Hardware Empfehlung

Verwendet wurde der M5StickC PLUS2
Affiliate Link
[https://amzn.to/4a65l2V](https://amzn.to/4a65l2V)

## ⚠️ Rechtlicher Hinweis

**Nur für Bildungszwecke.**
Nutze diese Firmware ausschließlich in deinem eigenen Netzwerk.
Angriffe auf fremde Netzwerke sind illegal und strafbar.
Der Autor übernimmt keine Haftung für Missbrauch.

## WiFi Deauth Attack

Bei einem Deauth Angriff sendet der M5Stick gefälschte Trennbefehle an WLAN Geräte.
Diese Management Frames sind bei WPA2 nicht verschlüsselt.
Die Echtheit wird nicht geprüft.
Ein Passwort ist nicht notwendig.
Eine Anmeldung im Netzwerk ist nicht nötig.

Die Geräte interpretieren die Pakete als echte Router Befehle.
Die Verbindung wird sofort getrennt.
Beim erneuten Verbinden kann ein WPA Handshake abgefangen werden.
Typischer Demo und Lern Anwendungsfall.

In der Praxis hat das mit einer Sonos Box problemlos funktioniert.

**Schutz:**
WPA3 verwenden.
Management Frame Protection nach 802.11w aktivieren.

## Weitere Ressourcen

Firmware Launcher zum Testen mehrerer Firmwares
[https://github.com/bmorcelli/Launcher](https://github.com/bmorcelli/Launcher)

Älteres Projekt rund um Pranks und digitale Selbstverteidigung
[https://github.com/n0xa/m5stick-nemo](https://github.com/n0xa/m5stick-nemo)

