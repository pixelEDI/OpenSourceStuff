# Nextcloud Talk CLI Script

Dieses Skript ermöglicht die Interaktion mit der Nextcloud Talk API über die Kommandozeile. Es bietet zwei Hauptfunktionen: das Abrufen der letzten Nachrichten aus einem Chatraum und das Senden von Nachrichten an denselben Chatraum.

## Funktionen

1. **Nachrichten senden:**  
   - Wenn das Skript mit einem Text-Argument aufgerufen wird, wird eine Nachricht an einen konfigurierten Nextcloud Talk-Chatraum gesendet.
   - Das Skript verwendet `curl`, um eine POST-Anfrage an die Nextcloud Talk API zu senden und überprüft den Erfolg der Nachrichtensendung.

2. **Nachrichten empfangen:**  
   - Ohne Argumente ruft das Skript die letzten Nachrichten aus dem Chatraum ab.
   - Es nutzt `curl`, um eine GET-Anfrage zu stellen und die Nachrichten nach Timestamp zu sortieren und auszugeben.

## Konfiguration

Stelle sicher, dass du eine `config.sh`-Datei im gleichen Verzeichnis wie das Skript hast, die folgende Variablen definiert:

- `NEXTCLOUD_URL`: Die URL deiner Nextcloud-Instanz
- `CONVERSATION_TOKEN`: Der Token des Gesprächs, auf das zugegriffen werden soll
- `USERNAME`: Dein Nextcloud-Benutzername
- `API_TOKEN`: Dein Nextcloud API-Token

## Verwendung

- **Nachrichten senden:**
  ```bash
  ./script.sh "Deine Nachricht"
  ```
 e
- **Letzte Nachrichten empfangen:**
  ```bash
  ./script.sh
  ```
## Automatische Ausführung alle 5 Sekunden mit `watch`

Diese Zeile führt das Skript `talk.sh` alle 5 Sekunden automatisch aus und ermöglicht es, die Nachrichten regelmäßig abzurufen oder zu senden.

- **`watch -n 5`**: Der Befehl `watch` wiederholt die Ausführung des angegebenen Befehls alle 5 Sekunden (`-n 5`).
- **`zsh -i -c`**: Startet eine interaktive Zsh-Shell und führt den angegebenen Befehl aus. Dies stellt sicher, dass alle Umgebungsvariablen und Konfigurationen korrekt geladen werden.
- **`./talk.sh`**: Dies ist das Skript, das ausgeführt wird.

Kurz gesagt, diese Zeile führt das Skript `talk.sh` alle 5 Sekunden aus und sorgt dafür, dass die Umgebungsvariablen und Konfigurationen korrekt genutzt werden.
