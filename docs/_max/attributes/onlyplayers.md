---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
tags:
  - visual adjustment
usage:
  signature: "BITFIELD_INT | SOURCE+SOURCE+..."
  values:
    "0": no filtering (default)
    "1..15": filter pixels by tracked skeletons
  examples:
    - "@onlyplayers 1   <- depth is filtered"
    - "@onlyplayers 3   <- depth and color are filtered"
    - "@onlyplayers depth        <- depth is filtered"
    - "@onlyplayers color+depth  <- depth and color are filtered"
---

Filter source by tracked players. Filtered data is zero-like.
Possible values are:

* [4-bit field](#bitfield) represented as an integer [0..15] allowing
all combinations of the four matrix outputs to be filtered.
* any combination of source names combined together

> 📝 [dp.kinect](../dp.kinect.md) plugin only filters depthmap

> 📝 Plugins v1.3.20240315 and older used the deprecated `@depthonlyplayers`.

## Filter bitfield values {#bitfield}

✔️ below means the data of that column is filtered

|    | depth | color | infrared | pointcloud |
| -: | :---: | :---: | :------: | :--------: |
|  **0** |   |   |   |   |
|  **1** | ✔️ |   |   |   |
|  **2** |   | ✔️ |   |   |
|  **3** | ✔️ | ✔️ |   |   |
|  **4** |   |   | ✔️ |   |
|  **5** | ✔️ |   | ✔️ |   |
|  **6** |   | ✔️ | ✔️ |   |
|  **7** | ✔️ | ✔️ | ✔️ |   |
|  **8** |   |   |   | ✔️ |
|  **9** | ✔️ |   |   | ✔️ |
| **10** |   | ✔️ |   | ✔️ |
| **11** | ✔️ | ✔️ |   | ✔️ |
| **12** |   |   | ✔️ | ✔️ |
| **13** | ✔️ |   | ✔️ | ✔️ |
| **14** |   | ✔️ | ✔️ | ✔️ |
| **15** | ✔️ | ✔️ | ✔️ | ✔️ |
