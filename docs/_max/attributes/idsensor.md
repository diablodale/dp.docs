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
    - "@idsensor camera123.mynetwork"
    - "@idsensor ip:camera123.mynetwork"
    - "@idsensor 192.168.2.44"
    - "@idsensor ip:192.168.2.44"
    - "@idsensor 2001:db8::1234:5678"
    - "@idsensor ip:2001:db8::1234:5678"
---

Bind specific sensor to the plugin. If `@idsensor` is not set
when the plugin receives an [`open`](../methods/open.md) method, it will
automatically select the first found sensor.

Consult your sensor manufacturer's documentation for the id type and format.
Examples include: serial number, usb path, network hostname, IP address, etc.

IP network identifiers may be prefixed with `ip:` to distinguish them.

Get the list of supported sensors with [`getusbidlist`](../methods/getusbidlist.md).

> 📝 Plugins before v1.3.20210818 use the old name `@idkinect`.
> It is deprecated.

## dp.kinect

Microsoft's [Kinect v1](../../_hardware/sensors/kinect-v1.md) SDK identifiers
are USB connection strings. They are unique to a specific USB port -- not
to the Kinect itself.

## dp.kinect2

Microsoft's [Kinect v2](../../_hardware/sensors/kinect-v2.md) SDK only
supports one single Kinect v2 per host computer. The identifier is
always `defaultkinectid`.

## dp.kinect3

Microsoft's [Kinect v3](../../_hardware/sensors/kinect-v3.md) SDK identifiers
are serial numbers.

## dp.oak

[Luxonis OAK](../../_hardware/sensors/oak-v1.md) SDK identifiers are
MXID serial numbers, IP addresses, and network hostnames. Hostnames must
be distinguished from MXID serial numbers. Therefore, hostnames must have
a dot `.` in them *or* be prefixed with `ip:`

* ✅Good names `camera123.mynetwork`, `camera123.building2.myuni.edu`, `ip:camera123`
* ❌Bad name `camera123`
