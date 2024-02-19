---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "BOOLEAN"
  values:
    "0": no swap
    "1": swap input channels 0 and 2 before inference
  examples:
    - "@mlswapch 1"
---

Swap 3-channel ml input tensor channels 0 and 2 before inference.

> :memo: [`@mlinput`](mlinput.md) may be easier to understand than [`@mlswapch`](mlswapch.md).

Most models that process color data need their input in a specific channel
order. `@mlswapch` is one method to change the order of channels. For example,
RGB color frames with `@mlswapch 1` will swap channels 0 and 2 to make BGR for inference.

```
+-----+                           +-----+  
| RGB |   -->  @mlswapch 1  -->   | BGR |
+-----+                           +-----+
```

3-channel input with [`@mlswapch`](mlswapch.md) applies [`@mlmean`](mlmean.md)
and [`@mlscale`](mlscale.md) to channels 2,1,0 *and* swaps data
channels 0 and 2 before sending to the model as input.
