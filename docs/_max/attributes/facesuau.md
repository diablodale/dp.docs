---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - face
usage:
  signature: "SUAU_INT"
  values:
    "0": no face SU/AU output (default)
    "1": dp.kinect SU/AU
    "2": dp.kinect2 SU/AU
  examples:
    - "@facesuau 2"
---

Face shape unit (SU) and animation unit (AU) output on the fifth outlet.
[`@faces`](faces.md) must also be enabled for this face tracking feature to function.
Values can be smoothed with [`@facesuausmooth`](facesuausmooth.md).

```python
# Max native:   @faces 1 @facesuau 2 @skeletonformat 1
face playerId shapeunits converged scale su1 su2...  
face playerId animunits au1 au2...

# OSC protocol: @faces 1 @facesuau 2
/face/playerId/shapeunits converged scale su1 su2...  
/face/playerId/animunits au1 au2...
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

converged
: boolean (`0` = false, `1` = true) when SUs converge to realistic values

scale
: float where `1.0` means equal in scale to loaded 3D model (in model-space)

su1 su2...
: floats for SUs described below

au1 au2...
: floats for AUs described below

### dp.kinect

[`dp.kinect`](../../dp.kinect/) with Microsoft's
[Kinect v1]({{- site.baseurl -}}/hardware/sensors/kinect-v1/) SDK deforms the face
model using shape units (SU) and animation units (AU) roughly based on the
[Candide-3 model](http://www.icg.isy.liu.se/candide/).

* 11 shape units statically displace the face model shape due to bone structure
  and the neutral position of features. Nine are defined by the
  Candide-3 model plus two additional: eyes vertical difference, chin width.
* 6 animation units are deltas to animate the face model shape so the rendered face
  matches the tracked human face, e.g. jaw lower, lip stretch, brow raise, etc.

Details of Kinect v1 SDK SUs and AUs are in
[Microsoft documentation](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/jj130970(v=ieb.10)#face-tracking-outputs).

### dp.kinect2

Microsoft's [Kinect v2]({{- site.baseurl -}}/hardware/sensors/kinect-v2/) SDK
face model is Microsoft-proprietary and has insufficient documentation.
Microsoft did not align with the Candide-3 model or maintain any compatibility
with Kinect v1.

* 94 [shape units](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn791604(v=ieb.10))
  require a fully [captured face model](faces.md#face-model).
* 17 [animation units](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn791602(v=ieb.10))
