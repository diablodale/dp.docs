---
title: Luxonis OAK v1
products:
  - dp.oak
---

## Technical Documents

System requirements

* 64-bit Intel® or AMD multi-core processor. Intel® Core™ i5 processor or faster recommended.
* 4 GB RAM (8 GB or more recommended)
* Windows 11 is best. Windows 10 19H1 (version 1903) or newer is [possible](../../_max/dp.oak.md#win10). Always 64-bit.
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* Luxonis OAK [RVC2 generation sensor](https://docs.luxonis.com/hardware/platform/rvc/rvc2/)
* [OAK Sensor hardware requirements](https://docs.luxonis.com/projects/hardware/en/latest/)
  vary based on the specific model.
* OpenCL and OpenGL-compatible GPU

[Sensor specifications, color data, depth data](https://docs.luxonis.com/projects/hardware/en/latest/)

[Coordinate spaces](kinect-v2.md) are the same as Kinect v2

### Depth technology {#depth}

The depth technology of most OAK sensors is similar to human
[stereo vision](https://www.google.com/search?q=depth+through+stereo). It may appear more noisy
than other sensors, however, neural nets are usually not affected by this.
The stereo approach is different than ToF (time of flight) infrared technology in sensors like Microsoft Kinect.
Only [OAK Pro](https://docs.luxonis.com/hardware/platform/features/depth/#Depth%20Perception-Active%20Stereo%20Depth)
sensors have infrared laser dot projectors which allow them to work in extreme darkness.

### Power over ethernet {#poe}

[Power-over-Ethernet (PoE)](https://en.wikipedia.org/wiki/Power_over_Ethernet)
devices are connected with an ethernet cable instead of a 3 meter USB cable.
The ethernet connection can be a great distance, even in a different building.
It may also enable weatherproof enclosures.

OAK PoE sensors have [fixes for firmware bugs](../../_max/dp.oak.md#poe) to improve long-term reliability.

OAK PoE sensors may [overload their CSS vpu](https://github.com/luxonis/depthai-core/issues/423).
This causes the sensor to deliver partial or delayed data.

OAK PoE sensors need time to be detected, startup, shut down, and restart.

* 5-10 seconds to find an OAK PoE sensor
* 10-20 seconds after stopping an OAK PoE sensor for that same sensor to be ready again
