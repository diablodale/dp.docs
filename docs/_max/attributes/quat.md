---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "I_FLOAT J_FLOAT K_FLOAT W_FLOAT"
  values: 0.0 0.0 0.0 1.0 (default)
  examples:
    - "@quat 0.323363 0.307397 0.423001 0.788678"
---

Rotate data by a [quaternion](https://en.wikipedia.org/wiki/Quaternion) in the
form: `i j k w`. This is always synchronized with the attributes [`@rotate`](rotate.md)
and [`@rotatexyz`](rotatexyz.md).
