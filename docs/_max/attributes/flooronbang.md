---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - physical
usage:
  signature: "ONBANG_BOOLEAN"
  values:
    "0": off (default)
    "1": output floor values on every bang
  examples:
    - "@flooronbang 1"
---

Output [`@floor`](floor.md) values as messages on every bang from the messages (fifth)
output. More efficient than separately querying the `@floor` attribute on every bang.