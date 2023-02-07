---
products:
  - dp.kinect
tags:
  - visual adjustment
usage:
  signature: "RANGE_INT"
  values:
    "0": normal range (default)
    "1": overflow boundaries
    "2": unlimited range
  examples:
    - "@depthrange 1"
---

Enable alternate or extended depth ranges.

## dp.kinect

[Kinect v1](../../_hardware/sensors/kinect-v1.md) has three modes of operation for its
[range of depth](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh973078(v=ieb.10)#depth-space-range).

`0`
: Normal range. Values outside the sensor's normal range are set to `0`.

`1`
: Overflow boundaries. Values outside the sensor's normal range are set to one
  of three values.
  * Too near is `0`
  * Too far is `4095` or hex `0x0fff`
  * Unknown is `8191` or hex `0x1fff`

`2`
: Unlimited range provides depth values beyond `4.0` meters. The quality
  of the value is worse as distance increases.
