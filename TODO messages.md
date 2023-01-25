
### Floor #
Floor identification occurs when `@skeleton` is enabled and the values stabilize over time. Once the floor is identified by the Kinect, you will begin receiving floor messages if `@flooronbang` is enabled. The floor values are influenced by the `@distmeters` and `@flipx` attributes.

    OSC                     Max route  
    -----------------------------------------  
    /floor x y z i j k      floor x y z i j k

* `x, y, z` are floating point numbers and are coordinates for a point on the plane
* `i, j, k` are floating point numbers and are of a vector normal to the plane
* Natively, the Kinect SDK describes the clipping plane as the equation Ax + By + Cz + D = 0. Given the floor output of 6 floats, you can derive the native values:  
A = the i value given your choice of `@flipx`  
B = the j value  
C = the k value  
D = negative of y value in meters or mm

Examples:

    OSC                                     Max route  
    ----------------------------------------------------------------------------  
    /floor 0.0 -925.7 0.0 0.12 0.97 0.047   floor 0.0 -925.7 0.0 0.12 0.97 0.047

An example of using this data is to position a jit.gl.gridshape plane using a jit.anim.node. Connect the node to the gridshape. Then set the `@position` of the node to be the `x, y, z` values and the `@direction` of the node to be the `i, j, k` values.

It is not necessary to enable `@flooronbang` to get this floor data in a message. These same values are available from the `@floor` attribute. It can be queried using the standard Max mechanism of prepending "get" on the attribute, `getfloor`, and sending that message to the 1st inlet. Its result will be output via the dumpout outlet. 

### Face Tracking #
Face tracking occurs when `@faces` is enabled with a value of `1`. The Kinect v2 supports tracking faces on all tracked skeletons. Data for face tracking is output on the OSC/route message outlet and most is affected by `@flipx`, `@distmeter` and `@skeletonformat` values; where they are not, it will be specifically noted. Face data is not rotated by gravity or elevation; you will need to do that yourself with jit.anim.node or custom calculations.

**Some face features (shape units, hidef 2D points, 3D model, and face colors) require a fully captured/modeled face. This full capture is: a) drastically slow compared to the Kinect v1; b) large facial hair tends to interfere; and c) requires the face to be rotated slowly in four directions. The status of this capture can be seen with the `modelstatus` message.**

`@faces=1` will always output the bounding box around the face in color/depth pixel coordinates and the 3D pose of the face in the real-world location. You must enable this or all other face tracking options will be ignored.

    OSC                                                  Max route  
    -----------------------------------------------------------------------------------------------------  
    /face/id/bounds left top right bottom                face id bounds left top right bottom  
    /face/id/boundsdepth left top right bottom           face id boundsdepth left top right bottom  
    /face/id/pose scale xrot yrot zrot xtrn ytrn ztrn    face id pose scale xrot yrot zrot xtrn ytrn ztrn  
    /face/id/modelstatus collection capture              face id modelstatus collection capture

* `bounds` has color coordinates and `boundsdepth` has depth coordinates
* `left` is a long integer that represents the leftmost X coordinate of the bounding box
* `top` is a long integer that represents the topmost Y coordinate of the bounding box
* `right` is a long integer that represents the rightmost X coordinate of the bounding box
* `bottom` is a long integer that represents the bottomost Y coordinate of the bounding box
* `scale` is a float where 1.0 means that it is equal in size to the loaded 3D model (in the model space)
* `xrot`, `yrot`, `zrot` are floats of Euler rotation angles in degrees of rotation around X, Y, and Z axis
* `xtrn`, `ytrn`, `ztrn` are floats of 3D translations on the X, Y, and Z axis in real-world space
* `collection` is a long integer bitfield that represents the [collection needs](https://msdn.microsoft.com/en-us/library/microsoft.kinect.face.facemodelbuildercollectionstatus.aspx)
* `capture` is a long integer that represents the [capture status](https://msdn.microsoft.com/en-us/library/microsoft.kinect.face.facemodelbuildercapturestatus.aspx)

**2D Face Points**  
`@face2dpoints` enables output of 2D points in color camera coordinate space that describe the face. It is one of the following values: 0=disabled, 1=Kinect v1 hidef points, 2=Kinect v2 basic points, 3=Kinect v2 hidef points. At this time, `1=Kinect v1 hidef points` are not available on dp.kinect2. Only values 2 and 3 are available.

* 2: Kinect v2 basic points are the (x,y) coordinates of [these 5 basic face points](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.facepointtype.aspx) listed in the same order.  
* 3: Kinect v2 hidef points are the (x,y) coordinates of [these defailed face points](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.highdetailfacepoints.aspx) listed in the same order. These require a fully captured face; see `modelstatus` message.

The output of OSC is below with the Max route format `@skeletonformat=1` following the same pattern as previous examples.

    OSC below (@skeletonformat=1 is also supported)    Max route
    ----------------------------------------------------------------------------------------------  
    /face/id/points2d x1 y1 x2 y2 x3 y3 ...            face id points2d x1 y1 x2 y2 x3 y3 ...
    /face/id/points2ddepth x1 y1 x2 y2 x3 y3 ...       face id points2ddepth x1 y1 x2 y2 x3 y3 ...

* `points2d` has color coordinates and `points2ddepth` has depth coordinates
* `x1` and `y1` are long integers and represent the x,y coordinate in color space of point 1 of the face
* `x2` and `y2` are long integers and represent the x,y coordinate in color space of point 2 of the face
* As an example, if you select `2=Kinect v2 basic points` there are 5 points, therefore 10 integers will be output

**Face Shape and Animation Units**  
`@facesuau` will enable animation unit (AU) and shape unit (SU) output for tracked faces. There are three values: `0=disabled, 1=Kinectv1 AU/SU, 2=Kinectv2 AU/SU.` You can smooth these values with `@facesuausmooth`. The output format is the same with dp.kinect and dp.kinect2. _However_, the meaning of the v1 and v2 AU/SUs are different. [v1 is documented](https://github.com/diablodale/dp.kinect/wiki/Message-based-Data#face-tracking) with dp.kinect.  Microsoft did not make the Kinect v2 backwards compatible with v1 and they did not follow the Candide-3 face model. The model with the Kinect v2 and therefore with dp.kinect2 is a Microsoft proprietary model. At this time, there is only brief Microsoft documentation:

* [Animation Units for Kinect v2](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.faceshapeanimations.aspx)
* [Shape Units for Kinect v2](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.faceshapedeformations.aspx) require a fully captured face; see `modelstatus` message

Output examples

    OSC (@skeletonformat=0)  
    -----------------------------------------------  
    /face/id/shapeunits converged scale su1 su2 ...  
    /face/id/animunits au1 au2 ...  
      
    Max route (@skeletonformat=1)  
    ----------------------------------------------  
    face id shapeunits converged scale su1 su2 ...  
    face id animunits au1 au2 ...


* `converged` is a long integer [0=false,1=true] when shape unit coefficients have converged to realistic values
* `scale` is a float where 1.0 means that it is equal in size to the loaded 3D model (in the model space).
* su1, su2, ... are floats representing the respective SUs described in the MSDN documentation
* au1, au2, ... are floats representing the respective AUs described in the MSDN documentation

**3D Face Model**  
`@face3dmodel = 3, 4, 7, or 8` will enable output of a 3D model of the face in local face coordinate space. Therefore, the `@distmeter` does not apply to this set of data. This model and its coordinate space can be scaled, translated, and rotated using the 3D `pose` values described above. The 3D face models require a fully captured face; see `modelstatus` message.

[![dp.kinect2 face model render](https://cloud.githubusercontent.com/assets/679350/20496090/0d505f86-b024-11e6-9dbf-a9007afbc6c7.png)](http://hidale.com/dpkinect2face/) Microsoft provides [little documentation](https://msdn.microsoft.com/en-us/library/dn785525.aspx#ID4EXC) on this feature and cautions in their forums that the 3D face model could change in future SDK updates. For now with SDK 2.0 on which dp.kinect2 is written, there are 1347 vertices making 2630 triangles.

This 3D face data is available in several formats:

3) `@face3dmodel=3` will output the `triangles` list describing counterclockwise triangles. Each triangle is a group of 9 values representing three 3D vertices; each vertex being an xyz coordinate
   ```
   OSC below (@skeletonformat=1 is also supported)
   --------------------------------------------------------------------    
   /face/id/triangles t1_v1_x t1_v1_y t1_v1_z t1_v2_x t1_v2_y t1_v2_z t1_v3_x t1_v3_y t1_v3_z ...
   ```
   * `t1_v1_x`, `t1_v1_y`, `t1_v1_z` are floats representing the x, y, z coordinates in local face coordinate space for the first vertex of the triangle
   * `t1_v2_x`, `t1_v2_y`, `t1_v2_z` are floats representing the x, y, z coordinates in local face coordinate space for the second vertex of the triangle
   * `t1_v3_x`, `t1_v3_y`, `t1_v3_z` are floats representing the x, y, z coordinates in local face coordinate space for the third vertex of the triangle
   * the above grouping of 9 repeats to describe all triangles in the model

4) `@face3dmodel=4` will output a long list of indices and then a long list of 3D points in that index order. Each triangle is described by three index values representing the three vertices in counterclockwise order. The index value is used as a lookup to find the index'th 3D point in the second list. The second list is a series of 3D points; each point being an xyz coordinate. A single 3D point will likely be referenced by its index more than one time because the triangles in the face model will share vertices.
   ```
   OSC below (@skeletonformat=1 is also supported)  
   --------------------------------------------------------------------  
   /face/id/indices t1_v1_idx t1_v2_idx t1_v3_idx t2_v1_idx t2_v2_idx t2_v3_idx ...  
   /face/id/vertices v1_x v1_y v1_z v2_x v2_y v2_z ...
   ```
   * `t1_v1_idx`, `t1_v2_idx`, `t1_v3_idx` are long integers representing the index lookup for the first, second, and third 3D point for each vertex of the first triangle
   * `t2_v1_idx`, `t2_v2_idx`, `t2_v3_idx` are long integers representing the index lookup for the first, second, and third 3d point for each vertex of the second triangle
   * The above pattern repeats until all triangles in the model are described with each their three indices
   * `v1_x`, `v1_y`, `v1_z` represent the x, y, z coordinate for a 3D point in local face coordinate space
   * `v2_x`, `v2_y`, `v2_z` represent the x, y, z coordinate for another 3D point in local face coordinate space
   * The above pattern of 3D points is repeated until all 3D points needed to create the model are output.
5) Not supported on the Kinect v2.
6) Not supported on the Kinect v2.
7) `@face3dmodel=7` will output a single 3-plane float32 matrix describing counterclockwise triangles with each triangle defined by sequential groups of three cells (xyz as the three planes) of the matrix representing the triangle's three 3D vertices. Other than it being stored in a matrix, the data is the same as (3) above.

8) `@face3dmodel=8` will output two matrices; first the indices used as a lookup to find the index'th 3D point of the second matrix to create triangles. The second matrix is a 3-plane float32 matrix with each cell describing an xyz point in 3D space. This may be a more efficient format than (7) because the indices matrix will only be sent once since the triangle relationships do not change. The 3D points matrix will update often since the vertices' xyz position on a face changes with every movement. A single 3D point will likely be referenced by its index more than one time because the triangles in the face model will share vertices. Other than it being stored in a matrix, the data is the same as (4) above.

**Face Colors (skin and hair)**  
`@facecolors=1` will enable output of face skin and hair color. Microsoft's technology derives the face and hair color by building a complete 3D model for the face and understanding the colors of that model. This 3D model process is described above.

    OSC below (max route friendly @skeletonformat=1 is also supported)
    --------------------------------------------------------------------    
    /face/id/haircolor red green blue alpha
    /face/id/skincolor red green blue alpha

* `id` is a long integer matching a tracked skeleton
* `red` is a float32 representing the red component of the color
* `green` is a float32 representing the green component of the color
* `blue` is a float32 representing the blue component of the color
* `alpha` is a float32 representing the alpha component of the color. It is always 1.0.

For example:
* `/face/2/haircolor 0.246 0.845 0.472 1.0` face on skeleton 2 has haircolor of red=0.246, green=0.845, blue=0.472
* `/face/5/skincolor 0.114 0.619 0.247 1.0` face on skeleton 5 has skincolor of red=0.114, green=0.619, blue=0.247

**Face Properties**  
`@faceprop=1` will enable output of [face properties](http://msdn.microsoft.com/en-us/library/dn782034.aspx#ID4EID) that provide information about the appearance or state of a user's face and the confidence of that result. The results and confidence may vary. You may need to filter or smooth them. This output may be moved into a separate attribute to optimize resources before the final release.

    OSC below (max route friendly @skeletonformat=1 is also supported)
    --------------------------------------------------------------------    
    /face/id/property result confidence

* `id` is a long integer matching a tracked skeleton
* `property` is a string representing one of the eight [face properties](http://msdn.microsoft.com/en-us/library/dn782034.aspx#ID4EID) tracked
* `result` is an integer (0=false, 1=true) representing the detected state of the property
* `confidence` is a floating point number representing the confidence result. The value is [0.0, 0.5, 1.0] with 1.0 indicating the highest confidence

For example:
* `/face/2/happy 1 1.0` face on skeleton 2 expresses happiness and Kinect is very confident
* `/face/2/happy 1 0.5` face on skeleton 2 may express happiness and Kinect is only somewhat confident
* `/face/2/happy 0 1.0` face on skeleton 2 does not express happiness and Kinect is very confident
* `/face/2/lefteyeclosed 1 1.0` face on skeleton 2 has the left eye closed and Kinect is very confident
* `/face/2/lefteyeclosed 0 1.0` face on skeleton 2 has the left eye open and Kinect is very confident
* `/face/2/lookingaway 1 1.0` face on skeleton 2 is looking away and Kinect is very confident
* `/face/2/lookingaway 1 0.5` face on skeleton 2 is probably partially looking away and Kinect is only somewhat confident


