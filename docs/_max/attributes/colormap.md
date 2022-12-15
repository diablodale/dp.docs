---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual
usage:
  signature: "{0 | 1 | 3 | 4 | 5 | off | argb | uyvy | rgb | rgba}"
  default: "off"
  examples:
    - "@colormap 1"
    - "@colormap rgb"
---

Enable color image output in choice of pixel format on the second outlet.

* 0 or off = no color output
* 1 or argb = color with byte order (alpha red green blue)
* 3 or uyvy = color in Max's uyvy; technically it is (YCbCr)
* 4 or rgb = color with byte order (red green blue)
* 5 or rgba = color with byte order (red green blue alpha)

rgb (4) and rgba (5) are often useful when sending color information to OpenGL.

> :warning: All known versions of Max incorrectly process and display uyvy data.
> Max will shift tint, color, saturation, and brightness. This is an internally
> documented Max bug due to incorrect and inconsistent formulas used for uyvy
> manipulation, uyvy to/from rgb conversion, and colorspace transformation.
> Cycling74 declines to fix these bugs. There is no workaround.
> When high color fidelity is needed, then avoid uyvy within Max.
