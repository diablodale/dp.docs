---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "X_FLOAT Y_FLOAT Z_FLOAT [0.0]"
  values: 0. -1. 0. (default)
  examples:
    - "accel 0.026321 -0.995679 -0.089051"
---

Acceleration XYZ vector usually pointing towards gravity
(where 1 unit = 9.81m/s^2). Read-only.

The coordinate system is centered on the sensor, and is a right-handed coordinate
system with positive Z in the direction the sensor lens is pointing. When a sensor
is perfectly still and perfectly level, this returns the vector `0. -1. 0.`.

> :memo: Plugins older than v1.3 return a four-value vector `x y z 0`.

> :memo: This feature is only supported on sensors with an
> [IMU](https://en.wikipedia.org/wiki/Inertial_measurement_unit).
