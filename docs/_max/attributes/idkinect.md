---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - physical
usage:
  signature: "ID_STRING"
  values: sensor specific default
  examples:
    - "@idkinect USB\\VID_045E&PID_02C2\\5&1C8A28AD&0&9"
---

Bind specific Microsoft Kinect sensor to the plugin. If `@idkinect` is not set
when the plugin receives an `open` message, it will automatically select
the first found Kinect.

Get the list of supported Kinect sensors with [`getusbidlist`](../methods/getusbidlist.md).

Microsoft Kinect sensors have limitations

* Microsoft's [Kinect v1]({{- site.baseurl -}}/hardware/sensors/kinect-v1/) SDK identifiers
  are USB connection strings. The identifiers change when the USB ports change.
* Microsoft's [Kinect v2]({{- site.baseurl -}}/hardware/sensors/kinect-v2/) SDK only
  supports one single Kinect v2 per host computer. Its identifier is always `defaultkinectid`.

> :memo: Plugins v1.3.20210818 and newer use instead [`@idsensor`](idsensor.md)
