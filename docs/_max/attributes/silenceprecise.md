---
parent: Attributes
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "MILLISECONDS"
  values: "OS specific"
  examples:
    - "@silenceprecise 800"
---

Milliseconds of silence needed before completing a recognition that is
**not** vague or ambiguous. For example, in a grammar which has two
sentences, "new game please" and "new game", a non-ambiguous recognition
would be "new game please."

The value of this attribute must be less than or equal to
[`@silencevague`](silencevague.md).
