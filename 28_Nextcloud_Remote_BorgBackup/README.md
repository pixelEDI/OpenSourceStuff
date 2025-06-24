
# 🚀 Nextcloud Remote Backup

Mehr Sicherheit für deine Nextcloud-Daten – einfach und zuverlässig mit Borg!
Hier findest du eine schnelle Anleitung, um Remote-Backups einzurichten.

Doku: <https://nextcloud.com/blog/how-to-back-up-restore-nextcloud-remotely-using-borg/>

## 🔑 Option freischalten bei bestehendem Backup

Siehe Diskussions-Thread:
[Nextcloud All-in-One Backup Option](https://github.com/nextcloud/all-in-one/discussions/596#discussioncomment-10100355)

---

## 🖥️ Zielserver vorbereiten

### 1. User anlegen

```bash
sudo adduser makebackup
```

---

### 2. Borg installieren

```bash
sudo apt update
sudo apt install borgbackup
```

---

### 3. SSH-Key-Austausch

Nach dem ersten Backup-Versuch gibt Nextcloud den SSH-Key aus, den du auf dem Zielserver autorisieren musst.

Falls `.ssh`-Ordner noch nicht existiert, erstelle ihn:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

SSH-Key hinzufügen:

```bash
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQpJMqdyIrrzNLQ8YLQGR8Ce1q7jY2RyUPBEl7vfC6k root@5fa20ecd4800" >> ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
```

---

### 4. SSH-Server-Konfiguration prüfen

```bash
sudo vim /etc/ssh/sshd_config
```

* `PubkeyAuthentication yes` muss aktiviert sein
* `AuthorizedKeysFile` sollte auf `.ssh/authorized_keys` zeigen

SSH-Dienst neu starten:

```bash
sudo systemctl restart ssh
```

---

## ⚙️ Nextcloud Backup Einstellungen

* **Local Backup location:** leer lassen
* **Remote Borg Backup:**
  `ssh://makebackup@65.21.105.35/home/makebackup/backup`

---

No Backup, no Mercy! 💾🔥 Bleib sicher und verliere keine Daten!
