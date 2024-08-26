---
title: Luxonis OAK v1
products:
  - dp.oak
---

## Technical Documents

System requirements

* 64-bit Intel® or AMD multi-core processor. Intel® Core™ i5 processor or faster recommended
* 4 GB RAM (8 GB or more recommended)
* Windows 10 April 2018 (Version 1803, OS Build 17134) release (64-bit) or newer
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [OAK Sensor hardware requirements](https://docs.luxonis.com/projects/hardware/en/latest/)
  vary based on the specific model.
* OpenCL and OpenGL-compatible GPU
Windows 8 or later

[Sensor specifications, color data, depth data](https://docs.luxonis.com/projects/hardware/en/latest/)

[Coordinate spaces](kinect-v2.md) are the same as Kinect v2

### Depth technology {#depth}

Our plugins support the current [RVC2](https://docs.luxonis.com/hardware/platform/rvc/rvc2/)
generation of Luxonis OAK sensors.

The depth technology of most OAK sensors is similar to
[stereo vision](https://www.google.com/search?q=depth+through+stereo) of humans.
This is different than ToF (time of flight) infrared technology in sensors like Microsoft Kinect.
Only [OAK Pro](https://docs.luxonis.com/hardware/platform/features/depth/#Depth%20Perception-Active%20Stereo%20Depth)
sensors have infrared laser dot projectors which allow them to work in extreme darkness.

### Power over ethernet {#poe}

[Power-over-Ethernet (PoE)](https://en.wikipedia.org/wiki/Power_over_Ethernet)
devices are connected with an ethernet cable instead of a short USB cable.
The ethernet connection can be a great distance, even in a different building.

[Luxonis OAK PoE sensor models](https://docs.luxonis.com/projects/hardware/en/latest/index.html#poe-designs)
may have have infrared laser dot projectors to work in darkness, or weatherproof enclosures.

OAK PoE sensors may [overload their CSS vpu](https://github.com/luxonis/depthai-core/issues/423).
This causes the sensor to deliver partial or delayed data.

OAK PoE sensors need time to be detected, startup, shut down, and restart.

* 5-10 seconds to find an OAK PoE sensor
* 10-20 seconds after stopping an OAK PoE sensor for that same sensor to be ready again
