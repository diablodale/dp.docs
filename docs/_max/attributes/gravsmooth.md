---
products:
  - dp.kinect
tags:
  - visual adjustment
usage:
  signature: "[0.0..1.0]"
  values: "0.05 (default)"
  examples:
    - "@gravsmooth 0.13"
---

Smoothing factor applied to gravity and acceleration where `0.0` is no smoothing
and `1.0` is extreme smoothing. Less smoothing will decrease lag yet cause
more jitters. The smoothing most visibly affects the responsiveness/smoothness
of [`@rotatemethod 2`](rotatemethod.md).
