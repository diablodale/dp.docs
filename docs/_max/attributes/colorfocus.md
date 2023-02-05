---
products:
  - dp.kinect3
  - dp.oak
categories:
  - camera control
usage:
  signature: "{ auto | FOCUS_FLOAT }"
  values:
    "auto": automatic color focus (default)
    "[0.0..1.0]": manual color focus
  examples:
    - "@colorfocus auto"
    - "@colorfocus 0.65"
---

Color camera focus position; automatic or manual.

Each sensor model may have a different color focus range that
allows for near and far-focus. Many sensors, e.g. all Microsoft Kinect
models, have fixed-focus color cameras.
`@colorfocus` is ignored on fixed-focus cameras.

* `auto` is the default; focus position is automatically chosen
* `[0.0..1.0]` is a normalized float for a manual focus position;
  `0.0` is far-focus position, `1.0` is near-focus position.
  Values between are sensor-specific and may not be linear.

## dp.oak

Luxonis OAK sensors are available with [automatic or fixed-focus
lenses](https://docs.luxonis.com/projects/hardware/en/latest/pages/guides/af_ff.html).
Consider the trade-offs and benefits of each.
