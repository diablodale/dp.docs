---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "FLOAT [FLOAT]..."
  examples:
    - "@mlmean 0.385 0.356 0.306"
---

Subtract values from input channels before scaling: `(pixel_value - mean) * scale`.

Some models are trained so that inference later needs standardized input.
Use `@mlmean` and [`@mlscale`](mlscale.md) to standardize real-time input for these models.
The given `@mlmean` floats are *substracted* from each input channel in the same order.

3-channel input with [`@mlswapch`](mlswapch.md) applies `@mlmean` to channels 2,1,0 *and* swaps data
channels 0 and 2 before sending to the model as input.

> :memo: [`@mlinput`](mlinput.md) may be easier to understand than [`@mlswapch`](mlswapch.md).
