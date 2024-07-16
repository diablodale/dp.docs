---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{ TRANSCODER_NAME | INDEX_INT }"
  values:
    "auto": "Chosen `@opencl` device, fallback to CPU (default)"
    "intelmedia": "Intel GPU Quick Sync, fallback to `auto`"
  examples:
    - "@transcoder intelmedia"
---

Transcoder for image formats, e.g. transcoding MJPEG sensor data to color RGB.

* `auto` is the default acceleration with your chosen [@opencl](opencl.md) device and CPU
* `intelmedia` uses Intel GPU (Quick Sync) hardware when possible, then fallback to `auto`

> 📝 Plugins before v1.3.20231220 use an old deprecated attribute `@decodercolor`.
> Use `@transcoder` with newer plugins. `@decodercolor intelmedia` is supported during a transition period.

## Performance

Enable multiple compute devices for different tasks using the
attributes [@transcoder](transcoder.md), [@opencl](opencl.md), and [@skelcompute](skelcompute.md).
For example...

* Decode color frames with integrated Intel Quick Sync engine `@transcoder intelmedia`
* Flip and undistort frames on integrated Intel GPU `@opencl intel`
* Track skeleton joints on the discrete Nvidia GPU `@skelcompute nvidia`
* ...and the remaining features run on your CPU

I recommend testing to discover which settings meet your needs for hardware,
latency, and throughput. You can have significant performance improvements! :smile:

## Kinect v3 (Azure) {#kinect-v3}

[Kinect v3](../../_hardware/sensors/kinect-v3.md) has many color resolutions.
Unfortunately, only one resolution is low-latency. The single low-latency Kinect v3
resolution is basic HD (1280x720). Use [`@colormapres 1280x720`](colormapres.md)
when the lowest color latency is needed.

All Kinect v3 resolutions except 1280x720 arrive from the sensor in MJPEG format. MJPEG is
an outdated compression format. Due to the math algorithm of MJPEG, the decompression
can not be multithreaded on a CPU or GPU. Only one thread on a CPU or GPU can be used
to decompress a MJPEG color frame. This usually leads to slightly higher latency.
Intel Quick Sync `@transcoder intelmedia` may *reduce* latency since it is a dedicated
special-purpose MJPEG engine.

### Nvidia nvJPEG decoder (removed) {#nvidia}

> ⚠️ The Nvidia nvJPEG decoder is deprecated and was removed in plugin v1.3.2023.
> It did not show significant benefits during testing when compared to other decoders.

An optional color decoder could be enabled when an Azure Kinect sensor
and [`dp.kinect3`](../dp.kinect3.md) were used with an Nvidia GPU.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/dp-kinect3/#download>.
2. The ZIP download contains four files for this decoder. Copy them to your dp.kinect3 folder.  
   ```
   nppc64_11.dll
   nppicc64_11.dll
   nppidei64_11.dll
   nvjpeg64_11.dll
   ```
3. Enable the decoder with the deprecated `@decodercolor nvjpeg`.
