## Removed CUDA and TensorRT body tracking  {#cuda}

In 2025, Nvidia CUDA and TensorRT compute modes were replaced with DirectML.
DirectML is now distributed by Windows Update.
These optional Nvidia compute modes never performed better than DirectML.

### Setup

> ⚠️ _Do not_ use these instructions with current versions of our plugins.
> They are for use with very old versions of our plugins.

1. Follow setup instructions for the plugin's optional body tracking
2. Download [optional-nvidia-addons.zip](https://hidale.s3.amazonaws.com/webcontent/dp.kinect3/optional-nvidia-addons.zip)
3. Copy these files within the ZIP download to the plugin folder
   ```
   onnxruntime_providers_shared.dll
   onnxruntime_providers_cuda.dll
   zlibwapi.dll
   ```
4. Download Nvidia CUDA v11.4.4 for Windows x64. Typical filename `cuda_11.4.4_472.50_windows`
5. Copy these CUDA files from `bin` folder to the plugin folder
   ```
   cudart64_110.dll
   cufft64_10.dll
   cublas64_11.dll
   cublasLt64_11.dll
   ```
6. Download Nvidia cuDnn v8.4.1.50 for CUDA 11.4-11.6 for Windows x64. Typical filename `cudnn-windows-x86_64-8.4.1.50_cuda11.6`
7. Copy these cuDNN files from `bin` to the plugin folder
   ```
   cudnn64_8.dll
   cudnn_cnn_infer64_8.dll
   cudnn_ops_infer64_8.dll
   ```

For TensorRT, follow these additional steps

1. Copy these additional files within the `optional-nvidia-addons.zip` download
   to the plugin folder
   ```
   onnxruntime_providers_tensorrt.dll
   ```
2. Copy these additional CUDA files from `bin` folder to the plugin folder
   ```
   nvrtc64_112_0.dll
   nvrtc-builtins64_114.dll
   ```
3. Download Nvidia TensorRT v8.4.1.5 for CUDA 11.4-11.6 and cuDNN 8.4 for Windows x64.
   Typical filename `TensorRT-8.4.1.5.Windows10.x86_64.cuda-11.6.cudnn8.4`
4. Copy these Tensor Runtime files from `lib` to the plugin folder
   ```
   nvinfer.dll
   nvinfer_plugin.dll
   nvinfer_builder_resource.dll
   nvonnxparser.dll
   ```

### Usage

> ⚠️ _Do not_ use these instructions with current versions of our plugins.
> They are for use with very old versions of our plugins.

```
@skelcompute cuda            <- CUDA, first Nvidia GPU
@skelcompute tensor          <- TensorRT, first Nvidia GPU
@skelcompute tensor_fp16     <- TensorRT, Nvidia GPU, float16
```

* TensorRT usually performs better than CUDA.
* `@skelcompute tensor_fp16` will use the Tensor Runtime and optimize the chosen
  body tracking model with 16-bit floating point calculations. It uses less resources
  and is slightly less accurate.
* TensorRT choices will have a **very long** first-time startup. For example, it is
  almost 5 minutes on a laptop with a RTX2070-Super GPU and choosing `tensor_fp16`.
  Later startups are only a few seconds due to caching.
* TensorRT caches the first-time startup optimizations at `%TEMP%\PLUGIN_NAME\tensor.cache`.
  You or Windows can delete these cache folders. TensorRT will re-create a cache
  on the next startup.
* Each TensorRT cache folder is dependent on your DLLs, body tracking model,
  compute device, fp16 optimization, etc. When you change configuration, a new cache
  folder will be created and new optimizations cached. These cache folders can grow
  to be hundreds of megabytes.
