---
title: dp.oak
layout: max-product
nav_order: 4
compatible_hardware:
  - name: Luxonis OAK sensor
    slug: sensors/oak-v1
---

### System requirements

* Windows 10 64-bit Version 1903 (OS build 18362) release or newer
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Luxonis OAK requirements](https://docs.luxonis.com/projects/hardware/en/latest/index.html)
* dp.oak supports the current Luxonis OAK [RVC2 generation](https://docs.luxonis.com/hardware/platform/rvc/rvc2/)
  sensors. Read more about [OAK RVC2 hardware limitations and benefits](../_hardware/sensors/oak-v1.md).

Luxonis OAK sensors do not have a shared system driver. Instead, all needed files are
in the same folder as the plugin. I have split downloads into two groups:

* {{ page.title }} plugin download with all features _except body tracking_. ~40 MB download
* Body tracking neural net files that change less often. ~18 MB download


{% include plugin-setup-basic.md %}

#### Optional body tracking  {#body-tracking}

This neural net enables body tracking for six people.

1. Download the neural net model for body tracking
   * Open the {{ page.title }} help file, click on the `body joints` tab, click download
   * Or manually from <https://github.com/diablodale/model-zoo/releases/latest/download/movenet_multipose_lightning_1_int32_op15_H160_W256.onnx>
2. Place the model in the same folder as the {{ page.title }} plugin

{% include plugin-setup-register.md %}
