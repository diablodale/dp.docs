---
products:
  - dp.kinect2
categories:
  - audio
usage:
  signature: "ENERGY_NORM ANGLE_DEGREES CONFIDENCE_NORM"
  default: "0. 0. 0."
  examples:
    - "@soundinfo 0.34 -15.2 0.74"
---

Real-time sound loudness, position, and confidence

* Energy/loudness [0.0 - 1.0] of the sound heard
* Estimated horizontal angle (in degrees) to the sound heard in
  camera coordinates, where the x- and z-axes define the horizontal plane.
  The angle is relative to the z-axis, which is perpendicular to the sensor.
* Confidence value of the estimated angle [0.0 - 1.0], with 1.0 indicating
  the highest confidence
