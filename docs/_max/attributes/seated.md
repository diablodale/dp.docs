---
products:
  - dp.kinect
tags:
  - visual adjustment
usage:
  signature: "SEATED_BOOLEAN"
  values:
    "0": normal skeleton tracking (default)
    "1": seated skeleton tracking
  examples:
    - "@seated 1"
---

Enable seated skeleton tracking; only tracks upper body.
Often used with [`@nearmode`](nearmode.md).

## dp.kinect

[Seated skeleton tracking](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh973077(v=ieb.10))
only tracks 10 upper [skeleton joints](skeleton.md#joint-names):
head, center shoulder, left/right shoulder, left/right elbow, left/right wrist,
and left/right hand.
