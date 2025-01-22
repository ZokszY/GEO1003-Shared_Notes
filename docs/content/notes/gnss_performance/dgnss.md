## **Differential GNSS (DGNSS)**

DGNSS improves navigation accuracy by calibrating **correlated range errors** using measurements from a **reference station** at a pre-surveyed location. However, **tracking errors, multipath effects, and NLOS reception errors** remain uncorrected since they are uncorrelated between locations.

### **How DGNSS Works**

* A **reference station** transmits correction data via a data link to a **nearby rover** (within 5–10 km).  
* **Key steps**:  
  1. **Baseline computation**: Differences in observations between the reference and rover are used to calculate the vector between them.  
  2. **Rover position**: Adding the baseline vector to the reference station's known coordinates gives the rover's position.

### **Local and Regional DGNSS**

#### **Local Area DGNSS (LADGNSS):**

* Corrections from a **single reference station** are transmitted to users (rovers) within the station's range.  
* User computes relative clock offsets and corrects errors for the selected satellites.

#### **Regional Area DGNSS (RADGNSS):**

* Enhances LADGNSS by using corrections from **multiple reference stations**.  
* Increases accuracy for wider regional coverage.

### **Wide Area DGNSS (WADGNSS)**

* Provides **meter-level accuracy** over large areas (e.g., continents or countries).  
* Uses **satellite broadcasts** for corrections instead of terrestrial or network-based transmissions.  
* **Corrections process**:  
  * **Reference stations** send pseudo-range and ionosphere delay measurements to a Master Control Station (MCS).  
  * The MCS computes corrections for satellite ephemeris, clock parameters, and ionosphere data, then broadcasts them via satellites.

### **Relative GNSS (RGNSS)**

* Focuses on accurate positioning **relative to a reference station** rather than absolute accuracy relative to Earth.  
* Computes the **baseline vector** by differencing pseudo-range measurements from the reference and rover.
