---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual
usage:
  signature: "UNIQUE_BOOLEAN"
  values:
    "0": always output on a bang (default)
    "1": only output when unique
  examples:
    - "@unique 1"
---

Unique-only matrices and messages; bang may not output when no changes.
This is *much* more efficient than using a Max object like
[jit.change](https://docs.cycling74.com/max7/refpages/jit.change).

`@unique 1`, [`@pipeline async`](pipeline.md#async), and banging the plugin at double the
sensor's native frame rate will get the newest sensor data with lowest latency due to
[Nyquist](pipeline.md#async).
