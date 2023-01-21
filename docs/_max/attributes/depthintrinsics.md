---
products:
  - dp.kinect2
  #- dp.kinect3
  #- dp.oak
categories:
  - physical
usage:
  signature: "FOCAL_X FOCAL_Y PP_X PP_Y RADIAL_K1 RADIAL_K2 RADIAL_K3"
  values: sensor specific defaults
  examples:
    - "depthintrinsics 365.1 365.1 254.9 205.6 -0.283 0.0991 0.0976"
---

Depth camera intrinsics for [`dp.kinect2`](../../dp.kinect2/) as a list of
[seven floats](https://msdn.microsoft.com/en-us/library/microsoft.kinect.kinect.cameraintrinsics.aspx).
Read-only. The `RADIAL_K` parameters model radial distortion using the
[Brown–Conrady and Division models](https://en.wikipedia.org/wiki/Distortion_%28optics%29#Software_correction).

Focal length X
: Focal length in pixels on X-axis

Focal length Y
: Focal length in pixels on Y-axis

Principal point X
: Principal point in pixels on X-axis

Principal point Y
: Principal point in pixels on Y-axis

Radial distortion second-order
: Radial distortion K1 parameter second-order

Radial distortion fourth-order
: Radial distortion K2 parameter fourth-order

Radial distortion sixth-order
: Radial distortion K3 parameter sixth-order
