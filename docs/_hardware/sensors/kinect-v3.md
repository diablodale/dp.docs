---
title: Microsoft Kinect v3, Azure
products:
  - dp.kinect3
---

## Technical Documents

[System requirements](https://learn.microsoft.com/en-us/azure/kinect-dk/system-requirements)

[Sensor specifications](https://learn.microsoft.com/en-us/azure/kinect-dk/hardware-specification)

[Color data](https://learn.microsoft.com/en-us/azure/kinect-dk/hardware-specification#color-camera-supported-operating-modes)

[Depth data](https://learn.microsoft.com/en-us/azure/kinect-dk/hardware-specification#depth-camera-supported-operating-modes)

[Coordinate spaces](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn785530(v=ieb.10)) and [orientation](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh973073(v=ieb.10)) documentation is from previous Kinect sensors.
Microsoft failed to provide documentation for Azure Kinect.

## Performance

Microsoft does not provide low-latency full HD (1920x1080) color output on
the Azure Kinect. Instead, they only provide one low-latency color output
at basic HD (1280x720) resolution. When low-latency color output is needed
on the Azure Kinect, I recommend 1280x720 resolution.
