# SSH Hardware Keys (FIDO2 / -sk)

Dieses README zeigt, wie man mit `ssh-keygen` einen Hardware-gestützten SSH-Key (FIDO2) erstellt, überprüft und damit Dateien signiert.

> Video: <https://www.youtube.com/watch?v=lfsaiHEl4bU>

## Quellen:

- https://developers.yubico.com/SSH/Securing_SSH_with_FIDO2.html
- https://wiki.archlinux.org/title/SSH_keys#FIDO/U2F
- https://man.openbsd.org/ssh-keygen

---

## 1. Key erstellen

Mit einem FIDO2-Sicherheitstoken (z. B. YubiKey) kannst du einen SSH-Key erzeugen:

```bash
ssh-keygen -t ed25519-sk -O resident -O verify-required -f ~/.ssh/hardwarekey
````

* `-t ed25519-sk` → erstellt einen Hardware-Key (Secure Key)
* `-O resident` → Key wird im Token gespeichert, nicht nur als Handle-Datei
* `-O verify-required` → erzwingt PIN/Touch bei jeder Nutzung
* `-f` → Pfad zur Schlüsseldatei (die enthält nur Handle + Public Key)

Der eigentliche Private Key bleibt **immer im Token**.

---

## 2. Key prüfen

Den Typ und Fingerprint kannst du mit `-vvv` anzeigen lassen:

```bash
ssh-keygen -l -f ~/.ssh/hardwarekey -vvv
```

Beispielausgabe:

```
256 SHA256:jG1/jWJzn5LTTRoy+0wj7MJTS5viXNXVTRaOOtmpI1s pixeledi@debian (ED25519-SK)
```

* **ED25519-SK** → Hardware-Key (FIDO2)
* Datei enthält **nur Public Key + Handle**, nicht den echten Private Key
* Private Key bleibt im Token

---

## 3. Datei anlegen und signieren

Erstelle eine Datei:

```bash
echo "Hallo pixeledi" > text.md
```

Signiere die Datei mit deinem Hardware-Key:

```bash
ssh-keygen -Y sign -f ~/.ssh/hardwarekey -n file text.md
```

* erzeugt eine Signaturdatei `text.md.sig`
* der Token muss dabei gesteckt sein und ggf. PIN/Touch bestätigen

---

## 4. Signatur prüfen

Die Signatur kannst du mit dem passenden Public Key verifizieren:

```bash
ssh-keygen -Y verify -f ~/.ssh/hardwarekey.pub -n file -I signer < text.md.sig
```

* `-f ~/.ssh/hardwarekey.pub` → dein Public Key
* `-n file` → Namespace, muss identisch mit dem beim Signieren sein
* `-I signer` → Name/Bezeichner des Signierers (frei wählbar)
* `< text.md.sig` → nimmt die Signatur als Input

Wenn die Prüfung erfolgreich ist, wird die Signatur als gültig bestätigt.

---

✅ Damit kannst du Hardware-gestützte SSH-Keys nicht nur für Logins, sondern auch zum **Signieren und Verifizieren von Dateien** nutzen.
