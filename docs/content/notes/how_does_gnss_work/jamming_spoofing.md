## Jamming and Spoofing
There are multiple mays a GNSS signal may be threatened, jamming and spoofing being intentional attacks.

### Jamming

By the time GNSS signals arrive at the antennas of a GNSS positioning system, the power level of these signals is very low.
This low power level makes the signals susceptible to interference from other signals transmitted in the GNSS frequency range.

Jamming is a special case of signal interference where an attacker tries to block the incoming GNSS signal to a specific person/area.

GNSS receivers can use several methods to protect against interference and jamming:

- Signal filtering
- Multiple navigation sensors. For short-term interference, other sensors can help the receiver bridge brief periods of GNSS outage.
- Multi-frequency/multi-constellation GNSS makes it much harder to jam a signal on multiple different frequencies at once.
- Anti-jam antennas use multiple antenna elements to control the amount of signal received from a particular direction. When an anti-jam system senses interference from a direction, it turns down the antenna gain for it.

### Spoofing

Unlike interference where GNSS is denied by overpowering the satellite signal, spoofing tricks the receiver into reporting an incorrect position.
Spoofing is done by first jamming the GNSS receiver and then providing a false satellite signal that is either created by a signal generator or is a rebroadcast of a pre-recorded GNSS signal.
Unlike interference, spoofing is always an intentional attack.

To protect against spoofing the same methods apply as against interference.
Additionally, one of the most effective ways to protect against spoofing is to track encrypted signals that are broadcast by several of the GNSS constellations.
Access to the encrypted signals is restricted and not available to all users.

### Signal blockage

The GNSS signal can be blocked by many objects like trees or buildings, especially in urban areas.
The main protection is again using multiple constellations and using additional sensors like an IMU.

### Constellation failure

Although it is extremely unlikely that an entire constellation will fail, receivers that can track more than one constellation protect against this unlikely scenario.
