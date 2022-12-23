---
products:
  - dp.kinect3
categories:
  - visual adjustment
usage:
  signature: "[-1000000 - 1000000]"
  values: "0 (default)"
  examples:
    - "@depthdelay 4000"
    - "@depthdelay -800"
---

Delay depth capture relative to color capture in microseconds (µs).
Use to synchronize and coodinate multiple sensors with attributes like
[`depthdelay`](depthdelay.md), [`syncdelay`](syncdelay.md),
[`syncmode`](syncmode.md), and [`idsensor`](idsensor.md).

`@depthdelay` must be: `-fps_in_µsec <= depthdelay <= fps_in_µsec`
