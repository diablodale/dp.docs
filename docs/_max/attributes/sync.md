---
products:
  - dp.kinect
tags:
  - visual adjustment
usage:
  signature: "SYNC_BOOLEAN"
  values:
    "0": normal synchronization (default)
    "1": aggressive synchronization
  examples:
    - "@sync 1"
---

Enable synchronization of data to be within 16.6 milliseconds (1/60<sup>th</sup> second).
Data is discarded when not within this synchronization period. Therefore,
it is possible to bang the plugin yet have no matrices output when this is enabled.
