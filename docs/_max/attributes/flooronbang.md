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

Floor plane message output on each bang.
More efficient than querying the same [`@floor`](floor.md) values
using `getfloor` on every bang.

## Floor message

```python
# Max native:   @skeleton 1 @flooronbang 1 @skeletonformat 1
# floor x y z i j k
floor 0.0 -925.7 0.0 0.12 0.97 0.047

# OSC protocol: @skeleton 1 @flooronbang 1
# /floor x y z i j k
/floor 0.0 -925.7 0.0 0.12 0.97 0.047
```

See [`@floor`](floor.md) for further details of the floor plane values.
