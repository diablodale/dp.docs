---
products:
  - dp.oak
tags:
  - camera control
usage:
  signature: "{ auto | EXPOSURE_INT } [{auto | ISO_INTEGER }]"
  values:
    "auto": automatic mono exposure and iso (default)
    "[1..5000000]": specific exposure, automatic iso
    "[1..5000000] [100..1600]": specific exposure, specific iso
  examples:
    - "@monoexposure auto        <- automatic exposure and iso"
    - "@monoexposure 16666       <- 16.6ms exposure, auto iso"
    - "@monoexposure 16666 auto  <- 16.6ms exposure, auto iso"
    - "@monoexposure 16666 800   <- 16.6ms exposure, 800 iso"
---

Monochrome camera exposure in microseconds (µs) and ISO sensitivity.

Each sensor model may have different exposure and ISO ranges.
Newer sensors and plugins usually have more flexible ranges.

* `auto` is the default; exposure and ISO is automatically chosen.
* `[1..5000000]` exposure is the length of time the monochrome camera
  receives light to create one frame.
* `[100..1600]` ISO is the sensitivity to light of the monochrome camera.
