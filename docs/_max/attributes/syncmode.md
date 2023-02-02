---
products:
  - dp.kinect3
categories:
  - physical
usage:
  signature: "[0..1000000]"
  values:
    "off": no synchronization (default)
    "wired-main": physical wire connection, main sensor
    "wired-sub": physical wire connection, subordinate sensor
  examples:
    - "@syncmode wired-sub"
---

Select sensor's role (main, subordinate) and medium (e.g. wired)
in a synchronization group.

Use to synchronize and coodinate multiple sensors with attributes including:
[`depthdelay`](depthdelay.md), [`syncdelay`](syncdelay.md),
[`syncmode`](syncmode.md), and [`idsensor`](idsensor.md).

## dp.kinect3

* [Device synchronization modes](https://learn.microsoft.com/en-us/azure/kinect-dk/capture-device-synchronization)
* [Sync technical details](https://learn.microsoft.com/en-US/azure/Kinect-dk/multi-camera-sync)
