---
products:
  - dp.kinect2
tags:
  - visual
usage:
  signature: "BODYPROP_BOOLEAN"
  values:
    "0": no body property output (default)
    "1": body property output
  examples:
    - "@bodyprop 1"
---

Skeleton body properties output: restricted, handstate, lean, and the
confidence of those properties. These properties may be noisy and benefit
from a filter or smoothing.

> :memo: [`@flipx`](flipx.md) does not affect lean values.

```python
# Max native:   @bodyprop 1 @skeletonformat 1
restricted playerId is_restricted confidence
handstate playerId left hand_state confidence
handstate playerId right hand_state confidence
lean playerId lean_side lean_forward confidence

# OSC protocol: @bodyprop 1
/restricted/playerId is_restricted confidence
/handstate/playerId/left hand_state confidence
/handstate/playerId/right hand_state confidence
/lean/playerId lean_side lean_forward confidence
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

is_restricted
: integer (`0`=false, `1`=true) indicating the skeleton body appears to be restricted from a full range of motion

hand_state
: one of the five words `unknown`, `nottracked`, `open`, `closed`, `lasso` that represents the given
  [hand state](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn799273(v=ieb.10)#what-is-handdata):
  
lean_side
: floating point number [-1.0..1.0] representing the
  [left-right lean](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn785526(v=ieb.10))
  of a skeleton body. It is a continuous range from 45 degrees left lean `-1.0`, no lean `0.0`, to 45 degrees right lean `1.0`.

lean_forward
: floating point number [-1.0..1.0] representing the
  [back-forward lean](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn785526(v=ieb.10))
  of a skeleton body. It is a continuous range from 45 degrees back lean `-1.0`, no lean `0.0`, to 45 degrees forward lean `1.0`.

confidence
: normalized float `[0.0..1.0]` for the confidence of that property.
  `1.0` indicates the highest confidence

## Examples

```python
# all examples: @bodyprop 1 @skeletonformat 1
# skeleton 2 appears restricted from full motion and sensor is very confident
restricted 2 1 1.0

# left hand on skeleton 2 appears to be open and sensor is very confident
handstate 2 left open 1.0

# right hand on skeleton 2 appears to be a lasso and sensor is average confident
handstate 2 right lasso 0.5

# skeleton 2 is leaning slightly right, slightly forward, and sensor is very confident
lean 2 0.2 0.3 1.0

# skeleton 2 is leaning left and sensor is average confident
lean 2 -0.5 0.0 0.5
```
