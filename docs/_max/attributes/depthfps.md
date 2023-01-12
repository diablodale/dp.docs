---
products:
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "FPS_INT"
  values: "30 (default)"
  examples:
    - "@depthfps 15"
    - "@depthfps 10"
---

Depth camera native capture frame rate expressed as frames per second (Hz).
Also controls color camera frame rate when your plugin has no `@colorfps` attribute.
