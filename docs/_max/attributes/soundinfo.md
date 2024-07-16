---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - audio
usage:
  signature: "ENERGY_NORM ANGLE_DEGREES CONFIDENCE_NORM"
  values: "float float float (read only)"
  examples:
    - "@soundinfo 0.34 -15.2 0.74"
---

Real-time sound loudness, position angle, and confidence float values
are calculated and available for read-only.

* Loudness/energy [0.0 - 1.0] of the sound
* Position angle (horizontal in degrees) to the sound in
  camera coordinates, where the x- and z-axes define the horizontal plane.
  The angle is relative to the z-axis, which is perpendicular to the sensor.
* Confidence value of the estimated angle [0.0 - 1.0], with 1.0 indicating
  the highest confidence

> 📝 [`dp.kinect`](../dp.kinect.md) constantly updates the attribute.
> [`dp.kinect2`](../dp.kinect2.md) only updates when the plugin is banged.
