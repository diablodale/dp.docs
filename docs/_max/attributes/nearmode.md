---
products:
  - dp.kinect
tags:
  - visual adjustment
usage:
  signature: "NEAR_BOOLEAN"
  values:
    "0": normal range (default)
    "1": near range
  examples:
    - "@nearmode 1"
---

Enable near range skeleton tracking. Not supported by all models.
Often used with [`@seated`](seated.md).

## dp.kinect

Not all Kinect v1 sensors support
[near range](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh973078(v=ieb.10)#depth-space-range).

* Range is `[0.4..3.0]` meters
* Supports normal and [`@seated`](seated.md) skeleton tracking
