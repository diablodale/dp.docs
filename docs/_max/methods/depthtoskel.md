---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "[U_NUMBER V_NUMBER Z_NUMBER [U_NUMBER V_NUMBER Z_NUMBER...]]"
  values: depthtoskel X Y Z
  examples:
    - "depthtoskel -0.42012 0.294084 2.4"
---

Transform depth pixel UVZ to real-world XYZ coordinates.
The result is affected by the values of [`@distmeter`](../attributes/distmeter.md),
[`@flipx`](../attributes/flipx.md), [`@align`](../attributes/align.md),
[`@position`](../attributes/position.md), [`@quat`](../attributes/quat.md),
[`@rotate`](../attributes/rotate.md), [`@rotatexyz`](../attributes/rotatexyz.md),
and [`@scale`](../attributes/scale.md).

> :memo: Older plugins use the old deprecated method name `pixeltoskel`.

## Examples

```python
# single depth pixel
depthtoskel 110 85 2.4              <- one depth pixel sent to the inlet
depthtoskel -0.42012 0.294084 2.4   <- one x,y,z real-world coordinate received from outlet

# multiple depth pixels
depthtoskel 110 85 2.4 380 250 1.5                 <- multiple depth pixels sent to inlet
depthtoskel -0.42012 0.294084 2.4 1.312 -0.54 1.5  <- x,y,z coordinates received from outlet
```
