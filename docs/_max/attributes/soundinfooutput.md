---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "{0 | 1 | 2}"
  values: "0 (default)"
  examples:
    - "@soundinfooutput 1"
---
Real-time sound loudness, position, and confidence output on the fifth outlet.

* 0 = off
* 1 = output at [`@soundinfo`](soundinfo.md) attribute
* 2 = output at @soundinfo attribute + message sent out from message/OSC outlet

Information about the sound heard by the sensor occurs by enabling `@soundinfooutput`.
When set to `2`, the data is also output as a message on every bang.

* Loudness/energy [0.0 - 1.0] of the sound
* Position angle (horizontal in degrees) to the sound in
  camera coordinates, where the x- and z-axes define the horizontal plane.
  The angle is relative to the z-axis, which is perpendicular to the sensor.
* Confidence value of the estimated angle [0.0 - 1.0], with 1.0 indicating
  the highest confidence

```
soundinfo ENERGY ANGLE CONF

soundinfo 0.673 25.0 0.8
soundinfo 0.577 19.0 0.7
```

When `@soundinfooutput 2` and [`@skeleton`](skeleton.md)
is enabled, an additional message `soundbodies` is output. This message
indicates a correlation between heard sound and tracked bodies. This message will
list all tracked bodies which the sensor believes are correlated with the heard sound.
It could be used to determine who is engaging with the sensor or who is speaking.

```sh
soundbodies BodyId1 [BodyId2...]
BodyIdX... where X is the same numeric id from the [`@skeleton`](skeleton.md) messages

# Examples
soundbodies 4              body 4 is correlated with sound
soundbodies 3 1            bodies 3 and 1 are correlated with sound
soundbodies 1 2 3 4 5 6    bodies 1, 2, 3, 4, 5, and 6 are correlated with sound
```
