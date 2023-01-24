---
products:
  - dp.kinect2
categories:
  - visual
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "output joints in colormap coordinates"
  examples:
    - "@skelcolor 1"
---

Skeleton joint output from the fifth outlet in colormap coordinates.
This output does not provide z-depth or orientation.
Output format (native Max messages, OSC protocol, etc.) is determined by
[`@skeletonformat`](skeletonformat.md).

```python
# @skeletonformat 0
/skelcolor/userid/jointname column row confidence

# @skeletonformat 1
skelcolor userid jointname column row confidence
```

* `userid`, `jointname`, and `confidence` are the same as [@skeleton](skeleton.md) output
* `column, row` are integers that represent the column and row in the colormap image

### Examples

```python
# @skeletonformat 0
/skelcolor/2/r_shoulder 975 758 0.5

# @skeletonformat 1
skelcolor 2 r_shoulder 975 758 0.5
```
