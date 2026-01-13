# llama.cpp mit AMD GPU (Vulkan Backend)

Dieses Repository enthält die Konfiguration und Dokumentation für llama.cpp mit Vulkan-Unterstützung für AMD GPUs unter Linux.


## 🎯 Vulkan vs ROCm

**Vulkan:** Universal, einfach, schnell für Inferenz ✅  
**ROCm:** Nur AMD, komplex, besser für Training ⚠️

**→ Für llama.cpp: Nutze Vulkan**

---

## 📦 Voraussetzungen

### System
- Linux (Ubuntu/Debian/Arch/etc.)
- AMD GPU mit Vulkan-Unterstützung
- Aktuelle GPU-Treiber (AMDGPU/Mesa)

### Packages installieren

**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install -y \
    cmake \
    build-essential \
    git \
    libvulkan-dev \
    vulkan-tools \
    mesa-vulkan-drivers
```

**Arch Linux:**
```bash
sudo pacman -S cmake base-devel git vulkan-headers vulkan-icd-loader mesa
```


### Vulkan-Unterstützung prüfen
```bash
vulkaninfo | less 
```
Du solltest deine AMD GPU sehen.

---

## 🔨 Installation & Build

### 1. Repository klonen (falls noch nicht vorhanden)
```bash
git clone https://github.com/ggerganov/llama.cpp.git .
```

### 2. Clean Build mit Vulkan
```bash
rm -rf build
cmake -B build -DGGML_VULKAN=ON
cmake --build build -j$(nproc)
```

**Build-Optionen:**
- `-DGGML_VULKAN=ON` - Aktiviert Vulkan-Backend für GPU-Beschleunigung
- `-j$(nproc)` - Nutzt alle CPU-Kerne für schnelleres Kompilieren

### 3. Build überprüfen
```bash
./build/bin/llama-cli --version
```

---

## 📥 Modelle herunterladen

### Empfohlene Modelle

#### Meta Llama 3.1 8B Instruct (Q4_K_M)
Gutes Allround-Modell, optimiert für Instruktionen.

```bash
mkdir -p models/llama
cd models/llama
wget https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/resolve/main/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf
```

**Direkter Link:**
https://huggingface.co/bartowski/Meta-Llama-3.1-8B-Instruct-GGUF/blob/main/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf

#### GPT-OSS 20B
Größeres, leistungsfähigeres Modell.

```bash
mkdir -p models/gpt-oss
cd models/gpt-oss
# Modell von hier herunterladen:
# https://huggingface.co/ggml-org/gpt-oss-20b-GGUF/tree/main
```

### Quantisierungsstufen erklärt

- **Q4_K_M**: Gutes Gleichgewicht zwischen Qualität und Geschwindigkeit (empfohlen)
- **Q5_K_M**: Bessere Qualität, etwas langsamer
- **Q8_0**: Höchste Qualität, deutlich größer und langsamer
- **Q2_K**: Sehr klein und schnell, niedrigere Qualität

---

## 🚀 Server starten

### Llama 3.1 8B Server
```bash
./build/bin/llama-server \
    -m /mnt/expansion/02_KI/07_llamacpp/models/llama/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf
```

**Server-Ausgabe:**
```
main: server is listening on http://127.0.0.1:8080 - starting the main loop
```

### Erweiterte Optionen
```bash
./build/bin/llama-server \
    -m models/llama/Meta-Llama-3.1-8B-Instruct-Q4_K_M.gguf \
    -c 4096 \           # Context-Größe
    -ngl 99 \           # GPU-Layers (99 = alle)
    --host 0.0.0.0 \    # Auf allen Interfaces lauschen
    --port 8080         # Port ändern
```

**Wichtige Parameter:**
- `-m` - Pfad zum Modell
- `-c` - Context-Länge (Standard: 2048)
- `-ngl` - Anzahl der Layers auf GPU (99 = alle verfügbaren)
- `--host` - Server-Adresse (0.0.0.0 für Netzwerkzugriff)
- `--port` - Server-Port


