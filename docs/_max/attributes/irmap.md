---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "IROUT_INT"
  values:
    "0": no infrared output (default)
    "1": infrared output
  examples:
    - "@irmap 1"
---

Infrared (IR) image output on the third outlet. This, resolution
[`@irmapres`](irmapres.md), and IR value type [`@irtype`](irtype.md)
together define the memory layout of IR data.

Gamma correction is applied with [`@irgamma`](irgamma.md).

> :memo: [Kinect v1]({{- site.baseurl -}}/hardware/sensors/kinect-v1/) hardware
> does not have enough USB bandwidth to output color and infrared data at the same time.

> :memo: [Luxonis OAK]({{- site.baseurl -}}/hardware/sensors/oak-v1/) sensors
> do not provide traditional infrared data. However, a Luxonis sensor
> with an IR illumination LED (e.g. OAK-D Pro) can output the right
> rectified monochrome camera data. Enable both [`@depthmap`](depthmap.md)
> and `@irmap` to output that right camera data on the third outlet.
