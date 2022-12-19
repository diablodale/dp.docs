---
parent: Attributes
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "{int | off | argb | uyvy | rgb | rgba}"
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
rgb (4) and rgba (5) are often useful when sending color information to OpenGL.

> :warning: All known versions of Max incorrectly process and display uyvy data.
> Max will shift tint, color, saturation, and brightness. This is an internally
> documented Max bug due to incorrect and inconsistent formulas used for uyvy
> manipulation, uyvy to/from rgb conversion, and colorspace transformation.
> Cycling74 declines to fix these bugs. There is no workaround.
> When high color fidelity is needed, then avoid uyvy within Max.
