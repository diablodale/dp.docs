---
title: dp.kinect3
layout: max-product
nav_order: 3
compatible_hardware:
  - name: Microsoft Kinect v3 (Azure Kinect)
    slug: sensors/kinect-v3
---

### System requirements

* Windows 10 64-bit Version 1903 (OS build 18362) release or newer
* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Microsoft Azure Kinect requirements](https://docs.microsoft.com/en-us/azure/kinect-dk/system-requirements)

The Azure Kinect sensor does not have a shared system driver from Microsoft.
Microsoft requires customers and applications to install independent
copies of Kinect drivers and files. There are three main groups:

* {{ page.title }} plugin download with all features _except body tracking_. ~19 MB download
* Microsoft body tracking files that Microsoft creates and tests. ~430 MB download
* Optional Nvidia files to run body tracking with CUDA and cnDNN apis. ~4 GB download

{% include plugin-setup-basic.md %}

#### Optional body tracking  {#body-tracking}

1. Download and install Microsoft's
   [Body Tracking SDK 1.1.2](https://docs.microsoft.com/en-us/azure/kinect-dk/body-sdk-download).
   Note the install folder; often `C:\Program Files\Azure Kinect Body Tracking SDK`
2. Navigate into the SDK install folder, then the `tools` subfolder,
   e.g. `C:\Program Files\Azure Kinect Body Tracking SDK\tools`
3. Copy these files from `sdk\windows-desktop\amd64\release\bin` to your {{ page.title }} folder
   ```
   k4abt.dll
   dnn_model_2_0_lite_op11.onnx
   dnn_model_2_0_op11.onnx      <- slightly more accurate
   ```

{% include plugin-setup-onnx-cuda.md %}

{% include plugin-setup-register.md %}
