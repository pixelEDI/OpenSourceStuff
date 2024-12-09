# Hugo install

Video: https://www.youtube.com/@pixeledi

- apt show hugo
  - vermutlich alte Version deshalb direkt via GitHub das .deb herunterladen
- https://github.com/gohugoio/hugo/releases
- Das heruntergeladene .deb installieren 
- Version checken: \`hugo version\`
- Themes: https://themes.gohugo.io/
  - https://stack.jimmycai.com/

## Neue Webiste anlegen mit:
```
hugo new site quickstart
cd quickstart
git init
```

submodule holen von theme zum Beispiel hier:

- stack.jimmycai.com
- Wie beschrieben das Thema via git Submodul laden
- Den git-Befehl direkt im Startverzeichnis ausführen. Die Theme wird utner /themes geladen
- git clone https://github.com/CaiJimmy/hugo-theme-stack/ themes/hugo-theme-stack
- dann in /themes die exmapleSite den content Ordner und das hugo.toml oder yaml ins Ausgangsverzeichnis kopieren
- hugo server zum lokalen testen

## erste Testseite:
`hugo new content content/posts/my-first-post.md`

# Caddy am vServer via Docker

compose.yaml

```
version: '3.8'

services:
  caddy:
    image: caddy:latest
    container_name: caddy
    volumes:
      - ./site:/usr/share/caddy
      - ./Caddyfile:/etc/caddy/Caddyfile
    ports:
      - "80:80"
      - "443:443"
    restart: unless-stopped
```

Caddyfile (ohne endung)

```
bestewebsite.ipv64.net {
    root * /usr/share/caddy
    file_server
}
```
