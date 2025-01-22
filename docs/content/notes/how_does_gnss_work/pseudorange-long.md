## Pseudorange Measurement

Once the receiver is locked on to a satellite's spreading code, it will continue to track it by *continuously adjusting the time delay and Doppler offset* to keep the correlation at a maximum. The time delay is then used to calculate the **pseudorange** $p_{r,s}$ to the satellite, which is (theoretically) the travel time $\tau_{r,s}$ multiplied by the speed of light $c$:

$$
p_{r,s} = c \cdot \tau_{r,s} \; \text{where} \; \tau_{r,s} = t_{r} - t_{s}
$$

with:

* $t_{s}$: signal transmission time (from satellite s)
* $t_{r}$: time of signal arrival (determined by receiver clock)

There are then two situations:

* **Signal acquisition**: pseudo-range prediction unknown, receiver-generated spreading code searched until correlation peak is found
* **Signal tracking**: pseudo-range prediction known, only vary the receiver-generated code phase slightly

Perceived carrier frequency varies due to: **Doppler effect** and **receiver clock drift**.

A **GNSS navigation solution** is *4D* with three position dimensions and one time dimension. For any satellite, the pseudo-range measurement, corrected for satellite clock error (and other known errors):

$$
\rho(t_{s,a}) = \sqrt{(r_s(t_{s,t}) - r_a(t_{s,a}))^T \cdot (r_s(t_{s,t}) - r_a(t_{s,a}))} + \delta \rho(t_{s,a})
$$

with:

* $r_s(t_{s,t})$: satellite position at time of signal transmission
* $r_a(t_{s,a})$: user antenna position at time of signal arrival
* $\delta \rho(t_{s,a})$: receiver clock offset

See [Error Sources](../gnss_performance/error_sources.md) for more information on the errors in the pseudorange measurement.
