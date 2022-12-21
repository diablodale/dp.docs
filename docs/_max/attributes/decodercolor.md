---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "{ DECODER_NAME | INDEX_INT }"
  values:
    "intelmedia": "Intel Media SDK"
    "libyuv": "LibYuv Project"
    "nv12": "NV12 with OpenCV and IPP"
    "nvjpeg": "NVIDIA nvJPEG"
    "winmf": "Windows Media Foundation"
  examples:
    - "@decodercolor winmf"
    - "@decodercolor intelmedia"
---

Select the color decoder used primarily for decoding MJPEG sensor data.
This attribute is enabled for sensors with design limitations like
[Azure Kinect](#azure-kinect). Test and experiment to discover which method of
color decoding works best with your specific computing hardware.

* `intelmedia` is the Intel Media SDK decompressor. If you have an Intel CPU
  with Intel Quick Sync/Graphics, then this decoder will use the hardware Quick
  Sync accelerator.
* `libyuv` is the libyuv decompression library and runs on the CPU
* `nv12` is a hybrid decompressor using OpenCV and IPP and may
  use both your CPU an GPU
* `nvjpeg` is the nvJPEG decoder and hardware available in some NVIDIA GPUs
* `winmf` is the Windows Media Foundation decoder built into Windows and
  may be hardware accelerated

## Performance

Use of multiple compute device for different tasks using the
attributes [@decodercolor](decodercolor.md), [@opencl](opencl.md), and [@skelcompute](skelcompute.md).
For example...

  * Decode color frames on the Intel CPU harware decoder `@decodercolor intelmedia`
  * Flip and undistort frames on integrated Intel GPU `@opencl intel`
  * Track skeleton joints on the discrete NVIDIA GPU `@skelcompute nvidia`
  * and the remaining features run on your CPU

I recommend testing to discover which settings meet your needs for hardware,
latency, and throughput. You can have significant performance improvements! :smile:

## Azure Kinect

The [@decodercolor](decodercolor.md) attribute is a result of Microsoft's
Azure Kinect design. Microsoft does not provide low-latency 
full HD (1920x1080) color output on the Azure Kinect. Instead, they only
provide one low-latency color output at basic HD (1280x720) resolution.
When low-latency color output is needed on the Azure Kinect,
I recommend 1280x720 resolution.

Higher resolutions of color are available (e.g. 4K) with Azure Kinect. However,
these resolutions are only available from the sensor in MJPEG format. MJPEG is
an outdated compression format; an unfortunate Microsoft choice. Due to the
mathematics of MJPEG, the decompression can not be low-latency or multithreaded
on the CPU or GPU. This means -- on modern CPUs with multiple "cores",
only one core will be used to decompress this MJPEG data. When that one core
is running as fast as possible, then color frames can not be processed any faster.
You may see this in Windows 10 Task Manager; one core may be at 100% while other
cores are not busy.

### NVIDIA decoder

An optional color decoder can be enabled when an Azure Kinect sensor is used with
an NVIDIA GPU. Please note: this decoder **did not** demonstrate significant benefits
during testing.

1. Download the optional-nvidia-addons.zip from <https://hidale.com/shop/dp-kinect3/#download>
2. The ZIP download contains four files for this decoder. Copy them to your dp.kinect3 folder.  
   ```
   nppc64_11.dll
   nppicc64_11.dll
   nppidei64_11.dll
   nvjpeg64_11.dll
   ```
3. Enable the decoder with the attribute `@decodercolor nvjpeg`
