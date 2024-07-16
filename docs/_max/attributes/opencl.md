---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "{GPU_NAME_SUBSTRING | GPU_INDEX}"
  values: "off (default)"
  examples:
    - "@opencl intel"
    - "@opencl amd"
    - "@opencl nvidia"
    - "@opencl default"
    - "@opencl 1"
    - '@opencl "2070"  <--  number quoted otherwise is GPU index 2070'
    - "@opencl 0"
    - "@opencl off"
---

OpenCL device for image processing (e.g. flipx, undistort, align, etc.)
using a GPU or accelerator compatible with OpenCL v1.2. An integrated GPU
may perform well at these simple tasks as it shares memory with the CPU.
Performance depends on the specific hardware and the image processing
chosen. It should be tested.

## GPU Sequence and Default

> 📝 Plugins v1.3.20221003 and newer support using GPU names,
> e.g. `@opencl nvidia`. Use specific names to avoid the sequence
> concerns below.

OpenCL and Windows together will chose the default OpenCL device when
enabled with `@opencl 1` or `@opencl default`. All OpenCL devices can be
seen by looking at the `@opencl` attribute with an (attrui) or the Max Inspector.

The default GPU and the sequence of GPUs may change because the Windows
Graphics Performance Preference default is "Let Windows decide". Windows may
decide to change the order of GPUs. This index *is* consistent when you choose
a Graphics Performance Preference. This setting is in Windows settings, System,
Display, Graphics settings.

The default OpenCL device can be forced by setting the `OPENCV_OPENCL_DEVICE`
environment variable in Windows.
<https://github.com/opencv/opencv/wiki/OpenCL-optimizations#opencv-opencl-configuration-options>

```
<Platform>:<CPU|GPU|ACCELERATOR|nothing=GPU/CPU>:<DeviceName or ID>
Examples:   Intel:GPU:
            :GPU:1
            AMD::Tahiti
            Intel:CPU:
            NVIDIA:GPU:0
```

## Known Issues

> ⚠️
> Enabling `@opencl` on an Intel GPU may crash Max when you first start your sensor. This
> is a known bug with Intel GPU drivers and LLVM (the compiler Intel uses for OpenCL).
> The only workaround is to try again. After clang successfully compiles the OpenCL kernels,
> they will be cached on-disk by OpenCV. These on-disk cached kernels will be used the next
> time and the LLVM clang compiler will not be used; therefore avoiding the crash. This cache
> is not forever and will be purged due to disk usage, Intel driver update, etc. See
> <https://github.com/llvm/llvm-project/issues/29935>, <https://github.com/intel/compute-runtime/issues/122>,
> <https://github.com/NixOS/nixpkgs/issues/97401>.
> For reference, these are the errors that appear in a debugger console during a crash.
> ```
> Loaded 'C:\Windows\System32\DriverStore\FileRepository\iigd_dch.inf_amd64_afa18c61a36f2728\opencl-clang64.dll'. Symbol loading disabled by Include/Exclude setting.
> clang: CommandLine Error: Option 'h' registered more than once!
> LLVM ERROR: inconsistency in registered CommandLine options
> Exception thrown at 0x00007FFC418A79A4 (opencl-clang64.dll) in Max.exe: 0xC0000005: Access violation reading location 0x0000000000000000.
> Exception thrown at 0x00007FFC418A79A4 (opencl-clang64.dll) in Max.exe: 0xC0000005: Access violation reading location 0x0000000000000000.
> Exception thrown at 0x00007FFC418A79A4 (opencl-clang64.dll) in Max.exe: 0xC0000005: Access violation reading location 0x0000000000000000.
> Exception thrown at 0x00007FFC418A79A4 (opencl-clang64.dll) in Max.exe: 0xC0000005: Access violation reading location 0x0000000000000000.
> The program '[665836] Max.exe' has exited with code 1 (0x1).
> ```
