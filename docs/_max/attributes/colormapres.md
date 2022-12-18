---
parent: Attributes
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "{2 | 3 | 4 | 5 | WIDTHxHEIGHT}"
  default: "varies by sensor"
  examples:
    - "@colormapres 3"
    - "@colormapres 5"
    - "@colormapres 1920x1080    <-- full HD"
    - "@colormapres 3840x2160    <-- 4K"
---

Choose resolution of color image output that was enabled with [`@colormap`](colormap.md)

* 2 = 640x480
* 3 = 1280x960
* 4 = 512x424
* 5 = 1920x1080
* WIDTHxHEIGHT

WIDTHxHEIGHT can be used on plugin versions v1.3.20200813 or newer.
Specify the resolution width and height separated by any character
except for a period `.`

> :memo: Not all sensors support all resolutions. Some sensors (e.g Kinect v2)
> have a single fixed resolution. Consult the
> [hardware documentation](../../_hardware/sensors.md) for your
> sensor to understand the resolution(s) it supports. Max objects like
> jit.matrix can scale or crop output to any resolution.
