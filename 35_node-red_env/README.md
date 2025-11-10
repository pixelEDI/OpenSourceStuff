# Node-RED mit .env Datei in Docker nutzen

Mit einer `.env` Datei kannst du sensible Daten wie Tokens oder Passwörter sicher an deinen Node-RED Container übergeben, ohne sie direkt in Flows zu speichern.

### 1. `.env` Datei anlegen

Erstelle im selben Ordner wie dein `docker-compose.yml` eine Datei namens `.env`:

```bash
MYSPECIALTOKEN=mein_geheimer_token
```

### 2. Docker Compose Beispiel

```yaml
version: '3.8'

services:
  nodered:
    image: nodered/node-red:latest
    restart: always
    container_name: nodered
    ports:
      - "1880:1880"
    environment:
      - MYSPECIALTOKEN=${TOKEN}
    volumes:
      - ./nodered_data:/data

volumes:
  nodered_data:
```

Damit wird die Variable `MYSPECIALTOKEN` beim Start an den Container übergeben.

### 3. Zugriff in Node-RED Function Node

```js
msg.mykeys = {
    key: env.get("MYSPECIALTOKEN")
}
return msg;
```

Die Variable steht über `env.get()` zur Verfügung.
Im **Debug-Tab** siehst du danach die Werte aus deiner `.env` Datei.

### 4. Testen

1. Flow importieren
2. Deploy klicken
3. Inject Node auslösen
4. Debug-Ausgabe prüfen

So kannst du Umgebungsvariablen sicher und einfach in Node-RED Docker Containern verwenden.

Video auf <https://youtube.com/@pixeledi>
