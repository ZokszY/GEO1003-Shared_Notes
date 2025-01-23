## 8 - Autonomy

> pages 73-83 of Hexagon intro to GNSS

This chapter will explore some of the technologies behind Autonomous Vehicles (AVs).

The level of automation is usually ranked on a scale of 0 (entirely human) to 5 (entirely autonomous).

![Levels of automation](../../../images/Levels%20of%20automation.png){ width="500" }

AV's rely on a combination of many sensors:

- LiDAR to provide a 360 degree depth view of the surrounding.
- Radar to detect objects that are too far to detect for the LiDAR aswell as detect movement.
- Cameras to detect and recognize objects like street-signs, road marking, and other vehicles.

AVs pretty much all use PPP combined with an IMU to determine the AV's position.

Combining the signals of all these different sensors can be tricky but if done right the sensors will compliment each other and reduce error overall.
In a modern vehicle, you can expect to find speed sensors on every wheel, yaw rate sensors, steering angle sensors, transmission settings, throttle and brakesensors.
All of them transmitting information to a highspeed data bus (Figure 54).
Combining these sensor outputs with an onboard IMU can provide a positioning solution with redundant measurements for velocity, turn rate and vehicle direction.

### Traditional positioning safety

Validating positioning data is critical for ensuring integrity, with standard deviation commonly used to measure accuracy.
GNSS positioning benefits from tightly clustered values and well-distributed satellites, allowing for reliable confidence ellipses like the 3-sigma model, which predicts 99.7% accuracy within a defined area.
However, non-Gaussian errors or biases like multipath can undermine this approach, requiring additional safeguards to address a wide range of potential failure scenarios.

### Autonomous positioning safety

For autonomous systems, protection levels provide a dynamic error bound to maintain safety, adapting to environmental changes like reduced satellite visibility.
These levels, visualized through tools like Stanford diagrams, help prevent errors exceeding safe limits.
Centralized processing supports protection level calculations and sensor integration, enhancing reliability and scalability in AV designs.

### Safety-critical design

AV development combines functional safety and cybersecurity to meet rigorous standards like ISO 26262 and ISO 21434.
Internal communication buses and external connections require robust safeguards against misuse or attacks.
By integrating safety and cybersecurity efforts early in the development process, AV systems can address potential risks, define safety goals, and ensure reliable operation under all conditions.
