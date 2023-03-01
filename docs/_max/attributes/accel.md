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

Acceleration calculation requires the following

* Sensor contains an [IMU](https://en.wikipedia.org/wiki/Inertial_measurement_unit)
* Enable [`@skeleton`](skeleton.md),
  [`@skelcolor`](skelcolor.md), [`@skeldepth`](skeldepth.md),
  [`@rotatemethod gravity`](rotatemethod.md), [`@flooronbang`](flooronbang.md),
  or [`@floorout`](floorout.md)

The acceleration coordinate system is the same as most depth coordinate systems.
It is centered on the sensor, and is a right-handed coordinate system
with positive Z in the direction the sensor lens is pointing. When a sensor
is perfectly still and perfectly level, the acceleration values are `0. -1. 0.`.

Acceleration values are not affected by flip or rotation attributes.

> :memo: Plugins older than v1.3 return a four-value vector `x y z 0`.

## dp.oak

Luxonis OAK sensors are available with IMUs. Some of those IMUs are
[not factory calibrated](https://github.com/luxonis/depthai-core/issues/319).
These uncalibrated IMUs report errant acceleration.
[`dp.oak`](../dp.oak.md) v1.3.20230301+ includes a workaround for most use cases.
