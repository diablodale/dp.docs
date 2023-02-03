---
products:
  - dp.kinect
  - dp.kinect3
  - dp.oak
categories:
  - color settings
usage:
  signature: "{ auto | [1000...12000]}"
  values:
    "auto": automatic white balance (default)
    "[1000...12000]": white temperature (Kelvin)
  examples:
    - "@whitebalance 4000"
    - "@whitebalance auto"
---

[White balance](https://en.wikipedia.org/wiki/Color_balance) in degrees Kelvin temperature
to adjust for lighting conditions. This baseline is used to adjust all other colors. When correctly
adjusted, a white piece of paper will appear white with no shade of another color.

Each sensor model may have a different white balance temperature range.
Newer sensors and plugins usually have more flexible ranges.

* `auto` is the default; white temperature is automatically chosen
* `[1000...12000]` is an integer in Kelvin for white temperature

## dp.kinect

[`dp.kinect`](../../dp.kinect/) is limited to 2700-6500 Kelvin. Its default is
automatic white balance. To set a specific white temperature, disable automatic
and then set the temperature, e.g. `@autowhitebalance 0 @whitebalance 4000`.
