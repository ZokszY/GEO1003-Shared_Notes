## Indoor Positioning Technologies

### 1 - Introduction

Discussion is made regarding the bottleneck of global positioning in indoor environments. An overview into all present (2012) indoor location technologies is made.

Challenges of Indoor Positioning:

* Multi-path from signal reflection
* Non-Line-of-Sight conditions
* High attenuation, signal scattering
* Temporal change, people and environment

Suitability of indoor environment for location:

* Small areas
* No weather influences (Troposphere)


### 2 - Definition of Terms

#### Line of Sight (LoS)

Line-of-sight propagation happens when a signal can travel on the most direct path from an emitting source to a receiver.  These are required for technologies such as the time of arrival measurements. Obstacles indoors can introduce non-line-of-sight anomalies.

#### Received Signal Strength Indicator (RSSI)

RSSI values are Received Signal Strength (RSS) values averaged over a certain sampling period and are measured as a perceived power value $P_r$ with the units of decibels. Using the physical property of **attenuation**, the gradual loss of intensity over a spatial propagation, RSS can be used to determine a distance d to an emitting source, as the output power value $P_T$ is known.

$$P_r \propto P_T \frac{G_T G_R}{4 \pi d^p}$$

Attenuation is characterised by a path loss exponent $p$ which in free space is represented by a literature value $p = 2$, it is however heterogeneous in an indoor space. $P_T$ is the transmitted power by the at the emitter. In theory, by calculating multiple perceived distances $d$ from emitters to various receivers, position can be calculated via multi-lateration. This however this is subject to multi-path influences, introducing error.

#### Indoor Path Loss Model

The ITU Model for Indoor Attenuation takes into account how radio waves propagate indoors. It models the path loss $L$, relative to the distance $d$ between emitter and receiver. 
$$L=20 \log f+p \log d+c(k, f)-28$$
Here $f$ is the radio frequency and $c$ is an empirical floor loss penetration factor. $k$ is the number of floors between transmitter and receiver. 

### Measurement Principles

#### Time of Arrival (ToA) / Time of Flight (ToF)

This principle measures the absolute travel time of a signal from transmitter to receiver. A **euclidian distance** can be derived using the wave speed. 

**NOTE**: Mautz et. al. (Reader) argues that the propagation of the speed of light slows down inside materials. This however is absolutely not the case as the speed of light is a universal constant.

#### Time Difference of Arrival (TDoA)

In this methodology, the differences of ToA many measurements is taken into account. For this, the possibility of a receiver's clock bias is terminated as it is subtracted in processing. By using two known emitter locations, receiver can be located as accurate as a hyperboloid (3D surface). A location of a receiver can be determined in 3D from four emitters by intersection of three hyperboloids. The precondition for this investigation is the precise synchronisation of all emitters. 

#### Angle of Arrival (AoA)

This methodology aims to obtain the direction of an incident incoming wave signal. For this, directionally sensitive antennas are needed. By having sensors that are responsive to a specific direction in space, vector addition can be used to evaluate an angle of incidence (arrival).

#### Trilateration

Referring to a position determination from distance measurements, either in 2D or 3D. This can be applied to ToA, TDoA & RSSI measurements. This technique can be expanded towards **multilateration** in which more than the minimum amount of time measurements are used to compute a position.

### RFID

A Radio Frequency Identification system consists of an antenna which reads nearby active transceivers (transmit & receive) and passive tags on the radio wave part of the EM-spectrum. These transmit a unique tag ID. To position these tags in space the Cell of Origin (CoO) principle is used. A combination of ToA and AoA is used to pinpoint a location of an RFID tag. 

Active RFID sensors are equipped with batteries which interrogate active radio transceivers. They are more costly than their passive opponent but offer long detection ranges of 30m or more. Location detection accuracies on the meter level have been proven possible.

Passive receivers rely on inductive coupling of EM waves and do not require batteries. These rely on receiving enough information by a scanner in order to transmit codes back. They are less costly, but only function in ranges smaller than 2 meters as signals need to travel two ways. 

Applications of passive scanners include the identification of buried pipes as well as inventory control. 

Using RFID scanners for indoor locations implies either having permanent active RFID sensors casting information or scanners suitable to detect passive ones. Both require large capital cost of installation. 

### Inertial Navigation Systems (INS)

Using the pedestrian dead reckoning (PDR) approach, an INS, consisting of an inertial measurement unit (IMU) is combined with a processing unit for target location. AS IMU's are subject to uncertainty drift, they are combined with complementary sensors for correction. An IMU consists of accelerometers (acceleration), gyroscopes(angles) and magnometers (magnetic field). Knowing an initial position the IMU is used to track positions, even without further location measurements, of course obtaining measurement errors. These two measurement systems are used to continuously update each other while navigating an indoor space. The accuracy of fingerprinting methods (5m) can therefore be increased to the sub-meter level. 
