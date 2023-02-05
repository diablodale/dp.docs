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
    "char": 8-bit unsigned integer (default)
    "float32": 32-bit normalized floating point
  examples:
    - "@colortype float32"
---

Color component in 8-bit unsigned integer or 32-bit normalized float.
This type combined with [`@colormap`](colormap.md) together define the memory
layout of color data.

* `char` values [0..255] are compact and often the native sensor color type
* `float32` values [0.0..1.0] are for computation efficiency; not increased accuracy

The plugin can convert sensor data to supported types efficiently.
Consider how the data is later consumed to choose the best data type. For example,
the memory size of a `float32` jitter matrix is four times larger than `char`. Yet,
having the data as `float32` may speed later processing with OpenGL, filters, shaders, etc.
