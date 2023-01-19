---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "{ROTATE_STRING | ROTATE_INT}"
  values:
    "off or 0": no compensation (default)
    "elevation or 1": elevation compensation (simple X-axis)
    "gravity or 2": gravity compensation (three axes)
  examples:
    - "@rotatemethod gravity"
    - "@rotatemethod 2"
---

Rotate data to compensate for physical rotation of the sensor. This compensation
is combined with rotations from jit.anim.node, [`@quat`](quat.md), [`@rotate`](rotate.md),
and [`@rotatexyz`](rotatexyz.md).

> :memo: `@rotatemethod 1` by elevation is emulated in [dp.kinect2](../../dp.kinect2/)
> and removed from all v1.3 and newer plugins.
