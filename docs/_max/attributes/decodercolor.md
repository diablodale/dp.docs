---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{ DECODER_NAME | INDEX_INT }"
  values:
    "intelmedia": "Intel GPU Quick Sync"
    "libyuv": "LibYuv Project"
    "nv12": "NV12 with OpenCV and IPP"
    "winmf": "Windows Media Foundation"
  examples:
    - "@decodercolor winmf"
    - "@decodercolor intelmedia"
---

Select the color decoder used primarily for decoding MJPEG sensor data.
This attribute is enabled for sensors with design limitations like
[Kinect v3](#kinect-v3). Test and experiment to discover which method of
color decoding works best with your specific computing hardware.

* `intelmedia` uses Intel GPU hardware acceleration
* `libyuv` uses the libyuv library; runs on the CPU
* `nv12` uses OpenCV and IPP; runs on the CPU and/or GPU
* `winmf` uses Windows Media Foundation; may be hardware accelerated

## Performance

Enable multiple compute devices for different tasks using the
attributes [@decodercolor](decodercolor.md), [@opencl](opencl.md), and [@skelcompute](skelcompute.md).
For example...

* Decode color frames on integrated Intel GPU `@decodercolor intelmedia`
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

[@decodercolor](decodercolor.md) is a result of Microsoft's design choice.
These alternate resolutions arrive from the sensor in MJPEG format. MJPEG is
an outdated compression format. Due to the algorithm of MJPEG, the decompression
can not be multithreaded on the CPU or GPU. Modern CPUs with multiple "cores"
and powerful GPUs can not be used. Only one CPU core will be used to decompress
a MJPEG color frame. This usually leads to slightly higher latency.

### Nvidia nvJPEG decoder (removed) {#nvidia}

> :warning: This Nvidia nvJPEG decoder is deprecated and was removed in plugin v1.3.2023.
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
3. Enable the decoder with `@decodercolor nvjpeg`.
