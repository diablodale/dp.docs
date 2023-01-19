---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "X_FLOAT Y_FLOAT Z_FLOAT"
  values: 0.0 0.0 0.0 (default)
  examples:
    - "@rotatexyz 30.0 25.0 60.0"
---

Rotate data by [Euler angles](https://en.wikipedia.org/wiki/Euler_angles)
(degrees) around the positive x, y, and z axes. The order of rotation is y then z then x.
This is always synchronized with the attributes [`@quat`](quat.md)
and [`@rotate`](rotate.md).

> :memo: Some combinations of Euler angles will result in unworkable
> rotations known as [gimbal lock](https://en.wikipedia.org/wiki/Gimbal_lock).