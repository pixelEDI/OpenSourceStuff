# Alle Infos zum Video zu PartDB
> https://www.youtube.com/@pixeledi

## Links PartDB
https://docs.part-db.de/
https://github.com/Part-DB/Part-DB-server

## Installation mit Docker
https://docs.part-db.de/installation/installation_docker.html

```yaml
version: '3.3'
services:
  partdb:
    container_name: partdb
    # By default Part-DB will be running under Port 8080, you can change it here
    ports:
      - '8083:80'
    volumes:
      # By default
      - ./uploads:/var/www/html/uploads
      - ./public_media:/var/www/html/public/media
      - ./db:/var/www/html/var/db
    restart: unless-stopped
    image: jbtronics/part-db1:latest
    environment:
      # Put SQLite database in our mapped folder. You can configure some other kind of database here too.
      #- DATABASE_URL=mysql://pixeledi:ilikemariadb#1@mariadb:3306/partdb
      - DATABASE_URL=sqlite:///%kernel.project_dir%/var/db/app.db
      # In docker env logs will be redirected to stderr
      - APP_ENV=docker
      - TRUSTED_PROXIES=116.202.11.192
      - DEFAULT_URI=https://myparts.ipv64.net
      # You can configure Part-DB using environment variables
      # Below you can find the most essential ones predefined
      # However you can add add any other environment configuration you want here
      # See .env file for all available options or https://docs.part-db.de/configuration.html

      # The language to use serverwide as default (en, de, ru, etc.)
      - DEFAULT_LANG=de
      # The default timezone to use serverwide (e.g. Europe/Berlin)
      - DEFAULT_TIMEZONE=Europe/Berlin
      # The currency that is used inside the DB (and is assumed when no currency is set). This can not be changed later, so be sure to set it the currency used in your country
      - BASE_CURRENCY=EUR
      # The name of this installation. This will be shown as title in the browser and in the header of the website
      - INSTANCE_NAME=Part-DB

      # Allow users to download attachments to the server by providing an URL
      # This could be a potential security issue, as the user can retrieve any file the server has access to (via internet)
      - ALLOW_ATTACHMENT_DOWNLOADS=0
      # Use gravatars for user avatars, when user has no own avatar defined
      - USE_GRAVATAR=0
      - PROVIDER_MOUSER_KEY=e42e42-e42e42-e42e42-e42e42-e42e42
      # Override value if you want to show to show a given text on homepage.
      # When this is empty the content of config/banner.md is used as banner
      - BANNER=Welcome to pixelEDI Parts Dev-Edition
```

Nach dem ersten Start des Container braucht es noch folgenden Befehl für die DB.    
Achtung, hier wird am Schluss dann auch "admin" und dass "passwort" angezeigt  
` docker exec --user=www-data partdb php bin/console doctrine:migrations:migrate`
Ausgabe: [warning] The initial password for the "admin" user is: 1040acfe9a  

## NGINX Proxy Manager
Neuer Host mit IP vom Server und Port wie in docker-compose.
Bei mir: 8083

## Data Providers
https://docs.part-db.de/usage/information_provider_system.html#data-providers
Mouser API Key dann in docker-compose hinterlegen

## Dateitypen anlegen
Alle "Dateiendungen" hinterelgen, die man generell abspeichern möchte
* 3D-Files -> STL / Step
* Pinout -> pdf / jpg
* Avatare -> jpg
* Fritzing
* Image

## Notizen
Edit -> Notizen
Sobald ein Text eingeben wird, ist der Menüpunkt Notizen auch beim Bauteil sichtbar.

## Backup
https://docs.part-db.de/usage/backup_restore.html

Die folgenden Ordner beinhalten sämtliche Bauteildaten/Informationen.
* db
* public_media
* uploads

## Andere Umsetzungen
* https://www.heise.de/news/Jetzt-in-der-Make-5-23-Werkstatt-Organizer-mit-LEDs-9325043.html
* https://www.youtube.com/watch?v=7C4i-2IqSS4
