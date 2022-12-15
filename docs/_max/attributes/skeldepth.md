---
products:
  - dp.kinect2
categories:
  - visual
usage:
  signature: "{0 | 1}"
  default: "off"
  examples:
    - "@skeldepth 1"
---

Skeleton joint output from the fifth outlet in depthmap coordinates.
This output does not provide orientation.
Output format (native Max messages, OSC protocol, etc.) is determined by
[`@skeletonformat`](skeletonformat.md).

* 0 = off
* 1 = joints in depthmap coordinates

```sh
# @skeletonformat 0
/skeldepth/userid/jointname column row depth confidence

# @skeletonformat 1
skeldepth userid jointname column row depth confidence
```

* `userid`, `jointname`, and `confidence` are the same as [`@skeleton`](skeleton.md) output
* `column, row` are integers that represent the column and row in the depthmap image
* `depth` is z-depth at that pixel in units chosen by [`@distmeter`](distmeter.md)

### Examples

```sh
# @skeletonformat 0 @distmeter 0
/skeldepth/2/r_shoulder 105 342 3712 0.5

# @skeletonformat 1 @distmeter 1
skeldepth 2 r_shoulder 105 342 3.712 0.5 
```
