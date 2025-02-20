# Synchronisierung von ToDo-Listen zwischen Nextcloud und dem lokalen Desktop mit todoman und vdirsyncer

In diesem Tutorial geht es um eine praktische Lösung zur Verwaltung von To-Do-Listen, die sowohl in Nextcloud als auch lokal auf deinem Desktop synchronisiert werden. Die Idee ist, Aufgaben in Nextcloud zu verwalten und diese effizient mit einem einfachen Terminal-Interface (TUI) wie todoman und vdirsyncer zu steuern, um deine To-Dos bequem und ablenkungsfrei zu verwalten.

### Schritt 1: todoman installieren und einrichten

todoman ist ein einfaches, CalDAV-basiertes To-Do-Management-Tool, das es ermöglicht, Aufgaben, die in Nextcloud gespeichert sind, lokal zu verwalten. Du kannst es mit den folgenden Befehlen installieren:

- **Debian-basierte Systeme:**  
  ```bash
  sudo apt-get install todoman
  ```
- **Arch Linux:**  
  ```bash
  pacman -S todoman
  ```

Nachdem die Installation abgeschlossen ist, erstellen wir das Konfigurationsverzeichnis für todoman, um die Kalenderdateien zu speichern. Wir legen diesen Ordner unter `~/.local/share/calendars` an und konfigurieren die To-Do-Management-Einstellungen:

1. Erstelle die Konfigurationsdatei:
   ```bash
   nano ~/.config/todoman/config.py
   ```

2. Füge die folgenden Zeilen ein:
   ```
    # A glob expression which matches all directories relevant.
    path = "~/.local/share/calendars/*"
    date_format = "%d.%m.%y"
    time_format = "%H:%M"
    default_list = "Personal"
    default_due = 48
   ```

Speichere und schließe die Datei. Jetzt kannst du todoman starten, aber es sind noch keine Aufgaben synchronisiert.

### Schritt 2: vdirsyncer einrichten

Um die Aufgaben zwischen Nextcloud und deinem lokalen System zu synchronisieren, benötigen wir vdirsyncer, ein Tool zum Synchronisieren von CalDAV und CardDAV-Daten. Installiere es mit:

- **Debian-basierte Systeme:**  
  ```bash
  sudo apt-get install vdirsyncer
  ```
- **Arch Linux:**  
  ```bash
  pacman -S vdirsyncer
  ```

Erstelle jetzt ein weiteres Konfigurationsverzeichnis für vdirsyncer und richte die Synchronisierung ein:

1. Erstelle den Ordner:
   ```bash
   mkdir ~/.config/vdirsyncer
   ```

2. Erstelle die Konfigurationsdatei:
   ```bash
   vim ~/.config/vdirsyncer/config
   ```

3. Füge die folgenden Zeilen hinzu:
   ```bash
    [general]
    status_path = "~/.config/vdirsyncer/status/"

    [pair tasks]
    a = "nextcloud_tasks"
    b = "local_tasks"
    collections = ["esp32"]
    metadata = ["color"]
    conflict_resolution = "b wins"

    [storage nextcloud_tasks]
    type = "caldav"
    url = "https://yournc.de/remote.php/dav/calendars/deinuser/tasks/"
    username = "deinuser"
    password = "nextcloudapppasswort"

    [storage local_tasks]
    type = "filesystem"
    path = "~/.local/share/calendars"
    fileext = ".ics"
   ```

Nachdem die Konfigurationsdatei erstellt wurde, kannst du mit `vdirsyncer discover` die verfügbaren Kalender und Aufgaben erkennen.

### Schritt 3: Synchronisierung ausführen

1. Führe die Synchronisation aus:
   ```bash
   vdirsyncer sync nextcloud_tasks
   ```

2. Nach der ersten Synchronisation solltest du die Aufgaben, die du in Nextcloud erstellt hast, lokal in deinem `~/.local/share/calendars/ESP32/`-Ordner finden.

### Fazit

Mit dieser Methode kannst du deine To-Do-Listen sowohl in Nextcloud als auch lokal synchronisiert und ablenkungsfrei verwalten. Du kannst Aufgaben direkt im Terminal hinzufügen, bearbeiten und synchronisieren – ideal für produktive Tage ohne Ablenkungen.
