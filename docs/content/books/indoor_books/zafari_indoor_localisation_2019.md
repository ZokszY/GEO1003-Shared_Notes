## Localisation Techniques

### Received Signal Strength Indicator (RSSI)
- RSS: actual signal power strength recorded by the receiver, in decibel-milliwatts (dBm) or milliWatts(mW)
  - Inverse proportionality between RSSI and transmitter-receiver distance
- RSSI: RSS indicated in arbitrary units
- RSSI localisation uses trilateration with at least 3 transmitters
- Advantages:
  - Simple and cost-efficient due to low hardware requirements
- Disadvantages:
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

## Localisation Technologies

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
