---
redirect_to: /max/attributes/flooronbang
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{STRING | INT}"
  values:
    "off or 0": off (default)
    "message or 1": "@floor attribute and floor message"
    "attr or 2": "@floor attribute only"
  examples:
    - "@floorout message"
---

Calculate the floor plane on each bang, update the [`@floor`](floor.md) attribute,
and optionally output a message.
More efficient than querying the same [`@floor`](floor.md) values
using `getfloor` on every bang.

> 📝 Plugins before v1.3 use the old attribute `@flooronbang`.
> It is deprecated. Use `@floorout message` with newer plugins.

## Floor message

```python
# Max native:   @skeleton 1 @floorout message @skeletonformat 1
# floor x y z i j k
floor 0.0 -925.7 0.0 0.12 0.97 0.047

# OSC protocol: @skeleton 1 @floorout message
# /floor x y z i j k
/floor 0.0 -925.7 0.0 0.12 0.97 0.047
```

See [`@floor`](floor.md) for further details of the floor plane values.
