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
    '2': 640x480
    '3': 1280x960
    '4': 512x424
    '5': 1920x1080
    'WIDTHxHEIGHT': WIDTH columns and HEIGHT rows
  examples:
    - "@colormapres 3"
    - "@colormapres 5"
    - "@colormapres 1920x1080    <-- full HD"
    - "@colormapres 3840x2160    <-- 4K"
---

Resolution of color image that was enabled with [`@colormap`](colormap.md)

`WIDTHxHEIGHT` can be used with plugin versions v1.3.20200813 or newer.
Specify the resolution width and height separated by any character
except a period `.`

> :memo: Not all sensors support all resolutions. Consult the
> [hardware documentation](../../_hardware/sensors.md) for your
> sensor to learn the supported resolution(s). Max objects like
> jit.matrix can scale or crop plugin output to any resolution.

## Azure Kinect Performance

Microsoft does not provide low-latency full HD (1920x1080) color output on
the Azure Kinect. Instead, they only provide one low-latency color output
at basic HD (1280x720) resolution. When low-latency color output is needed
on the Azure Kinect, I recommend 1280x720 resolution.
