# Nextcloud Notizen mit rclone via webdav synchronisieren

Meine Motivation dahinter ist, dass ich gerne am Terminal arbeite und meine Notizen in nvim verwalte. Doch möchte ich sie auch in der Cloud sichern, um jederzeit darauf zugreifen zu können. Dafür benutze ich Nextcloud und WebDAV als Schnittstelle.

WebDAV ist eine Erweiterung des HTTP-Protokolls, die es ermöglicht, Dateien über das Internet zu bearbeiten und zu speichern, ähnlich wie bei einem Dateimanager. Es stellt eine Schnittstelle für den Austausch von Dateien bereit.

Rclone ist ein Kommandozeilen-Tool, das mit verschiedenen Cloud-Speichern zusammenarbeitet, einschließlich Nextcloud über WebDAV. Es ermöglicht es uns, Dateien zu synchronisieren, ähnlich wie bei Git, aber ohne die Notwendigkeit einer grafischen Benutzeroberfläche.

 **Installiere Rclone**:
   - Lade Rclone herunter: `sudo apt-get install rclone` (für Linux)
   - `pacman -S rclone`

 **Rclone konfigurieren**:
   - Starte den Konfigurationsassistenten mit `rclone config`.
   - Erstelle eine neue Remote-Verbindung (mit `n` für neue Konfiguration).
   - Wähle WebDAV (Nummer 42) als Protokoll.
   - Gib die WebDAV-URL von Nextcloud ein (findest du unter Nextcloud > Einstellungen > WebDAV).
   - Gib deinen Nextcloud-Benutzernamen und das App-Passwort ein (erstelle ein App-Passwort in den Nextcloud-Einstellungen unter „Sicherheit“).
   
 **Konfiguration testen**:
   - Teste die Verbindung, indem du mit `rclone lsd Nextcloud-Notes:` den Inhalt des WebDAV-Ordners überprüfst.
   
 **Notizen erstellen und synchronisieren**:
   - Lege deine Notizen lokal an (z. B. in Markdown).
   - Synchronisiere sie mit Nextcloud, indem du die Befehle `rclone copy` oder `rclone sync` verwendest.

Beispiel `rclone.conf`

```
[nextcloud_notes]
type = webdav
url = https://deinenextcloudurl.de/remote.php/dav/files/deinuserinnextcloud/Notizen/
vendor = nextcloud
user = deinuserinnxtcloud
pass = nichtimklartext_sondern_via_rclone_configurator_eingeben
```

Nun lassen sich die Notizen synchronisieren:
- `rclone sync nextcloud_notes: zielpfad`
- `rclone sync quellpfadlokal - nextcloud_notes:`

## links
- https://github.com/rclone/rclone
- https://rclone.org/webdav/#nextcloud
