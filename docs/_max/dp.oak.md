---
title: dp.oak
layout: max-product
nav_order: 4
compatible_hardware:
  - name: Luxonis OAK sensor
    slug: sensors/oak-v1
---

### System requirements

* Windows 11 is best. Windows 10 is [possible](#win10). Always 64-bit.
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Luxonis OAK requirements](https://docs.luxonis.com/projects/hardware/en/latest/index.html)
* Luxonis OAK [RVC2 generation sensor](../_hardware/sensors/oak-v1.md)

{% include plugin-setup-basic.md %}

#### Optional body tracking  {#body-tracking}

This neural net enables body tracking for six people.

1. Download the neural net model for body tracking
   * Open the {{ page.title }} help file, click on the `body joints` tab, click download
   * Or download [movenet_multipose_lightning_1_int32_op15_H160_W256.onnx](https://github.com/diablodale/model-zoo/releases/latest/download/movenet_multipose_lightning_1_int32_op15_H160_W256.onnx)
2. Place the model in the same folder as the {{ page.title }} plugin

{% include plugin-setup-win10.md %}

#### Power over Ethernet (PoE)  {#poe}

Luxonis PoE sensors are now long-term reliable by updating the OAK PoE factory
bootloader to v0.0.28+ and using plugin v1.3.20240825+.
⚠️ Firmware updates are at your own risk! Luxonis made this
[requirement](https://github.com/luxonis/depthai-core/releases/tag/v2.26.0)
and [recommends using their Device Manager](https://docs.luxonis.com/software/depthai-components/bootloader/#Bootloader)
to fix their bugs.

{% include plugin-setup-register.md %}
