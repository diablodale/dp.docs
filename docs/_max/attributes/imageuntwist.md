---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - physical
usage:
  signature: "UNTWIST_BOOLEAN"
  values:
    "0": no imageuntwist messages (default)
    "1": output imageuntwist messages
  examples:
    - "@imageuntwist 1"
---

Rotation (degrees) to align depth, color, etc. images to gravity.
Top pixels are away from gravity and bottom pixels towards gravity.
The `imageuntwist` message is sent out the fifth outlet on each bang.

Common use is to set the `@theta` attribute of
[`jit.rota`](https://docs.cycling74.com/max7/refpages/jit.rota) to this
value (converted to radians). Then, send the image matrix from the plugin
to the `jit.rota`.

```python
# Max native:   @imageuntwist 1 @skeletonformat 1
imageuntwist 10.2

# OSC protocol: @imageuntwist 1
/imageuntwist 10.2
```

> 📝 This feature is only supported on sensors with an
> [IMU](https://en.wikipedia.org/wiki/Inertial_measurement_unit).
