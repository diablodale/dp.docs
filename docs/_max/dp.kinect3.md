---
title: dp.kinect3
layout: max-product
nav_order: 3
compatible_hardware:
  - name: Microsoft Kinect v3 (Azure Kinect)
    slug: sensors/kinect-v3
---

### System Requirements

* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Microsoft Azure Kinect requirements](https://docs.microsoft.com/en-us/azure/kinect-dk/system-requirements)
* Windows 10 April 2018 (Version 1803, OS Build 17134) release (64-bit) or newer

The Azure Kinect sensor does not have a shared system driver from Microsoft.
Microsoft requires customers and applications to install independent
copies of Kinect drivers and files. There are three main groups:

* dp.kinect3 plugin download with all features _except body tracking_. ~19 MB download
* Microsoft body tracking files that Microsoft creates and tests. ~430 MB download
* Optional NVIDIA files to run body tracking with CUDA and cnDNN apis. ~4 GB download

{% include plugin-setup-basic.md %}

### Body Tracking Setup

1. Download and install Microsoft's
   [Body Tracking SDK 1.1.2](https://docs.microsoft.com/en-us/azure/kinect-dk/body-sdk-download).
   Note the install directory; often `"C:\Program Files\Azure Kinect Body Tracking SDK"`
2. Navigate into the SDK install directory, then the `tools` subdirectory,
   e.g. `"C:\Program Files\Azure Kinect Body Tracking SDK\tools"`
3. Copy these files from `sdk\windows-desktop\amd64\release\bin` to your dp.kinect3 directory
   ```
   k4abt.dll
   dnn_model_2_0_lite_op11.onnx
   dnn_model_2_0_op11.onnx      <- slightly more accurate
   ```

### Optional NVIDIA-only Body Tracking with CUDA and TensorRT

This is optional and for unusual situations. Your NVIDIA GPU already
works with the DirectML support built into dp.kinect3.
During body tracking testing, these optional CUDA and TensorRT providers
performed the same or _worse_ than DirectML. Please note, the total
download size for these is ~4 GB.

For CUDA or TensorRT follow these steps

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/dp-kinect3/#download>
2. Copy these files within the ZIP download to the dp.kinect3 directory
   ```
   onnxruntime_providers_shared.dll
   onnxruntime_providers_cuda.dll
   zlibwapi.dll
   ```
3. Download NVIDIA CUDA v11.4.4 for Windows x64. Typical filename `cuda_11.4.4_472.50_windows`
4. Copy these CUDA files from `bin` folder to the dp.kinect3 directory
   ```
   cudart64_110.dll
   cufft64_10.dll
   cublas64_11.dll
   cublasLt64_11.dll
   ```
5. Download NVIDIA cuDnn v8.4.1.50 for CUDA 11.4-11.6 for Windows x64. Typical filename `cudnn-windows-x86_64-8.4.1.50_cuda11.6`
6. Copy these cuDNN files from `bin` to the dp.kinect3 directory
   ```
   cudnn64_8.dll
   cudnn_cnn_infer64_8.dll
   cudnn_ops_infer64_8.dll
   ```

For TensorRT, first follow the CUDA steps above. Then follow these steps

1. Copy these additional files within the optional-nvidia-addons.zip download
   to the dp.kinect3 directory
   ```
   onnxruntime_providers_tensorrt.dll
   ```
2. Copy these additional CUDA files from `bin` folder to the dp.kinect3 directory
   ```
   nvrtc64_112_0.dll
   nvrtc-builtins64_114.dll
   ```
3. Download NVIDIA TensorRT v8.4.1.5 for CUDA 11.4-11.6 and cuDNN 8.4 for Windows x64.
   Typical filename `TensorRT-8.4.1.5.Windows10.x86_64.cuda-11.6.cudnn8.4`
4. Copy these Tensor Runtime files from `lib` to the dp.kinect3 directory
   ```
   nvinfer.dll
   nvinfer_plugin.dll
   nvinfer_builder_resource.dll
   ```

### Optional NVIDIA-only color decoder

> :warning: This feature is deprecated and will be removed.
> This decoder has not shown significant benefits compared to other decoders.

Optionally enable an additional color decoder for your NVIDIA GPU with these three steps.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/dp-kinect3/#download>
2. The ZIP download contains four files for this decoder. Copy them to your dp.kinect3 folder.
   ```
   nppc64_11.dll
   nppicc64_11.dll
   nppidei64_11.dll
   nvjpeg64_11.dll
   ```
3. Enable the feature with the attribute `@decodercolor nvidia`
