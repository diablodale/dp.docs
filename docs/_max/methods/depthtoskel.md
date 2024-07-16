---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "DEPTH_U DEPTH_V DEPTH_Z [DEPTH_U DEPTH_V DEPTH_Z...]"
  values: depthtoskel X Y Z
  examples:
    - "depthtoskel -0.42012 0.294084 2.4"
---

Transform depth pixel UVZ to real-world XYZ coordinates where
`U` is column, `V` is row, and `Z` is depth. The result is affected by the values of:
[`@distmeter`](../attributes/distmeter.md),
[`@flipx`](../attributes/flipx.md), [`@align`](../attributes/align.md),
[`@position`](../attributes/position.md), [`@quat`](../attributes/quat.md),
[`@rotate`](../attributes/rotate.md), [`@rotatexyz`](../attributes/rotatexyz.md),
and [`@scale`](../attributes/scale.md).

> 📝 Older plugins use the old deprecated method name `pixeltoskel`.

## Examples

```python
# single depth coordinate
depthtoskel 110 85 2.4              <- one UVZ depth coordinate sent to inlet
depthtoskel -0.42012 0.294084 2.4   <- one XYZ real-world coordinate received from outlet

# multiple depth coordinates
depthtoskel 110 85 2.4 380 250 1.5                 <- multiple UVZ depth coordinates sent to inlet
depthtoskel -0.42012 0.294084 2.4 1.312 -0.54 1.5  <- multiple XYZ real-world coordinates received from outlet
```
