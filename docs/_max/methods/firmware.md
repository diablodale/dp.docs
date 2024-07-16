---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{ update | version } IDSENSOR [COMPONENT]"
  values:
    "update | version": "update firmware or query version"
    "IDSENSOR": "unique id of sensor"
    "COMPONENT": "sensor component for firmware"
  examples:
    - "firmware version 184123456789F50800"
    - "firmware update 184123456789F50800 bootloader"
---

Firmware version query and update for supported sensor devices.

Some sensors may spontaneously report bootloader version warnings.
The manufacturer is responsible for their warnings and recommendations.

:memo: Network devices may be very slow for all `firmware` actions.

## Version

Versions of firmware on sensors often has user-friendly versions. The format of versions
is not consistent across sensor models and often not consistent with standards.
For example, Luxonis OAK sensors have versions that look similar
to [SemVer versions](https://semver.org/) but are not compatible with them.

Use `firmware version IDSENSOR` to query version information for a given sensor id.
When it is supported and available, version information is output on dumpout in the
format `firmware version IDSENSOR COMPONENT FIRMWARE_TYPE CURRENT_VERSION AVAILABLE UPDATE_VERSION`.
Multiple lists are sent to dumpout, one for each component. For example:
```
firmware version 184123456789F50800 bootloader factory-network 0.0.17 update 0.0.26
firmware version 184123456789F50800 imu BNO086 3.9.9 no-update 3.9.9
```

IDSENSOR
: sensor id unique to the target sensor, e.g. `14442C10C1A1C6D200` or `USB\\VID_045E&PID_02C2\\5&1C8A28AD&0&9`

COMPONENT
: sensor component providing version information, e.g. `bootloader` or `imu`

FIRMWARE_TYPE
: model or type of the component, e.g. `BNO086` or `factory-usb`

CURRENT_VERSION
: current firmware version for the component

AVAILABLE
: availability for updating, e.g. `update` or `no-update`. Versions are
  compared. When a newer version is available and it is possible to update
  to that version, then this field is `update`.

UPDATE_VERSION
: Available update firmware version for the component

## Update

> :warning: Firmware updates are at your own risk! :warning:

> :warning: You accept all consequences and waive all claims! :warning:

> :warning: You may damage or brick your sensor device! :warning:

Some sensors have firmware that can be updated.
Start updates for individual components with `firmware update IDSENSOR COMPONENT`

IDSENSOR
: sensor id unique to the target sensor, e.g. `14442C10C1A1C6D200` or `USB\\VID_045E&PID_02C2\\5&1C8A28AD&0&9`

COMPONENT
: sensor component to update, e.g. `bootloader` or `imu`

### Update process

1. Get the list of supported sensors with [`getusbidlist`](../methods/getusbidlist.md)
   or the id from [`@idsensor`](../attributes/idsensor.md).
2. Query version information with `firmware version IDSENSOR`
3. Inspect the lists sent on dumpout for possible updates
4. Update individual components with `firmware update IDSENSOR COMPONENT`
5. Read messages in the Max console. You must agree to the waiver and e-sign it.
6. Resend the same command and append the waiver and e-sign in double quotes.
7. A UI will appear showing progress during the update.
8. Success or error messages appear in the Max console.
9. When successfully updated, the message `firmware update IDSENSOR COMPONENT 1` is sent
   on dumpout.
