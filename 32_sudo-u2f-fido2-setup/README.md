
# Absicherung von `sudo` mit Thetis / FIDO2 / U2F Key

Mit einem Hardware-Sicherheitsschlüssel (z. B. Thetis FIDO2) kannst du `sudo` unter Linux absichern.  
Die folgenden Schritte zeigen Installation, Key-Registrierung und Konfiguration für Debian und Arch.  

### Unterschied FIDO2 / U2F

U2F wurde ursprünglich nur als zweiter Faktor für Passwörter entwickelt, während FIDO2 zusätzlich passwortlose Logins ermöglicht. Beide sind gleich sicher, aber FIDO2 bringt mit WebAuthn und CTAP moderne Protokolle für plattformübergreifende Authentifizierung.
* PAM spricht aktuell nur **U2F**, auch wenn dein Stick FIDO2 kann.

Quellen: 
- [Debian Wiki – U2F](https://wiki.debian.org/Security/U2F)  
- [Arch Wiki – PAM](https://wiki.archlinux.org/title/PAM)  


- `pamu2fcfg` → registriert den Key und schreibt den Eintrag in deine `keys.txt`  
- `libpam-u2f` → PAM-Modul, das die Authentifizierung mit dem Key ermöglicht  
- `udev-Regel` → sorgt dafür, dass dein User den Key ohne Root-Rechte ansprechen darf  
- PAM-Dateien in `/etc/pam.d/` → steuern, wann und wie der Key abgefragt wird  


---

## Installation

### Debian
```bash
sudo apt-get install pamu2fcfg libpam-u2f
````

### Arch

```bash
sudo pacman -S libfido2 pam-u2f
```

---

## udev-Regel (USB-Zugriff)

```bash
echo 'KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0664", GROUP="plugdev"' | \
sudo tee /etc/udev/rules.d/thetisu2f.rules
```

Neues Terminal öffnen.

Die Regel erlaubt deinem Benutzer Zugriff auf den FIDO-Key:

* `hidraw` = Schnittstelle für HID-Geräte wie FIDO-Keys
* `MODE="0664"` = User/Gruppe dürfen lesen & schreiben
* `GROUP="plugdev"` = nur Nutzer in dieser Gruppe bekommen Zugriff


---

## Key registrieren

```bash
mkdir -p ~/.config/u2f_keys
pamu2fcfg > ~/.config/u2f_keys/keys.txt
chown pixeledi:pixeledi ~/.config/u2f_keys/keys.txt
chmod 600 ~/.config/u2f_keys/keys.txt
```


In der `keys.txt` steht:

```
<username>:<public_key>,<key_handle>,<options>
```

* **username** → für welchen User der Key gilt
* **public_key** → öffentlicher Teil des Schlüssels
* **key_handle** → Referenz, mit der der Stick seinen geheimen Schlüssel findet
* **options** → z. B. `+presence` = Button muss gedrückt werden



---

## PAM anpassen

```bash
cd /etc/pam.d/
sudo vim sudo
```

Datei könnte so aussehen

```sudo
#%PAM-1.0
auth            include         system-auth
account         include         system-auth
session         include         system-auth
```


an erster Stelle einfügen einfügen:

```
auth sufficient pam_u2f.so cue authfile=/home/pixeledi/.config/u2f_keys/keys.txt
```


* **sufficient** → Wenn der Key erfolgreich erkannt wird, reicht das aus. Wenn nicht, geht PAM zur nächsten Regel über (meist Passwort). → **kein Risiko, dich auszusperren**.

* **required** → Der Key muss erfolgreich erkannt werden. Scheitert das, schlägt der Login fehl, auch wenn du das Passwort kennst. → **sicherer, aber riskant ohne Backup-Key**.

---

## Test

Neues Terminal öffnen:

```bash
sudo echo
```

* Mit Key eingesteckt → kein Passwort nötig
* Key abgezogen → Passwort wird wieder abgefragt

