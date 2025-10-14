# PicoKeys

**Open-Source Sicherheitsschlüssel auf Basis des Raspberry Pi Pico**  
[PicoKeys Website](https://www.picokeys.com)

PicoKeys ist ein **FIDO2-kompatibler Sicherheitsschlüssel**, der auf dem Raspberry Pi Pico basiert.  
Im Gegensatz zu proprietären USB-Sticks ist die Firmware **offen, transparent und frei anpassbar** – ideal für alle, die Sicherheit verstehen und selbst kontrollieren möchten.

---

## 🚀 Vorteile gegenüber proprietären Sticks

- Open Source – keine Blackbox
- Einfach flashbare Firmware (UF2)
- Läuft auf günstiger Standardhardware (Raspberry Pi Pico)
- Volle Kontrolle über Sicherheit und Updates

## Waveshare RP2350-one

- wiki: https://www.waveshare.com/wiki/RP2350-One
- Waveshare RP2350-One: https://amzn.to/46Xjc9b (Affiliate Link)
- 3D Case: https://www.printables.com/model/1129764-waveshare-rp2040-one-and-rp2350-one-case

---

## 🔧 Installation der FIDO2-Firmware

1. Lade die Firmware von [picokeys.com/pico-fido](https://www.picokeys.com/pico-fido/) herunter (Waveshare - rp2350-one) 
2. **Boot-Button gedrückt halten**, dann Pico einstecken  
3. Die `.uf2`-Datei auf das erscheinende Laufwerk kopieren  
4. Pico neu einstecken – fertig!

---

## Weitere Einrichtung - Commissioner

- https://www.picokeys.com/pico-commissioner/



## 🧠 FIDO2-Befehle

```bash
fido2-token -L                # Zeigt verfügbare Geräte
fido2-token -I /dev/hidraw16  # Infos zum PicoKey
fido2-token -S /dev/hidraw16  # pin setzen
````

---

## 🌐 WebAuthn-Test

Teste deinen PicoKey unter [webauthn.io](https://webauthn.io):

1. Auf **Register** klicken und Benutzername anlegen
2. Seite in anderem Browser oder Inkognito-Modus öffnen
3. Auf **Authenticate** klicken und den Button am Pico drücken
4. Teste mit anderer Hardware – Zugriff wird verweigert

---


## Gespeicherte webauthn

`brave://settings/securityKeys`


