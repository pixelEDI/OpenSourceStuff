# Memos - Self-Hosted Notizen App mit Docker

> https://www.usememos.com/

Dieses Repository enthält die Anleitung zur Installation der Notizen-App **Memos** auf einem eigenen Server mit Docker und Docker Compose. Memos ist eine self-hosted Lösung zur Verwaltung von Notizen, die besonders für diejenigen geeignet ist, die ihre Daten lieber lokal halten möchten.

## Features:
- **Self-Hosted:** Alle Daten bleiben auf deinem Server, ohne in die Cloud hochgeladen zu werden.
- **Markdown Support:** Volle Unterstützung für Markdown, um deine Notizen zu formatieren.
- **Multi-User:** Unterstützung für mehrere Benutzer, ideal für Teams oder Organisationen.
- **Tags und Sortierung:** Notizen können nach Tags und Datum sortiert werden, um sie einfach zu finden.
- **To-Do Listen:** Unterstützung für Checklisten und To-Do-Listen.
- **Mobile und Tablet-Freundlich:** Die App ist für den Einsatz auf verschiedenen Endgeräten optimiert.

## Installation

1. **Docker und Docker Compose installieren:** Stelle sicher, dass Docker und Docker Compose auf deinem Server installiert sind.

2. **Docker Compose Datei erstellen:**
   Erstelle eine `docker-compose.yml` Datei mit folgendem Inhalt:
   
```yaml
services:
  memos:
    image: neosmemo/memos:stable
    container_name: memos
    volumes:
      - ./.memos/:/var/opt/memos
    ports:
      - 5230:5230
```

Weitere Installationsmöglichkeiten: https://www.usememos.com/docs

Viel Spaß beim Ausprobieren: https://links.pixeledi.eu
