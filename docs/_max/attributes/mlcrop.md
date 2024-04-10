---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "{ off | center | centerpad | XMIN YMIN XMAX YMAX }"
  values: "mlcrop off (default)"
  examples:
    - "@mlcrop centerpad"
    - "@mlcrop 160 140 479 379"
---

Crop the machine learning input tensor.
This overrides the default behavior to automatically scale the input to the model's tensor input
size requirements *without* preserving aspect ratio.

* `off` resize to input requirement, may change aspect ratio
* `center` resize and center crop to input requirement, loose cropped areas, keep aspect ratio
* `centerpad` resize and pad the color image to input requirement, keep aspect ratio
* `XMIN YMIN XMAX YMAX` four integer crop region, resize to input requirement, may change aspect ratio  
  e.g. `@mlcrop 160 140 479 379` crops tensor to have inclusive columns 160->479
  and rows 140->379, then resized by [`@mlinput`](mlinput.md) requirement.

Visit [`@mlinput`](mlinput.md#pipeline) for a diagram of the crop pipeline.

`@mlcrop` can be changed anytime. It can automated by sending messages like
`mlcrop 12 34 56 78` to our plugins. This enables dynamic focus, zoom, and crop of data
based on real-time algorithms and choices. For example, if a model identifies a human in
an image and provides a bounding box, then the bounding box pixel coordinates can be used
to focus a model on only that human by constructing a `mlcrop` message and sending it to
the plugin.
