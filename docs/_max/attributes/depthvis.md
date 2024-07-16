---
products:
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "MILLIMETERS_INT"
  values: "50 (default)"
  examples:
    - "@depthvis 75"
---

Depth visibility filter removes [double images and edge artifacts](align.md#artifacts)
in image matrices. The default of 50mm identifies and removes obstructed pixels
in common situations.

Set `@depthvis 0` to disable this filter or simulate [dp.kinect](../dp.kinect.md) behavior.

> 📝 Plugin versions v1.2.20200629 and newer support this feature.
