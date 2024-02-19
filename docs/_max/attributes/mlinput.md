---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "FourCC1 [FourCC2]..."
  values: "mlinput rgb (default)"
  examples:
    - "@mlinput bgr"
    - "@mlinput rgba"
---

Machine learning input source and channels using a list of FourCC codes.
The default `@mlinput rgb` transcodes color sensor input into a 3-channel tensor
with the channel order: red green blue.

Choose the FourCC code needed for your model's tensor input. Currently, only packed
FourCC codes are supported, e.g. bgr, bgra, rgb, rgba, argb, grey, y16, etc.

```
Examples:
  @mlinput grey       # greyscale, 1-channel
  @mlinput bgr        # color, 3-channel in order blue green red
  @mlinput rgba       # color, 4-channel in order red green blue alpha

+--------+                          +-----+  
| sensor |  -->  @mlinput bgr  -->  | BGR |
+--------+                          +-----+
```
