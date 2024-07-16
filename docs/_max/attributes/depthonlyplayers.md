---
redirect_to: /max/attributes/onlyplayers
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
tags:
  - visual adjustment
usage:
  signature: "BITFIELD_INT | SOURCE+SOURCE+..."
  values:
    "0": no filtering (default)
    "1..15": filter pixels by tracked skeletons
  examples:
    - "@onlyplayers 1   <- depth is filtered"
    - "@onlyplayers 3   <- depth and color are filtered"
    - "@onlyplayers depth        <- depth is filtered"
    - "@onlyplayers color+depth  <- depth and color are filtered"
---

Filter source by tracked players. Deprecated. Use [`@onlyplayers`](onlyplayers.md).

> 📝 Plugin v1.3.20240315 and older use this deprecated attribute.
> Use [`@onlyplayers`](onlyplayers.md) with newer plugins.
