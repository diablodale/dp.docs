---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - face
usage:
  signature: "2DPOINTS_INT"
  values:
    "0": no face2dpoints output (default)
    "1": dp.kinect detailed points
    "2": dp.kinect2 basic points
    "3": dp.kinect2 detailed points
  examples:
    - "@face2dpoints 2"
---

Face 2D key points in color camera `uv` coordinates output on the fifth outlet.
[`@faces`](faces.md) must also be enabled for this face tracking feature to function.

```python
# Max native:   @faces 1 @face2dpoints 2 @skeletonformat 1
face playerId points2d u1 v1 u2 v2 u3 v3...
face playerId points2ddepth u1 v1 u2 v2 u3 v3...

# OSC protocol: @faces 1 @face2dpoints 2
/face/playerId/points2d u1 v1 u2 v2 u3 v3...
/face/playerId/points2ddepth u1 v1 u2 v2 u3 v3...
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

u1 v1 u2 v2 u3 v3...
: `uv` coordinates of face key points 1, 2, 3...
  in `points2d` color-space or `points2ddepth` depth-space

## dp.kinect detailed points (1)

[`dp.kinect`](../dp.kinect.md) with `@face2dpoints 1` enables output of 100 2D-points in color-space
that describe the face. The first 87 points are correctly shown in
[Microsoft's documentation](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/jj130970(v=ieb.10)#face-tracking-outputs).
However, Microsoft is wrong about the last 13 points. The correct key points are

* left eye center (88)
* right eye center (89)
* nose center (90)
* left eye brow from inside (91-95)
* right eye brow from inside (96-100)

`points2d` will have 200 integers since there are 100 key points.  
`points2ddepth` depth-space coordinates are not supported.

## dp.kinect2 basic points (2)

[`dp.kinect2`](../dp.kinect2.md) with `@face2dpoints 2` enables output of 5 basic 2D-points that describe the face.
Since there are 5 key points, the `points2d` and `points2ddepth` messages will both have 10 integers.

```
left eye
right eye
nose
left mouth corner
right mouth corner
```

## dp.kinect2 detailed points (3)

[`dp.kinect2`](../dp.kinect2.md) with `@face2dpoints 3` enables output of 35 detailed 2D-points that describe the face.
These detailed points require a [face model](faces.md#face-model).
Since there are 35 key points, the `points2d` and `points2ddepth` messages will both have 70 integers.

```
left eye inner corner
left eye outer corner
left eye mid top
left eye mid bottom
right eye inner corner
right eye outer corner
right eye mid top
right eye mid bottom
left eyebrow inner
left eyebrow outer
left eyebrow center
right eyebrow inner
right eyebrow outer
right eyebrow center
mouth left corner
mouth right corner
mouth upper lip mid top
mouth upper lip mid bottom
mouth lower lip mid top
mouth lower lip mid bottom
nose tip
nose bottom
nose bottom left
nose bottom right
nose top
nose top left
nose top right
forehead center
left cheek center
right cheek center
left cheekbone
right cheekbone
chin center
lower jaw left end
lower jaw right end
```
