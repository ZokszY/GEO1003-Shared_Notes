## 5 - Resolving errors

In general, techniques to resolve errors can be described as follows:

1. Modelling of the phenomena that cause the errors and estimating the correction values.
2. Reducing or removing the error sources by differencing between receivers.

### Multi-frequency, multi-constellation

**Multi-frequency**  
Remove ionospheric error:

* Most effective way to remove ionospheric error from the position calculation.
* By comparing the delays of two GNSS signals, the receiver can correct for the impact of ionospheric errors.

Provide immunity to interference:

* Track different signals to ensure ongoing positioning when there is interference around a frequency band.

**Multi-constellation**  
Multi-constellation receiver can access signals from several constellations: GPS, GLONASS,BeiDou and Galileo.

* Reduced signal acquisition time
* Improved position and time accuracy
* Reduced problems caused by obstructions such as buildings and foliage
* Improved spatial distribution of visible satellites, resulting in improved dilution of precision

### Differential GNSS (DGNSS)

![DGNSS](../../../images/screenshots%20Hexagon%20book/image1.png){ width="500" }

In DGNSS, the position of base stations is determined to a high degree of accuracy using conventional surveying techniques. Then, the base station determines ranges to the GNSS satellites in view using:

* The code-based positioning technique
* The location of the satellites determined from the precisely known orbit ephemerides and satellite time

Principle:

1. The base station compares the surveyed position to the position calculated from the satellite ranges.
2. Differences between the positions can be attributed to satellite ephemeris and clock errors, and atmospheric delay.
3. The base station uses the difference between the calculated and surveyed position to generate a correction message which it sends to other receivers (rovers).
4. The rover receivers incorporate the corrections from the base station into their position calculations to improve position accuracy.

DGNSS works very well with maximum separations of up to tens of kilometres or miles, as the base stations and rovers are under similar atmospheric conditions.

### Satellite Based Augmentation System (SBAS)

For applications where the cost of a differential GNSS system is not justified, or if the rover stations are spread over too largean area, an SBAS may be more appropriate for enhancing position accuracy.

SBAS are geosynchronous satellite systems that provide services for improving:

* **Accuracy:** enhanced through the transmission of wide-area corrections for GNSS range errors
* **Integrity:** enhanced by the SBAS network quickly detecting satellite signal errors and sending alerts to receivers that they should not track the failed satellite
* **Signal availability:** improved if the SBAS transmits ranging signals from its satellites

Principle:

1. SBAS include reference stations, master stations, uplink stations and geosynchronous satellites.
2. Reference stations receive GNSS signals and forward them to the master station. Since their locations are accurately known, the master station can accurately calculate wide-area corrections.
3. Corrections are uplinked to the SBAS satellite and then broadcast to GNSS receivers.
4. User equipment receives the corrections and applies them to range calculations.

![SBAS](../../../images/screenshots%20Hexagon%20book/image2.png){ width="500" }

SBAS services:  
WAAS(US), EGNOS(Europ), BDSBAS(China), MSAS(Japan), GAGAN(India), SDCM(Rassia)

### Ground Based Augmentation System (GBAS)

* A GBAS provides differential corrections and satellite integrity monitoring to receivers using a very high frequency (VHF) radio link.
* Consists of several GNSS antennas placed at known locations, a central control system and a VHF radiotransmitter.
* GBAS covers a relatively small area(Airports)

### Precise Point Positioning (PPP)

The error sources impacting PPP are mitigated by modelling, estimating and applying external corrections:

* MODELLING: Some phenomena(the solid Earth tides, antenna phase wind-up andthe dry part of the tropospheric delay) can be modelled by well-established scientific models.
* ESTIMATING: Unknown components of the system (the receiver’s position, ionosphere delay, the residual troposphere delay, receiver biases andthe carrier phase ambiguities) are estimated using conventional estimation strategies.
* APPLYING EXTERNAL CORRECTIONS: PPP correction providers deliver corrections to account for satelliteclock, orbit and biases.
  * PPP service providers operate a network of ground reference stations to collect correction data for the different signals broadcast by each satellite.
  * The corrections are broadcast from geostationary satellites to the receivers.

### GNSS data post-processing

For many applications corrected GNSS positions are not required in real-time, instead, measurements are collected and stored for processing post-mission.

Advantages:

* Base station data can be used from one or more GNSS receivers: helps preserve high accuracy over large project areas
* Base station data can often be freely downloaded if the project’s proximity to a permanently operating GNSS network
* Post-processing applications offer a great deal of flexibility.
* Post-processing generally results in a more accurate, comprehensive solution than is possible in real‑time.

### Comparison of GNSS Positioning Technologies

#### DGNSS vs RTK

**Key Similarities:**

- Both require:
  - A **base station** at a known location.
  - A **rover receiver** to receive corrections.
  - A **communication link** between the base and rover.

**Key Differences:**

| Aspect | DGNSS | RTK |
| :---- | :---- | :---- |
| **Accuracy** | Lower (code-based method). | Higher (carrier phase method). |
| **Baseline Length** | Supports longer baselines. | Accuracy decreases with longer baselines. |
| **Cost** | Less expensive. | More expensive (advanced receivers). |
| **Setup Complexity** | Simpler to set up. | Requires precise base station setup. |

**Takeaway:**

- **DGNSS** is cost-effective for long baseline applications.
- **RTK** delivers superior accuracy for short baselines but is costlier and more complex.

#### SBAS vs PPP

**Key Similarities:**

- Both receive **corrections from satellites**.

**Key Differences:**

| Aspect | SBAS | PPP |
| :---- | :---- | :---- |
| **Accuracy** | Lower (code-based method). | Higher (carrier phase method). |
| **Correction Service** | Free, publicly available. | Subscription required (private service). |
| **Coverage** | Regional (depends on SBAS system). | Global availability. |
| **Equipment** | Requires only an SBAS-capable receiver. | Requires a PPP-compatible receiver and possibly L-Band support. |

**Takeaway:**

- **SBAS** is ideal for cost-free regional corrections.
- **PPP** offers higher accuracy and global coverage but requires paid services.

#### DGNSS vs SBAS

**Key Differences:**

| Aspect | DGNSS | SBAS |
| :---- | :---- | :---- |
| **Accuracy** | Similar accuracy. | Similar accuracy. |
| **System Setup** | Requires base station, rover, and communication link. | Only needs SBAS-compatible receiver and antenna. |
| **Ease of Use** | Requires additional setup for base station at a known location. | Simpler system configuration. |


**Takeaway:**

- **DGNSS** needs more equipment and setup but can offer localized corrections.
- **SBAS** is easier to deploy and maintain for regional corrections.

#### RTK vs PPP

**Key Differences:**

| Aspect | RTK | PPP |
| :---- | :---- | :---- |
| **Accuracy** | Higher, especially at short baselines. | Slightly lower. |
| **Initialization** | Quick initialization. | Longer convergence time. |
| **Setup Complexity** | Requires two receivers (base and rover), GNSS antennas, and communication link. | Requires a single receiver and a correction service subscription. |
| **Baseline Length** | Accuracy decreases with increasing baseline length. | Not affected by baseline length. |
| **Coverage** | Limited to the base station's range. | Global coverage. |
| **Cost** | Higher equipment cost and setup complexity. | Lower cost and simpler setup. |

**Takeaway:**

- **RTK** is best for high-accuracy, short-baseline applications.
- **PPP** is ideal for global, simplified positioning needs but requires longer initialization.
