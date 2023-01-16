---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "MILLIMETERS_INT"
  values: "50 (default)"
  examples:
    - "@depthvis 75"
---

Depth visibility filter removes [double images and edge artifacts](align.md#artifacts)
in image matrices. The depth visibility threshold default
is 50mm to identify obstructed pixels and remove them in common situations. Set
`@depthvis 0` to remove this filter or simulate [dp.kinect](../../dp.kinect/) behavior.

> :memo: Plugin versions v1.2.20200629 and newer support this feature.
