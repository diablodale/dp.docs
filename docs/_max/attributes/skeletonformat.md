---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "{INT | FORMAT_NAME }"
  values:
    "0 or osc": "OSC protocol (default)"
    "1 or max": "native Max messages"
  examples:
    - "@skeletonformat 1   <-- enables native Max message format"
---
Message format output from the fifth outlet (skeletons, users, etc.)

OSC protocol is the legacy default. It may be helpful when sending raw
sensor data to heterogeneous network devices. The protocol can be
manipulated with OSC tools like
[CNMAT's OSC-route](http://cnmat.berkeley.edu/downloads/externals/overview).

Native Max messages are Usually the better choice when using sensor data
within Cycling74 Max. The messages can be manipulated with all built-in
Max, MSP, and Jitter objects like route, routepass, and select.

> :memo: Plugin versions v1.3.20210721 and newer support using the
> value names `max` and `osc`.
