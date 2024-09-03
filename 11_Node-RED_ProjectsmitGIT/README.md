## Projects in Node-RED

Das dazugehörige Video findest du unter: www.youtube.com/@pixeledi

In Node-RED ermöglicht die "Projects"-Funktion die Verwaltung von Flows in Git-Repositories. Damit kannst du Änderungen in deinen Flows versionieren, vergleichen und bei Bedarf wiederherstellen. Die Integration mit Git erlaubt es, deine Projekte sowohl lokal als auch auf einem Remote-Server zu speichern und gemeinsam mit anderen zu bearbeiten. Über die Git-Verwaltung kannst du außerdem Branches erstellen, Merges durchführen und Commits verwalten. Dadurch bleibt der gesamte Entwicklungsprozess nachvollziehbar und gut organisiert.

Damit Git in Node-Red verfügbar ist müssen die Projects aktiviert werden : https://nodered.org/docs/user-guide/projects/

In der settings.js muss unter editorTheme die Projects auf true gesetzt werden:

```
 editorTheme: {
       projects: {
           enabled: true
       }
   },
```

Nach einem Node-RED Neustart sind die Projects und die Git-Verwaltung verfügbar.

Zuerst richtest du in Node-RED ein lokales Git-Repository ein, um die Versionierung deiner Projekte zu starten. Nachdem du einige Änderungen vorgenommen hast, erstellst du einen SSH-Key, um das Repository auf einen Remote-Server wie Gitea zu pushen. Du fügst den SSH-Key auf dem Server hinzu und klonst das Remote-Repository zurück auf deinen Rechner. Dabei überprüfst du, ob die verschlüsselten Credentials korrekt hinterlegt sind, indem du den Haken bei "Credentials encrypt" setzt. In einem Testfall richtest du einen MQTT-Node ein, bei dem du den Benutzer einträgst, aber das Passwortfeld leer lässt. Nach dem Commit des Projekts siehst du, dass die Anmeldedaten im Klartext im Git-Repository gespeichert wurden. Dieses Verhalten zeigt, dass ohne Verschlüsselung sensible Daten ungeschützt bleiben. Deshalb sollte die Verschlüsselung in Git-Repositories immer sichergestellt werden
