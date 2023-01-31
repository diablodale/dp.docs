---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  #signature: "[ID1_STRING [ID2_STRING...]]"
  values: usbidlist [ID1_STRING [ID2_STRING...]]
  examples:
    - "usbidlist USB\\VID_045E&PID_02C2\\5&1C8A28AD&0&9"
    - "usbidlist 87D699E7FEAE545DA6"
    - "usbidlist 14442C10C1A1C6D200 3A01A2FAB82150E9BC"
---

Output supported sensor identifiers on the dumpout outlet. Use one of these
identifiers with [`@idsensor`](../attributes/idsensor.md).

* [Kinect v1]({{- site.baseurl -}}/hardware/sensors/kinect-v1/) hardware SDK identifiers
  are USB connection strings. The identifiers change when the USB ports change.
* [Kinect v2]({{- site.baseurl -}}/hardware/sensors/kinect-v2/) hardware SDK only
  supports one (1) Kinect per host computer. Its single identifier is always `defaultkinectid`.
* Newer sensors use their internal serial number as the identifier.