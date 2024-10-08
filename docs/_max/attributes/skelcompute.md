---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "ENGINE_STRING [ DEVICE_SUBSTRING | DEVICE_INDEX ]"
  values: "directml 0 (default)"
  examples:
    - "@skelcompute directml        <- DirectML, first GPU"
    - "@skelcompute directml 1      <- DirectML, second GPU"
    - "@skelcompute directml \"2070\" <- DirectML, \"2070\" GPU"
    - "@skelcompute directml intel  <- DirectML, \"intel\" GPU"
    - "@skelcompute directml rtx    <- DirectML, \"rtx\" GPU"
    - "@skelcompute cuda            <- CUDA, first Nvidia GPU"
    - "@skelcompute tensor          <- TensorRT, first Nvidia GPU"
    - "@skelcompute tensor_fp16     <- TensorRT, Nvidia GPU, float16"
---

Skeleton tracking compute engine and device.
Enable multiple compute devices for different tasks using attributes like
[@skelcompute](skelcompute.md), [@transcoder](transcoder.md), and [@opencl](opencl.md).
For example...

* Track skeleton joints on the discrete Nvidia GPU `@skelcompute nvidia`
* Decode color frames on the Intel CPU harware decoder `@transcoder intelmedia`
* Flip and undistort frames on integrated Intel GPU `@opencl intel`
* and the remaining features run on your CPU

Test to discover which settings meet your needs for hardware, latency, and throughput.
You can have significant performance improvements! 🙂

DirectML is built into Windows and requires no downloads. Other compute engines like
CUDA and TensorRT have additional download requirements. Consult your plugin setup
documentation for details.

> 📝 The second parameter of `@skelcompute` is the name of the device or
> the numeric index (starting with 0) of the device. *Name* of the device is recommended.
> The index may change because the Windows Graphics Performance Preference default
> is "Let Windows decide". Windows may decide to change the order of GPUs and therefore
> the indices change. The index *is* consistent when you choose a Graphics Performance
> Preference. This setting is in Windows settings, System, Display, Graphics settings.

## Performance

* DirectML works very well across most GPUs. It is the recommended choice.
* CUDA and TensorRT are optional providers for body tracking. They require
  [additional setup](../dp.kinect3.md#cuda), are for unusual situations,
  and performed no better than DirectML during testing.
* TensorRT usually performs better than CUDA.
* `@skelcompute tensor_fp16` will use the Tensor Runtime and optimize the chosen body tracking model
  with 16-bit floating point calculations. It is slightly less accurate and uses less resources.
* TensorRT choices will have a **very long** first-time startup. For example, it is almost 5 minutes on
  a laptop with a RTX2070-Super GPU and choosing `tensor_fp16`. Later startups are only a few seconds
  due to caching.
* TensorRT caches the first-time startup optimizations at `%TEMP%\PLUGIN_NAME\tensor.cache`.
  You or Windows can delete these cache folders. TensorRT will re-create a cache
  on the next startup.
* Each TensorRT cache folder is dependent on your DLLs, body tracking model,
  compute device, fp16 optimization, etc. When you change configuration, a new cache folder will be
  created and new optimizations cached. These cache folders can grow to be hundreds of megabytes.

## Known Issues

* Microsoft's Azure Kinect bug <https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues/1783>
  sometimes crashes Max when closing the application. It involves some combinations of compute choices.
  The crash may not be apparent; it happens as Max is closing. It may be no real-world harm.
* Azure Kinect bug may freeze or crash with the below scenario. It may be safer to change
  `@skelcompute` by typing that attribute on the `(dp.kinect3 @skelcompute directml ...)` box itself.
  1. Output visual data like depth, color, ir, or playermap
  2. Stop dp.kinect3
  3. Change `@skelcompute` using a message to dp.kinect3 or an (attrui)
  4. Start dp.kinect3, the crash/freeze usually happens within a few seconds.
