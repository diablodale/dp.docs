---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - physical
usage:
  signature: "GRAVROT_BOOLEAN"
  values:
    "0": no gravrot messages (default)
    "1": output gravrot messages
  examples:
    - "@gravrot 1"
---

Rotation relative to gravity message; angle (degrees) around a vector output
to fifth outlet on bang. Common use is to set the `@rotate` attribute of
[jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node) to these values.

Another possibility is using [`@rotatemethod 2`](rotatemethod.md)
to automatically compensate for gravity.

```python
# Max native:   @gravrot 1 @skeletonformat 1
gravrot a x y z
gravrot 16.798854 0.147311 0. 0.98909

# OSC protocol: @gravrot 1
/gravrot a x y z
/gravrot 16.798854 0.147311 0. 0.98909
```
