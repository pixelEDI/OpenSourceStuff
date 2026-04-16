# Velxio lokal starten

Repo: https://github.com/davidmonterocrespo24/velxio

Self-hosted Alternative zu Wokwi. Läuft komplett lokal ohne Cloud.

YouTube Video: [https://youtu.be/e4hyUGLcIZ8](https://youtu.be/e4hyUGLcIZ8)

## Start

```bash
docker run -d -p 3080:80 ghcr.io/davidmonterocrespo24/velxio:master
```

Dann im Browser öffnen
[http://localhost:3080](http://localhost:3080)

## Debug

```bash
docker ps
docker logs -f <container>
```

## Features

* läuft lokal ohne Cloud
* ESP32 Simulation im Browser
* Boards, Sensoren und Examples direkt verfügbar
* perfekt für schnelle Prototypen und Schulungen

