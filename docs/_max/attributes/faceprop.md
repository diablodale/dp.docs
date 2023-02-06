---
products:
  - dp.kinect2
tags:
  - face
usage:
  signature: "FACEPROP_BOOLEAN"
  values:
    "0": no face property output (default)
    "1": output face properties
  examples:
    - "@faceprop 1"
---

Face properties for the appearance or state of a tracked face.
Output on the fifth outlet. [`@faces`](faces.md) must be enabled for this face
tracking feature to function.

Microsoft's Kinect v2 SDK used by [`dp.kinect2`](../dp.kinect2.md) provides
[details on these face properties](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn782034(v=ieb.10)#face-properties).
These properties may be noisy and benefit from a filter or smoothing.

```python
# Max native:   @faces 1 @faceprop 1 @skeletonformat 1
face playerId property state confidence

# OSC protocol: @faces 1 @faceprop 1
/face/playerId/property state confidence
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

property
: name of `happy`, `engaged`, `wearingglasses`, `lefteyeclosed`, `righteyeclosed`,
  `mouthopen`, `mouthmoved`, or `lookingaway`

state
: boolean (`0` = false, `1` = true) of the state of the face property

confidence
: normalized float `[0.0..1.0]` for the confidence of that property.
  `1.0` indicates the highest confidence

## Examples

```python
# face on skeleton 2 expresses happiness and sensor is very confident
face 2 happy 1 1.0

# face on skeleton 2 may express happiness and sensor is only somewhat confident
face 2 happy 1 0.5

# face on skeleton 2 does not express happiness and sensor is very confident
face 2 happy 0 1.0

# face on skeleton 2 has the left eye closed and sensor is very confident
face 2 lefteyeclosed 1 1.0

# face on skeleton 2 has the left eye open and sensor is very confident
face 2 lefteyeclosed 0 1.0

# face on skeleton 2 is looking away and sensor is very confident
face 2 lookingaway 1 1.0

# face on skeleton 2 is probably partially looking away and sensor is only somewhat confident
face 2 lookingaway 1 0.5

# face on skeleton 2 is wearing eye glasses and sensor is very confident
face 2 wearingglasses 1 1.0
```
