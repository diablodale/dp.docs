---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "{FORMAT_STRING | FORMAT_INT}"
  values:
    "quat or 0": quaternion hierarchical
    "quat-abs or 1": quaternion absolute (default)
    "mat or 2": matrix hierarchical
    "mat-abs or 3": matrix absolute
  examples:
    - "@orientformat 2"
    - "@orientformat mat-abs"
---

Skeleton joint orientation as quaternion, 4x4 matrix, hierarchical, or absolute
rotation. Set [`@skeleton 2`](skeleton.md) to output these orientation values.

Orientation is output as quaternion (4 floats) or 4x4 rotation matrix (16 floats).
Examine the 3x3 rotation matrix within the 4x4. The first three are the direction of the
joint's +X axis given as a 3-vector in the chosen coordinate space, the second three are the
+Y axis direction, and the third three are the +Z axis direction.

```python
# Max native, quaternion absolute orientation: @skeleton 2 @skeletonformat 1 @orientformat 1
skel playerId jointname x y z confidence qx qy qz qw
skel 1 l_shoulder -0.211094 -0.01427 0.813303 1. 0.789475 -0.596378 0.044726 -0.138065

# Max native, matrix absolute orientation: @skeleton 2 @skeletonformat 1 @orientformat 3
skel playerId jointname x y z confidence m11 m12 m13 m14 m21 m22 m23 m24 m31 m32 m33 m34 m41 m42 m43 m44
skel 1 l_shoulder -0.211094 -0.01427 0.813303 1. 0.255383 -0.965115 -0.057734 0. -0.85392 -0.197149 -0.481615 0. 0.453432 0.172296 -0.874479 0. 0. 0. 0. 1.
```

The coordinate space for the orientation is *absolute* world coordinate space or
a *hierarchical* rotation coordinate space. Details on the orientation can be found at
<https://docs.microsoft.com/en-us/previous-versions/windows/kinect/dn799273(v=ieb.10)#joint-normals> and
<https://docs.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh973073(v=ieb.10)>.


> :memo: Plugins v1.3.20210818 and newer support format names like `mat` and `quat-abs`.
> When `mat` is within the name they output matrix format, otherwise quaternion.
> When `abs` is within the name they output absolute world rotation, otherwise hierarchical.

> :memo: When migrating from jit.openni, the orientation data has changed. The rotations are *not*
> relative to a T-pose. This change must be managed by your Max patch.

> :warning: [`dp.kinect`](../../dp.kinect/) default orientation format is
> `0` quaternion hierarchical
