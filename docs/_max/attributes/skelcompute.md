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
    - "@skelcompute cpu             <- CPU only"
---

Skeleton tracking compute engine and device.
Enable multiple compute devices for different tasks using attributes like
[@skelcompute](skelcompute.md), [@transcoder](transcoder.md), and [@opencl](opencl.md).
For example...

* Track skeletons on the discrete Nvidia GPU `@skelcompute directml nvidia`
* Decode color frames on the Intel CPU harware decoder `@transcoder intelmedia`
* Flip and undistort frames on integrated Intel GPU `@opencl intel`
* and the remaining features run on your CPU

Test to discover which settings meet your needs for hardware, latency, and throughput.
You can have significant performance improvements! 🙂

> 📝 The second parameter of `@skelcompute` is the name of the device or
> the numeric index (starting with 0) of the device. *Name* of the device is recommended.
> The index may change because the Windows Graphics Performance Preference default
> is "Let Windows decide". Windows may decide to change the order of GPUs and therefore
> the indices change. The index *is* consistent when you choose a Graphics Performance
> Preference. This setting is in Windows settings, System, Display, Graphics settings.

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

{% include plugin-setup-onnx-cuda.md %}
