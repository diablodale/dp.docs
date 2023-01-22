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
    "char": 8-bit unsigned integer [0-255] (default)
    "float32": 32-bit normalized floating point [0.0..1.0]
  examples:
    - "@colortype float32"
---

Color component in 8-bit unsigned integer or 32-bit normalized float.
This type combined with [`@colormap`](colormap.md) together define the exact memory
layout of color data.

Almost always, the `float32` type is available for computation efficiency; not more
color accuracy. The plugin can convert sensor data to `char` or `float32` efficiently.
Consider how the color data is later consumed to choose the best data type. For example,
the memory size of a `float32` jitter matrix is four times larger than `char`. Yet,
having the data as `float32` may speed later processing with OpenGL, filters, shaders, etc.
