---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - audio
usage:
  signature: "[0..10000]"
  values: "OS specific"
  examples:
    - "@silencevague 1000"
---

Milliseconds of silence needed before completing a recognition that is
vague or ambiguous. For example, in a grammar which has two sentences,
"new game please" and "new game", an ambiguous recognition would
be "new game."

The value of this attribute must be greater than
[`@silenceprecise`](silenceprecise.md).
