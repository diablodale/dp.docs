---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - face
usage:
  signature: "FACES_INT"
  values:
    "0": no face output (default)
    "1, 2": dp.kinect number of faces to track
    "1": dp.kinect2 track all faces
  examples:
    - "@faces 1"
---

Face tracking calculation and messages with 2D bounding box, rotation, translation,
and scale relative to the standard face model. `@faces` must be enabled for any
face tracking features to function. Messages are output on the fifth outlet.

Face messages and values are affected by [`@skeletonformat`](skeletonformat.md),
[`@flipx`](flipx.md), and [`@distmeter`](distmeter.md). The values are *not*
rotated by gravity or elevation. Use [jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node)
or custom calculations when that is needed.

[`dp.kinect`](../dp.kinect.md) with Microsoft's [Kinect v1](../../_hardware/sensors/kinect-v1.md) SDK
tracks a maximum of two (2) faces on tracked skeletons. Yet, their SDK can track six skeletons.
It is not possible for their SDK to track all faces on all skeletons.
Use `@faces 2` to track the maximum two.

[`dp.kinect2`](../dp.kinect2.md) with Microsoft's [Kinect v2](../../_hardware/sensors/kinect-v2.md) SDK
can track faces on all tracked skeletons. Use `@faces 1` to track all faces.

> ⚠️ Kinect v2 face [2D keypoints](face2dpoints.md), 3D model,
> shape units, and face color output requires a [face model](#face-model).

```python
# Max native:   @faces 1 @skeletonformat 1
face playerId bounds left top right bottom  
face playerId boundsdepth left top right bottom  
face playerId pose scale xrot yrot zrot xtrn ytrn ztrn 
face playerId modelstatus collection capture

# OSC protocol: @faces 1
/face/playerId/bounds left top right bottom            
/face/playerId/boundsdepth left top right bottom       
/face/playerId/pose scale xrot yrot zrot xtrn ytrn ztrn
/face/playerId/modelstatus collection capture          
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

bounds
: color `uv` coordinates

boundsdepth
: depth `uv` coordinates

left
: integer that represents the leftmost X coordinate of the bounding box

top
: integer that represents the topmost Y coordinate of the bounding box

right
: integer that represents the rightmost X coordinate of the bounding box

bottom
: integer that represents the bottomost Y coordinate of the bounding box

scale
: float where `1.0` means equal in scale to loaded 3D model (in model-space)

xrot, yrot, zrot
: floats of Euler rotation angles (degrees) around X, Y, and Z axes

xtrn, ytrn, ztrn
: floats of 3D translation on the X, Y, and Z axes in
  [skeleton coordinates](skeleton.md#joint-location)

collection
: integer bitfield [collection needs](#collection-needs)

capture
: integer [capture status](#capture-status)

## Face model

Some Kinect v2 face output (shape units, hidef 2D points, 3D model, and face color)
requires a fully captured and modeled face.

* these face features are drastically slower than Kinect v1
* requires the face to be rotated slowly in four directions
* track progress of the capture with the `face playerId modelstatus` message
* facial obstructions (heavy facial hair, scarf, etc.) tend to interfere with capture

### Collection needs

The collection needs bit field is the first value of the `modelstatus` message. As a
bit field, its value is the sum of the combined state values.

state value | meaning
:--: | :--
0 | Collection complete
1 | More frames needed
2 | Frames from front view needed
4 | Frames from left view needed
8 | Frames from right view needed
16 | Frames from tilted up view needed

### Capture status

The capture status is the second value of the `modelstatus` message.

value | meaning
:-: | :---
0  | Frame capture worked
1  | Other views needed
2  | Face is no longer tracked
3  | Face is too far from sensor
4  | Face is too near to sensor
5  | Face is moving too fast
6  | System error occurred
