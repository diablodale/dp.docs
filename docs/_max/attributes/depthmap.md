---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "DEPTHOUT_INT"
  values:
    "0": no depth output (default)
    "1": depth output
    "2": depth output, calculate player indices (dp.kinect only)
  examples:
    - "@depthmap 1"
---

Depth output on the first outlet. This combined with resolution
[`@depthmapres`](depthmapres.md) and depth value type [`@type`](type.md) define
the memory layout of depth data.

> :memo: [dp.kinect](../../dp.kinect/) requires `@depthmap 2` to calculate the
> [`@playermap`](playermap.md).
