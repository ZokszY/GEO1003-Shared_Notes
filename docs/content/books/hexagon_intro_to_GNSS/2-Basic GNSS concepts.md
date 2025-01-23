## 2 - Basic GNSS concepts

> pages 11-26 of Hexagon intro to GNSS

![Basic GNSS](../../../images/screenshots%20Hexagon%20book/Basic%20GNSS.png){ width="500" }

### STEP 1 - SATELLITES

- In short: GNSS satellites orbit the Earth. Satellites know their orbit ephemerides (parameters that define their orbit) and the time very, very accurately. Ground-based control stations adjust the satellites’ ephemerides and time, when necessary.
- Constellation = grouping of satellites in orbits that have been designed to provide a desired coverage (e.g. regional or global)
- Time is an important factor in GNSS systems: it is because the time it takes a GNSS signal to travel from satellites to receivers is used to determine distances (ranges) to satellites. Accuracy is required because radio waves travel at the speed of light. Small errors in time can result in large errors in calculating position.
- Multiple GNSS constellations enhance accuracy, redundancy, and availability, ensuring functionality during system failures or in obstructed areas like cities or forests.

#### Satellite orbits

- GNSS orbits are more or less circular, highly stable and predictable.
- Wind does not affect satellites, but gravitational effects and the pressure of solar radiation  do affect GNSS orbits a bit, and the orbits need to be occasionally corrected (while it is being adjusted, satellite’s status is changed to “out of service”, so user equipment knows not to use the affected signals)

![GPS frequency plan](../../../images/screenshots%20Hexagon%20book/GPS%20frequency%20plan.png){ width="500" }

- Frequency plans (plans that describe the frequency, amplitude and bandwidth of signals) are a little different for each GNSS system
- GPS uses a transmission scheme CDMA (Code Division Multiple Access, a spread spectrum method (meaning the signal is deliberately spread in the frequency domain resulting in a signal with a wider bandwidth))
- Satellite transmits signals on the same frequency, modulated with unique pseudo random codes (PRN) codes
- Receivers correlate with specific satellite signals using theses codes, even at low power levels
- CDMA is like understanding conversations in different languages in a noisy room
- GPS operates in a frequency band referred to as the L-band, a portion of the radio spectrum between 1 and 2 GHz. L-band is chosen because of:
  - Simplification of antenna design
  - Ionospheric delays are significant at lower frequencies
  - Speed of light is lower at lower frequencies (except in a vacuum). It is actually only that exact speed in a vacuum, but through air or any other medium it is slower
  - Coding scheme requires a high bandwidth, which was not available in every frequency band
  - The frequency band was chosen to minimize the effect that weather has on GPS signal propagation
- L1 transmits a navigation message, the coarse acquisition (C/A) code and an encrypted precision (P) code, called the P(Y) code. Navigation message is a low bit rate message that includes the following information:
  - GPS data and time
  - Satellite status and health
  - Satellite ephemeris data -> allows the receiver to calculate the satellite’s position
  - Almanac data contains info and status of all GPS satellites, so receivers know which satellites are available for tracking. Almanac consists of coarse orbit and status information for each satellite in the constellation

![GPS navigation message](../../../images/screenshots%20Hexagon%20book/GPS%20navigation%20message.png){ width="500" }

#### GPS transmission scheme is chosen for many good reasons

- GPS receivers can recover very weak signals using very small antennas. This keeps the receiver cost low
- Multi-frequency operations allows for ionospheric compensation, since ionospheric delays vary with frequency
- GPS system is resistant to jamming and interference
- Security: signals used by military applications are not accessible by civilians

#### Satellite errors

Satellite errors include ephemeris and clock errors.
Errors are very small,  but they can add up to significant errors in the position calculated by the receiver.

#### Satellite lifetimes

Do not last forever, sometimes they are phased out with newer models that have new signals or improved timekeeping.
If they fail, and can’t be restored, they will be permanently removed from service

#### Satellite corrections

Earth stations monitor and adjust GNSS satellites’ time and orbit for accuracy, taking satellites out of service if needed, while signals travel to Earth at the speed of light.

### STEP 2 - PROPAGATION

![GNSS signal propagation](../../../images/screenshots%20Hexagon%20book/GNSS%20signal%20propagation.png){ width="400" }

- In short: GNSS satellites regularly broadcast their ephemerides and time, as well as their status. GNSS radio signals pass through layers of the atmosphere to the user equipment.
- GNSS signal travel from satellites to receivers, passing through the atmosphere
- To obtain accurate position and time, we need to know the length of the direct path from the satellite to the user equipment (which we refer to as the “range” to the satellite). Radio waves do not travel in a straight path
- There is a bending, which increases the amount of time the signal takes to travel from the satellite to the receiver
- Errors in the propagation time increase or decrease the computed range to the satellite. Incidentally, since the computed range contains errors and is not exactly equal to the actual range,  we refer to it as a “pseudorange”
- The layer of the atmosphere that most influences the transmission of GPS (and other GNSS) signals is the ionosphere, the layer 50 to 1000 km above the Earth’s surface. It causes delays due to free electrons from the sun’s UV rays. Ionospheric delays are frequency-dependent, by calculating the range using two frequencies (such as L1 and L2), the receiver can resolve the effect of the ionosphere by comparing the propagation time between the two frequencies
- The troposphere, the Earth’s lower atmosphere, also causes delays, affected by temperature, pressure and humidity. Tropospheric delay cannot be eliminated like ionospheric delay but can be modeled for compensation
- Multipath propagation occurs when signals reflect off surfaces, causing delayed signals that can affect measurements
- Modern GNSS receivers are designed to track direct signals and ignore multipath signals

### STEP 3 - RECEPTION

![GNSS reception](../../../images/screenshots%20Hexagon%20book/GNSS%20reception.png){ width="500" }

- In short: GNSS user equipment receives the signals from multiple GNSS satellites and, for each satellite, recovers the information that was transmitted and determines the time of propagation (the time it takes the signals to travel from the satellite to the receiver).
- Receivers need at least four satellites to obtain a position. More satellites improve accuracy, but the receiver’s computational power may limit its ability to use additional signals
- The receiver tracks signals using PRN codes, which allow it to calculate the time of propagation by comparing the received signal with the satellite’s transmission time

![Determining time of propagation](../../../images/screenshots%20Hexagon%20book/Determining%20time%20of%20propagation.png){ width="500" }

- Antenna selection is crucial for optimal GNSS performance and must match the receiver’s capabilities and the intended application

#### Importance of antenna selection

- Constellation and signals: antenna must support the frequencies used by the GNSS constellations
- Antenna gain: determines the antenna’s ability to focus energy and affects the signal-to-noise ratio (C/No)
- Element gain: defines how efficient the antenna is at receiving signals
- Antenna beamwidth & gain roll-off: describes how gain changes with the elevation angle, affecting performance at different satellite positions
- Phase centre stability: the electrical phase center can shift, affecting accuracy. High precision applications require antennas with minimal phase center variations

![Plot of good and poor antenna phase centre variation over elevation angle](../../../images/screenshots%20Hexagon%20book/Plot%20of%20good%20and%20poor%20antenna%20phase%20centre%20variation%20over%20elevation%20angle.png){ width="400" }

- Application: the antenna must meet the performance, environmental and mechanical needs of the specific application, such as aviation or surveying

### STEP 4 - COMPUTATION

- In short: GNSS user equipment uses the recovered information to compute time and position.
- To calculate a position, GNSS receivers need signals from at least four satellites. The receiver calculates how long the satellite signal took to reach it, as follows:
- PROPAGATION TIME = Time Signal Reached Receiver - Time Signal Left Satellite
- Multiplying the speed of light to find the distance to each satellite, and uses trilateration to determine its location
- Trilateration = method of geometrically determining the position of an object in a manner similar to triangulation, the receiver calculates its position.
- In 2D, the receiver calculates its range to satellite A, placing it on a circle around that satellite. Adding a second satellite places the receiver at one of two intersections. A third satellite is needed to resolve the exact position.

![Ranging to first satellite](../../../images/screenshots%20Hexagon%20book/Ranging%20to%20first%20satellite.png){ width="300" }

![Ranging to second satellite](../../../images/screenshots%20Hexagon%20book/Ranging%20to%20second%20satellite.png){ width="500" }

- We do need four ranges instead of three. It turns out that receiver clocks are not nearly as accurate as the clock onboard the satellites. When we determine the range of two satellites, our computed position will be out by an amount proportional to the inaccuracy in our receiver clock.

![Position error](../../../images/screenshots%20Hexagon%20book/Position%20error.png){ width="350" }

- The receiver time inaccuracy causes range errors that result in position errors. The receiver knows there is an error: it just doesn’t know the size of the error. If we now compute the range to a third satellite, it doesn’t intersect the computed position

![Detecting position error](../../../images/screenshots%20Hexagon%20book/Detecting%20position%20error.png){ width="350" }

- The receiver knows the reason the pseudoranges to the the three satellites are not intersecting is because its clock is not very good. The receiver is programmed to advance or delay its clock until the pseudoranges ot the three satellites converge at a single point

![Convergence](../../../images/screenshots%20Hexagon%20book/Convergence.png){ width="250" }

- The incredible accuracy of the satellite clock has been “transferred” to the receiver clock, greatly reducing the receiver clock error in the position determination.

#### GNSS error sources

Various errors affect the accuracy of GNSS positioning, such as atmospheric delays, multipath interference, and satellite geometry. Methods for error correction are crucial for precision.

#### Dilution of precision (DOP)

- The geometry of the visible satellites affects accuracy. Poor satellite geometry (e.g. satellites clustered together) increases DOP, leading to less precise positioning. Good geometry (satellites spread out) reduces DOP and improves accuracy.

`INACCURACY OF COMPUTED POSITION = DOP x Inaccuracy of range measurement`

- If DOP is very high, the inaccuracy of the computed position will be much larger than the inaccuracy of the range measurement

![Dilution of precision (poor satellite geometry)](../../../images/screenshots%20Hexagon%20book/Dilution%20of%20precision%20%28poor%20satellite%20geometry%29.png){ width="450" }

![Dilution of precision (improved geometry)](../../../images/screenshots%20Hexagon%20book/Dilution%20of%20precision%20%28improved%20geometry%29.png){ width="450" }

Types of DOP:

- HDOP (Horizontal Dilution of Precision)
- VDOP (Vertical Dilution of Precision)
- PDOP (Position Dilution of Precision) DOP values impact accuracy, with high DOP leading to poor precision
Impact of satellite position: DOP values change with time of day and location. For example, in high-latitude areas or urban environments, low satellite positions can lead to poor DOP and lower positioning accuracy.

### STEP 5 - APPLICATION

- In short: GNSS user equipment provides the computed position and time to the end-user application for use in navigation, surveying, mapping and more.
- Range from basic navigation to high-precision solutions for surveying, military, and autonomous systems.
- GNSS is often combined with other sensors like inertial technology for enhanced reliability
