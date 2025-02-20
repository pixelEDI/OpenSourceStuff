# Automatische SSH-Verbindung zu einem vServer

Dieses Repository enthält eine Anleitung, wie du einen V-Server bei Hetzner mietest, einen SSH-Key erstellst und eine SSH-Config anlegst, um dich bequem und sicher ohne Passwort mit deinem Server zu verbinden. Diese Anleitung kannst du auch für deinen Homeserver oder alternativen Hoster nutzen.

## Voraussetzungen
- Ein Linux-System (z.B. Linux Mint, Debian oder Ubuntu, oder noch besser ein Arch :)
- Ein vServer/Homeserver

## 1. SSH-Key generieren
Falls du noch keinen SSH-Ordner hast, erstelle ihn:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

Erstelle einen neuen SSH-Key:
Im Video habe nur 'ssh-keygen' verwendet. Eine Alterantive ist hier.
```bash
ssh-keygen -t rsa -b 4096 -f ~/.ssh/myvserver
```
Lasse die Passphrase leer oder setze eine für zusätzliche Sicherheit.

## 2. SSH-Key zu Hetzner hinzufügen
- Erstelle einen neuen vServer bei Hetzner. Ich verwende ein Debain System

- Kopiere den Public Key:
  ```bash
  cat ~/.ssh/myv-server.pub
  ```
- Füge den Key beim Erstellen des Servers unter "SSH Key hinzufügen" ein
- Server starten und IP-Adresse notieren

## 3. Verbindung mit dem Server
Nach dem Start kannst du dich mit folgendem Befehl verbinden:
```bash
ssh root@<server-ip>
```
Akzeptiere den Host-Fingerprint mit `yes`.

## 4. SSH-Config für einfachere Nutzung
Um den Zugriff zu erleichtern, erstelle oder editiere die Datei `~/.ssh/config`:
```bash
nano ~/.ssh/config
```
Füge folgende Zeilen hinzu:
```ini
Host myv-server
    HostName <server-ip>
    User root
```

Speichern mit `STRG+X`, `Y`, `Enter`.

Nun kannst du dich einfach mit folgendem Befehl verbinden:
```bash
ssh myvserver
```

## 5. Sicherheit erhöhen
Deaktiviere den Root-Login mit Passwort:
```bash
nano /etc/ssh/sshd_config
```
Ändere oder füge folgende Zeilen hinzu:
```ini
PasswordAuthentication no
PermitRootLogin prohibit-password
```
Speichern und SSH neu starten:
```bash
systemctl restart ssh
```

## 6. Notfallzugang
Falls du dich ausgesperrt hast, kannst du über die Hetzner Rescue-Konsole den SSH-Dienst wieder anpassen:
- Hetzner Cloud Interface → Server → "Rescue" starten
- Per Webkonsole einloggen

## Fazit
Mit dieser Methode kannst du sicher und komfortabel auf deinen V-Server zugreifen, ohne jedes Mal ein Passwort eingeben zu müssen.

## Hetzner Starguthaben
<https://hetzner.cloud/?ref=4CYeG01EJFye> (Affiliate Link)

Wenn du dich über diesen Link registrierst, bekommst du 20 € Startguthaben bei Hetzner.
