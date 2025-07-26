---
title: dp.kinect3
layout: max-product
nav_order: 3
compatible_hardware:
  - name: Microsoft Kinect v3 (Azure Kinect)
    slug: sensors/kinect-v3
---

### System requirements

* Windows 11 is best. Windows 10 is [possible](#win10). Always 64-bit.
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Microsoft Azure Kinect requirements](https://docs.microsoft.com/en-us/azure/kinect-dk/system-requirements)

{% include plugin-setup-basic.md %}

#### Optional body tracking  {#body-tracking}

1. Download and install Microsoft's
   [Body Tracking SDK 1.1.2](https://docs.microsoft.com/en-us/azure/kinect-dk/body-sdk-download).
   Note the install folder; often `C:\Program Files\Azure Kinect Body Tracking SDK`
2. Navigate into the SDK install folder, then the `tools` subfolder,
   e.g. `C:\Program Files\Azure Kinect Body Tracking SDK\tools`
3. Copy these three (3) files from `sdk\windows-desktop\amd64\release\bin` to your {{ page.title }} folder
   ```
   k4abt.dll
   dnn_model_2_0_lite_op11.onnx      <- default model
   dnn_model_2_0_op11.onnx           <- more accurate model
   ```

{% include plugin-setup-win10.md %}

{% include plugin-setup-register.md %}
