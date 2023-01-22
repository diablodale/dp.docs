---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
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

`long` is a signed integer. 32-bit integer with Max 32-bit. 64-bit integer
with Max 64-bit.

Almost always, this depth type is available for computation efficiency; not more
depth accuracy. The plugin can convert sensor data to any type efficiently.
Consider how the depth data is later consumed to choose the best data type.
