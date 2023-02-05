---
products:
  - dp.kinect3
tags:
  - physical
usage:
  signature: "[-1000000 - 1000000]"
  values: "0 (default)"
  examples:
    - "@depthdelay 4000"
    - "@depthdelay -800"
---

Depth capture delay (microseconds) relative to color capture.

Use to synchronize and coodinate multiple sensors with attributes including:
[`depthdelay`](depthdelay.md), [`syncdelay`](syncdelay.md),
[`syncmode`](syncmode.md), and [`idsensor`](idsensor.md).

* Default `@depthdelay 0` means the depth and color images should
  be time aligned.
* `-fps_in_µs <= depthdelay <= fps_in_µs` where `fps_in_µs` is
  [`@depthfps`](depthfps.md) frames per second converted to
  microseconds

## dp.kinect3

* [Device synchronization modes](https://learn.microsoft.com/en-us/azure/kinect-dk/capture-device-synchronization)
* [Sync technical details](https://learn.microsoft.com/en-US/azure/Kinect-dk/multi-camera-sync)
