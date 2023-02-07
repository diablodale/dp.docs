---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "DEPTH_U DEPTH_V DEPTH_Z [DEPTH_U DEPTH_V DEPTH_Z...]"
  values: depthtocolor COLOR_U COLOR_V
  examples:
    - "depthtocolor 850 105"
---

Transform depth pixel UVZ to color UV coordinates where `U` is column, `V` is row,
and `Z` is depth. The result is affected by the values of:
[`@distmeter`](../attributes/distmeter.md), [`@flipx`](../attributes/flipx.md),
and [`@align`](../attributes/align.md).

## Examples

```python
# single depth coordinate
depthtocolor 110 85 2.4    <- one UVZ depth coordinate sent to inlet
depthtocolor 850 105       <- one UV color coordinate received from outlet

# multiple depth coordinates
depthtocolor 110 85 2.4 380 250 1.5   <- multiple UVZ depth coordinates sent to inlet
depthtocolor 850 105 1450 650         <- multiple UV color coordinates received from outlet
```
