---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual
usage:
  signature: "{char | long | float32 | float64}"
  values:
    "char": 8-bit unsigned integer
    "long": signed integer (default)
    "float32": 32-bit normalized floating point
    "float64": 64-bit normalized floating point
  examples:
    - "@irtype float32"
---

Infrared (IR) values in 8-bit unsigned integer, long signed integer, or
32/64-bit normalized float. Enable IR output with [`@irmap`](irmap.md).

* `char` values [0..255] are compact yet result in a slight loss of precision
* `long` values are signed integers; 32-bit with Max 32-bit, 64-bit with Max 64-bit
* `float32` and `float64` values [0.0..1.0] are for computation efficiency;
  not increased accuracy

The plugin can convert sensor data to supported types efficiently.
Consider how the data is later consumed to choose the best data type. For example,
the memory size of a `float32` jitter matrix is four times larger than `char`. Yet,
having the data as `float32` may speed later processing with OpenGL, filters, shaders, etc.
