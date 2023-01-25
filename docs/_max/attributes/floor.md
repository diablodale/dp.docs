---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - physical
usage:
  signature: X_FLOAT Y_FLOAT Z_FLOAT I_FLOAT J_FLOAT K_FLOAT
  values: 0. 0. 0. 0. 0. 0. (default)
  examples:
    - "floor 0.0 -925.7 0.0 0.12 0.97 0.047"
---

Floor plane as x, y, z coordinates for a point on the plane
and i, j, k of a vector normal to the plane. Read only. The floor plane
identification occurs when [`@skeleton`](skeleton.md) is enabled and
the values stabilize.

Floor values are affected by [`@flipx`](flipx.md) and [`@distmeter`](distmeter.md).
Output `floor` messages on every bang by enabling [`@flooronbang`](flooronbang.md).

```python
# Max native:   @skeleton 1 @skeletonformat 1
floor x y z i j k

# OSC protocol: @skeleton 1
/floor x y z i j k
```

### Examples

Render an OpenGL plane that visually matches the physical floor identified.

1. Create a Max patch that includes your sensor plugin,
   [jit.anim.node](https://docs.cycling74.com/max7/refpages/jit.anim.node),
   and a [jit.gl.gridshape @shape plane](https://docs.cycling74.com/max7/refpages/jit.gl.gridshape)
   that renders itself to a window.
2. Connect the node to the gridshape.
3. Set the `@position` of the node to be the `floor` x, y, z values.
4. Set the `@direction` of the node to be the `floor` i, j, k values.

### dp.kinect, dp.kinect2 floor equation

[`dp.kinect`](../../dp.kinect/) and [`dp.kinect2`](../../dp.kinect2/) use
Microsoft Kinect SDKs that describe their floor clipping plane as an equation.

```
Ax + By + Cz + D = 0
A = i value of the floor normal vector; negate when @flipx is enabled 
B = j value of the floor normal vector 
C = k value of the floor normal vector 
D = -y value of the floor point on the plane; in meters or mm by `@distmeter`
```
