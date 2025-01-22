## 3 - Transformation from RD and NAP to ETRS89

### 3.1 - Inverse map projection

#### 3.1.1 - Projection from plane to sphere

RD coordinates of a point of interest must be converted to Bessel coordinates before the other steps of the transformation can be performed.
The RD map projection is a double projection. The first step of the inverse map projection is an inverse oblique stereographic conformal projection from the RD projection plane to a sphere (Formula 3.1.1).

#### 3.1.2 - Projection from sphere to ellipsoid

The second step of the inverse RD map projection is an inverse Gauss conformal projection from the sphere to the Bessel ellipsoid to obtain Bessel coordinates of the point of interest (Formula 3.1.2).
Do not use spherical or ellipsoidal Bessel coordinates for other purposes than RDNAPTRANS™ to avoid confusion with ETRS89 coordinates.

### 3.2 - RD correction

#### 3.2.1 - Direct correction

The ellipsoidal geographic coordinates of a point of interest obtained by the inverse map projection, are real Bessel coordinates. Due to the error propagation of measurement noise of the original (1888–1928) measurements of RD, the real Bessel coordinates must be corrected up to 0.25 m to obtain pseudo Bessel coordinates. For implementation variant 2, the datum transformation is included in the correction grid (Section 3.2.2).
The corrections are obtained from a regular grid of values for latitude correction and a regular grid of values for longitude correction, using bilinear interpolation (Formula 2.3.1). A unit conversion (Formula 2.1) might be needed, as the correction values are given in degrees or arcseconds, depending on the data format of the correction grid. v

To transform the point of interest, the nearest NW, NE, SW and SE grid values are required.
The indices of the required grid values need to be determined.
To use the same formulas for computing the indices for an array variable as for the original grid file, the array variable should have the same dimensions and order as the grid file.
The indices can be computed from the coordinates of the point of interest (Formula 2.3.2).
The horizontal ellipsoidal geographic real Bessel coordinates of the point of interest must be corrected to pseudo Bessel coordinates (Formula 3.2.1) using the interpolated correction grid value of the point of interest.
No iteration is needed for the transformation from RD to ETRS89 coordinates as the grid is given in real Bessel coordinates.
Do not use Bessel coordinates for other purposes than RDNAPTRANS™ to avoid confusion with ETRS89 coordinates.

#### 3.2.2 - Datum transformation in the correction grid

It is possible to include the datum transformation in the correction grid.
The alternative grid for this implementation variant 2 contains the latitude and longitude corrections up to 0.25 m, but also the datum difference (about 0.1 km in the central part of the Netherlands).
In that way the 3D similarity transformation (Section 3.3) is not needed.
With this alternative grid a bilinear interpolation of the latitude and longitude corrections (Formula 2.3.1) at the nearest grid points (Formula 2.3.2) and correction of real Bessel coordinates (Formula 3.2.1) can be applied as for a correction grid without the datum transformation, but in this case the output are ETRS89 coordinates of the point of interest instead of pseudo Bessel coordinates.
These grids have the same properties as the correction grids that do not include the datum transformation (Section 2.3.1).
When the datum transformation is included in the correction grid, it is not possible to use a zero correction outside the bounds of the grid.
A point of interest outside the grid bounds should be transformed with the 3D similarity transformation (Section 3.3) or no value should be given at all for such point.
A no result outside the bounds of the correction grid is best accompanied with a warning that the RD coordinates are out of bounds.

### 3.3 - Datum transformation

The corrected ellipsoidal geographic Bessel coordinates of a point of interest must be transformed to ellipsoidal geographic ETRS89 coordinates.
This is only needed for implementation variant 1, for variant 2 the datum transformation (Section 3.3) is included in the correction grid (Section 3.2).
First, the ellipsoidal geographic Bessel coordinates of a point of interest must be converted to geocentric Cartesian Bessel coordinates (Formula 2.2.1) to be able to apply a 3D similarity transformation.
Note that the parameters of the Bessel ellipsoid (Section 2.2.3) are needed for the conversion to geocentric Cartesian coordinates for the transformation from RD to ETRS89.
Unlike conventional use in transformations, including RDNAPTRANS™2008 and earlier versions of RDNAPTRANS™, a fixed ellipsoidal height is used instead of the actual height of the point of interest.
Points with the same latitude and longitude in RD that differ in height get exactly the same horizontal ETRS89 coordinates. This enables 2D transformation between RD and ETRS89 and straightforward implementation in software like GIS packages.
However, it introduces small differences between back and forth transformation. These differences are below 0.0010 m up to 500 km outside the bounds of the RDNAPTRANS™2018 grids.

The 3D similarity transformation must be applied to the geocentric Cartesian Bessel coordinates of the point of interest to obtain geocentric Cartesian ETRS89 coordinates.
The datum transformation uses the same formulas for the 3D similarity transformation from RD to ETRS89 as from ETRS89 to RD (Formula 2.2.2). So the order is first rotate and then translate, instead of inversing the order to translating and rotating. As a result, the inverse transformation parameters do not only have opposite sign, but the parameters also have slightly different numbers (except for the scale difference parameter). Sometimes the differences are only apparent in the last digit. The parameters could be computed from the inverse parameters too (Section 2.2.2).

Do not use these geocentric Cartesian ETRS89 coordinates for other purposes than RDNAPTRANS™, as the use of a fixed height might be not appropriate and the actual height of the point of interest should be used.
Instead, first convert the coordinates of the point of interest to ellipsoidal ETRS89 geographic coordinates and perform the height transformation (Section 3.5), then convert to geocentric Cartesian ETRS89 coordinates with the actual height of the point of interest to obtain geocentric Cartesian ETRS89 coordinates.
After the 3D similarity transformation, the geocentric Cartesian ETRS89 coordinates of the point of interest must be converted back to ellipsoidal geographic ETRS89 coordinates (Formula 2.2.3). The latitude is computed iteratively. The parameters of the GRS80 ellipsoid (Section 2.2.1) are needed for the conversion to ellipsoidal geographic coordinates for the transformation from RD to ETRS89.

### 3.4 - Notation in degrees, minutes and seconds

The ETRS89 coordinates of a point of interest obtained after transformation are in radians or decimal degrees, depending on the type of goniometry functions used. These coordinates must be converted to decimal degrees and optionally to degrees, minutes and seconds (Formula 3.4). Traditionally, the latitude and longitude of a point of interest are given as integer degrees, integer minutes and decimal seconds with a hemisphere code, but other notation formats and variations on these are used too (Section 2.1).

### 3.5 - Height transformation

The physical NAP height of a point of interest can be transformed to the purely geometrical ellipsoidal ETRS89 height. The height transformation from NAP to ETRS89 is based on the quasi-geoid model NLGEO2018. The quasi-geoid height at the point of interest is obtained by bilinear interpolation of a regular grid of quasi-geoid height values (Formula 2.5.1). A unit conversion (Formula 2.1) is only needed when working with radians.

A no result outside the bounds of the quasi-geoid grid model is best accompanied with a warning that the NAP coordinates are out of bounds.
To transform the point of interest, the nearest NW, NE, SW and SE grid values are required. Grid values can be read one by one from the binary grid file by direct access or the entire grid of the binary or ASCII text file can be assigned to an array variable first. In both cases, the indices of the required grid values need to be determined.
The grid for the bilinear interpolation is supplied in two horizontal datums. The horizontal coordinates of the grid points for which the quasi-geoid height is given are in ETRS89 (variant 1) or in Bessel (variant 2), but the quasi-geoid height is relative to the ETRS89 ellipsoid in both cases. These grids are also supplied in three data formats, in tab-separated value ASCII text file format (.txt), in binary VDatum file format (.gtx) and in binary GeoTIFF file format (.tif) with different properties (Section 2.5.1).
Implementation variant 1 uses the ETRS89 grid for transformation in both transformation directions, for RD and NAP to ETRS89 as well as ETRS89 to RD and NAP. Using a different grid for the transformation back is not recommended, as it can result in too large differences after repeatedly transforming back and forth.

Some software expect the quasi-geoid grid to give ETRS89 quasi-geoid height in a Bessel grid. For these applications implementation variant 2 with the Bessel grid is used in both transformation directions, for RD and NAP to ETRS89 as well as ETRS89 to RD and NAP.
The NAP height of the point of interest must be transformed to ellipsoidal ETRS89 height (Formula 3.5) using the interpolated quasi-geoid height of the point of interest.
