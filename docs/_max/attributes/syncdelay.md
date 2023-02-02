---
products:
  - dp.kinect3
categories:
  - physical
usage:
  signature: "[0..1000000]"
  values: "0 (default)"
  examples:
    - "@syncdelay 23000"
---

Synchronization delay (microseconds) on a sync subordinate sensor.
Sets the capture delay between the color camera capture and the external
sync input pulse.

Use to synchronize and coodinate multiple sensors with attributes including:
[`depthdelay`](depthdelay.md), [`syncdelay`](syncdelay.md),
[`syncmode`](syncmode.md), and [`idsensor`](idsensor.md).

* Default `@syncdelay 0` means the master and subordinate color images should
  be time aligned.
* `0 <= syncdelay <= fps_in_µs` where `fps_in_µs` is
  [`@depthfps`](depthfps.md) frames per second converted to
  microseconds

## dp.kinect3

`@syncdelay` does not affect the sync-out port connection.

* [Device synchronization modes](https://learn.microsoft.com/en-us/azure/kinect-dk/capture-device-synchronization)
* [Sync technical details](https://learn.microsoft.com/en-US/azure/Kinect-dk/multi-camera-sync)
