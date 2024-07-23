---
products:
  - dp.kinect3
  - dp.oak
tags:
  - machine learning
usage:
  signature: "PATH_STRING"
  examples:
    - "@mlmodel c:\\mymodels\\squeezenet.onnx"
    - "@mlmodel darknet-abc123.onnx"
---

Run machine learning inference with an ONNX model.

## Input into model {#input}

Sensor color image is the single model input currently implemented.
Pre-processing of this raw sensor data is controlled with [`@mlinput`](mlinput.md).

## Output inference results {#output}

Model results must be dense tensors of numeric data. Multiple tensors are supported.
Sparse tensors, sequences, and maps are not currently supported.

These results are output on the 5th outlet as a
Max [dictionary](https://docs.cycling74.com/max7/vignettes/dictionaries).
[route](https://docs.cycling74.com/max7/refpages/route)
and [routepass](https://docs.cycling74.com/max7/refpages/routepass?q=route)
are helpful to send it to other dict objects for post-processing.

This dictionary contains a named entry for each result tensor output by the model. Their names are defined by the model itself.

```jsonc
{
    "$schema": "dp-nd-tensor",
    "shape": [ 1, 1000, 1, 1 ],
    "type": "float32",
    "data": [ 1.49474326e-05, 2.23620050e-03, 1.65242789e-04,
        9.92372283e-04, 7.42915319e-04, 5.80585969e-04,
        ...
    ]
}
```

* `$schema` is "dp-nd-tensor"
* `shape` is the tensor shape with an entry for every rank and its value as the extent
* `type` is the tensor element type listed below
* `data` contains the flattened element data of the tensor

### Element types

ONNX data is converted from its native `type` into Max Dictionary compatible types like long, float32, char, etc.

| Onnx Native Element Type                 | C++ Type  |
|------------------------------------------|-----------|
| ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT      | float32   |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT8      | uint8     |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT8       | int8      |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT16     | uint16    |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT16      | int16     |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT32      | int32     |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT64      |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_STRING     |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_BOOL       |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT16    | float16   |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_DOUBLE     | float64   |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT32     |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT64     |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_COMPLEX64  |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_COMPLEX128 |           |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_BFLOAT16   |           |
