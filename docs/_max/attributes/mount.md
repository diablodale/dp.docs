---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{0 | 90 | 180 | 270}"
  values: "0 (default)"
  examples:
    - "@mount 180"
---

Mount rotation of sensor in clockwise degrees; may optimize ai models like body tracking.
Useful when you mount your sensor upside down `@mount 180`, or on either side
with `@mount 90` or `@mount 270`.

This *does not* rotate output values. To rotate values, use [`@quat`](quat.md),
[`@rotate`](rotate.md), [`@rotatexyz`](rotatexyz.md), [`@rotatemethod`](rotatemethod.md),
and [jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node).
