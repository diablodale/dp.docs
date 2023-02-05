---
products:
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "on"
  examples:
    - "@undistort 1"
---

Undistort the depth, color, infrared, and playermap output.
The undistortion and cropping of unwanted/invalid
pixels is controlled with [`@undistortscale`](undistortscale.md).

All lenses have [distortion](https://en.wikipedia.org/wiki/Distortion_%28optics%29).
They are not perfect [pinhole cameras](https://en.wikipedia.org/wiki/Pinhole_camera).
Usually, the sensor's image can be used with no corrections.
Some special cases need the image to be undistorted using this
feature.

> :memo: Plugins always undistort real-world xyz locations of points in
> the pointcloud jit matrix. However, the uv coordinates (i.e. pixel)
> at which the xyz pointcloud data is stored in memory *are not undistorted*.

In practice, distorted uv coordinates are almost never a concern.
Consumers of pointcloud data are interested in the xyz values, not the uv
coordinates which store them. Simply enable [`@align`](align.md) and *not*
`@undistort` to align the depth/color and the pointcloud xyz.

Enabling both `@align 2 @undistort 1` and sending
colormap and pointcloud jit matrices to (jit.gl.mesh) will not visually
align. A real-world xyz location will have different uv (pixel) coordinates
in the pointcloud and colormap matrices. The aligned pointcloud uv pixel
coordinate will not correspond to the aligned+undistorted colormap uv
pixel coordinate.
