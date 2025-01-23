## Fundamental concepts and Overview

Notes from the chapter Introduction of Principles of GNSS, Inertial, and Miltisensor Integrated Navigation Systems - Paul D. Groves

### Fundamental concepts

**Navigation** refers to determining and planning the movement of a body, such as a ship or aircraft, by calculating its position and course. It involves both the science of positioning and the planning of a course to avoid obstacles.

**Positioning** is a subset of navigation, involving the determination of a body’s position. Techniques can be classified based on:

1. **Real-time vs. postprocessed techniques**
2. **Fixed vs. movable objects** (static vs. mobile positioning)
3. **Self-positioning vs. remote positioning**

Navigation systems use various sensors, such as accelerometers and gyroscopes, to calculate position and velocity. The output is a navigation solution, typically including position and velocity, and sometimes attitude and acceleration. Systems may calculate 2D or 3D positions based on the application (e.g., cars vs. airplanes).

Position and location are related but distinct concepts:

- **Position** is quantitative (coordinates).
- **Location** is qualitative (e.g., a city or room).
- **Localization** is used instead of positioning particularly for short-range applications.

Two fundamental methods for determining position:

- Position Fixing: Uses identifiable external information such as radio signals or environmental features.
- Dead Reckoning: Calculates position by measuring changes in velocity and integrating this data over time, using tools like odometers and gyroscopes.

### Dead Reckoning

Calculates current position by integrating changes in position or velocity from a previous location, requiring attitude information for accurate direction.

2D Navigation: Only a heading measurement is needed.
3D Navigation: Requires a full attitude measurement in three components.
Accuracy: Smaller calculation steps enhance accuracy, particularly with changing attitudes.
Modern Methods: Include pedometers and advanced pedestrian dead reckoning using accelerometers.
Odometer: Measures distance through wheel rotations, used in vehicles and marine/aircraft equivalents.
Heading Measurement: Done using magnetic compasses, gyrocompasses, or sensors for roll, pitch, and trajectory.
Inertial Navigation Systems (INS): Use accelerometers, gyroscopes, and processors to calculate position, velocity, and attitude.
Performance: Dead reckoning offers continuous operation and high update rates but suffers from growing position errors over time, corrected by position-fixing in integrated systems.

### Position Fixing Methods

Position fixing methods include:

- Proximity: Position is inferred from nearby landmarks.
- Ranging: Measures distances to landmarks, creating circular lines of position.
- Bearing: Measures angles between the user and landmarks.
- Pattern Matching: Compares environmental data with stored databases.
- Doppler Positioning: Measures Doppler shift to calculate position.

Other systems

- Barometric Altimeter: Estimates height or depth using pressure measurements.
- Radar Altimeter: Measures height above terrain, used in aircraft with known terrain height.
- Data and Databases: Rely on data like landmarks and patterns, requiring updates and large storage.
- SLAM: Enables systems to build and update landmark databases through exploration and dead reckoning.

Signal-Based Positioning includes:

- Satellite Navigation (GNSS, e.g., GPS), providing global positioning with high accuracy but vulnerable to interference.
- Terrestrial Systems: Radio signals for long-range or short-range positioning.
- Signal of Opportunity: Uses existing signals (e.g., mobile phone or broadcast signals).
- Acoustic, Ultrasound, and Optical Signals: Used for underwater or short-range positioning.

#### Environmental Feature Matching

Humans and animals use environmental features for navigation, and modern techniques leverage sensors like cameras, radar, and sonar to perform angular positioning or range measurements. Celestial navigation uses stars, the sun, and the moon to determine position, while Terrain-Referenced Navigation (TRN) uses terrain features, like radar altimeters or sonar, to measure height above terrain for position determination.

Map-Matching techniques are essential in land vehicles, where the movement along predefined paths (e.g., roads) is combined with dead reckoning to correct positioning errors.

Fault Detection is critical in pattern-matching techniques to avoid false position fixes and ensure reliable navigation.

### The Navigation System

The design of navigation systems varies based on the application context, integrating multiple technologies for optimal performance. Key aspects include communications links, fault detection, and collaboration between systems.

#### Requirements

Navigation needs differ by application, with factors such as accuracy, reliability, and cost playing a role.

- High-Value Applications (e.g., airliners) need high integrity and reliability.
- Military systems must withstand electronic warfare and varying accuracy demands.
- Personal/Vehicle Navigation focuses on cost, size, and power consumption.
- Positioning systems may use custom infrastructure for high-value applications or general sensors for lower-value ones.

#### Context

The system adapts based on the environment (e.g., land, sea, air) and behavior of the vehicle or user. Context-sensitive factors like physical constraints (e.g., vehicles following roads), speed limits, and environmental conditions influence navigation performance. Context-adaptive navigation allows systems to adjust dynamically, such as moving from indoor to outdoor environments.
1.4.3 Integration

Integrated navigation combines multiple technologies (e.g., GNSS and INS).

- Measurement-domain integration uses raw measurements in a common algorithm.
- Position-domain integration directly combines position solutions from different systems.
- Benefits include improved accuracy and robustness through complementary error characteristics, often managed by algorithms like Kalman filters.

#### Aiding

- Dead Reckoning Aiding: Periodic corrections to improve accuracy based on sensor errors.
- Position-Fixing Aiding: Coarse initial positions improve efficiency and precision in pattern-matching and signal-based systems.
- Velocity Aiding: Combines measurements to enhance accuracy in systems like Terrain-Referenced Navigation (TRN).

#### Assistance and Cooperation

- Assistance: External data (e.g., transmitter locations, environmental features) can aid navigation by reducing onboard storage needs and providing real-time updates.
- Cooperative Positioning: Data shared between nearby devices (e.g., vehicles, smartphones) enables relative positioning and enhances positioning accuracy, especially in signal-deprived environments.

#### Fault Detection

- **Integrity monitoring** ensures a reliable navigation solution by detecting, isolating, and excluding faults in hardware or software. In safety-critical applications, such as aviation, formal integrity systems are essential to meet performance standards.
