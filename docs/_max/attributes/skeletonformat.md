---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "{INT | FORMAT_NAME }"
  values:
    "0 or osc": "OSC protocol (default)"
    "1 or max": "native Max messages"
  examples:
    - "@skeletonformat 1"
    - "@skeletonformat max"
---
Message format for skeleton joints, users, faces, etc.
Native Max messages (usually better) and OSC are the two supported formats.

> :memo: Plugin versions v1.3.20210721 and newer support using the
> value names `max` and `osc`.

## Max messages {#max}

Native Max messages are usually the better choice when using sensor data
within Cycling74 Max. The messages can be manipulated with all built-in
Max, MSP, and Jitter objects like route, routepass, and select.

```python
# @skeletonformat 1
skel 2 r_shoulder -1.204 2.053 3.712 0.5
skelcolor 2 r_shoulder 975 758 0.5
```

## OSC protocol {#osc}

OSC protocol is the legacy default. It may be helpful when sending raw
sensor data to heterogeneous network devices. The protocol can be
manipulated with OSC tools like
CNMAT's OSC-route which can be found in the Max Package Manager named "ODOT" or
[download direct](https://cnmat.berkeley.edu/downloads).

```python
# @skeletonformat 0
/skel/2/r_shoulder -1.204 2.053 3.712 0.5
/skelcolor/2/r_shoulder 975 758 0.5
```
