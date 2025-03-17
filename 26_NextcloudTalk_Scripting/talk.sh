#!/bin/bash
#        _          _          _ _
#  _ __ (_)_  _____| | ___  __| (_)
# | '_ \| \ \/ / _ \ |/ _ \/ _` | |
# | |_) | |>  <  __/ |  __/ (_| | |
# | .__/|_/_/\_\___|_|\___|\__,_|_|
# |_|
# https://links.pixeledi.eu
# Talk API | 03.2025
# Script Aufruf = fetch letzte Nachrichten
# Mit Text als Argument = sende Nachricht

source "$(dirname "$0")/config.sh"

send_message() {
    local message="$1"
    response=$(curl -s -X POST "${NEXTCLOUD_URL}/ocs/v2.php/apps/spreed/api/v1/chat/${CONVERSATION_TOKEN}" \
        -H "Accept: application/json" \
        -H "OCS-APIRequest: true" \
        -u "${USERNAME}:${API_TOKEN}" \
        -d "message=${message}" \
        -d "actorDisplayName=${USERNAME}")
    
    # Überprüfen, ob die Nachricht erfolgreich gesendet wurde
    if echo "$response" | jq -e '.ocs.meta.status == "ok"' > /dev/null; then
        echo "---Nachricht ist unterwegs---"
        # script selber aufrufen!
        exec "$0"
    else
        echo "Ooops Fehler beim Senden der Nachricht: $response"
    fi
}

receive_messages(){
response=$(curl -s -X GET "${NEXTCLOUD_URL}/ocs/v2.php/apps/spreed/api/v1/chat/${CONVERSATION_TOKEN}" \
  -H "Accept: application/json" \
  -H "OCS-APIRequest: true" \
  -u "${USERNAME}:${API_TOKEN}" \
  -G --data-urlencode "lookIntoFuture=0" \
  --data-urlencode "limit=10")

# echo "$response" 
 
# Nachrichten aus der Antwort extrahieren, nach Timestamp sortieren und formatieren
 echo "$response" | jq -r '.ocs.data | sort_by(.timestamp) | .[] | "\(.actorDisplayName): \(.message)"'
}

if [ $# -gt 0 ]; then
    send_message "$*"
else
  receive_messages
fi
