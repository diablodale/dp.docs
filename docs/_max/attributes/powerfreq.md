---
products:
  - dp.kinect
  - dp.kinect3
  - dp.oak
tags:
  - camera control
usage:
  signature: "{ FILTER_INT | POWER_FREQUENCY }"
  values:
    "0": disable filter (default)
    "1 or 50": 50 Hz power filter
    "2 or 60": 60 Hz power filter
  examples:
    - "@powerfreq 1"
    - "@powerfreq 50"
---

Reduce video banding and flicker related to regional
[power frequency](https://en.wikipedia.org/wiki/Utility_frequency).

* `0`: disable filter; not supported for [dp.kinect3](#dpkinect3)
* `1` or `50`: apply filter for 50 Hz mains power
* `2` or `60`: apply filter for 60 Hz mains power

> 📝 Plugin versions v1.3.20210226 and newer support using frequency
> values `50` and `60`.

## dp.kinect3

Microsoft [Azure Kinect](../../_hardware/sensors/kinect-v3.md)
sensor always applies a power frequency filter and can not be disabled.
The default is 60 Hz. Change it to 50 Hz with `@powerfreq 50`.
