---
parent: Attributes
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "int"
  values:
    "0": "off"
    "1": "on (default)"
  examples:
    - "@speechadapt 0"
---

Constantly adapt speech recognition model to adjust for various
speaker(s). This can cause problems over time in noisy
environments or where there are a great number of speakers (in a
kiosk environment, for example). For these scenarios and long
recognition sessions (a few hours or more), it may be beneficial
to turn off adaptation of the acoustic model. This will prevent
recognition accuracy from degrading over time and lessen memory usage.
