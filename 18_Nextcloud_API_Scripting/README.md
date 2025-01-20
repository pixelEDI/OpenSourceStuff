# Nextlcoud API Scripting

## Erste API tests

- App Token anlegen (ganz unten) falls 2FA aktiviert ist: https://deinenextcloud.eu/settings/user/security
- falls man zu viele fehlerhafte Loginversuche hat, kann man diese wie folgt rauslöschen: 
  - ` docker exec -it -u 33 nextcloud-aio-nextcloud php occ security:bruteforce:reset 171.65.12.11`
- Docs: https://deck.readthedocs.io/en/latest/API/#attachments

## Meine Commands aus dem Video:

```bash
curl -u admin:222-1111-3333-4444-5555 -X GET \
    'https://mynextcloud.ipv64.net/index.php/apps/deck/api/v1.1/boards' \
    -H "OCS-APIRequest: true"
```


```bash
curl -i -u admin:222-1111-3333-4444-5555  -X POST \
    'https://mynextcloud.ipv64.net/index.php/apps/deck/api/v1.1/boards/1/stacks/1/cards' \
    -H "OCS-APIRequest: true" \
    -H "Content-Type: application/json" \
    -d '{ 
        "title": "pixeledi abonnieren!!",
        "type": "plain",
        "order": 1,
        "description": "Ich kontrolliere das natürlich!!!!"
    }'
```


```bash
curl -i -u admin:222-1111-3333-4444-5555 -X POST \
    'https://mynextcloud.ipv64.net/index.php/apps/deck/api/v1.1/boards/1/stacks/1/cards/14/attachments' \
    -H "OCS-APIRequest: true" \
    -F "type=file" \
    -F "file=@/home/pixeledi/Downloads/iusearchbtw.png"
```
