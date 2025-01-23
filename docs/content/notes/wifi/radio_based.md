## Radio-based Localisation Techniques

### Received Signal Strength (RSS)

RSSI values are Received Signal Strength (RSS) values averaged over a certain sampling period and are measured as a perceived power value $P_r$ with the units of decibels. Using the physical property of **attenuation**, the gradual loss of intensity over a spatial propagation, RSS can be used to determine a distance d to an emitting source, as the output power value $P_T$ is known. RSSI localisation uses trilateration with at least 3 transmitters.

$$P_r \propto P_T \frac{G_T G_R}{4 \pi d^p}$$

Attenuation is characterised by a path loss exponent $p$ which in free space is represented by a literature value $p = 2$, it is however heterogeneous in an indoor space. $P_T$ is the transmitted power by the at the emitter. In theory, by calculating multiple perceived distances $d$ from emitters to various receivers, position can be calculated via multi-lateration. This however this is subject to multi-path influences, introducing error.

Advantages:

- Simple and cost-efficient due to low hardware requirements

Disadvantages:

- Poor localization accuracy, especially in non-Line-of-Sight situations
- Additional signal attenuation from transmission through walls, obstacles, and multipath
- Potentially high fluctuation over time

### Channel State Information (CSI)

- Captures amplitude and phase response across different frequencies
- Higher granularity than RSSI, gives more information to reduce multipath and provide more consistent measurements
- Overall higher localisation accuracy than RSSI

### Fingerprinting/Scene Analysis

- Discrete estimation of user location based on grid
  - Delicate balance between size of grid (and corresponding resolution), and the signal variation error
  - Eg: impossible to estimate the correct point if the difference in RSSI values between each grid cell is less than the uncertainty range of the signal strength
- Offline phase: collect RSSI/CSI measurements to form a fingerprint map
- Online phase: compare real-time measurements with fingerprint map using algorithms:
  - Probabilistic method: use histogram/kernel to calculate probability of receiver being in $x$ grid of fingerprint map
  - Artificial Neural Network: train a neural network (eg: Multi-Layer Perceptron) and provide real-time input with weights
  - k-Nearest Neighbours: average nearest measurement patches to estimate the location
  - Support Vector Machine (SVM): machine learning method applicable to indoor localisation

### Angle of Arrival (AoA)

- Receiver's antennae array estimates the angle of transmitted signal by the time difference of arrival at individual parts of the array
- Advantages:
  - Receiver location can be estimated with just 3 transmitters in a 3D environment
  - Accurate estimation when transmitter-receiver distances are small
- Disadvantages:
  - Slight error in angle calculation translates to huge error in position determination
    - Thus not accurate at larger transmitter-receiver distances
  - Line of Sight for angle calculation is hard to obtain due to indoor multipath effects

### Time of Flight (ToF)

- Calculate physical transmitter-receiver distance using signal propagation time and speed of light
- Trilateration is used similar to RSSI to estimate position
- Requires strict time synchronisation between transmitter and receiver, such that timestamps may also be included in the signal
- Advantages:
  - High sampling rate and large signal bandwidth increases the resolution of the position estimation
- Disadvantages:
  - Highly sensitive to obstacles as they deflect the signals, resulting in a longer propagation time

### Time of Arrival (ToA)

This principle measures the absolute travel time of a signal from transmitter to receiver. A **euclidian distance** can be derived using the wave speed.

### Time Difference of Arrival (TDoA)

- Create hyperbolas between each pair of transmitters
- Intersection point of all hyperbolas represents the position estimate
  - Ie: solve the system of hyperbola equations for X,Y,Z
- Difference between TDoA and ToF
  - ToF uses absolute signal propagation time between each transmitter and receiver
  - TDoA uses the difference between these propagation times
    - Synchronisation is thus only necessary between transmitters (receiver error is common between transmitter pairs)

### Return Time of Flight (RToF)

- Measures the round-trip signal propagation time from transmitter to receiver, and response signal from receiver to transmitter
- Difference between RToF and ToF
  - Only moderate synchronisation between transmitter and receiver is required
  - All factors affecting ToF are worse in RToF due to twice the distance
  - Time delay in transmitting response signal (depending on the receiver's electronics) adds to position estimation error

### Phase of Arrival (PoA)

- Measures phase difference from transmission to reception
- Typically used in conjunction with other methods (RSSI, ToF, TDoA) to enhance localisation accuracy
- High accuracy is only achievable with direct line-of-sight

### Angle of Arrival (AOA)

This methodology aims to obtain the direction of an incident incoming wave signal. For this, directionally sensitive antennas are needed. By having sensors that are responsive to a specific direction in space, vector addition can be used to evaluate an angle of incidence (arrival).

### Path-Loss

The ITU Model for Indoor Attenuation takes into account how radio waves propagate indoors. It models the path loss $L$, relative to the distance $d$ between emitter and receiver.
$$L=20 \log f+p \log d+c(k, f)-28$$
Here $f$ is the radio frequency and $c$ is an empirical floor loss penetration factor. $k$ is the number of floors between transmitter and receiver.

### Fine Timing Measurement (FTM)

### Radio Frequency Identification (RFID)

A Radio Frequency Identification system consists of an antenna which reads nearby active transceivers (transmit & receive) and passive tags on the radio wave part of the EM-spectrum. These transmit a unique tag ID. To position these tags in space the Cell of Origin (CoO) principle is used. A combination of ToA and AoA is used to pinpoint a location of an RFID tag.

Active RFID sensors are equipped with batteries which interrogate active radio transceivers. They are more costly than their passive opponent but offer long detection ranges of 30m or more. Location detection accuracies on the meter level have been proven possible.

Passive receivers rely on inductive coupling of EM waves and do not require batteries. These rely on receiving enough information by a scanner in order to transmit codes back. They are less costly, but only function in ranges smaller than 2 meters as signals need to travel two ways.

Applications of passive scanners include the identification of buried pipes as well as inventory control.

Using RFID scanners for indoor locations implies either having permanent active RFID sensors casting information or scanners suitable to detect passive ones. Both require large capital cost of installation.

### Comparison

| Technology                                    |  Range | Advantages                                                                | Disadvantages                                                                           |
|-----------------------------------------------|:------:|---------------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| Wifi 802.11 n/ac/ad                           |   35m  | Widely available<br>High accuracy<br>Existing infrastructure              | Sensitive to noise<br>Complex processing algorithms needed                              |
| Wifi 802.11 ah (new)                          |   1km  | High coverage range<br>Low power consumption                              | New technology, not yet tested for indoor environments                                  |
| Ultrawide Band (UWB)                          | 10-20m | Immune to interference<br>High accuracy                                   | Short Range<br>Additional hardware<br>High cost                                         |
| Radio Frequency Indentification Device (RFID) |  200m  | Low power consumption<br>High coverage range                              | Low accuracy                                                                            |
| Bluetooth                                     |  100m  | High throughput <br>High coverage range<br>Low power consumption          | Low accuracy<br>Sensitive to noise                                                      |
| Ultrasound                                    |  <20m  | Less absorption from obstacles                                            | High dependence on sensor placement                                                     |
| Acoustics                                     |   <2m  | High accuracy                                                             | Niche applications<br>Sensitive to sound pollution<br>Additional hardware/anchor points |
| Visible Light (LEDs)                          |  1.4km | Widely available<br>High potential (with AoA technique)<br>Multipath-free | Requires Line-of-Sight<br>Higher power consumption                                      |
