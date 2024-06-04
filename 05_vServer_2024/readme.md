# Test vServer mit Docker und verschiedenen Diensten

Dieses Projekt wurde erstellt, um einen Test vServer einzurichten, der Docker verwendet, um verschiedene Container-Dienste zu betreiben. Bitte beachte, dass dies nur zu Testzwecken dient und keine vollständige Konfiguration von Passwörtern oder Sicherheitseinstellungen vorgenommen wurde.

Im Folgenden findest du eine Liste der enthaltenen Dienste:

1. **Docker Installation**: Dieser Test vServer wurde mit Docker eingerichtet, um Container für verschiedene Dienste bereitzustellen.

2. **Node-RED**: Eine leistungsstarke Plattform für die Entwicklung von IoT-Anwendungen.

3. **Mosquitto**: Ein MQTT-Broker, der die Kommunikation zwischen IoT-Geräten ermöglicht.

4. **Nginx Reverse Proxy Manager**: Ein Werkzeug zur Verwaltung von Reverse-Proxies für verschiedene Dienste und Anwendungen.

5. **MariaDB**: Ein relationales Datenbankmanagementsystem.

6. **Adminer**: Ein webbasiertes Datenbankverwaltungstool für MariaDB.

7. **ip64.net**: DynDNS Service mit 3 kostenlosen Domains: https://ipv64.net/


> [!WARNING]  
> Bitte beachte, dass du alle notwendigen Sicherheitsmaßnahmen selbst ergreifen musst. Es wurden keine Sicherheitskonfiguration in diesem Testumfeld implementiert.

Viel Spaß beim Testen und Experimentieren mit diesen Diensten auf deinem vServer!

# Jetzt geht`s los

## Docker

```bash
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
```

```bash
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

```bash
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

```bash
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose
```

## Node-RED

```bash
docker volume create nodered_data
mkdir nodered
chown -R 1000:1000 nodered
cd nodered
mkdir nodered_data
chown -R 1000:1000 nodered_data
```

```bash
docker run -d \
    -p 1880:1880 \
    -v $PWD/nodered_data:/data \
    --name=nodered \
    --restart=unless-stopped \
    nodered/node-red:latest
```

## Mosquitto

mosquitto.conf zuerst anlegen

```bash
allow_anonymous true
listener 1883 0.0.0.0

persistence true
persistence_location /mosquitto/data/
log_dest file /mosquitto/log/mosquitto.log
```

```bash
docker run -it -d \
    -p 1883:1883 \
    -p 9001:9001 \
    -v $PWD/mosquitto.conf:/mosquitto/config/mosquitto.conf \
    -v $PWD/mosquitto_data:/mosquitto/data \
    -v $PWD/mosquitto_log:/mosquitto/log \
    --restart=always \
    --name=mosquitto-server \
    eclipse-mosquitto:latest
```

In Node-RED beim MQTT Node IP vom Server und Port 1883 ohne http eintragen

## NGINX Proxy Manger

https://ipv64.net/ für DynDNS

```bash
version: '3.8'
services:
  app:
    image: 'jc21/nginx-proxy-manager:latest'
    restart: unless-stopped
    ports:
      - '80:80'
      - '81:81'
      - '443:443'
    volumes:
      - ./data:/data
      - ./letsencrypt:/etc/letsencrypt
```
Erstanmeldung:
Email:    admin@example.com
Password: changeme

## Maria db

```bash
docker run -d \
    -p 3306:3306  \
    --name mdb \
    -e MARIADB_ROOT_PASSWORD=mysecretpassword \
	--restart=unless-stopped \
    -d mariadb:latest
```


```bash
docker run -d \
    --link mdb:db \
    -p 8080:8080 \
    --name adminer \
    --restart=unless-stopped \
    adminer:latest
```

Palette installieren unter Node-RED -> node-red-node-mysql
statt localhost wieder IP eintragen


## Beispiel Datenbank

```sql
SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

DROP TABLE IF EXISTS `myfriends`;
CREATE TABLE `myfriends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `age` int(11) NOT NULL,
  `favoritecolor` varchar(128) NOT NULL,
  `hobbies` varchar(128) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO myfriends (ID, name, age, favoritecolor, hobbies)
VALUES
(1, 'Chuck Norris', 80, 'Unendlich', 'Roundhouse Kicks'),
(2, 'Sheldon Cooper', 35, 'Blau', 'Physik, Comics'),
(3, 'Deadpool', 45, 'Rot', 'Sarcasm, Katzen'),
(4, 'Hermione Granger', 30, 'Lila', 'Zauberei, Lesen'),
(5, 'Tony Stark', 50, 'Rot und Gold', 'Iron Man-Anzüge');
``````

** https://links.pixeledi.eu **
