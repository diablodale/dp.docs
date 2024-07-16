---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "ENGINE_STRING [ DEVICE_SUBSTRING | DEVICE_INDEX ]"
  values: "directml 0 (default)"
  examples:
    - "@mlcompute directml        <- DirectML, first GPU"
    - "@mlcompute directml 1      <- DirectML, second GPU"
    - "@mlcompute directml \"2070\" <- DirectML, \"2070\" GPU"
    - "@mlcompute directml intel  <- DirectML, \"intel\" GPU"
    - "@mlcompute directml rtx    <- DirectML, \"rtx\" GPU"
---

Machine learning compute engine and device.
Enable multiple compute devices for different tasks using attributes like
[@mlcompute](mlcompute.md), [@transcoder](transcoder.md), and [@opencl](opencl.md).
For example...

* Track animals using a model on the discrete Nvidia GPU `@mlcompute nvidia`
* Decode color frames on the Intel CPU harware decoder `@transcoder intelmedia`
* Flip and undistort frames on integrated Intel GPU `@opencl intel`
* and the remaining features run on your CPU

Test to discover which settings meet your needs for hardware, latency, and throughput.
You can have significant performance improvements! 🙂

DirectML is built into Windows and requires no downloads. Other compute engines like
CUDA and TensorRT are not tested or supported -- use at your own risk.

> 📝 The second parameter of `@mlcompute` is the name of the device or
> the numeric index (starting with 0) of the device. *Name* of the device is recommended.
> The index may change because the Windows Graphics Performance Preference default
> is "Let Windows decide". Windows may decide to change the order of GPUs and therefore
> the indices change. The index *is* consistent when you choose a Graphics Performance
> Preference. This setting is in Windows settings, System, Display, Graphics settings.

## Performance

DirectML works very well across most GPUs. You may have a delay the first-time your model
is started while the engine is optimizing it. Later starts should be quicker.
