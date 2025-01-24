## Fundamental Concepts and Overview

Notes from the chapter Introduction of the book "Principles of GNSS, Inertial, and Multisensor Integrated Navigation Systems" - Paul D. Groves

### Fundamental concepts

**Navigation** refers to determining and planning the movement of a body, such as a ship or aircraft, by calculating its position and course. It involves both the science of positioning and the planning of a course to avoid obstacles.

**Positioning** is a subset of navigation, involving the determination of a body’s position. Techniques can be classified based on:

1. **Real-time vs. postprocessed techniques**
2. **Fixed vs. movable objects** (static vs. mobile positioning)
3. **Self-positioning vs. remote positioning**

**Navigation systems** use various sensors, such as accelerometers and gyroscopes, to calculate position and velocity. The output is a **navigation solution**, typically including position and velocity, and sometimes attitude and acceleration. Systems may calculate 2D or 3D positions based on the application (e.g., cars vs. airplanes).

The **user** in navigation refers to the person or software that receives the position and velocity solution, and **user equipment** refers to the system located on the object being positioned.

Position and location are related but distinct concepts:

- **Position** is quantitative (coordinates).
- **Location** is qualitative (e.g., a city or room).

**Localization** is used instead of positioning particularly for short-range applications.

Two fundamental methods for determining position:

- **Position Fixing**: Uses identifiable external information such as radio signals, acoustic, ultrasounds etc or environmental features (signs, roads, terrain, landmarks, sounds smells).
- **Dead Reckoning**: Measures distance and direction traveled using a self-contained system, like an INS, without relying on external infrastructure. Environmental features can also assist dead reckoning by comparing repeated measurements.

### Dead Reckoning

Calculates current position by integrating changes in position or velocity from a previous location, requiring attitude information for accurate direction.

- 2D Navigation: Only a heading measurement is needed.
- 3D Navigation: Requires a full attitude measurement in three components.
- Accuracy: Smaller calculation steps enhance accuracy, particularly with changing attitudes.

Modern Methods: Include pedometers and advanced pedestrian dead reckoning using accelerometers.
Odometer: Measures distance through wheel rotations, used in vehicles and marine/aircraft equivalents.
Heading Measurement: Done using magnetic compasses, gyrocompasses, Land heading, roll and pitch (measured using accelerometers, tilt sensors, or celestial observations (sun, moon, stars)), and Gyroscopes and differential odometry.
Inertial Navigation Systems (INS): Use accelerometers, gyroscopes, and a navigation processor to calculate position, velocity, and attitude.

Performance:

- Navigation accuracy depends on sensor quality
- The principal advantages of inertial navigation and other dead-reckoning techniques, compared to position fixing, are continuous operation, a high update rate, low short-term noise, and the provision of attitude, angular rate, and acceleration as well as position and velocity.
- The main drawbacks are that the position solution must be initialized and the position error grows with time because the errors in successive distance and direction measurements accumulate.
- In an integrated navigation system, position-fixing measurements may be used to correct the dead-reckoning navigation solution and also calibrate the dead-reckoning sensor errors.

### Position Fixing

#### Position-Fixing Methods

There are five main methods: proximity, ranging, angular positioning, pattern matching, and Doppler positioning.

- **Proximity**:  
  Simplest method, assumes the receiver's position is the transmitter's or a nearby feature's. Accuracy improves with proximity to landmarks. Short-range signals like Bluetooth, RFID, or indoor features are ideal. Using multiple landmarks allows averaging of their positions.  
  **Containment** Intersection: A refined proximity method where containment zones around landmarks are defined. Observed landmarks localize the position to the intersection of these zones, with the center of the intersection as the position fix.

  ![Proximity positioning](../../../images/proximity-positioning.png){ width="500" }
- **Ranging**:  
  Measures distances to landmarks and defines circular lines of position (LOPs) based on these ranges. The user's position lies at the intersection of LOPs. At least two LOPs are needed; three resolve ambiguities. (Or prior information)  
  In three-dimensional positioning, each range measurement defines a spherical surface of position (SOP) centered at a landmark. The intersection of:  
  - Two SOPs forms a circular line of position (LOP).
  - Three SOPs intersects at two points, requiring additional information or a fourth SOP to determine a unique position fix.
  
  If the user and landmarks are coplanar, only planar position components can be determined, limiting vertical accuracy in terrestrial systems.  
  Range Measurement: based on signal time of flight (TOF), multiplied by the speed of light or sound. Accurate TOF measurement depends on transmitter-receiver time synchronization.
  - Two-way ranging (e.g., distance measuring equipment - DME) minimizes synchronization errors via bidirectional signal exchange.
  - One-way ranging (e.g., GNSS) requires synchronized transmitter clocks, treating receiver clock offset as an unknown. This technique is known as passive ranging and is how GNSS works. Additional transmitters or reference receivers can correct for clock offsets.
  - Where the landmark is an environmental feature, active sensors like radar, sonar, or laser transmit signals to a landmark, measure the reflected signal's round-trip time, and calculate the range.

  ![Positioning by ranging](../../../images/positioningbyranging.png){ width="500" }
- **Bearing**:  
  A bearing is the angle in the horizontal plane between the line of sight to an object and a reference direction (e.g., true or magnetic north).  
  Position Fixing with Bearings:
  - Two-Dimensional Positioning: Measuring the bearing to two known landmarks defines straight LOPs. Their intersection gives the user’s position. Without a reference direction, measuring the angle difference between two landmarks defines a curved LOP, requiring three landmarks for positioning.
  - Three-Dimensional Positioning: Extends by measuring the elevation angle (line of sight vs. horizontal plane) to one landmark. However, accuracy decreases with distance, and Earth's curvature affects measurements.

  ![Angular positioning](../../../images/angularpositioning.png){ width="400" }
- **Angle of Arrival (AOA)**:  
  Direction Finding: Uses steerable directional antennas to determine signal bearing.
  - Nonisotropic Transmissions: Broadcast signals with modulation varying by direction enable bearing and/or elevation determination. Examples include VHF omnidirectional radiorange (VOR) and Nokia HAIP (high-accuracy indoor positioning).
  - Environmental features can be measured using cameras, laser scanners, imaging radar, or multibeam sonar. The position of a feature in the sensor's image, combined with sensor orientation, determines its bearing and elevation.
- **Integrated Navigation System**:  
  Full position fixes are unnecessary; single measurements (e.g., range, bearing, or elevation of a landmark) can contribute to the navigation solution. For example, a two-dimensional position fix may be obtained by measuring the range and bearing of a single landmark as shown in Figure 1.10. Adding elevation provides a three-dimensional fix.
- **Landmark Identification**:  
  Signals are identified via demodulation, transmitter IDs, or frequency. Environmental features are matched with stored data, requiring distinctive features and approximate position inputs to limit the size of database that must be searched to obtain a match. Even so, positioning using environmental features is normally more processor intensive than signal-based positioning.
- **Pattern Matching**:  
  A database contains parameters varying by location (e.g., terrain height, signal strength, magnetic fields, GNSS obstructions).
  Measured values at the user’s position are compared with database values at candidate grid points. The best match determines the position.
  Interpolation refines results if several candidates match well. As with feature matching for landmark identification, the input of
  an approximate position solution limits the size of the database to be searched.  
  Combining multiple parameters into a **location signature** enhances uniqueness and accuracy.
  In some cases, such as terrain height, there is insufficient information to obtain an unambiguous position fix. However, if the navigation system is moving, measurements may be made at multiple positions,
  collectively known as a transect. Position fixing can be enhanced by this. Using dead reckoning to relate transect points allows measurements to form a location signature, compared with a database for positioning, requiring interpolation if spacing differs.
- **Doppler Positioning**:  
  Measures Doppler shift from relative transmitter-receiver motion to determine relative velocity and a conical surface of position (e.g., used in Iridium positioning).
- **Height Measurement**:  
  Barometric Altimeter: Uses pressure to estimate height or underwater depth.
  Radar Altimeter: Measures height above terrain for aircraft where terrain height is known.
- **Data and Databases**:  
  Position-fixing methods rely on data like landmark positions, feature info, and pattern-matching parameters. Databases may be preloaded but require updates and significant storage for large areas.
- **SLAM (simultaneous localization and mapping)**:  
  Allows systems to create and update its own landmark databases by exploring environments, observing features several times and and using dead reckoning to track traveled distances.
  
Many signal-based positioning systems include transmitter positions in their signals, but this can delay position computation after signal reception. A separate data link, known as assistance, can provide the necessary information on demand to reduce delays.
  
Position fixing is essential for determining absolute position, with errors independent of the distance traveled, but it depends on the availability of suitable signals or environmental features. To enhance position accuracy and availability, multiple position-fixing technologies or dead reckoning can be combined to bridge gaps.

#### Signal-Based Positioning

Signal-Based Positioning covers various navigation systems, from early radio-based methods to modern satellite and terrestrial systems.

- Early Radio Navigation: Radio navigation began in the 1920s, with Omega providing global coverage by the 1970s.
- Terrestrial Systems: Older systems like DME, VOR, and Loran provide long-range navigation, while newer methods use signals from mobile phones, Wi-Fi, Bluetooth, RFID, UWB, television, and broadcast radio for short-range positioning.
- Signal of Opportunity (SOOP): Some systems use signals like mobile phone or broadcast signals without operator cooperation, relying on calibration or reference stations.
- Underwater Navigation: Acoustic signals, such as ultrasound, are used for short-range underwater positioning.
- Satellite Navigation: GNSS systems (e.g., GPS, GLONASS, Galileo) provide global positioning, requiring at least four satellites for 3D fixes. GNSS offers high accuracy but is vulnerable to interference, jamming, and obstructions. Differential and carrier-phase techniques enhance accuracy, achieving meter to centimeter-level precision.
- GNSS vs Terrestrial Systems: GNSS offers global coverage and better accuracy, but is vulnerable to interference. Terrestrial systems like DME and enhanced Loran serve as backups, with short-range systems covering areas where GNSS signals are weak.
- Maximizing Positioning: Combining different signal types improves the robustness and availability of navigation solutions.

Overall, GNSS provides superior accuracy and global reach, while terrestrial and short-range systems fill gaps in environments where GNSS struggles.

![Range and accuracy](../../../images/rangeandaccuracy.png){ width="350" }

#### Environmental Feature Matching

- Natural Navigation: Humans and animals navigate using environmental features, often comparing them with maps, memory, or written directions.
- Static or Predictable Features: Features used for navigation must be either stationary or predictable in their movement.
- Historical Positioning: Historically, position fixes (LOPs) were made by manually identifying distant landmarks and using tools like a theodolite and compass.
- Modern Techniques: Image-based positioning techniques now automate the process, and devices like stereo cameras, radar, laser scanners, or sonar enable both angular positioning and ranging.
- Pattern Matching: Position can also be inferred directly from images through pattern-matching techniques.

Celestial Navigation:

- Using Sun, Moon, and Stars: Celestial bodies like the sun and stars have historically served as landmarks. For example, the sun's highest angle at the equinox equals the latitude.
- Star Navigation: The position can be determined by measuring the elevation angles of stars, and accurate time is required to calculate longitude. This has been practical since the 1760s, after advances in timekeeping by John Harrison.
- Modern Tools: Today, star imagers automate this celestial navigation process.

Terrain-Referenced Navigation (TRN):

- User Position from Terrain Height: TRN determines position based on the terrain height below the vehicle.
- Aircraft: Uses radar altimeters (radalt) or laser scanners to measure height above terrain, then compares it with the vehicle's height to determine the terrain height.
- Ship/Submarine: Sonar measures the depth of the terrain below.
- Land Vehicles: Inference of terrain height is made directly from their height solution.
- Pattern Matching: The vehicle's terrain measurements are compared with a terrain database to determine position.
- Accuracy and Limitations: Radalt-based navigation is accurate to about 50m, and works best over hilly or mountainous terrain. It is not effective over flat terrain.

Map-Matching Techniques:

- Constraints on Dead Reckoning: Land vehicles follow roads or rails, so map-matching uses this to constrain dead reckoning and correct positioning errors.
- Car Navigation: Map matching is crucial in car navigation, combining proximity and pattern-matching methods.
- Height Inference: Maps can also help infer terrain height from horizontal position.

Other Environmental Features:

- Magnetic/Gravity Anomalies & Pulsars: These can also be used for position fixing.
- Heterogeneous Feature Mix: A mix of different environmental features may be used to improve position determination.

Pattern Matching & Fault Detection:

- False Matches: Pattern matching may occasionally result in false or ambiguous position fixes.
- Fault Detection: It's important to implement fault detection and recovery techniques to address these potential errors.

### The Navigation System

Diverse Needs Across Applications: Navigation requirements differ significantly depending on the application. Factors include accuracy, update rate, reliability, budget, size, and mass. Some applications also require attitude solutions in addition to position and velocity.

#### Requirements

Navigation needs differ by application, with factors such as accuracy, reliability, and cost playing a role.

- High-Value Applications (e.g., airliners) need high integrity and reliability.
- Military systems must withstand electronic warfare and varying accuracy demands.
- Personal/Vehicle Navigation focuses on cost, size, and power consumption.
- Positioning systems may use custom infrastructure for high-value applications or general sensors for lower-value ones.

#### Context

The system adapts based on the environment (e.g., land, sea, air) and behavior of the vehicle or user. Context-sensitive factors like physical constraints (e.g., vehicles following roads), speed limits, and environmental conditions influence navigation performance. Context-adaptive navigation allows systems to adjust dynamically, such as moving from indoor to outdoor environments.

#### Integration

An integrated navigation system combines two or more navigation technologies, either position-fixing methods or a mix of position-fixing and dead reckoning.

Integration Types:

Measurement-Domain Integration:

Combines raw measurements (e.g. ranges, bearings) into a common position estimation algorithm.
Advantages:

- Allows systems to contribute even without enough data for an independent solution.
- Easier error characterization ensures optimal weighting.
  
Position-Domain Integration:

- Inputs position solutions directly from different systems.

Typical Architecture:

- Combines position-fixing (e.g. GNSS) with dead-reckoning systems (e.g. INS).
- Dead-reckoning provides a continuous navigation solution, while position-fixing corrects errors and calibrates dead-reckoning sensors.
- Corrections and calibration are managed by an estimation algorithm, typically a Kalman filter.

Benefits:

- Exploits complementary error characteristics of position-fixing and dead reckoning.
- Enhances robustness and accuracy of the integrated solution.

#### Aiding

Position-fixing and dead-reckoning systems can be aided using the integrated navigation solution or other positioning technologies.

Dead Reckoning Aiding:

- Requires initialization of position, velocity, and sometimes attitude.
- Integration algorithms provide periodic corrections to navigation solutions and sensor outputs.
- Estimated sensor errors can be fed back to improve accuracy.

Position-Fixing Aiding:

- Pattern-matching systems need an approximate position input to limit the search area and improve efficiency.
- Signal-based systems can use this approximate position to search for signals effectively.
- Tiered positioning: One system provides a coarse position, aiding another system in achieving higher precision.

Velocity Aiding:

- Used in transect-based techniques like Terrain-Referenced Navigation (TRN) to create a location signature by combining measurements from different positions.
- Enhances sensitivity in radio positioning systems and compensates for motion effects in two-way ranging systems.

#### Assistance and Cooperation

Assistance:

- Utilizes a separate communication link to provide navigation systems with information about signals and environmental features for positioning.
- Includes data on transmitter locations, signal characteristics, landmark identification, and pattern-matching information.
- Benefits include access to up-to-date data, reduced onboard storage needs, faster position fixes, and support in areas with poor signal reception.
- Assistance data is often provided by commercial services, like mobile operators, with potential subscription fees.

Cooperative Positioning:

- Involves direct data exchange between nearby users over short-range links (e.g., **collaborative** or **peer-to-peer** positioning ).
- Participants can include personnel, vehicle fleets, or public users, enabling cross-device cooperation (e.g., smartphone with a car or train).
- Shared data can include:
  - Signal quality and availability.
  - Transmitter clock offset and positions for signals of opportunity.
  - Positions and identification of environmental features.
  - Terrain height and calibration parameters.
  
Relative Positioning: Participants measure their positions relative to each other using proximity, ranging, or angular data. This is especially useful when there is insufficient information available to determine a stand-alone position solution.

#### Fault Detection

**Integrity monitoring** ensures a reliable navigation solution by detecting, isolating, and excluding faults in hardware or software. In safety-critical applications, such as aviation, formal integrity systems are essential to meet performance standards.
  