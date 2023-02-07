---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "X Y Z [X Y Z...]"
  values: skeltocolor COLOR_U COLOR_V
  examples:
    - "skeltocolor 850 105"
---

Transform real-world XYZ coordinates to color UV coordinates where
`U` is column and `V` is row. The result is affected by the values of:
[`@distmeter`](../attributes/distmeter.md),
[`@flipx`](../attributes/flipx.md), [`@align`](../attributes/align.md),
[`@position`](../attributes/position.md), [`@quat`](../attributes/quat.md),
[`@rotate`](../attributes/rotate.md), [`@rotatexyz`](../attributes/rotatexyz.md),
and [`@scale`](../attributes/scale.md).

## Examples

```python
# single real-world coordinate
skeltocolor -1.1 0.4 2.4    <- one XYZ real-world coordinate sent to inlet
skeltocolor 850 105         <- one UV color coordinate received from outlet

# multiple real-world coordinates
skeltocolor -1.1 0.4 2.4 3.1 5.0 3.7  <- multiple XYZ real-world coordinates sent to inlet
skeltocolor 850 105 1450 650          <- multiple UV color coordinates received from outlet
```
