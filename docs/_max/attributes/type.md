---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual
usage:
  signature: "TYPE_STRING"
  values:
    "long": signed integer (default)
    "float32": 32-bit floating point
    "float64": 64-bit floating point
  examples:
    - "@type float32"
---

Depthmap value in signed integer, 32-bit float, or 64-bit float.
This type combined with [`@depthmap`](depthmap.md) together define the exact memory
layout of depth data. The values for depth are affected by [`@distmeter`](distmeter.md)
and some combinations may not be useful.

* `long` values are signed integers; 32-bit with Max 32-bit, 64-bit with Max 64-bit
* `float32` and `float64` values [0.0...1.0] are for computation efficiency;
  not increased accuracy

The plugin can convert sensor data to supported types efficiently.
Consider how the data is later consumed to choose the best data type.
