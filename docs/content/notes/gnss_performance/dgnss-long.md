## Differential GNSS (DGNSS)

By comparing pseudo-range measurements with those made by equipment at a **pre-surveyed location**, known as a **reference station or base station**, the correlated range errors may be calibrated out.

* Improves the navigation solution accuracy
* The tracking, multipath, and Non-Line-of-Sight (NLOS) reception errors still exist (as it is uncorrelated between users at different locations).

### How does it work?

DGPS uses a data link to a **nearby base** or **reference station** (GPS receiver at an accurately known position). The errors affect both receivers **almost identically** if the distance between them is small enough (5-10km).

1. ​​From the differenced observations, the **baseline** (vector) between the two receivers can be computed through least-squares estimation.
2. The position of the rover is then obtained by adding the baseline vector to the accurately known coordinates of the reference station.

### Local and Regional Area DGNSS

In a local area DGNSS(LADGNSS) system, corrections are transmitted from a single reference station to mobile users, sometimes known as rovers, within the range of its transmitter.

* **Range corrections** are transmitted, allowing the user to select any combination of the satellites tracked by the reference station.
* The user’s navigation processor simply solves for the relative clock offset and **drift between the user and reference**, instead of the user receiver clock errors.

**Regional area DGNSS** (RADGNSS) enables LADGNSS users to obtain greater accuracy by using corrections from **multiple reference stations.**

### Wide Area DGNSS

A wide area DGNSS (WADGNSS) system aims to provide positioning to meter accuracy over a continent, such as Europe, or a large country, such as the United States.

* Using much fewer reference stations than LADGNSS or RADGNSS would require.
* The key difference is that **corrections** for the different error sources are **transmitted separately**.
* Uses **satellite broadcasts** to disseminate correction data as compared to terrestrial radio or network transmissions.

Corrections:

* 10 or more reference stations at known locations send pseudo-range and dual-frequency ionosphere delay measurements to a master control station (MCS).
* The MCS then computes corrections to the GNSS system broadcast ephemeris and satellite clock parameters, together with ionosphere data, which are transmitted to the users.

### Relative GNSS

Relative GNSS (RGNSS) is used where the user position must be known accurately with respect to the reference station, but the position accuracy with respect to the Earth is less important.

This relative position is known as a **baseline**. In RGNSS, the reference station transmits absolute pseudo-range measurements, which are then differenced with the user’s pseudo-range measurements.
