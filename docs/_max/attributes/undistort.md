---
products:
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "on"
  examples:
    - "@undistort 1"
---

Undistort the depth, color, and infrared output. Set
the scale factor with [`@undistortscale`](undistortscale.md).
