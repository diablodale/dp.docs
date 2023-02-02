---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "[ID1_STRING [ID2_STRING...]]"
  values: ports ID_STRING PORT STATUS
  examples:
    - "ports 0000171696318 sync-out 0"
    - "ports 0000171696318 sync-in 1"
---

Get status of sensor ports; like those for synchronization.

ID_STRING
: same sensor identifiers from [`@idsensor`](../attributes/idsensor.md)
  and [`getusbidlist`](getusbidlist.md)

PORT
: sensor-specific name of port

STATUS
: sensor-specific status of port

### Examples

```python
# send to first inlet of plugin for ports on default sensor
getports

# responses from dumpout: sync-out disconnected, sync-in connected
ports 0000171696318 sync-out 0
ports 0000171696318 sync-in 1

# send to first inlet of plugin for ports on sensors 0000171696318 and 4580030408629
getports 0000171696318 4580030408629

# responses from dumpout
ports 0000171696318 sync-out 0
ports 0000171696318 sync-in 1
ports 4580030408629 sync-out 1
ports 4580030408629 sync-in 0
```

## dp.kinect3

[`dp.kinect3`](../../dp.kinect3/) has two
[synchronization ports](https://learn.microsoft.com/en-US/azure/Kinect-dk/multi-camera-sync)

sync-out
: synchronization pulse output send; the VSync for the RGB camera

sync-in
: synchronization pulse input receive

with a status of

0
: disconnected port

1
: connected port
