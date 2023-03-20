---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "update IDSENSOR"
  values: firmware update IDSENSOR 1
  examples:
    - "firmware update 85GB493VN90B7K"
---

Firmware update, query, and administration.

## Update

> :warning: This is rare and at your own risk.

[`dp.oak`](../dp.oak.md) can update the IMU firmware on OAK sensors.

1. Get the list of supported sensors with [`getusbidlist`](../methods/getusbidlist.md)
   or the id from [`@idsensor`](../attributes/idsensor.md).
2. Use the command `firmware update <idsensor>`.
3. Read messages in the Max console to accept or deny the waiver.
4. A UI will appear showing progress during an update.
5. The Max console contains status messages after an update.
6. When the update is successful, the message `firmware update <idsensor> 1` is sent
   from dumpout.
