---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "output at `@soundinfo` attribute"
    "2": "output at `@soundinfo` attribute and message output"
  examples:
    - "@soundinfooutput 1"
---
Real-time sound loudness, position, and confidence message output
on the fifth outlet. [`@soundinfo`](soundinfo.md) must also be enabled.

Information about the sound heard by the sensor occurs by enabling `@soundinfooutput`.
When set to `2`, the data is also output as a message on every bang.

* Loudness/energy [0.0 - 1.0] of the sound
* Position angle (horizontal in degrees) to the sound in
  camera coordinates, where the x- and z-axes define the horizontal plane.
  The angle is relative to the z-axis, which is perpendicular to the sensor.
* Confidence value of the estimated angle [0.0 - 1.0], with 1.0 indicating
  the highest confidence

```python
soundinfo ENERGY ANGLE CONF

# examples
soundinfo 0.673 25.0 0.8
soundinfo 0.577 19.0 0.7
```

When both `@soundinfooutput 2` and [`@skeleton`](skeleton.md) is enabled,
an additional message `soundbodies` is output. This message
indicates a correlation between heard sound and tracked skeletons. This message
will list all [playerIDs of tracked skeletons](skeleton.md#user-identification)
which the sensor believes are correlated with the heard sound.
It can be used to determine who is engaging with the sensor or who is speaking.

```python
# integers are the same playerID used throughout skeleton tracking messages
soundbodies integer1 [integer2...]

# examples
soundbodies 4              playerID 4 is correlated with sound
soundbodies 3 1            playerIDs 3 and 1 are correlated with sound
soundbodies 1 2 3 4 5 6    playerIDs 1, 2, 3, 4, 5, and 6 are correlated with sound
```
