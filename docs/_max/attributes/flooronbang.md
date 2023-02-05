---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - physical
usage:
  signature: "ONBANG_BOOLEAN"
  values:
    "0": off (default)
    "1": output floor values on every bang
  examples:
    - "@flooronbang 1"
---

Output [`floor`](floor.md) plane as message on every bang from the fifth outlet.
More efficient than separately querying the `@floor` attribute on every bang.
