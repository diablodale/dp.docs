---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "ANGLE_FLOAT X_FLOAT Y_FLOAT Z_FLOAT"
  values: 0.0 0.0 0.0 1.0 (default)
  examples:
    - "@rotate 75.875687 0.525959 0.49999 0.688024"
---

Rotate data by an angle (degrees) around an XYZ vector in the form: `angle x y z`.
This is always synchronized with the attributes [`@quat`](quat.md)
and [`@rotatexyz`](rotatexyz.md).

This `@rotate` is compatible with Max
[jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node).
