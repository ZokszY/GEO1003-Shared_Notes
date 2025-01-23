## 1 - Overview

> pages 3-10 of Hexagon intro to GNSS

![GNSS segments](../../../images/screenshots%20Hexagon%20book/GNSS%20segments.png)

GNSS (Global Navigation Satellite System) = collection of satellite positioning systems, called “constellations,” from various countries that are in operation or planned.
- GPS (United States)
- GLONASS (Russia)
- Galileo (European Union)
- BeiDou (China)
- NavIC (India)
- QZSS (Japan)

GNSS consists of 3 major components or segments: space segment, control segment and user segment.

### Space segment

Consists of GNSS satellites orbiting (far away, 19-36.000 km above Earth).
Each GNSS has its own constellation of satellites, arranged in orbits to provide the desired coverage.
Each satellite in a GNSS constellation broadcasts a signal identifying itself and providing its precise time, orbit location and system health status.

![GNSS satellite orbits](../../../images/screenshots%20Hexagon%20book/GNSS%20satellite%20orbits.png)

### Control segment

Comprises a ground-based network of master control stations as well as data uploading stations and monitor stations.
In case of GPS: control segment includes a master control station, an alternate master control station, 11 command and control antennas and 16 monitoring sites located throughout the world.
In each GNSS system, the master control station adjusts the satellites’ orbit parameters and onboard high-precision clocks when necessary to maintain accuracy.
Monitor stations monitor the satellite’s signals and status and relay this information to the master control station.
Master control station analyses the signals and transmits orbit and time corrections to the satellites through data uploading stations

### User segment

Consists of equipment that processes the received signals from the GNSS satellites and uses them to derive and apply location and time information.

### GNSS signals

Frequencies range from 1.17 to 1.61 GHz, higher than FM radio but lower than microwaves
Weakness: by the time GNSS signals reach the ground, they are very weak

### GNSS positioning

Based on a process called “trilateration” - determining position by measuring distances from three known points.

![trilateration](../../../images/screenshots%20Hexagon%20book/trilateration.png)

With a third distance, you can only be in one physical location.
Extension to satellites: replaces physical reference points with satellites to calculate precise locations.

### GNSS applications

Widely used in agriculture, transportation, autonomous vehicles, machine control, marine navigation, mobile devices, athletics,  and entertainment.
GNSS provides precise time synchronization for power grids, cellular systems, the internet, and financial networks.

### GNSS user equipment - components

![GNSS user equipment](../../../images/screenshots%20Hexagon%20book/GNSS%20user%20equipment.png)

GNSS antennas: Receive satellite signals; designs vary depending on applications (e.g. base stations, UAVs).
GNSS receivers: process signals recovered by the antenna to calculate position and time; available in various configurations for different needs.

### GNSS augmentation

Purpose: improves accuracy and availability beyond standalone GNSS (- a few meters).
Techniques: specialized methods and equipment enhance positioning accuracy for critical applications.
