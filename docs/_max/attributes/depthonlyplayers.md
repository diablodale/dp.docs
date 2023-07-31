---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
tags:
  - visual adjustment
usage:
  signature: "BITFIELD_INT"
  values:
    "0": no filtering (default)
    "1..15": filter pixels by tracked skeletons
  examples:
    - "@depthonlyplayers 1   <- depth only for tracked skeletons"
    - "@depthonlyplayers 3   <- depth, color only for tracked skeletons"
    - "@depthonlyplayers 10  <- color, pointcloud only for tracked skeletons"
---

Filter matrix pixels by tracked skeletons. Filtered pixels are zero-like.
Possible values are a [4-bit field](#bitfield) represented as an integer [0..15] allowing
all combinations of the four matrix outputs to be filtered.

> :memo: [dp.kinect](../dp.kinect.md) plugin only filters depthmap

## Filter bitfield values {#bitfield}

:heavy_check_mark: below means the data of that column is filtered

|    | depth | color | infrared | pointcloud |
| -: | :---: | :---: | :------: | :--------: |
|  **0** |   |   |   |   |
|  **1** | :heavy_check_mark: |   |   |   |
|  **2** |   | :heavy_check_mark: |   |   |
|  **3** | :heavy_check_mark: | :heavy_check_mark: |   |   |
|  **4** |   |   | :heavy_check_mark: |   |
|  **5** | :heavy_check_mark: |   | :heavy_check_mark: |   |
|  **6** |   | :heavy_check_mark: | :heavy_check_mark: |   |
|  **7** | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |   |
|  **8** |   |   |   | :heavy_check_mark: |
|  **9** | :heavy_check_mark: |   |   | :heavy_check_mark: |
| **10** |   | :heavy_check_mark: |   | :heavy_check_mark: |
| **11** | :heavy_check_mark: | :heavy_check_mark: |   | :heavy_check_mark: |
| **12** |   |   | :heavy_check_mark: | :heavy_check_mark: |
| **13** | :heavy_check_mark: |   | :heavy_check_mark: | :heavy_check_mark: |
| **14** |   | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| **15** | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
