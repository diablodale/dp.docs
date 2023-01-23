---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "GAMMA_FLOAT"
  values: "1.0 (default)"
  examples:
    - "@irgamma 1.3"
---

Apply [gamma correction](https://en.wikipedia.org/wiki/Gamma_correction)
to infrared image enabled with [`@irmap`](irmap.md). Use to brighten or darken
areas of the infrared image without adjusting the entire image intensity.

The formula is: output = input<sup>(1/irgamma)</sup> where

* `1.0` disables correction
* `> 1.0` brightens
* `< 1.0` darkens
