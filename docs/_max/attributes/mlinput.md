---
products:
  - dp.kinect3
  - dp.oak
mermaid: true
tags:
  - machine learning
usage:
  signature: "Source [Action]..."
  examples:
    - "@mlinput color rgb"
    - "@mlinput color grey"
    - "@mlinput color bgr resize 256 160"
    - "@mlinput color rgb centercrop resize 256 160 int32 nchw"

---

Machine learning input and preprocessing actions.
For example, color in RGB format is easy with `@mlinput color rgb`.

## Input sources {#input}

`color` is the only input source supported at this time

## Preprocessing actions {#actions}

Preprocessing is achieved by a series of actions. The actions are applied
to the input in the order listed. Actions are described by a series of tokens and values.
Some actions are chords; meaning that several tokens and values are combined.

Simple example `@mlinput color rgb`

1. get color input from sensor
2. convert to rgb encoding

Advanced example `@mlinput color rgb centercrop resize 256 160 int32 nchw`

1. get color input from sensor
2. convert to rgb encoding
3. center crop to match the resize aspect ratio ↙️
4. resize the center cropped area to 256x160 pixels (1.6 aspect ratio)
5. convert each component (red, green, blue) to a 32-bit signed integer
6. convert to an NCHW layout tensor

Actions are applied in the order listed. The advanced example order could be changed
to achieve a similar result with `@mlinput color rgb int32 centercrop resize 256 160 nchw`

### Transcode

Input encoding, fundamental type, normalization, and layout can all be changed.

#### Encode

Choose the encoding you need. More can be added on request.

`rgb`, `rgba`, `argb`, `bgr`, `bgra`
: variations of channel order for BT.601 full range [0..255]

`uyvy`, `ycbcr`
: interleaved YCbCr; recommend another encoding due to [Max color bugs](colormap.md#color-quality)

 `grey`
: single-channel greyscale using BT.601 primaries

#### Fundamental type {#type}

Fundamental type of input values is changed with the following

Optional [`norm`](#normalize)
: `uint8` or `char`, `float16`, `float32`, `float64`

No norm
: `int8`, `int16`, `uint16`, `int32`

#### Normalize

List `norm` after the [type](#type) to enable normalization

`uint8 norm`, `char norm`
: floating-point 0.0-1.0 to 8-bit unsigned integer 0-255 with `(value * 255.0)`

`float16 norm`, `float32 norm`, `float64 norm`
: 8-bit unsigned integer 0-255 to floating-point 0.0-1.0 with `(value / 255.0)`

#### Layout

Inference models and their underlying engines require specific layouts for each
batch of input. Two layouts are supported

`nchw`
: number of batch samples, channels, height, width; required for ONNX and often with PyTorch

`nhwc`
: number of batch samples, height, width, channels; often with TensorFlow

### Scalar Math {#math}

Scalar math operations can be applied to values. Any combination of these
can be used for common operations like substracting the mean, scaling, offset, etc.

`add`
: add a value to each respective channel, e.g.  
  (100, 100, 100) `add 2` = (102, 100, 100)  
  (100, 100, 100) `add 2 2` = (102, 102, 100)  
  (100, 100, 100) `add 2 2 2` = (102, 102, 102)

`sub`
: subtract a value from each respective channel, e.g.  
  (100, 100, 100) `sub 2` = (98, 100, 100)  
  (100, 100, 100) `sub 2 2` = (98, 98, 100)  
  (100, 100, 100) `sub 2 2 2` = (98, 98, 98)

`mul`
: multiply a value with each respective channel, e.g.  
  (100, 100, 100) `mul 1.5` = (150, 100, 100)  
  (100, 100, 100) `mul 1.5 1.5` = (150, 150, 100)  
  (100, 100, 100) `mul 1.5 1.5 1.5` = (150, 150, 150)

`div`
: divide a value into each respective channel, e.g.
  (100, 100, 100) `div 2` = (50, 100, 100)  
  (100, 100, 100) `div 2 2` = (50, 50, 100)  
  (100, 100, 100) `div 2 2 2` = (50, 50, 50)

### Transform

#### Resize

`resize DIMENSION` will resize input to a given width and height dimension.
It may be faster to resize early so that later actions operate on smaller input.
The dimension can be two separate numbers or a resolution string like `256x160`.
All three examples below achieve the same result

* `resize 250 160`
* `resize 250.0 160.0`
* `resize 250x160`

#### Flip

`flipx` (flip input by columns, rows are same)
or `flipy` (flip input by rows, columns are same) will flip input across rows or columns.

<table class="compact"><tr>
<th>Original</th><th><code>flipx</code></th><th><code>flipy</code></th></tr>
<tr><td>
<table>
<tr><th>column 1</th><th>column 2</th></tr>
<tr><td>1.0</td><td>2.0</td></tr>
<tr><td>3.0</td><td>4.0</td></tr>
</table>
</td><td>
<table>
<tr><th>column 1</th><th>column 2</th></tr>
<tr><td>2.0</td><td>1.0</td></tr>
<tr><td>4.0</td><td>3.0</td></tr>
</table>
</td><td>
<table>
<tr><th>column 1</th><th>column 2</th></tr>
<tr><td>3.0</td><td>4.0</td></tr>
<tr><td>1.0</td><td>2.0</td></tr>
</table>
</td></tr></table>

#### Rotate

`rotate NUMBER` will rotate input clockwise in 90 degree-increments, i.e. 0, 90, 180, 270.
It does not crop or pad input. If your input is 320x240 then `rotate 90` will create input 240x320.

<table class="compact"><tr>
<th>Original</th><th><code>rotate 90</code></th><th><code>rotate 180</code></th><th><code>rotate 270</code></th></tr>
<tr><td>
<table><tr><th></th><th></th></tr><tr><td>1.0</td><td>2.0</td></tr><tr><td>3.0</td><td>4.0</td></tr></table>
</td><td>
<table><tr><th></th><th></th></tr><tr><td>3.0</td><td>1.0</td></tr><tr><td>4.0</td><td>2.0</td></tr></table>
</td><td>
<table><tr><th></th><th></th></tr><tr><td>4.0</td><td>3.0</td></tr><tr><td>2.0</td><td>1.0</td></tr></table>
</td><td>
<table><tr><th></th><th></th></tr><tr><td>2.0</td><td>4.0</td></tr><tr><td>1.0</td><td>3.0</td></tr></table>
</td></tr></table>

### Crop

#### Region of interest {#roi}

Each crop type supports a region of interest (roi) declared using one of these coordinates

`xyxy XLEFT_INT YTOP_INT XRIGHT_INT YBOTTOM_INT`
: top-left inclusive and bottom-right exclusive corners, e.g. `xyxy 200 50 400 150` rectangle has pixels x 200-399 and y 50-149

`xywh XLEFT_INT YTOP_INT WIDTH_INT HEIGHT_INT`
: top-left inclusive and its width and height from that point, e.g. `xywh 200 50 200 100` rectangle has pixels x 200-399 and y 50-149

`cxywh XCENTER_INT YCENTER_INT WIDTH_INT HEIGHT_INT`
: center of roi and its total width and height, e.g. `cxywh 300 100 200 100` rectangle has pixels x 200-399 and y 50-149

#### Crop shapes

Cropping shapes require a [resize](#resize) dimension, [roi](#roi), or both.

`crop ROI`
: crop/remove input outside required roi, preserves visual aspect ratio; e.g. `crop xyxy 200 50 400 150`

`centercrop [ROI] resize DIMENSION`
: crop/remove input outside optional roi, then center crop with dimension's aspect ratio and no padding (looses visual content),
  then resize to dimension, preserves visual aspect ratio;
  e.g. `centercrop resize 256 160` or `centercrop xyxy 200 50 400 150 resize 256 160`

`padcrop [ROI] resize DIMENSION`
: crop/remove input outside optional roi, then center crop with dimension's aspect ratio and padding (retains visual content),
  then resize to dimension, preserves visual aspect ratio, also known as "letterboxing" or "pillarboxing";
  e.g. `padcrop resize 256 160` or `padcrop xyxy 200 50 400 150 resize 256 160`

## Archive

Plugin versions before v1.3.20240619 used `@mlcrop`, `@mlmean`, `@mlscale`, and `@mlswapch` to
pre-process input. Newer plugins do not support these separate attributes. Use [`@mlinput`](mlinput.md) for all pre-processing.
