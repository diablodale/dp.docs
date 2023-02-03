---
products:
  - dp.kinect3
  - dp.oak
categories:
  - color settings
usage:
  signature: "{ auto | EXPOSURE_NUM } [{auto | ISO_INTEGER }]"
  values:
    "auto": automatic color exposure and iso (default)
    "[1..5000000]": specific exposure, automatic iso
    "[1..5000000] [100..1600]": specific exposure, specific iso
  examples:
    - "@colorexposure auto        <- automatic exposure and iso"
    - "@colorexposure 16666       <- 16.6ms exposure, auto iso"
    - "@colorexposure 16666 auto  <- 16.6ms exposure, auto iso"
    - "@colorexposure 16666 800   <- 16.6ms exposure, 800 iso"
---

Color exposure in microseconds (µs) and ISO sensitivity.

Each sensor model may have different exposure and ISO ranges.
Newer sensors and plugins usually have more flexible ranges.

* `auto` is the default; exposure and ISO is automatically chosen.
* `[1..5000000]` exposure is the length of time the color sensor
  receives light to create one frame. Time is measured in
  microseconds, except for [dp.kinect](#dpkinect).
* `[100..1600]` ISO is the sensitivity to light of the color sensor.

## dp.kinect

[`dp.kinect`](../../dp.kinect/) uses the old attribute `@exposure`
to set color exposure time. The default is automatic color exposure.
To set a specific color exposure, disable automatic color exposure
and then set the exposure, e.g. `@autoexposure 0 @exposure 166`.

Exposure time is measured in units of 1/10000 second. Therefore,
`@autoexposure 0 @exposure 166.6` is a 16.66 millisecond exposure.
The range of possible exposure units is `[1.0..4000.0]`.
