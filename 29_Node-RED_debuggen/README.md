# Debugging in Node-RED – So findest du Fehler schnell! 🐞

Es gibt verschiedene Methoden, um deine Flows zu debuggen und Fehler zu erkennen. Hier die wichtigsten:

### 1️⃣ Debug Node – Schneller Blick auf Nachrichten 🔍

Der Debug Node zeigt dir direkt im Debug-Fenster, welche Nachrichten durch deine Nodes laufen. Super, um zu sehen, was gerade passiert.

### 2️⃣ Catch Node – Fehler abfangen 🎣

Der Catch Node fängt alle Fehler auf, die im Flow auftreten. So kannst du gezielt sehen, wo Probleme entstehen, ohne jeden Node einzeln zu prüfen.

### 3️⃣ node.status – Status direkt am Node 💬

Mit `node.status()` kannst du Infos und Warnungen direkt unter dem Node anzeigen lassen. Das hilft dir, den Zustand deines Flows schnell zu überblicken.

```js
if (msg.payload > 100) {
  node.status({ fill: "red", shape: "ring", text: "Wert zu hoch!" });
} else {
  node.status({}); // Status löschen
}
return msg;
```

### 4️⃣ Warning & Error – Fehler melden 🚨

Schick Warnungen und Fehler in die Konsole oder Logs, damit du auch später noch siehst, was schiefgelaufen ist. Das ist besonders wichtig, wenn dein Flow produktiv läuft.

```js
if (!msg.payload) {
  node.warn("Keine Nutzlast vorhanden!");
  node.error("Payload fehlt komplett!", msg);
  return null;
}
return msg;
```

---

Mit diesen Methoden findest du Bugs schneller und hast deinen Flow besser im Griff! 😎

---
