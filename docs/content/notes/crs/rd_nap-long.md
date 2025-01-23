## RDNAP

### 0. Coordinate Systems

Official 3D coordinate system of the Netherlands and Europe: European Terrestrial Reference System 1989 (ETRS89).
ETRS89 is linked to the International Terrestrial Reference System (ITRS) by a time-dependant coordinate transformation.
National coordinate systems in Europe are linked to ETRS89.

#### Rijksdriehoeksmeting (RD)

Coordinates in the Dutch **Stelsel van de Rijksdriehoeksmeting (RD)** are the most-frequently used 2D coordinates on land and internal waters.
RD coordinates are defined by the official transformation from ETRS89 coordinates.
Maintaining reference points for ETRS89 and the transformation to RD coordinates are legal responsibilities of Kadaster.

The **Stelsel van de Rijksdriehoeksmeting (RD)** was created using triangulation from church spires and stone markers (historical). It has no time dependence; the differences are <1cm since 2000. It uses one EPSG-code (EPSG:28992 (RD New) for 2D and EPSG:7415 for compound CRS with NAP). The RD projection has its origin in Amersfoort in the middle of the Netherlands, it uses conformal stereographic projection (angles are preserved) and the north of the map is not equal to the true north. Unlike what you might think, the highest accuracy is not in Amersfoort itself, but rather in a circle ~100km around it.

![RDNAP diagram](../../../images/RDNAP.png){ width="600" }

To prevent confusion between the x-coordinates and y-coordinates, and to obtain always positive coordinates, the origin of the coordinates was shifted 155 km to the West and 463 km to the South (**False Easting and Northing**). This resulted in only positive x- and y-coordinates, where the y-coordinates are always larger than the x-coordinates.

#### Normaal Amsterdams Peil (NAP)

The national height system on land and internal waters in the Netherlands is called **Normaal Amsterdams Peil (NAP)** and is based on the average summer flood in 1683-1684. Maintenance is based on point stability and it uses the NLGEO2018 geoid for GNSS measurements. Ellipsoidal heights in ETRS89 can be transformed with the quasi-geoid model to NAP with a precision higher than ETRS89 coordinates obtained with most GNSS measurements.
Values range between 39.1 – 48.7m. The NAP is a legal responsibility of Rijkswaterstaat

For parts of the Noordzee however, the NAP cannot be used. Instead, they use the **Lowest Astronomical Tide** (LAT), which is the water depth in Worst-case astronomical conditions and average meteorological conditions.

### 1. Coordinate transformation

The official coordinate transformation between European ETRS89 coordinates and Dutch coordinates in RD and NAP is called RDNAPTRANS™.
It uses a Datum transformation and a correction grid (see fig.) in combination with the map projection to transform the values. The height of the transformation is determined by a quasi-geoid.

![NTv2 transformation procedure used by RDNAPTRANS™2018](../../../images/RDNAPTRANS.png){ width="600" }

Below are the errors of the RDNAPTRANS:

![Errors of RDNAPTRANS™](../../../images/RDNAPTRANS_errors.png){ width="300" }

The recommended ETRS89 realisation is ETRF2000 at epoch 2010.50 (AGRS2010). When using RDNAPTRANS™2018 it is important to use this realisation and epoch, especially for the height. For applications demanding high accuracy, it is recommended to obtain the NAP height of the point of interest by levelling to nearby NAP benchmarks.

![Figure 1.2.2](../../../images/Steps_transformation_procedure.png){ width="600" }

There are two variants for the implementation of the horizontal component of RDNAPTRANS™2018 and two variants for the vertical component (figure called Figure 1.2.2).

Implementation variant 1 applies the datum transformation as a separate step using a 3D similarity transformation.
The advantage of implementation variant 1 is that it has no strict bounds for the area where horizontal coordinates can be transformed correctly. The disadvantage is that many software packages do not support implementation variant 1 for the horizontal component.

Implementation variant 2 includes the datum transformation in the correction grid and uses a different quasi-geoid grid for the height transformation. Implementation variant 2 for the horizontal component is supported by more software but can only be used within the bounds of the correction grid (Figure 1.1.1). The difference in the resulting coordinates between the two variants is well below 0.0010 m within the bounds of the RDNAPTRANS™2018 grids.

### 2. Transformation from ETRS89 to RD and NAP

#### 2.1 Notation in degrees, minutes and seconds

ETRS89 coordinates are commonly expressed in ellipsoidal geographic coordinates latitude, longitude and ellipsoidal height.

#### 2.2 Datum transformation

##### 2.2.1 Conversion to geocentric Cartesian coordinates

Variant 1 - The ellipsoidal geographic ETRS89 coordinates of a point of interest must be converted to geocentric Cartesian ETRS89 coordinates to be able to apply a 3D similarity transformation. (Formula 2.2.1)
Variant 2 - the datum transformation (Section 2.2.1, 2.2.2 and 2.2.3) is included in the correction grid (Section 2.3).

A fixed ellipsoidal height is used instead of the actual height of the point of interest.
As a result, points with the same latitude and longitude in ETRS89 that differ in height get exactly the same RD coordinates.
This enables 2D transformation between ETRS89 and RD and straightforward implementation in software like GIS packages.
However, it introduces small differences between back and forth transformation.

##### 2.2.2 3D similarity transformation

The formula for a 3D similarity transformation must be applied to the geocentric Cartesian ETRS89 coordinates of the point of interest (Formula 2.2.2).
The obtained geocentric Cartesian coordinates are in the geodetic datum of RD.
Since the name RD is often used for projected coordinates only, the geodetic datum is often referred to as RD Bessel or just Bessel.

##### 2.2.3 Conversion from geocentric Cartesian coordinates

After the 3D similarity transformation, the geocentric Cartesian Bessel coordinates of the point of interest must be converted back to ellipsoidal geographic Bessel coordinates (Formula 2.2.3).

#### 2.3 RD correction

##### 2.3.1 Bilinear correction grid interpolation

The ellipsoidal geographic coordinates of a point of interest obtained by datum transformation of implementation variant 1 are pseudo Bessel coordinates. Due to the error propagation of measurement noise of the original (1888–1928) measurements of RD, the pseudo Bessel coordinates must be corrected up to 0.25 m to obtain real Bessel coordinates.
For implementation variant 2, the datum transformation is included in the correction grid (Section 2.3.4).
The corrections are obtained from a regular grid of values for latitude correction and a regular grid of values for longitude correction, using bilinear interpolation (Formula 2.3.1).

##### 2.3.2 Determine nearest grid points

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required.
Grid values can be read one by one from the binary grid file by direct access or the entire grid of the binary or ASCII text file can be assigned to an array variable first.

##### 2.3.3 Iterative correction

The horizontal ellipsoidal geographic pseudo Bessel coordinates of the point of interest must be corrected to real Bessel coordinates (Formula 2.3.3) using the interpolated correction grid value of the point of interest.
The horizontal ellipsoidal geographic coordinates of the correction grid points are in real Bessel.
Therefore, also the coordinates of the point of interest are needed in real Bessel to determine the right correction.
To solve this, the real Bessel coordinates are computed iteratively, until the difference between subsequent iterations becomes smaller than the precision threshold.

##### 2.3.4 Datum transformation in the correction grid

It is possible to include the datum transformation in the correction grid.
The alternative grid for this implementation variant 2 contains the latitude and longitude corrections up to 0.25 m, but also the datum difference (about 0.1 km in the central part of the Netherlands).
In that way the 3D similarity transformation (Section 2.2) is not needed.

#### 2.4 Map projection

##### 2.4.1 Projection from ellipsoid to sphere

The corrected ellipsoidal geographic Bessel coordinates of a point of interest must be projected to obtain RD coordinates.
The used RD map projection is a double projection.
The first step is a Gauss conformal projection from the ellipsoid to a sphere (Formula 2.4.1).

##### 2.4.2 Projection from sphere to plane

The second step of the RD map projection of the point of interest is an oblique stereographic conformal projection from sphere to a plane to obtain RD coordinates (Formula 2.4.2).

#### 2.5 Height transformation

##### 2.5.1 Bilinear quasi-geoid grid interpolation

The ellipsoidal height is not used with RD coordinates as it is purely geometrical and has no physical meaning. The height transformation from ellipsoidal ETRS89 height of a point of interest to NAP height is based on the quasi-geoid model NLGEO2018.
The quasi-geoid height at the point of interest is obtained by bilinear interpolation of a regular grid of quasi-geoid height values (Formula 2.5.1).

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required.

The horizontal coordinates of the grid points for which the quasi-geoid height is given are in ETRS89 (variant 1) or in Bessel (variant 2), but the quasi-geoid height is relative to the ETRS89 ellipsoid in both cases.

Implementation variant 1 uses the ETRS89 grid for transformation in both transformation directions, for ETRS89 to RD and NAP as well as RD and NAP to ETRS89.
Using a different grid for the transformation back is not recommended, as it can result in too large differences after repeatedly transforming back and forth.

The quasi-geoid heights are in metres, spacing and coordinates of grid bounds are given in decimal degrees with conventional sign, thus east of the Greenwich meridian is positive.

##### 2.5.2 Transformation to NAP

The ellipsoidal ETRS89 height of the point of interest must be transformed to NAP height (Formula 2.5.2) using the interpolated quasi-geoid height of the point of interest.

### 3. Transformation from RD and NAP to ETRS89

#### 3.1 Inverse map projection

##### 3.1.1 Projection from plane to sphere

RD coordinates of a point of interest must be converted to Bessel coordinates before the other steps of the transformation can be performed.
The RD map projection is a double projection. The first step of the inverse map projection is an inverse oblique stereographic conformal projection from the RD projection plane to a sphere (Formula 3.1.1).

##### 3.1.2 Projection from sphere to ellipsoid

The second step of the inverse RD map projection is an inverse Gauss conformal projection from the sphere to the Bessel ellipsoid to obtain Bessel coordinates of the point of interest (Formula 3.1.2).

#### 3.2 RD correction

##### 3.2.1 Direct correction

The ellipsoidal geographic coordinates of a point of interest obtained by the inverse map projection, are real Bessel coordinates. Due to the error propagation of measurement noise of the original (1888–1928) measurements of RD, the real Bessel coordinates must be corrected up to 0.25 m to obtain pseudo Bessel coordinates. For implementation variant 2, the datum transformation is included in the correction grid (Section 3.2.2).
The corrections are obtained from a regular grid of values for latitude correction and a regular grid of values for longitude correction, using bilinear interpolation (Formula 2.3.1).

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required
The horizontal ellipsoidal geographic real Bessel coordinates of the point of interest must be corrected to pseudo Bessel coordinates (Formula 3.2.1) using the interpolated correction grid value of the point of interest.
No iteration is needed for the transformation from RD to ETRS89 coordinates as the grid is given in real Bessel coordinates.

##### 3.2.2 Datum transformation in the correction grid

It is possible to include the datum transformation in the correction grid.
In that way the 3D similarity transformation (Section 3.3) is not needed.
With this alternative grid a bilinear interpolation of the latitude and longitude corrections (Formula 2.3.1) at the nearest grid points (Formula 2.3.2) and correction of real Bessel coordinates (Formula 3.2.1) can be applied as for a correction grid without the datum transformation, but in this case the output are ETRS89 coordinates of the point of interest instead of pseudo Bessel coordinates.

#### 3.3 Datum transformation

The corrected ellipsoidal geographic Bessel coordinates of a point of interest must be transformed to ellipsoidal geographic ETRS89 coordinates.
This is only needed for implementation variant 1, for variant 2 the datum transformation (Section 3.3) is included in the correction grid (Section 3.2).
First, the ellipsoidal geographic Bessel coordinates of a point of interest must be converted to geocentric Cartesian Bessel coordinates (Formula 2.2.1) to be able to apply a 3D similarity transformation.

Unlike conventional use in transformations, including RDNAPTRANS™2008 and earlier versions of RDNAPTRANS™, a fixed ellipsoidal height is used instead of the actual height of the point of interest.
Points with the same latitude and longitude in RD that differ in height get exactly the same horizontal ETRS89 coordinates. This enables 2D transformation between RD and ETRS89 and straightforward implementation in software like GIS packages.
However, it introduces small differences between back and forth transformation. These differences are below 0.0010 m up to 500 km outside the bounds of the RDNAPTRANS™2018 grids.

The 3D similarity transformation must be applied to the geocentric Cartesian Bessel coordinates of the point of interest to obtain geocentric Cartesian ETRS89 coordinates.
The datum transformation uses the same formulas for the 3D similarity transformation from RD to ETRS89 as from ETRS89 to RD (Formula 2.2.2). So the order is first rotate and then translate, instead of inversing the order to translating and rotating. As a result, the inverse transformation parameters do not only have opposite sign, but the parameters also have slightly different numbers (except for the scale difference parameter). Sometimes the differences are only apparent in the last digit. The parameters could be computed from the inverse parameters too (Section 2.2.2).

After the 3D similarity transformation, the geocentric Cartesian ETRS89 coordinates of the point of interest must be converted back to ellipsoidal geographic ETRS89 coordinates (Formula 2.2.3). The latitude is computed iteratively. The parameters of the GRS80 ellipsoid (Section 2.2.1) are needed for the conversion to ellipsoidal geographic coordinates for the transformation from RD to ETRS89.

#### 3.4 Notation in degrees, minutes and seconds

The ETRS89 coordinates of a point of interest obtained after transformation are in radians or decimal degrees, depending on the type of goniometry functions used. These coordinates must be converted to decimal degrees and optionally to degrees, minutes and seconds (Formula 3.4).

#### 3.5 Height transformation

The physical NAP height of a point of interest can be transformed to the purely geometrical ellipsoidal ETRS89 height. The height transformation from NAP to ETRS89 is based on the quasi-geoid model NLGEO2018. The quasi-geoid height at the point of interest is obtained by bilinear interpolation of a regular grid of quasi-geoid height values (Formula 2.5.1). A unit conversion (Formula 2.1) is only needed when working with radians.

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required. Grid values can be read one by one from the binary grid file by direct access or the entire grid of the binary or ASCII text file can be assigned to an array variable first. In both cases, the indices of the required grid values need to be determined.
The horizontal coordinates of the grid points for which the quasi-geoid height is given are in ETRS89 (variant 1) or in Bessel (variant 2), but the quasi-geoid height is relative to the ETRS89 ellipsoid in both cases.
Implementation variant 1 uses the ETRS89 grid for transformation in both transformation directions, for RD and NAP to ETRS89 as well as ETRS89 to RD and NAP. Using a different grid for the transformation back is not recommended, as it can result in too large differences after repeatedly transforming back and forth.

The NAP height of the point of interest must be transformed to ellipsoidal ETRS89 height (Formula 3.5) using the interpolated quasi-geoid height of the point of interest.
