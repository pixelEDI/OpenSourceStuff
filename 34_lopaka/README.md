# Lopaka – DIY GUI für ESP32 Displays

**Lopaka** ist ein self-hosted No-Code-Tool zum Erstellen von Benutzeroberflächen für kleine Displays, etwa OLED- oder TFT-Screens am ESP32. Damit kannst du Layouts, Texte, Icons oder Statusanzeigen gestalten, ohne selbst Code zu schreiben.

## Installation mit Docker

```bash
git clone https://github.com/sbrin/lopaka.git
cd lopaka
docker build -t lopaka .
docker run -d -p 3000:80 lopaka
```

Danach erreichst du die Oberfläche im Browser unter
👉 **[http://localhost:3000](http://localhost:3000)**

## Nutzung mit Podman

Wenn du **Podman** statt Docker verwendest, musst du das Basis-Image im `Dockerfile` anpassen.

```dockerfile
FROM nginx:alpine
```

ersetzen durch

```dockerfile
FROM docker.io/library/nginx:alpine
```

Podman verlangt die vollständige Registry-Angabe (`docker.io`), falls in `registries.conf` keine Standard-Registry erlaubt ist. Danach funktioniert der Build auch mit Podman reibungslos.

## Beispielcode

Mein PlatformIO Beispiel ist mit in diesem Repo.
Video gibts unter: <https://youtube.com/@pixeledi>
