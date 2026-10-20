# ESP32 Smart Energy Meter & Load Controller

So, I got tired of manually toggling between grid power, generators, and inverters while completely guessing how much power everything was drawing. This project is my fix: a custom ESP32-powered smart energy meter that tracks live electrical data and handles automated safety cutoffs without blowing up.

## What This Board Does
- **Keeps things safe:** Uses an HLK-PM01 5V power supply backed up by a 1A fuse and a Metal Oxide Varistor (MOV) so voltage spikes don't fry the board.
- **Tracks the numbers:** Hooks up a PZEM-004T module with a CT clamp to measure real voltage, current, and power usage on the fly.
- **Switches heavy loads:** Uses an optoisolated 5V relay module to trigger a high-voltage AC contactor safely from low-voltage digital pins.
- **Maintains boundaries:** Designed the double-sided KiCad layout with a strict physical isolation gap keeping the spicy 220V AC mains completely away from the low-voltage DC logic.

## Stack & Hardware
- **Brain:** ESP32 DevKit V1 (Wi-Fi telemetry & logic)
- **CAD & Layout:** KiCad
- **Core Parts:** HLK-PM01, PZEM-004T, 5V relay module, Phoenix screw terminals
- **Code:** C++ (Arduino / PlatformIO)

## Repo Structure
- `/schematics` - KiCad schematic files.
- `/pcb` - Board layout files and Gerber exports.
- `/firmware` - ESP32 sensor logic and actuation code.
- `JOURNAL.md` - My actual build log and workflow notes.