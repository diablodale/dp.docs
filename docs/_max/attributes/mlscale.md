---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "FLOAT [FLOAT]..."
  examples:
    - "@mlscale 0.429 0.424 0.425"
---

Scale input values after subtracting mean: `(pixel_value - mean) * scale`.

Some models are trained so that inference later needs standardized input.
Use [`@mlmean`](mlmean.md) and `@mlscale` to standardize real-time input for these models.
The given `@mlscale` floats are multiplied to each channel in the same order.

3-channel input with [`@mlswapch`](mlswapch.md) applies `@mlscale` to channels 2,1,0 *and* swaps data
channels 0 and 2 before sending to the model as input.

> 📝 [`@mlinput`](mlinput.md) may be easier to understand than [`@mlswapch`](mlswapch.md).
