### Optional NVIDIA-only Body Tracking with CUDA and TensorRT

Optionally enable CUDA and TensorRT. This is for unusual situations
since NVIDIA gpus work well with the DirectML support built into the plugin.
These CUDA and TensorRT providers performed the same or _worse_ than DirectML
during testing. Please note, the download size is ~4 GB.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/{{- page.title | slugify -}}/#download>
2. Copy these files within the ZIP download to the {{ page.title }} folder
   ```
   onnxruntime_providers_shared.dll
   onnxruntime_providers_cuda.dll
   zlibwapi.dll
   ```
3. Download NVIDIA CUDA v11.4.4 for Windows x64. Typical filename `cuda_11.4.4_472.50_windows`
4. Copy these CUDA files from `bin` folder to the {{ page.title }} folder
   ```
   cudart64_110.dll
   cufft64_10.dll
   cublas64_11.dll
   cublasLt64_11.dll
   ```
5. Download NVIDIA cuDnn v8.4.1.50 for CUDA 11.4-11.6 for Windows x64. Typical filename `cudnn-windows-x86_64-8.4.1.50_cuda11.6`
6. Copy these cuDNN files from `bin` to the {{ page.title }} folder
   ```
   cudnn64_8.dll
   cudnn_cnn_infer64_8.dll
   cudnn_ops_infer64_8.dll
   ```

For TensorRT, follow these additional steps

1. Copy these additional files within the optional-nvidia-addons.zip download
   to the {{ page.title }} folder
   ```
   onnxruntime_providers_tensorrt.dll
   ```
2. Copy these additional CUDA files from `bin` folder to the {{ page.title }} folder
   ```
   nvrtc64_112_0.dll
   nvrtc-builtins64_114.dll
   ```
3. Download NVIDIA TensorRT v8.4.1.5 for CUDA 11.4-11.6 and cuDNN 8.4 for Windows x64.
   Typical filename `TensorRT-8.4.1.5.Windows10.x86_64.cuda-11.6.cudnn8.4`
4. Copy these Tensor Runtime files from `lib` to the {{ page.title }} folder
   ```
   nvinfer.dll
   nvinfer_plugin.dll
   nvinfer_builder_resource.dll
   ```
