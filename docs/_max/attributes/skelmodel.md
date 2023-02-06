---
products:
  - dp.kinect3
  - dp.oak
tags:
  - physical
usage:
  signature: "PATH_STRING"
  values: sensor specific default
  examples:
    - "@skelmodel c:\\models\\dnn_model_2_0_op11.onnx"
    - "@skelmodel movenet_multipose_lightning_1_int32_op15_H160_W256.onnx"
---

Machine learning model used for skeleton and joint tracking

## dp.kinect3

Microsoft provides two models for Azure Kinect

* `dnn_model_2_0_lite_op11.onnx`: default, less accurate, less compute burden
* `dnn_model_2_0_op11.onnx`: more accurate, more compute burden

> :warning: Microsoft will not fix their bug
> <https://github.com/microsoft/Azure-Kinect-Sensor-SDK/issues/1540>.
> The Azure Kinect model file must be on an ASCII path.

## dp.oak

The model currently supported is `movenet_multipose_lightning_1_int32_op15_H160_W256.onnx`.
Use the maxhelp file in the plugin ZIP download to get the model. Or, download it from
<https://github.com/diablodale/model-zoo>.
