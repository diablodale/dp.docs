---
published: false
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "FLOOROUT_INT"
  values:
    "off": off (default)
    "bang": output floor message on every bang
    "attr": floor values only on @floor attribute
  examples:
    - "@floorout bang"
---

Output [`floor`](floor.md#floor-message) message on every bang from the fifth outlet.
More efficient than separately querying the `@floor` attribute on every bang.
