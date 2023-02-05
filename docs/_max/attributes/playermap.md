---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  #- dp.oak
tags:
  - visual
usage:
  signature: "PLAYEROUT_INT"
  values:
    "0": no playermap output (default)
    "1": playermap output
  examples:
    - "@playermap 1"
---

Player indices for each pixel output on the fourth outlet.
Pixels are a signed integer and align with the identical (row, column) pixel
in other matrices. This integer is the same playerID that is used throughout
the plugin data to uniquely identify skeletons seen by the sensor.

This playermap can be used to mask and filter matrix data.
A common use is to mask the depthmap, colormap, or pointcloud based on skeletons
detected. This can be done automatically using [`@depthonlyplayers`](depthonlyplayers.md).

The depthmap, IR, playermap, and pointcloud matrices align with each
other by default. Use [`@align`](align.md) to also align and match the color data.

> :memo: [dp.kinect](../dp.kinect.md) requires [`@depthmap 2`](depthmap.md)
> to calculate this playermap.
