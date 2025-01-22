## RDNAP

### Coordinate Systems

Official 3D coordinate system of the Netherlands and Europe: European Terrestrial Reference System 1989 (ETRS89).
ETRS89 is linked to the International Terrestrial Reference System (ITRS) by a time-dependant coordinate transformation.
National coordinate systems in Europe are linked to ETRS89.

#### Rijksdriehoeksmeting (RD)

Coordinates in the Dutch Stelsel van de Rijksdriehoeksmeting (RD) are the most-frequently used 2D coordinates on land and internal waters.
RD coordinates are defined by the official transformation from ETRS89 coordinates.
Maintaining reference points for ETRS89 and the transformation to RD coordinates are legal responsibilities of Kadaster.

#### Normaal Amsterdams Peil (NAP)

Heights relative to Normaal Amsterdams Peil (NAP) are the official and the most-frequently used heights on land and internal waters.  The NAP is a legal responsibility of Rijkswaterstaat
Ellipsoidal heights in ETRS89 can be transformed with the quasi-geoid model to NAP with a precision higher than ETRS89 coordinates obtained with most GNSS measurements.

### Coordinate transformation RDNAPTRANS™

The official coordinate transformation between European ETRS89 coordinates and Dutch coordinates in RD and NAP is called RDNAPTRANS™

The recommended ETRS89 realisation is ETRF2000 at epoch 2010.50 (AGRS2010). When using RDNAPTRANS™2018 it is important to use this realisation and epoch, especially for the height. For applications demanding high accuracy, it is recommended to obtain the NAP height of the point of interest by levelling to nearby NAP benchmarks.

![Figure 1.2.2](../../../images/Steps_transformation_procedure.png)

There are two variants for the implementation of the horizontal component of RDNAPTRANS™2018 and two variants for the vertical component (Figure 1.2.2).

Implementation variant 1 applies the datum transformation as a separate step using a 3D similarity transformation.
The advantage of implementation variant 1 is that it has no strict bounds for the area where horizontal coordinates can be transformed correctly. The disadvantage is that many software packages do not support implementation variant 1 for the horizontal component.

Implementation variant 2 includes the datum transformation in the correction grid and uses a different quasi-geoid grid for the height transformation. Implementation variant 2 for the horizontal component is supported by more software but can only be used within the bounds of the correction grid (Figure 1.1.1). The difference in the resulting coordinates between the two variants is well below 0.0010 m within the bounds of the RDNAPTRANS™2018 grids.

### Transformation from ETRS89 to RD and NAP: Steps

1. Datum transformation

   1.1 Conversion to geocentric Cartesian coordinates. Variant 1, The ellipsoidal geographic ETRS89 coordinates of a point of interest must be converted to geocentric Cartesian ETRS89 coordinates to be able to apply a 3D similarity transformation.
   Variant 2, the datum transformation is included in the correction grid.

   1.2 3D similarity transformation

   1.3 Conversion from geocentric Cartesian coordinates back to ellipsoidal geographic Bessel coordinates (Formula 2.2.3).

2. RD correction

   2.1 Bilinear correction grid interpolation to obtain real Bessel coordinates.

   2.2 To transform the point of interest, Determine nearest grid points

   2.3 Iterative correction of the point of interest from pseudo Bessel coordinates to real Bessel coordinates,

   2.4 Datum transformation in the correction grid

3. Map projection

   3.1 Projection from ellipsoid to sphere (Gauss conformal projection from the ellipsoid to a sphere)

   3.2 Projection from sphere to plane

4. Height transformation

   4.1 Bilinear quasi-geoid grid interpolation

   4.2 Transformation to NAP

### Transformation from RD and NAP to ETRS89: Steps

1. Inverse map projection

   1.1 Projection from plane to sphere

   1.2 Projection from sphere to ellipsoid

2. RD correction

   2.1 Direct correction

   2.2 Datum transformation in the correction grid

3. Datum transformation

   3.1 Variant 1, transformation from ellipsoidal geographic Bessel coordinates of a point of interest to ellipsoidal geographic ETRS89 coordinates. Variant 2 the datum transformation is included in the correction grid

   3.2 the ellipsoidal geographic Bessel coordinates of a point of interest must be converted to geocentric Cartesian Bessel coordinates

   3.3 The 3D similarity transformation must be applied to the geocentric Cartesian Bessel coordinates of the point of interest to obtain geocentric Cartesian ETRS89 coordinates.

   3.4 The geocentric Cartesian ETRS89 coordinates of the point of interest must be converted back to ellipsoidal geographic ETRS89 coordinates. The latitude is computed iteratively.

4. Conversion of radians or decimal degrees to decimal degrees

5. Height transformation: the physical NAP height of a point of interest to the purely geometrical ellipsoidal ETRS89 height, based on the quasi-geoid model NLGEO2018. The NAP height of the point of interest must be transformed to ellipsoidal ETRS89 height (Formula 3.5) using the interpolated quasi-geoid height of the point of interest.
