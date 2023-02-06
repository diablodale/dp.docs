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

Output [`@floor`](floor.md) plane values as a message on every bang
from the fifth outlet. More efficient than separately querying the `@floor`
attribute on every bang.

```python
# Max native:   @skeleton 1 @flooronbang 1 @skeletonformat 1
# floor x y z i j k
floor 0.0 -925.7 0.0 0.12 0.97 0.047

# OSC protocol: @skeleton 1 @flooronbang 1
# /floor x y z i j k
/floor 0.0 -925.7 0.0 0.12 0.97 0.047
```
