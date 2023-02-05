---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "X_FLOAT Y_FLOAT Z_FLOAT"
  values: 1.0 1.0 1.0 (default)
  examples:
    - "@scale 1.5 2.0 1.0"
---

Scale the sensor data by this XYZ value. That is,
multiply sensor data and this XYZ vector.

This `@scale` is compatible with Max
[jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node).
