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

Enable machine learning and run inference with the given ONNX model on the *colormap*.
Models supported include those that have a single input and that output numeric data (not strings).

## Input into model {#input}

The color image from the sensor is the single input currently implemented.

1. Transcode into different formats using [`@mlinput`](mlinput.md).
2. Scale to the model's tensor input size requirement *without* preserving aspect ratio.
   Use [`@mlcrop`](mlcrop.md) to override this and control the crop and resize.
3. Element type is checked/converted to the models's tensor input type requirement, e.g.
   8-bit unsigned int, 32-bit float, 16-bit float, etc. It prevents under/overflows.
   It does *not* normalize.
4. [`@mlmean`](mlmean.md) is subtracted from the element values
5. [`@mlscale`](mlscale.md) is multiplied to the element values

## Output inference results {#output}

Model results can be a tensor, a sequence, or a map. Sparse tensor output is not supported.

These results are output on the 5th outlet as a
Max [dictionary](https://docs.cycling74.com/max7/vignettes/dictionaries).
[route](https://docs.cycling74.com/max7/refpages/route)
and [routepass](https://docs.cycling74.com/max7/refpages/routepass?q=route)
are helpful to send it to other dict objects for post-processing.

This dictionary contains a named entry for each result tensor output by the model. Their names are defined by the model itself.

```jsonc
{
    "type_id": "dp-nd-tensor",    // n-dimensional tensor
    "sizes": [ 1, 1000, 1, 1 ],   // shape
    "dt": "f",                    // element type abbreviation
    "data": [ 1.49474326e-05, 2.23620050e-03, 1.65242789e-04,
        9.92372283e-04, 7.42915319e-04, 5.80585969e-04,
        ...
    ]
}
```

* `type_id` is always "dp-nd-tensor"
* `sizes` is the shape of the tensor with an entry for every rank and its value as the extent
* `dt` is the tensor element type [abbreviation](#abbreviation)
* `data` contains the flattened element data of the tensor

### Element type abbreviation {#abbreviation}

All except the last three element types are converted into the json dictionary.

| Onnx Native Element Type                 | C++ Type    | Abbreviation |
|------------------------------------------|-------------|:------------:|
| ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT      | float       | f            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT8      | uint8_t     | u            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT8       | int8_t      | c            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT16     | uint16_t    | w            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT16      | int16_t     | s            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT32      | int32_t     | i            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_INT64      | int64_t     | j            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_STRING     | std::string | t            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_BOOL       | bool        | b            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_FLOAT16    | half        | h            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_DOUBLE     | double      | d            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT32     | uint32_t    | k            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_UINT64     | uint64_t    | m            |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_COMPLEX64  |             |              |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_COMPLEX128 |             |              |
| ONNX_TENSOR_ELEMENT_DATA_TYPE_BFLOAT16   |             |              |
