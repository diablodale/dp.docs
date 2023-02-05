---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual
usage:
  signature: "{POINTCLOUD_STRING | POINTCLOUD_INT}"
  values:
    "off or 0": no pointcloud output (default)
    "xyz or 1": pointcloud with XYZ values
    "xyzw or 2": pointcloud with XYZW values, W=1.0
  examples:
    - "gldepth @pointcloud xyz"
    - "gldepth @pointcloud 1"
---

Format of pointcloud output as three or four floating point values.

* XYZ: real-world XYZ location of the point with three float32 values
* XYZW: real-world XYZW location of the point with four float32 values.
  W is always 1.0. This format is often useful when transforming the
  pointcloud with matrix math or OpenGL shaders.

> :warning: Pointcloud output requires the optional fifth outlet enabled
> with the plugin argument [`gldepth`](#outlet-5).

The matrix output on this fifth outlet is a jitter matrix having
three or four planes, same dimensions as the depthmap, and
contains floating point values representing the real-world
location of every depth pixel in the depthmap.

Send an XYZ pointcloud matrix to the first inlet of a (jit.gl.mesh)
to visually see a point cloud. These 3-value matrices are compatible with the
[OpenGL matrix format](http://cycling74.com/docs/max6/dynamic/c74_docs.html#jitterappendixb).

Use [`@align`](align.md) to align color/depth/ir/playermap data with
the pointcloud xyz values. This enables scenarios like overlaying the
colormap pixels on to the pointcloud points.

### Outlet 5 for Pointclouds {#outlet-5}

Plugins only have four matrix outlets by default. Enable the
optional fifth outlet for pointclouds by typing the argument
`gldepth` when you create your plugin object. Next,
control the pointcloud output format using `@pointcloud`.

```
dp.kinect2 gldepth @depthmap 1 @pointcloud 1
```
