---
products:
  - dp.kinect
tags:
  - camera control
usage:
  signature: "[1.0..2.8]"
  values: "2.2 (default)"
  examples:
    - "@gamma 1.8"
---

[Gamma transfer function](https://en.wikipedia.org/wiki/Gamma_correction)
for encoding luminance data in the color image.
The range is `1.0` to `2.8`.

> :memo: This is distinct from [`@irgamma`](irgamma.md)
