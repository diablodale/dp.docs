---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "{ALIGN_STRING | ALIGN_INT}"
  values:
    "off or 0": no alignment (default)
    "depth or 1": align to depth camera
    "color or 2": align to color camera
  examples:
    - "@align color"
    - "@align 0"
---

Align data to the perspective of the depth or color camera.
This affects all data: depthmap, colormap, ir, playermap, pointcloud, etc.

* off: native alignment based on original sensor sources
* depth: align all data and resolutions to be the same resolution as the depthmap
* color: align all data and resolutions to be the same resolution as the colormap

> :memo: Plugin versions v1.3.20210721 and newer support using string value names
> like `color` and `off`.

## Artifacts

> :warning: There can be slight artifacts around edges of objects because the two
> cameras (depth, color) on the sensor can not occupy the same physical place.
> They have slightly different views causing one camera to see pixels while the other
> camera can not see those same pixels.

Newer plugins have less artifacts with [`@depthvis`](depthvis.md)
and [`@depthonlyplayers`](depthonlyplayers.md) filtering, and improvements
in sensor manufacturing.

Below are examples of possible artifacts without filtering.

![Color black artifacts]({{- site.baseurl -}}/assets/max/attributes/align-artifacts-3.png)

![Color double artifacts]({{- site.baseurl -}}/assets/max/attributes/align-artifacts.png)

![Depth black artifacts]({{- site.baseurl -}}/assets/max/attributes/align-artifacts-2.png)
