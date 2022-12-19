---
parent: Attributes
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "ENERGY_NORM ANGLE_DEGREES CONFIDENCE_NORM"
  values: "0. 0. 0."
  examples:
    - "@soundinfo 0.34 -15.2 0.74"
---

Real-time sound loudness, position angle, and confidence

* Loudness/energy [0.0 - 1.0] of the sound
* Position angle (horizontal in degrees) to the sound in
  camera coordinates, where the x- and z-axes define the horizontal plane.
  The angle is relative to the z-axis, which is perpendicular to the sensor.
* Confidence value of the estimated angle [0.0 - 1.0], with 1.0 indicating
  the highest confidence
