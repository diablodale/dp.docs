---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "CONFIDENCE_FLOAT"
  values: 0.5 (default)
  examples:
    - "@posconfidence 1.0"
---

Filter skeleton body, joints, and face by their [confidence](skeleton.md#joint-location).
This confidence must be `@posconfidence` value or higher. Some plugin output
has only three possible confidence values: `0.0`, `0.5`, and `1.0`. Therefore, the
`@posconfidence` default of `0.5` will only output those with `0.5` average
and `1.0` high confidence.
