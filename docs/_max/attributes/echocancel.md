---
products:
  - dp.kinect
tags:
  - audio
usage:
  signature: "ECHO_BOOLEAN"
  values:
    "0": no echo cancellation (default)
    "1": enable echo cancellation"
  examples:
    - "@echocancel 1"
---

Echo cancellation for audio and speech. Enable this when both capturing
and playing sound from your sensor.
