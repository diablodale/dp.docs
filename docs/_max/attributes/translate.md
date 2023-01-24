---
products:
  - dp.kinect
categories:
  - visual adjustment
usage:
  signature: "X_FLOAT Y_FLOAT Z_FLOAT"
  values: 0.0 0.0 0.0 (default)
  examples:
    - "@translate 1.3 -4.0 23.5"
---

Offset the origin of sensor data to this XYZ value. That is,
translate sensor data by this XYZ vector.

> :memo: `@translate` is replaced by [`@position`](position.md)
> in other plugins
