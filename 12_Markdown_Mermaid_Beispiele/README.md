## Markdown Mermaid 


### Links
- VS-Code Extension: https://marketplace.visualstudio.com/items?itemName=bierner.markdown-mermaid
- Mermaid Live via Browser: https://mermaid.live/edit
- Mermaid Syntax: https://mermaid.js.org/intro/getting-started.html

### Bsp. 1

```mermaid
graph LR
	YouTube --> pixeledi --> abonnieren
```
### Bsp. 2
```mermaid
graph TD
    subgraph youtube
        A[YouTube] --> B{suche guten Kanal}
        B --> C[gefunden] 
        B -->|nicht gefunden| F[pixeledi suchen]
    end

    subgraph user
        C --> D[abonnieren]
        F --> D
    end
```

### Bsp. 3
```mermaid
%% paste code in https://mermaid.live/
sequenceDiagram
    WiFi->>+WiFi: Connecting to WiFi
    WiFi->>+HTTP: Connected
    HTTP->>+HTTP: HTTP GET Request
    HTTP->>+JSON: On Response
    JSON->>+Sensor: Parse JSON & Publish BTC Price
    Sensor->>+Display: Update E-Paper
    Display->>+DeepSleep: Enter Deep Sleep
```    