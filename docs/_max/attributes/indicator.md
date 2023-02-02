---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "INDICATOR_BOOLEAN"
  values:
    "0": no streaming/recording indicator (default)
    "1": enable streaming/recording indicator
  examples:
    - "@indicator 1"
---

Enable streaming/recording indicator (e.g. LED) on the sensor.
Not all sensors have this indicator.
