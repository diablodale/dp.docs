---
title: dp.oak
layout: max-product
nav_order: 4
compatible_hardware:
  - name: Luxonis OAK sensor
    slug: sensors/oak-v1
---

### System requirements

* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Luxonis OAK requirements](https://docs.luxonis.com/projects/hardware/en/latest/index.html)
  vary with models
* Windows 10 April 2018 (Version 1803, OS Build 17134) release (64-bit) or newer

The Luxonis OAK sensor does not have a shared system driver that all applications use.
It instead has all the needed files in the same folder as the plugin. I have split
the downloads into two groups:

* {{ page.title }} plugin download with all features _except body tracking_. ~40 MB download
* Body tracking neural net files that change less often. ~18 MB download

{% include plugin-setup-basic.md %}

#### Optional body tracking  {#body-tracking}

This neural net enables body tracking for six people.

1. Download the neural net model for body tracking
   * Open the {{ page.title }} help file, click on the `body joints` tab, click download
   * Or manually from <https://github.com/diablodale/model-zoo/releases/latest/download/movenet_multipose_lightning_1_int32_op15_H160_W256.onnx>
2. Place the model in the same folder as the {{ page.title }} plugin

{% include plugin-setup-register.md mutate="storetrial" %}

### Depth technology {#depth}

Depth technology of most OAK sensors is similar to
[stereo vision](https://www.google.com/search?q=depth+through+stereo)
of humans. This is different than infrared-laser technology in sensors like Microsoft Kinect.
Only [OAK Pro](https://docs.luxonis.com/projects/hardware/en/latest/pages/articles/oak-s2.html#pro-version)
sensors have infrared laser dot projectors.

### Power over ethernet {#poe}

[Power-over-Ethernet (PoE)](https://en.wikipedia.org/wiki/Power_over_Ethernet)
devices are connected with an ethernet cable instead of a short 3-meter USB cable.
The ethernet connection can be a great distance, even in a different building.

Luxonis makes several [OAK PoE sensor models](https://docs.luxonis.com/projects/hardware/en/latest/index.html#poe-designs).
Some have infrared laser dot projectors to work in darkness. Others have weatherproof enclosures.

PoE devices need more time to be detected, startup, shut down, and restart.
It is not unusual to need 5-8 seconds to find a PoE sensor.
It is not unusual to need 20 seconds after stopping a PoE sensor for that same PoE sensor to be ready again.

### Known issues

* :warning: Luxonis [PoE](#poe) sensors may not meet some quality requirements  
  [PoE can't read data](https://github.com/luxonis/depthai-core/issues/406)  
  [PoE fails after 6 connections](https://github.com/luxonis/depthai-core/issues/415)  
  [PoE overloaded on CSS vpu](https://github.com/luxonis/depthai-core/issues/423)
* Each time you start Max and load {{ page.title }}, it may have extra lag/latency on
  the depth and color cameras. Stopping and restarting {{ page.title }} often removes the lag. Cause
  under investigation.
