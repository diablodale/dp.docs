---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  examples: 
    - open
---

Open and initialize the connection to a sensor. When [`@idsensor`](../attributes/idsensor.md)
has not been set, then the plugin defaults to the first found sensor.

A message for success `open 1` or failure `open 0` is reported at dumpout.
