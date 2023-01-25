dp.kinect2 supports a normal compliment of Max attributes plus the following. They are grouped here in the same way they are visibly grouped in the Max inspector. Defaults are within brackets [] after the attribute name below, for example: `myattributename [off]`


### Face Tracking #
Below are the attributes related to face tracking. Please also reference the [face tracking message output](https://github.com/diablodale/dp.kinect2/wiki/Message-based-Data#face-tracking) to understand more details on the output.

`faces [0]` Kinect v2 can track up to six faces. When enabled, it will output messages related to the 2D bounding box of the face, rotation, translation, and the scale relative to the standard face model.

`face2dpoints [0]` Enables output of 2D points in color camera coordinate space that describe the face. It is one of the following values: 0=disabled, 1=Kinect v1 detailed points, 2=Kinect v2 basic points, 3=Kinect v2 detailed points. At this time, `1=Kinect v1 detailed points` are not available on dp.kinect2. Only values 2 and 3 are available.

* 2: Kinect v2 basic points are the (x,y) coordinates of [these basic face points](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.facepointtype.aspx) listed in the same order.  
* 3: Kinect v2 detailed points are the (x,y) coordinates of [these defailed face points](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.highdetailfacepoints.aspx) listed in the same order.

`facesuau [0]` Enables animation unit (AU) and shape unit (SU) output for tracked faces. There are three values: 0=disabled, 1=Kinectv1 AU/SU, 2=Kinectv2 AU/SU. The output format is the same with dp.kinect and dp.kinect2. _However_, the meaning of the v1 and v2 AU/SUs are different. [v1 is documented](https://github.com/diablodale/dp.kinect/wiki/Message-based-Data#face-tracking) with dp.kinect.  Microsoft did not make the Kinect v2 backwards compatible with v1 and they did not follow the Candide-3 face model. The model with the Kinect v2 and therefore with dp.kinect2 is a Microsoft proprietary model. At this time, there is only brief Microsoft documentation:
* [Animation Units for Kinect v2](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.faceshapeanimations.aspx)
* [Shape Units for Kinect v2](http://msdn.microsoft.com/en-us/library/microsoft.kinect.face.faceshapedeformations.aspx)

`facesuausmooth [0. 0. 0. 0. 0.]` are five floats representing a [holt double smoothing algorithm](https://docs.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh855623(v=ieb.10)). This is the same smoothing algorithm that is applied to the joints with `@smoothing`. The default is no AU smoothing `0.0 0.0 0.0 0.0 0.0`.

`face3dmodel [0]` Enables output of a detailed 3D model of the face in local face coordinate space. Microsoft provides [little documentation](https://msdn.microsoft.com/en-us/library/dn785525.aspx) on this model. It does create a very detailed face when the mesh is drawn. This mesh is not the same as the simpler Candide-3 face model available with the Kinect v1 sensor. There are several formats in which this model can be provided to your patch. Examples of these formats are [described in this face tracking section](Message-based-Data#face-tracking).
* 0 = Disabled.
* 3 = Output a list describing counterclockwise triangles with each triangle as a group of 9 values representing three 3D vertices.
* 4 = Output a list of indices and then a list of 3D points where the index value is used as a lookup to find the index'th 3D point of the second list to create triangles. This is a more efficient format than (3) because the indices will only be sent once since the triangle relationships do not change. The 3D points will update often since the vertices' xyz position on a face changes with every movement. A single 3D point will likely be referenced by its index more than one time because the triangles in the face model will share vertices.
* 7 = Output a single 3-plane float32 matrix describing counterclockwise triangles with each triangle defined by sequential groups of three cells (xyz as the three planes) of the matrix representing the triangle's three 3D vertices.
* 8 = Output two matrices; first the indices used as a lookup to find the index'th 3D point of the second matrix to create triangles. The second matrix is a 3-plane float32 matrix with each cell describing an xyz point in 3D space. This may be a more efficient format than (7) because the indices matrix will only be sent once since the triangle relationships do not change. The 3D points matrix will update often since the vertices' xyz position on a face changes with every movement. A single 3D point will likely be referenced by its index more than one time because the triangles in the face model will share vertices.

`facecolors [0]` Setting to a value of `1` will enable output of face and hair color for each detected face. You will also need to enable @faces=1. Microsoft's technology derives the face and hair color by building a complete 3D model for the face and understanding the colors of that model. This color data format and the head movement requirements are [described in this face tracking section](Message-based-Data#face-tracking).

`faceprop [0]` Setting to a value of `1` will enable output of [face properties](http://msdn.microsoft.com/en-us/library/dn782034.aspx#ID4EID) that provide information about the appearance or state of a user's face and the confidence of that result. The results and confidence may vary. You may need to filter or smooth them.

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

### Physical #

`gravrot [off]` Enable or disable rotation of the Kinect relative to gravity to be sent out the OSC/skeleton output on every bang. The output is a message of 4 floats representing an angle of rotation in degrees around a vector (a, x, y, z). An example of usage is to set the `@rotate` attribute on a jit.anim.node to these values.

`hardware [unknown]` Identifies the model of Kinect hardware attached where 0=unknown, 1=Kinect for XBox, 2=Kinect for Windows, 3=Kinect v2 for Windows. This value is not always specific and may require the Kinect to be open and operating.

`idkinect [unknown]` Identifies the USB id for the specific Kinect associated with this specific dp.kinect2. This enables multiple Kinect v2's to be used on a single Windows computer once Microsoft supports multiple use. You can retrieve a list of possible USB ids by sending the message `getusbidlist` to dp.kinect2.

`imageuntwist [off]` Needed degrees of rotation to rotate (re-orient) the depth, color, and ir maps so that pixels at the top are away from gravity and pixels at the bottom are towards gravity. An example of usage is to set the `@theta` attribute of jit.rota to this value (converted to radians) and then send the color image matrix from dp.kinect2 to jit.rota. This message sent out the OSC/skeleton output on every bang

`verbose [off]` Enable or disable verbose error and warning messages to be output in the Max window to aid debugging.

### Visual #

`unique [off]` Choice on/off to limit output of depth, color, IR, or playermap matrices to be 0=always output on a bang or 1=only output when unique. Therefore, if you set this value to be on (1), it is possible for you to bang the object yet not have matrices output. This is **much** more efficient than using a jit.change object.
