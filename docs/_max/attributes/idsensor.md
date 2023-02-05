---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "ID_STRING"
  values: sensor specific default
  examples:
    - "@idsensor 14442C10C1A1C6D200"
---

Bind specific sensor to the plugin. If `@idsensor` is not set
when the plugin receives an `open` message, it will automatically select
the first found sensor.

Get the list of supported sensors with [`getusbidlist`](../methods/getusbidlist.md).

> :memo: Plugins before v1.3.20210818 use instead [`@idkinect`](idkinect.md)
