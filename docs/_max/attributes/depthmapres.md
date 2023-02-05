---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual
usage:
  signature: "{INT | WIDTHxHEIGHT}"
  values:
    '0': 80x60
    '1': 320x240
    '2': 640x480
    #'3': 1280x960
    '4': 512x424
    #'5': 1920x1080
    'WIDTHxHEIGHT': WIDTH columns and HEIGHT rows
  examples:
    - "@depthmapres 1"
    - "@depthmapres 512x512   <-- Kinect Azure wide fov binned"
    - "@depthmapres 1280x720  <-- HD"
---

Resolution of depth image that was enabled with [`@depthmap`](depthmap.md).

`WIDTHxHEIGHT` can be used with plugin versions v1.3.20200813 or newer.
Specify the resolution width and height separated by any character
except a period `.`

> :memo: Not all sensors support all resolutions. Consult the
> [hardware documentation](../../_hardware/sensors.md) for your
> sensor to learn the supported resolution(s). Max objects like
> jit.matrix can scale or crop plugin output to any resolution.
