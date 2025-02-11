# Node-RED Token Authentication

Dieses Projekt zeigt, wie man einen Bearer-Token in Node-RED implementiert, um REST APIs abzusichern. Es wird ein einfaches Beispiel verwendet, bei dem eine MySQL-Datenbank mit Sensordaten abgefragt und die Daten über einen HTTP-Endpunkt bereitgestellt werden. Nur berechtigte Benutzer mit einem gültigen Bearer-Token können auf diese API zugreifen.

Den Node-RED Flow findest unter `token_api_flow.json` im Repo.
1. Öffne Node-RED in deinem Browser.
2. Klicke auf das Menü oben rechts (drei horizontale Striche) und wähle **"Importieren"**.
3. Wähle **"Datei"** und lade die `token_api_flow.json` Datei hoch.
4. Klicke auf **"Importieren"**, um den Flow in dein Node-RED-Projekt einzufügen.
5. Der Flow wird jetzt in deinem Arbeitsbereich angezeigt und ist bereit zur Konfiguration und Nutzung.

## Schritte:

1. **Datenbank-Abfrage**: 
   - Es wird eine MySQL-Datenbank mit Sensordaten (z. B. CO2, Humidity, Temperature) genutzt.
   - Ein SQL-Statement wird ausgeführt, um den neuesten Datensatz basierend auf einem Timestamp zu erhalten.

2. **HTTP-Endpunkt erstellen**:
   - Ein HTTP-GET-Endpunkt wird in Node-RED eingerichtet, um die Sensordaten über eine URL verfügbar zu machen.
   - Der Endpunkt liefert einen Status-Code 200 bei erfolgreicher Abfrage.

3. **Token-Generierung**:
   - Ein Bearer-Token wird manuell generiert (z. B. mit OpenSSL oder UUID).
   - Dieses Token wird verwendet, um die Authentifizierung des API-Zugriffs zu prüfen.

4. **Token-Überprüfung**:
   - Eine zusätzliche Funktion wird erstellt, um das Token im HTTP-Request zu prüfen.
   - Wird ein gültiges Token übergeben, werden die Daten zurückgegeben. Bei einem ungültigen oder fehlenden Token wird ein Fehlercode (400 für ungültig, 401 für fehlend) zurückgegeben.

5. **Testen des Endpunkts**:
   - Der Endpunkt wird getestet, indem ein Curl-Befehl mit einem Bearer-Token gesendet wird.
   - Es werden unterschiedliche Fehlercodes getestet, je nachdem, ob das Token gültig oder ungültig ist.


## Beispiel-Token-Generierung

```bash
openssl rand -base64 32
```

Oder mit UUID:

```bash
uuidgen | tr -d '-'
```

Viel Spaß beim Ausprobieren: https:links.pixeledi.eu

