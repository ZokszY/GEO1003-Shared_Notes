## PPP & RTK

### Abbreviations

- **SV**: space vehicles or orbiting space vehicles
- **RTK**: Real-Time Kinematic
- **PPP**: Precise Point Positioning
- **PPP-RTK**: Hybrid of PPP and RTK
- **CORS**: Continuously Operating Reference Station
- **NRTK**: Network RTK
- **OSR**: Observation State Representation
- **SSR**: State Space Representation

### PPP

- **PPP** achieves decimetre-level or better accuracy by leveraging corrections transmitted via satellite or the internet.
- It utilises the **SSR** message format for efficient data transmission.
- **PPP** is suitable for global applications due to its independence from regional base stations.
- The primary limitation of **PPP** is its long convergence time, typically ranging from 5 to 30 minutes.
- **PPP** primarily corrects for orbit errors, clock errors, and biases to achieve its positioning solution.
- **PPP** offers a trade-off between accuracy and coverage, providing moderate accuracy over a wide area.
- Variations like PPP-AR and A-PPP exist, offering enhanced accuracy or specialized capabilities.

### RTK

- **RTK** provides centimetre-level accuracy, achieving the highest precision among the discussed technologies.
- **RTK** relies on the **OSR** message format, which requires a two-way communication channel between the base station and the rover.
- The coverage area of **RTK** is limited to a short range (30-50 km) due to signal degradation with distance.
- **RTK** boasts a near-instantaneous convergence time, typically under 5 seconds.
- **RTK** corrects for various errors, including orbit errors, clock errors, bias, ionospheric delay, and tropospheric delay.
- **RTK** is widely adopted in applications demanding high accuracy within a limited area, such as surveying and agriculture.
- Developments like Network RTK (NRTK) address range limitations by incorporating networks of base stations.

### PPP-RTK

- **PPP-RTK** combines the strengths of PPP and RTK, offering high accuracy, global coverage, and fast convergence.
- **PPP-RTK** achieves centimetre-level accuracy comparable to RTK while offering global coverage.
- **PPP-RTK** employs the efficient **SSR** message format, enabling broadcast corrections and lower bandwidth requirements.
- **PPP-RTK** utilises a network of CORS stations for precise atmospheric and clock corrections.
- **PPP-RTK** converges significantly faster than PPP, typically within 1-10 minutes, and potentially seconds under ideal conditions.
- It effectively corrects for orbit errors, clock errors, bias, ionospheric delay, and tropospheric delay, allowing for integer ambiguity resolution.
- **PPP-RTK** gracefully degrades to standard PPP performance when outside the range of the CORS network.

### Comparing RTK, PPP, and PPP-RTK

| Feature                  | RTK                                                                         | PPP                                                     | PPP-RTK                                                                                                                                      |
| :----------------------- | :-------------------------------------------------------------------------- | :------------------------------------------------------ | :------------------------------------------------------------------------------------------------------------------------------------------- |
| **Accuracy**             | **cm-level** (up to 1 cm + 1 ppm)                                           | **dm-level or better** (less than 10 cm)                | **cm-level**, similar to RTK                                                                                                                 |
| **Coverage Area**        | **Limited range** (typically 30-50 km from the base station)                | **Global**                                              | **Global** with graceful degradation to standard PPP outside the range of the CORS network                                                   |
| **Message Format**       | **OSR** (Observation Space Representation)                                  | **SSR** (State Space Representation)                    | **SSR** (State Space Representation)                                                                                                         |
| **Transmission Channel** | **Two-way communication** between base station and rover                    | Corrections delivered via **satellite or the internet** | Corrections **broadcast to users**, enabling a large number of users to connect simultaneously                                               |
| **Convergence Time**     | **Near-instantaneous** (typically less than 5 seconds)                      | **Relatively long** (typically 5-30 minutes)            | **Fast** (typically 1-10 minutes, potentially within seconds under ideal conditions)                                                         |
| **Errors Solved**        | Orbit errors, clock errors, bias, **ionospheric delay, tropospheric delay** | Orbit errors, clock errors, bias                        | Orbit errors, clock errors, bias, **ionospheric delay, tropospheric delay**, enabling **integer ambiguity resolution**                       |
| **Key Strengths**        | High accuracy, very fast convergence time                                   | Global coverage, no reliance on local base stations     | High accuracy, fast convergence time, global coverage, lower bandwidth requirements compared to RTK, graceful degradation outside CORS range |
| **Key Limitations**      | Limited range, high bandwidth requirements, reliance on local base stations | Long convergence time, lower accuracy compared to RTK   | Still requires a CORS network (though less dense than RTK) and may degrade to standard PPP with increasing distance from CORS station        |

![difference in message format and resolved errors](../../../images/message-format.png){ width="500" }
