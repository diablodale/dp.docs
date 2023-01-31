---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - face
usage:
  signature: "FACES_INT"
  values:
    "0": no face 3D model output (default)
    "1": dp.kinect triangles list
    "2": dp.kinect indices and vertices lists
    "3": dp.kinect2 triangles list
    "4": dp.kinect2 indices and vertices lists
    "7": dp.kinect2 triangles matrix
    "8": dp.kinect2 indices and vertices matrices
  examples:
    - "@face3dmodel 1"
---

Face 3D model output as a mesh in local face coordinate-space.
The mesh is defined with triangles or a trio of indexed vertices.
They are stored in lists or matrices.
[`@faces`](faces.md) must be enabled for this face tracking feature to function.

The face 3D model can be scaled, translated, and rotated using [`face pose`](faces.md) values.
[`@distmeter`](distmeter.md) does not scale face 3D model triangles.
[`@flipx`](flipx.md) affects winding of triangle vertices.

### dp.kinect

Microsoft's [Kinect v1]({{- site.baseurl -}}/hardware/sensors/kinect-v1/) SDK
used by [`dp.kinect`](../../dp.kinect/) has
[insufficient documentation](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/jj130970(v=ieb.10)#face-tracking-outputs)
for its face 3D model. Microsoft hints it is based on the [Candide-3 model](http://www.icg.isy.liu.se/candide/).

![dp.kinect faces]({{- site.baseurl -}}/assets/max/attributes/face3dmodel-k1-2faces-h300.jpg)

### dp.kinect2

Microsoft's [Kinect v2]({{- site.baseurl -}}/hardware/sensors/kinect-v2/) SDK
used by [`dp.kinect2`](../../dp.kinect2/) has
[insufficient documentation](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn785525(v=ieb.10)#face-model)
for its face 3D model. The model has 1347 vertices that make 2630 triangles.
It is not based on the Candide-3 model. It requires a [captured face model](faces.md#face-model).

![dp.kinect2 face]({{- site.baseurl -}}/assets/max/attributes/face3dmodel-k2-1face-h300.png)

### Triangles list

Output a `triangles` list of counterclockwise triangles. Each triangle has 9 coordinate values
for the three XYZ vertices. The list is extremely long; 9 times the number of triangles.

```python
# Max native:   @faces 1 @face3dmodel 1 @skeletonformat 1
face playerId triangles t1_v1_x t1_v1_y t1_v1_z t1_v2_x t1_v2_y t1_v2_z t1_v3_x t1_v3_y t1_v3_z...

# OSC protocol: @faces 1 @face3dmodel 1
/face/playerId/triangles t1_v1_x t1_v1_y t1_v1_z t1_v2_x t1_v2_y t1_v2_z t1_v3_x t1_v3_y t1_v3_z...
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

t1_v1_x, t1_v1_y, t1_v1_z
: float XYZ coordinates in local face coordinate-space for the *first* vertex of triangle `t1`

t1_v2_x, t1_v2_y, t1_v2_z
: float XYZ coordinates in local face coordinate-space for the *second* vertex of triangle `t1`

t1_v3_x, t1_v3_y, t1_v3_z
: float XYZ coordinates in local face coordinate-space for the *third* vertex of triangle `t1`

### Indices and vertices lists

Output an `indices` list and then a `vertices` list of XYZ coordinates in the indices order.
Each triangle is described by three index values for the three vertices in counterclockwise order.
The index value is used as a lookup to find the index'th XYZ point in the `vertices` list.
The `vertices` list is a series of points; each point having XYZ coordinates.

This may be a more efficient format than [triangles list](#triangles-list) because the `indices` list
is only sent once since the triangle relationships do not change. The `vertices` list will update often
since the vertices' XYZ positions on a face change continuously. A vertex will likely be referenced
by its index more than one time because the triangles in the face model will share vertices. Other than it
being stored in a list, the data is the same as [indices and vertices matrices](#indices-and-vertices-matrices).

```python
# Max native:   @faces 1 @face3dmodel 2 @skeletonformat 1
face playerId indices t1_v1_idx t1_v2_idx t1_v3_idx t2_v1_idx t2_v2_idx t2_v3_idx...
face playerId vertices v1_x v1_y v1_z v2_x v2_y v2_z...

# OSC protocol: @faces 1 @face3dmodel 2
/face/playerId/indices t1_v1_idx t1_v2_idx t1_v3_idx t2_v1_idx t2_v2_idx t2_v3_idx...
/face/playerId/vertices v1_x v1_y v1_z v2_x v2_y v2_z...
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

t1_v1_idx, t1_v2_idx, t1_v3_idx
: integer index (lookup) for the first, second, and third vertex of triangle `t1`

v1_x, v1_y, v1_z
: float XYZ coordinates for a point in local face coordinate-space

### Triangles matrix

Output a 3-plane float32 matrix of counterclockwise triangles.
Sequential groups of three matrix cells (each cell having three planes for XYZ) define
the three vertices of a triangle. Values are the same as in [triangles list](#triangles-list).
The name of this matrix is output on the fifth outlet.

```python
# Max native:   @faces 1 @face3dmodel 7 @skeletonformat 1
face playerId triangles jit_matrix uTriangleName

# OSC protocol: @faces 1 @face3dmodel 7
/face/playerId/triangles jit_matrix uTriangleName
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

uTriangleName
: unique name for 3-plane float32 matrix containing triangles

### Indices and vertices matrices

Output two 3-plane matrices. The `indices` integer matrix is a lookup to find the index'th vertex
of the `vertices` matrix to create triangles. Each cell of the `vertices` float32 matrix contains
an XYZ vertex.

This may be a more efficient format than [triangles matrix](#triangles-matrix) because the `indices` matrix
is only sent once since the triangle relationships do not change. The `vertices` matrix will update often
since the vertices' XYZ positions on a face change continuously. A vertex will likely be referenced
by its index more than one time because the triangles in the face model will share vertices. Other than it
being stored in a matrix, the data is the same as [indices and vertices lists](#indices-and-vertices-lists).

```python
# Max native:   @faces 1 @face3dmodel 8 @skeletonformat 1
face playerId indices jit_matrix uIndicesName
face playerId vertices jit_matrix uVerticesName

# OSC protocol: @faces 1 @face3dmodel 8
/face/playerId/indices jit_matrix uIndicesName
/face/playerId/vertices jit_matrix uVerticesName
```

playerId
: same integer used for a [tracked skeleton](skeleton.md#user-identification)

uIndicesName
: unique name for 3-plane integer matrix containing indices

uVerticesName
: unique name for 3-plane float32 matrix containing vertices
