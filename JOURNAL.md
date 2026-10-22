---
title: "ESP32 Smart Energy Meter & Load Controller"
author: "Olajide Ayomide Evidence"
description: "Building an IoT smart energy meter and automated high-voltage load switcher from scratch."
created_at: "2026-10-19"
---

# October 19: Schematic design, ERC debugging, and footprint hunts

Spent a wild amount of time wiring up the AC mains input, HLK-PM01 power supply, and PZEM sensor module in KiCad. Ran into the classic KiCad ERC power flag warnings because it didn't trust my live feed, but figured out how to drop `PWR_FLAG` symbols to get a clean bill of health. Also had to swap out a few messy footprints so everything matches physical components. 

![Schematic Design](images/schematic-v1.png)

**Total time spent: 3.5 hours**

# October 20: PCB layout, board boundaries, and component placement

Moved over to the PCB editor today with the camera rolling for a build timelapse. Organized the board so the high-voltage AC mains stay strictly separated from the low-voltage DC logic zone for safety. Placed the screw terminals, fuse holder, and ESP32 headers so the ratlines cross as little as possible. Next up is routing those traces!

![PCB Layout](images/pcb-layout.png)

**Total time spent: 2.5 hours**

# October 22: Routing, ground pour, custom silkscreen, and Gerber export

Finished routing all the AC and DC traces today, keeping power tracks thick and pouring the ground plane on the DC section while leaving the AC side completely isolated. I Ran DRC and passed with a clean 0-error bill of health. 
Added my custom signature ("Built by Debug Ayo :)") and graphic to the silkscreen, checked everything in the 3D viewer, and generated the final manufacturing files (`production/SEM-V1_gerbers.zip`). 
So i am submitting now waiting for feedback :)

![3D PCB Render]images/pcb_3d.png)

**Total time spent: 4.0 hours**