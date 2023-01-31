---
products:
  - dp.kinect2
categories:
  - face
usage:
  signature: "COLOR_BOOLEAN"
  values:
    "0": no face color output (default)
    "1": output face colors
  examples:
    - "@facecolors 1"
---

Face and hair color for each tracked face. Output on the fifth outlet.
[`@faces`](faces.md) must be enabled for this face tracking feature to function.
It also requires a [captured face model](faces.md#face-model).

Microsoft's [Kinect v2]({{- site.baseurl -}}/hardware/sensors/kinect-v2/) SDK
used by [`dp.kinect2`](../../dp.kinect2/) derives the face and hair color
by building a [face 3D model](face3dmodel.md#dpkinect2) and distinguishing
the colors on that model. Results are affected by environment conditions,
distance from the sensor, and often not high-quality.

```python
# Max native:   @faces 1 @facecolors 1 @skeletonformat 1
face playerId haircolor red green blue 1.0
face playerId skincolor red green blue 1.0

# face on skeleton 2 has hair color of red=0.246, green=0.845, blue=0.472
face 2 haircolor 0.246 0.845 0.472 1.0
# face on skeleton 5 has skin color of red=0.114, green=0.619, blue=0.247
face 5 skincolor 0.114 0.619 0.247 1.0

# OSC protocol: @faces 1 @facecolors 1
/face/playerId/haircolor red green blue 1.0
/face/playerId/skincolor red green blue 1.0
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

red green blue
: normalized floats [0.0..1.0] of the color's red, green, and blue components
