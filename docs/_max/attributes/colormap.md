---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "{INT | off | argb | uyvy | rgb | rgba}"
  values:
    "0 or off": no color output (default)
    "1 or argb": color with byte order (alpha red green blue)
    "3 or uyvy": color with Max uyvy; technically (YCbCr)
    "4 or rgb": color with byte order (red green blue)
    "5 or rgba": color with byte order (red green blue alpha)  
  examples:
    - "@colormap 1"
    - "@colormap rgb"
---

Color image output in choice of pixel format on the second outlet.
Values `4 or rgb` and `5 or rgba` are often useful when sending color information to OpenGL.

> :memo: Plugin versions v1.3.20210429 and newer support using value names like `rgb` and `argb`.

> :warning: All known versions of Max incorrectly process and display
>  ***all*** image data. Max will slightly shift tint, color,
> saturation, and brightness. The shifts accumulate. These shifts may
> not be important or visible depending on your specific use.
> 
> Details of the problems are within private conversations with Max developers.
> In general, the problems are due to incorrect and inconsistent formulas in
> Max's codebase that are used for rgb and uyvy manipulation,
> uyvy to/from rgb conversion, and colorspace transformation. In addition,
> there is no single shared rgb colorspace for jitter matrices and no
> metadata that labels jitter matrices with their colorspace. Without this
> metadata or a single shared colorspace, no processing or ***display*** of
> image data can be consistently high-fidelity. This is a technically
> difficult topic area; Cycling74 declines to fix the problems.
> Workarounds are very difficult and require custom-written Max plugins,
> shaders, and new visual display components (e.g. jit.window, jit.pwindow).
><https://cycling74.com/forums/yuv-bugs-fixed-in-max-8-corrupts-tint-color-saturation-and-brightness>
