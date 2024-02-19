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
    - "@mlcrop 160 140 300 350"
---

Crop the machine learning input tensor.
This overrides the default behavior to automatically scale the input to the model's tensor input
size requirements *without* preserving aspect ratio.

* `off` resize to input requirement, may change aspect ratio
* `center` resize and center crop to input requirement, loose cropped areas, keep aspect ratio
* `centerpad` resize and pad the color image to input requirement, keep aspect ratio
* Four integers define a crop region, then resize to input requirement, may change aspect ratio,
  e.g. `@mlcrop 160 140 300 350` means all inclusive columns 160->300 and rows 140->350
