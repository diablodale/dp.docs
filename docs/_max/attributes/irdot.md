---
products:
  - dp.kinect3
  - dp.oak
categories:
  - camera control
usage:
  signature: "IRDOT_FLOAT"
  values: sensor specific default
  examples:
    - "@irdot 0.25"
---

IR laser dot projector brightness (power) normalized to `[0.0..1.0]`.

Each sensor model with an IR laser dot projector has a different
range of brightness. They are all normalized to `[0.0..1.0]`
where `0.0` is lowest and `1.0` is highest.
Values between are sensor-specific and may not be linear.

Some sensor models have no laser. Some sensor models do not allow
control of their laser. `@irdot` is ignored on all such sensors.

We recommend to only use the brightness (power) needed. Higher
brightness *does not* imply better results.

> :warning: IR laser dot projectors can overheat and are
> a consumable component. Consult the manufacturer's documentation
> to learn responsible and reliable usage of the IR laser dot
> projector. We are *not responsible* for misuse or its consumption.
> Suggested topics include: cooling needs, power guidelines, and duty
> cycles.
