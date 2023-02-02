---
products:
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "CONFIDENCE_FLOAT"
  values: "[0.0..1.0] with sensor specific defaults"
  examples:
    - "@depthconf 0.65"
---

Filter depth pixels by the confidence of those pixel values.
The pixel confidence must be `@depthconf` value or higher.
The pixel confidence and this filter are both normalized floats `[0.0..1.0]`.

A confidence value of `0.0` is no confidence. A value of `1.0` is full confidence.
Values between are sensor-specific and may not be linear.
