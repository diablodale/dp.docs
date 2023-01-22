---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "METER_BOOLEAN"
  values:
    "0": millimeters distance
    "1": meters distance (default)
  examples:
    - "@distmeter 0"
    - "@distmeter 1"
---

Distance output in meters `1` or millimeters `0`. This affects all distance
output including depthmap, pointcloud, skeleton joints, floor, face tracking, etc.

Some combinations of plugin settings may not be useful. For example,
using together [`@depthmap 1`](depthmap.md) and [`@type long`](type.md)
to output a depthmap matrix with long integers has few possible values.
The only values that will appear in the matrix are
0, 1, 2, 3, 4, 5, 6, 7, and 8; an integer has no fractional part and the
`distmeter` default is meters. Use instead `@depthmap 1 @type long @distmeter 0`
to output integers in millimeters. Then the values will be any integer
in the range [0..8000].
