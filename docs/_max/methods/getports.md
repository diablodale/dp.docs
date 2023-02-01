---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "[ID1_STRING [ID2_STRING...]]"
  values: ports id_string port status
  examples:
    - "ports 0000171696318 sync-out 0"
    - "ports 0000171696318 sync-in 1"
---

Get status of sensor ports like those for synchronization.

```python
# send to first inlet of plugin for ports on default sensor
getports

# send to first inlet of plugin for ports on sensor 0000171696318
getports 0000171696318

# send to first inlet of plugin for ports on sensors 0000171696318 and 4580030408629
getports 0000171696318 4580030408629

######## dumpout response is: ports id_string port status ########
# sync out port on sensor 0000171696318 is not connected
ports 0000171696318 sync-out 0

# sync in port on sensor 0000171696318 is connected
ports 0000171696318 sync-in 1
```

id_string
: same sensor identifiers from [`@idsensor`](../attributes/idsensor.md)
  and [`getusbidlist`](getusbidlist.md)

port
: sensor-specific name of port

status
: sensor-specific status of port

## dp.kinect3

[`dp.kinect3`](../../dp.kinect3/) has two
[synchronization ports](https://learn.microsoft.com/en-US/azure/Kinect-dk/multi-camera-sync)

sync-out
: synchronization pulse output; the VSync for the RGB camera

sync-in
: synchronization pulse receiver

with a status of

0
: disconnected port

1
: connected port
