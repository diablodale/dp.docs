---
parent: Attributes
products:
  - dp.kinect2
categories:
  - visual
usage:
  signature: "{0 | 1}"
  values: "off"
  examples:
    - "@skelcolor 1"
---

Skeleton joint output from the fifth outlet in colormap coordinates.
This output does not provide z-depth or orientation.
Output format (native Max messages, OSC protocol, etc.) is determined by
[`@skeletonformat`](skeletonformat.md).

* 0 = off
* 1 = joints in colormap coordinates

```sh
# @skeletonformat 0
/skelcolor/userid/jointname column row confidence

# @skeletonformat 1
skelcolor userid jointname column row confidence
```

* `userid`, `jointname`, and `confidence` are the same as [@skeleton](skeleton.md) output
* `column, row` are integers that represent the column and row in the colormap image

### Examples

```sh
# @skeletonformat 0
/skelcolor/2/r_shoulder 975 758 0.5

# @skeletonformat 1
skelcolor 2 r_shoulder 975 758 0.5
```
