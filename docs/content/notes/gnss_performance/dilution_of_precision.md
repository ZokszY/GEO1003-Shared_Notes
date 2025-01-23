## Dilution of Precision

The geometry of the visible satellites affects accuracy. Poor satellite geometry (e.g. satellites clustered together) increases DOP, leading to less precise positioning. Good geometry (satellites spread out) reduces DOP and improves accuracy.

$$
\text{Position Error} = \text{DOP}* \text{Range Error (UERE)}
$$

If DOP is very high, the inaccuracy of the computed position will be much larger than the inaccuracy of the range measurement.

DOP Formula:

$$
\sigma_{G} = \sqrt{\sigma_{E}^2 + \sigma_{N}^2 + \sigma_{U}^2 + \sigma_{T}^2} \\
$$

Where
- $\sigma_{G}$ is the GDOP (Geometric Dilution of Precision) value
- $\sigma_{E}^2$, $\sigma_{N}^2$, $\sigma_{U}^2$ are the East, North and Up variance components of receiver position estimate 
- $\sigma_{T}^2$ is Variance of receiver clock offset estimate

If DOP is very high, the inaccuracy of the computed position will be much larger than the inaccuracy of the range measurement

Types of DOP:
- GDOP (Geometric Dilution of Precision)
  - Amplifies pseudorange error of the position determination
  - $GDOP^2$ = $PDOP^2$ + $TDOP^2$
- PDOP (Position Dilution of Precision) - 3D uncertainty representation
  - $PDOP^2$ = $HDOP^2$ + $VDOP^2$ \
$\sigma_{P} = \sqrt{\sigma_{E}^2 + \sigma_{N}^2 + \sigma_{U}^2}$
- HDOP (Horizontal Dilution of Precision)  - 2D uncertainty representation \
$\sigma_{H} = \sqrt{\sigma_{E}^2 + \sigma_{N}^2}$
- VDOP (Vertical Dilution of Precision)
  - Typically, VDOP > HDOP because satellites 'below' the receiver cannot be acquired
  - This disparity increases with latitude due to less available satellites high in the sky
    - GPS constellation's orbit inclination is $55^o$
    - There will never be a GPS satellite directly overhead at latitudes $>55^o$ N/S
- TDOP (Time Dilution of Precision)

Assume only 4 satellites are being observed by a receiver. Maximising the tetrahedron formed by the 4 satellite points tends to minimize GDOP. \
Conversely, DOP can be infinitely large (eg: 999.0 in assignment) when receiver-satellite vectors lie in the same plane.
When this happens, the solution cannot distinguish between error in receiver clock and error in receiver position.
\
DOP values represent accuracy, with high DOP leading to poor precision. Impact of satellite position.
DOP values change with time of day and location. 
For example, in high-latitude areas or urban environments, poor satellite geometry can lead to high DOP and lower positioning accuracy.
