# Nextcloud All-in-One Installation 2025

Nextcloud All-in-One (AIO) ist eine vorkonfigurierte Version von Nextcloud, die alle wichtigen Anwendungen und Tools bereits integriert hat. Mit Nextcloud AIO bekommst du eine umfassende Cloud-Lösung, die keine weiteren Installationen oder großen Konfigurationsaufwände benötigt. Du kannst direkt loslegen, ohne die einzelnen Nextcloud-Apps manuell installieren und konfigurieren zu müssen.

In dieser Variante ist der ReverseProxy schon mitdabei und muss nicht extra installiert werden.


### Links

- https://github.com/nextcloud/all-in-one
- https://ipv64.net/

### Docker installieren via Script von Nextcloud

```bash
curl -fsSL https://get.docker.com | sudo sh
```

### Docker run

```
sudo docker run \
--init \
--sig-proxy=false \
--name nextcloud-aio-mastercontainer \
--restart always \
--publish 80:80 \
--publish 8080:8080 \
--publish 8443:8443 \
--volume nextcloud_aio_mastercontainer:/mnt/docker-aio-config \
--volume /var/run/docker.sock:/var/run/docker.sock:ro \
nextcloud/all-in-one:latest
```

Viel Spaß mit Nextcloud und eventuell interessieren dich auch meine Nextcloud Scripting Videos <https://www.youtube.com/watch?v=klb_1lUMATI>.
