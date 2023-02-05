---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - face
usage:
  signature: "SMOOTH_FLOAT1 SMOOTH_FLOAT2 SMOOTH_FLOAT3 SMOOTH_FLOAT4 SMOOTH_FLOAT5"
  values: 0. 0. 0. 0. 0. (default)
  examples:
    - "@facesuausmooth 0.5 0.1 0.5 0.1 0.1"
---

Smoothing for [face animation units](facesuau.md) (AU) with the same
[five parameter](smoothing.md#holt) Holt double-exponential filter used
to smooth skeleton joints. The default `0. 0. 0. 0. 0.` is no smoothing.
