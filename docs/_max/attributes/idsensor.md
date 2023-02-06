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
    - "@idsensor USB\\VID_045E&PID_02C2\\5&1C8A28AD&0&9"
---

Bind specific sensor to the plugin. If `@idsensor` is not set
when the plugin receives an [`open`](../methods/open.md) method, it will
automatically select the first found sensor.

Get the list of supported sensors with [`getusbidlist`](../methods/getusbidlist.md).

> :memo: Plugins before v1.3.20210818 use the old name `@idkinect`.
> It is deprecated.

## dp.kinect

Microsoft's [Kinect v1](../../_hardware/sensors/kinect-v1.md) SDK identifiers
are USB connection strings. The identifiers change when the USB ports change.

## dp.kinect2

Microsoft's [Kinect v2](../../_hardware/sensors/kinect-v2.md) SDK only
supports one single Kinect v2 per host computer. Its identifier is
always `defaultkinectid`.
