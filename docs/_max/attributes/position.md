---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "X_FLOAT Y_FLOAT Z_FLOAT"
  values: 0.0 0.0 0.0 (default)
  examples:
    - "@position 1.3 -4.0 23.5"
---

Offset the origin of sensor data to this XYZ value. That is,
translate sensor data by this XYZ vector.

This `@position` is compatible with Max
[jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node).

## dp.kinect

[dp.kinect](../dp.kinect.md) uses the old deprecated attribute name `@translate`.
It offsets the origin the same.
It does *not* support [jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node).
