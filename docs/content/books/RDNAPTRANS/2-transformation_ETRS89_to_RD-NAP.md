## 2 - Transformation from ETRS89 to RD and NAP

### 2.1 - Notation in degrees, minutes and seconds

ETRS89 coordinates are commonly expressed in ellipsoidal geographic coordinates latitude, longitude and ellipsoidal height.

Height in meters

- N or positive decimal degrees (d.d)
- S or negative decimal degrees (d.d)
- E or positive decimal degrees (d.d)
- W or negative decimal degrees (d.d)

The number of needed decimals in degrees, minutes and seconds for a resolution corresponding to approximately 0.01 m, are given in the examples below:

Examples of notation of 2D ellipsoidal geographic coordinates

- D M S.S: 52° 5′ 29.870″ N, 5° 7′ 18.141″ E (Dutch notation: 52° 5′ 29,870″ NB; 5° 7′ 18,141″ OL)
- D M.M: 52° 5.49783′ N, 5° 7.30235′ E (Dutch notation: 52° 5,49783′ NB; 5° 7,30235′ OL)
- D.D: 52.0916305° N, 5.1217059° E (Dutch notation: 52,0916305° NB; 5,1217059° OL)
- d.d: +52.0916305°, +5.1217059° (Dutch notation: +52,0916305°; +5,1217059°)

To transform the coordinates of a point of interest, its ETRS89 coordinates must be converted first to decimal degrees or to radians (Formula 2.1), depending on the type of goniometry functions used.

### 2.2 - Datum transformation

#### 2.2.1 - Conversion to geocentric Cartesian coordinates

Variant 1 - The ellipsoidal geographic ETRS89 coordinates of a point of interest must be converted to geocentric Cartesian ETRS89 coordinates to be able to apply a 3D similarity transformation. (Formula 2.2.1)
Variant 2 - the datum transformation (Section 2.2.1, 2.2.2 and 2.2.3) is included in the correction grid (Section 2.3).

A fixed ellipsoidal height is used instead of the actual height of the point of interest.
As a result, points with the same latitude and longitude in ETRS89 that differ in height get exactly the same RD coordinates.
This enables 2D transformation between ETRS89 and RD and straightforward implementation in software like GIS packages.
However, it introduces small differences between back and forth transformation.
These differences are below 0.0010 m up to 500 km outside the bounds of the RDNAPTRANS™2018 grids.

Do not use these geocentric Cartesian ETRS89 coordinates for other purposes than RDNAPTRANS™.
For the transformation to RD coordinates with geocentric Cartesian ETRS89 coordinates obtained in a different way than by conversion with the fixed height (e.g. geocentric Cartesian ETRS89 coordinates obtained directly from GNSS measurements), convert such geocentric Cartesian ETRS89 coordinates first to ellipsoidal geographic ETRS89 coordinates (Section 3.3) and then perform the transformation to RD coordinates (Chapter 2).

#### 2.2.2 - 3D similarity transformation

The formula for a 3D similarity transformation must be applied to the geocentric Cartesian ETRS89 coordinates of the point of interest (Formula 2.2.2).
The obtained geocentric Cartesian coordinates are in the geodetic datum of RD.
Since the name RD is often used for projected coordinates only, the geodetic datum is often referred to as RD Bessel or just Bessel.

#### 2.2.3 - Conversion from geocentric Cartesian coordinates

After the 3D similarity transformation, the geocentric Cartesian Bessel coordinates of the point of interest must be converted back to ellipsoidal geographic Bessel coordinates (Formula 2.2.3).
The ellipsoidal height is not given in the formula, as it is not used.

The initial value for the latitude should be used to obtain an approximation of the latitude. This approximate value is then used to obtain an improved approximation. The latitude is computed iteratively until the difference between subsequent iterations becomes smaller than the precision threshold.
Do not use Bessel coordinates for other purposes than RDNAPTRANS™ to avoid confusion with ETRS89 coordinates.

### 2.3 - RD correction

#### 2.3.1 - Bilinear correction grid interpolation

The ellipsoidal geographic coordinates of a point of interest obtained by datum transformation of implementation variant 1 are pseudo Bessel coordinates. Due to the error propagation of measurement noise of the original (1888–1928) measurements of RD, the pseudo Bessel coordinates must be corrected up to 0.25 m to obtain real Bessel coordinates.

For implementation variant 2, the datum transformation is included in the correction grid (Section 2.3.4).
The corrections are obtained from a regular grid of values for latitude correction and a regular grid of values for longitude correction, using bilinear interpolation (Formula 2.3.1). Unit conversion (Formula 2.1) might be needed, as the correction values are given in degrees or arcseconds, depending on the data format of the correction grid. The correction grid for bilinear interpolation (Formula 2.3.1) is supplied in three data formats, in tab-separated value ASCII text file format (.txt), in binary NTv2 file format (.gsb) and in binary GeoTIFF file format (.tif). In NTv2 and GeoTIFF formats, the file contains two grids, a course parent grid for a large area covering the Netherlands with EEZ and a dense subgrid for a smaller area without EEZ. The course parent grid is not to be used in the area of the dense subgrid.

#### 2.3.2 - Determine nearest grid points

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required.

Grid values can be read one by one from the binary grid file by direct access or the entire grid of the binary or ASCII text file can be assigned to an array variable first.

#### 2.3.3 - Iterative correction

The horizontal ellipsoidal geographic pseudo Bessel coordinates of the point of interest must be corrected to real Bessel coordinates (Formula 2.3.3) using the interpolated correction grid value of the point of interest.

The horizontal ellipsoidal geographic coordinates of the correction grid points are in real Bessel.
Therefore, also the coordinates of the point of interest are needed in real Bessel to determine the right correction.

To solve this, the real Bessel coordinates are computed iteratively, until the difference between subsequent iterations becomes smaller than the precision threshold.

The pseudo Bessel coordinates are used as initial approximate values for the first iteration.
Do not use Bessel coordinates for other purposes than RDNAPTRANS™ to avoid confusion with ETRS89 coordinates.

#### 2.3.4 - Datum transformation in the correction grid

It is possible to include the datum transformation in the correction grid.
The alternative grid for this implementation variant 2 contains the latitude and longitude corrections up to 0.25 m, but also the datum difference (about 0.1 km in the central part of the Netherlands).
In that way the 3D similarity transformation (Section 2.2) is not needed.
With this alternative grid a bilinear interpolation of the latitude and longitude corrections (Formula 2.3.1) at the nearest grid points (Formula 2.3.2)
and correction to real Bessel coordinates (Formula 2.3.3) can be applied as for a correction grid without the datum transformation, but in this case ETRS89 coordinates of the point of interest are used as input instead of the pseudo Bessel coordinates.

When the datum transformation is included in the correction grid, it is not possible to use a zero correction outside the bounds of the grid.
A point of interest outside the grid bounds should be transformed with the 3D similarity transformation (Section 2.2) or no value should be given at all for such point.

A no result outside the bounds of the correction grid is best accompanied with a warning that the RD coordinates are out of bounds.

### 2.4 - Map projection

#### 2.4.1 - Projection from ellipsoid to sphere

The corrected ellipsoidal geographic Bessel coordinates of a point of interest must be projected to obtain RD coordinates.
The used RD map projection is a double projection.
The first step is a Gauss conformal projection from the ellipsoid to a sphere (Formula 2.4.1).
Do not use the spherical coordinates for other purposes than RDNAPTRANS™ to avoid confusion with ellipsoidal coordinates.

#### 2.4.2 - Projection from sphere to plane

The second step of the RD map projection of the point of interest is an oblique stereographic conformal projection from sphere to a plane to obtain RD coordinates (Formula 2.4.2).

### 2.5 - Height transformation

#### 2.5.1 - Bilinear quasi-geoid grid interpolation

The ellipsoidal height is not used with RD coordinates as it is purely geometrical and has no physical meaning. The height transformation from ellipsoidal ETRS89 height of a point of interest to NAP height is based on the quasi-geoid model NLGEO2018.
The quasi-geoid height at the point of interest is obtained by bilinear interpolation of a regular grid of quasi-geoid height values (Formula 2.5.1).

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required.
In both cases, the indices of the required grid values need to be determined.
The indices can be computed from the coordinates of the point of interest (Formula 2.3.2).

The quasi-geoid grid for bilinear interpolation (Formula 2.5.1) is supplied in two horizontal datums.
The horizontal coordinates of the grid points for which the quasi-geoid height is given are in ETRS89 (variant 1) or in Bessel (variant 2), but the quasi-geoid height is relative to the ETRS89 ellipsoid in both cases.

Implementation variant 1 uses the ETRS89 grid for transformation in both transformation directions, for ETRS89 to RD and NAP as well as RD and NAP to ETRS89.
Using a different grid for the transformation back is not recommended, as it can result in too large differences after repeatedly transforming back and forth.

Some software expect the quasi-geoid grid to give ETRS89 quasi-geoid height in a Bessel grid.
For these applications implementation variant 2 with the Bessel grid is used in both transformation directions, for ETRS89 to RD and NAP as well as RD and NAP to ETRS89.

The binary VDatum file format is supported by open source software for geo-information.
The quasi-geoid heights are in metres, spacing and coordinates of grid bounds are given in decimal degrees with conventional sign, thus east of the Greenwich meridian is positive.

A no result outside the bounds of the quasi-geoid grid model is best accompanied with a warning that the NAP coordinates are out of bounds.

#### 2.5.2 - Transformation to NAP

The ellipsoidal ETRS89 height of the point of interest must be transformed to NAP height (Formula 2.5.2) using the interpolated quasi-geoid height of the point of interest.
