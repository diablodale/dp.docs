---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "X Y Z [X Y Z...]"
  values: skeltodepth DEPTH_U DEPTH_V DEPTH_Z
  examples:
    - "skeltodepth 150 100 2.4"
---

Transform real-world XYZ coordinates to depth UVZ coordinates where
`U` is column, `V` is row, and `Z` is depth. The result is affected by the values of:
[`@distmeter`](../attributes/distmeter.md),
[`@flipx`](../attributes/flipx.md), [`@align`](../attributes/align.md),
[`@position`](../attributes/position.md), [`@quat`](../attributes/quat.md),
[`@rotate`](../attributes/rotate.md), [`@rotatexyz`](../attributes/rotatexyz.md),
and [`@scale`](../attributes/scale.md).

## Examples

```python
# single real-world coordinate
skeltodepth -1.1 0.4 2.4    <- one XYZ real-world coordinate sent to inlet
skeltodepth 150 100 2.4     <- one UVZ depth coordinate received from outlet

# multiple real-world coordinates
skeltodepth -1.1 0.4 2.4 3.1 5.0 3.7  <- multiple XYZ real-world coordinates sent to inlet
skeltodepth 150 100 2.4 350 28 3.7    <- multiple UVZ depth coordinates received from outlet
```
