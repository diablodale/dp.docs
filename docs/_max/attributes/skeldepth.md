---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "output joints in depthmap coordinates"
  examples:
    - "@skeldepth 1"
---

Skeleton joint output from the fifth outlet in depthmap coordinates.
This output does not provide orientation.
Output format (native Max messages, OSC protocol, etc.) is determined by
[`@skeletonformat`](skeletonformat.md).

```python
# @skeletonformat 0
/skeldepth/playerId/jointname column row depth confidence

# @skeletonformat 1
skeldepth playerId jointname column row depth confidence
```

* `playerId`, `jointname`, and `confidence` are the same as [`@skeleton`](skeleton.md) output
* `column, row` are integers that represent the column and row in the depthmap image
* `depth` is z-depth at that pixel in units chosen by [`@distmeter`](distmeter.md)

### Examples

```python
# @skeletonformat 0 @distmeter 0
/skeldepth/2/r_shoulder 105 342 3712 0.5

# @skeletonformat 1 @distmeter 1
skeldepth 2 r_shoulder 105 342 3.712 0.5 
```
