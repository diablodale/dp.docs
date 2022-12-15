dp.kinect2 supports a normal compliment of Max attributes plus the following. They are grouped here in the same way they are visibly grouped in the Max inspector. Defaults are within brackets [] after the attribute name below, for example: `myattributename [off]`

### Audio and Speech #

`speechadapt [on]` Enables constant adaptation of speech recognition to adjust for the current speaker(s). This can cause problems over time in noisy environments or where there are a great number of speakers (in a kiosk environment, for example). For these scenarios and long recognition sessions (a few hours or more), it may be beneficial to turn off adaptation of the acoustic model. This will prevent recognition accuracy from degrading over time and lessen memory usage.

`speechconf [normal]` Your choice (high, normal, no filter) of what speech to be recognized. Your selection and better will be output. For example, the default (normal) will output speech it recognized as having normal confidence or high confidence.

`grammarfile []` The path to the speech recognition grammar file. It is an [GRXML](http://msdn.microsoft.com/en-us/library/hh361658%28v=office.14%29.aspx) file as defined by the [W3C standards](http://www.w3.org/TR/speech-grammar/). The Kinect recognition engine is tuned for command/response type grammars and does not support real-time dictation.

`speechlocale [en-us]` The Kinect supports multiple languages for speech recognition. Set this attribute to an installed language pack combination, for example: fr-fr, de-de, en-gb, ja-jp, es-es. The US English (en-us) language pack is included with the standard Kinect driver setup. You can download [additional language packs](http://go.microsoft.com/fwlink/?LinkID=248679).

`speech [off]` Enables speech recognition and, optionally, speech interference information. All speech recognition or interference information will be output on the OSC/skeleton outlet.

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

`accel [0. -1. 0. 0.]` Four float vector (x, y, z, w) pointing in the direction of gravity in gravity units (where 1 unit = 9.81m/s^2). The coordinate system is centered on the sensor, and is a right-handed coordinate system with positive z in the direction the sensor is pointing at. In the default sensor rotation (horizontal, level placement), this will return the vector (0, -1.0, 0, 0). The w value of the Vector4 is always set to 0.0.

`colorfocal [hardware dependent]` Color camera focal length in pixels.

`colorfov [hardware dependent]` Color camera field of view in degrees as a list of three floats: horizontal, vertical, diagonal.

`depthfocal [hardware dependent]` Depth camera focal length in pixels.

`depthfov [hardware dependent]` Depth camera field of view in degrees as a list of three floats: horizontal, vertical, diagonal.

`depthintrinsics [hardware dependent]` Depth camera intrinsics as a list of seven floats defined at https://msdn.microsoft.com/en-us/library/microsoft.kinect.kinect.cameraintrinsics.aspx

`elevation [0]` Get the physical elevation angle in degrees of the Kinect relative to the horizon.

`floor [0. 0. 0. 0. 0. 0.]` List of 6 floats representing the floor clipping plane. Its values are affected by `@flip` and `@distmeter`. For compatibility with jit.openni, the first 3 describe the x, y, z coordinates for a point on the plane and the second 3 are the i, j, k of a vector normal to the plane. These same values are output with the floor OSC message. An example of usage is to send the x, y, z point coordinates to the `@position` attribute on a jit.anim.node and the i, j, k normal vector to the `@lookat` attribute on that same jit.anim.node.

Natively, the Kinect SDK describes the clipping plane as an equation. Given the floor output of 6 floats, you can derive the native Kinect SDK values as follows:

    Ax + By + Cz + D = 0
    A = i value of the normal vector; negate if `@flipx = 1` 
    B = j value of the normal vector 
    C = k value of the normal vector 
    D = -y value of the point on the plane; in meters or mm by `@distmeter`

`gravrot [off]` Enable or disable rotation of the Kinect relative to gravity to be sent out the OSC/skeleton output on every bang. The output is a message of 4 floats representing an angle of rotation in degrees around a vector (a, x, y, z). An example of usage is to set the `@rotate` attribute on a jit.anim.node to these values.

`hardware [unknown]` Identifies the model of Kinect hardware attached where 0=unknown, 1=Kinect for XBox, 2=Kinect for Windows, 3=Kinect v2 for Windows. This value is not always specific and may require the Kinect to be open and operating.

`idkinect [unknown]` Identifies the USB id for the specific Kinect associated with this specific dp.kinect2. This enables multiple Kinect v2's to be used on a single Windows computer once Microsoft supports multiple use. You can retrieve a list of possible USB ids by sending the message `getusbidlist` to dp.kinect2.

`imageuntwist [off]` Needed degrees of rotation to rotate (re-orient) the depth, color, and ir maps so that pixels at the top are away from gravity and pixels at the bottom are towards gravity. An example of usage is to set the `@theta` attribute of jit.rota to this value (converted to radians) and then send the color image matrix from dp.kinect2 to jit.rota. This message sent out the OSC/skeleton output on every bang

`verbose [off]` Enable or disable verbose error and warning messages to be output in the Max window to aid debugging.

### Visual #

`bodyprop [off]` Enables output of body properties: restricted, handstate, and lean. These properties provide information about the appearance or state of a tracked body and the confidence of that result. The results and confidence may vary. You may need to filter or smooth them. Note, `@flipx` does not affect the lean values.

    OSC below (max route friendly @skeletonformat=1 is also supported)
    --------------------------------------------------------------------    
    /restricted/id isrestricted confidence
    /handstate/id/left thehandstate confidence
    /handstate/id/right state confidence
    /lean/id lean_x lean_y confidence

* `id` is a long integer matching a tracked skeleton
* `isrestricted` is an integer (0=false, 1=true) representing if the body is restricted from a full range of motion
* `thehandstate` is a string representing one of the five [hand states](http://msdn.microsoft.com/en-us/library/dn799273#ID4EOC) of: unknown, nottracked, open, closed, lasso
* `lean_x` and `lean_y` are floats representing [left, right, forward, and backward leaning](http://msdn.microsoft.com/en-us/library/dn785526.aspx) of the body. The values range between -1.0 (left or back) and 1.0 (right or front) in both directions, where 1.0 roughly corresponds to 45 degrees of lean.
* `confidence` is a floating point number representing the confidence result. The value is [0.0, 0.5, 1.0] with 1.0 indicating the highest confidence  
* For example:  
  * `/restricted/2 1 1.0` skeleton 2 appears restricted from full motion and Kinect is very confident
  * `/handstate/2/left open 1.0` left hand on skeleton 2 appears to be open and Kinect is very confident
  * `/handstate/2/right lasso 0.5` right hand on skeleton 2 appears to be a lasso and Kinect is only somewhat confident
  * `/lean/2 0.2 0.3 1.0` skeleton 2 is leaning slightly right, slightly forward, and Kinect is very confident
  * `/lean/2 -0.5 0.0 0.5` skeleton 2 is leaning left and Kinect is only somewhat confident


`colortype [char]` Choice of number format to represent color components: char or float32. The Microsoft drivers for the Kinect provide char (i.e. 8-bit) values for color components. The float32 type is available for CPU efficiency not more Kinect color accuracy. This is due to dp.kinect2's efficient pixel processing; it can provide you the float32 values more efficiently than your patch converting later. The memory size of a float32 jitter matrix is 4x larger than char. The benefit of using float32 may be more apparent if you later process the color image with filters, shaders, OpenGL, etc.

`depthmap [off]` Choice of depthmap to be output on the 1st outlet where 0=off, 1=depth, and 2=depth+player indices.

`depthmapres [640x480]` Choice of resolution for the depthmap where 0=80x60, 1=320x240, and 2=640x480. Not all resolutions are supported given Kinect hardware capabilities.

`type [long]` choice of number format for depthmap matrix: long, float32, or float64.

`flooronbang [off]` Choice on/off to output the `@floor` attribute values via OSC/route outlet for every bang. More efficient than querying the attribute if you need the data on every bang.

`irtype [long]` Choice of the number format for the infrared (IR) matrix output. Available options are char, long, float32, or float64. Choosing char results in a loss of precision.

`irmap [off]` Choice on/off of infrared (IR) matrix data to be output on the 3rd outlet. Kinect v1 hardware does not have enough bandwidth to output color and IR data at the same time.

`irmapres [640x480]` Choice of resolution for the IR matrix where 0=80x60, 1=320x240, and 2=640x480. Not all resolutions are supported given Kinect hardware.

`playermap [off]` Choice on/off of playermap matrix data to be output on the 4th outlet. `@depthmap` must be 2=depth+indices to output this matrix.

`pointcloud [off]` Choice of pointcloud format to be output on the optional 5th outlet where 0=off, 1=XYZ, 2=XYZW.
* 0 = off: Pointcloud output is off by default. You must [enable the optional 5th outlet](Matrix-Based-Data#opengl-point-cloud-optional-outlet-5).
* 1 = XYZ: The real-world XYZ location of the voxel in meters as float32
* 2 = XYZW: The real-world XYZW location of the voxel in meters as float32. W is always 1.0. This format is sometimes useful when transforming the pointcloud with matrix math or OpenGL shaders.

`unique [off]` Choice on/off to limit output of depth, color, IR, or playermap matrices to be 0=always output on a bang or 1=only output when unique. Therefore, if you set this value to be on (1), it is possible for you to bang the object yet not have matrices output. This is **much** more efficient than using a jit.change object.

### Visual Adjustment #

`align [off]` Choice of alignment between the color image and the depthmap/IR/playermap/pointcloud where 0=none, 1=color to depth, 2=depth to color. There will be some slight artifacts around edges of objects because the two cameras (depth, color) on the Kinect can not occupy the same physical place; therefore they have slightly different views causing one camera to see pixels while the other camera can not see those same pixels.
* 1 = color to depth: This will align all data and downsample them to be the same as the depthmap resolution of 512x424
* 2 = depth to color: This will align all data and upsample them to be the same as the colormap HD resolution of 1920x1080

`depthonlyplayers [0 = off]` Filter matrix output to have values only for those people tracked. This attribute is a bitmap value `0 - 15` allowing any combination of the four matrix outputs to be filtered. In the table below, the `x` means the data of that column is filtered.

|    | depth | color | infrared | pointcloud |
| -: | :---: | :---: | :------: | :--------: |
|  **0** |   |   |   |   |
|  **1** | x |   |   |   |
|  **2** |   | x |   |   |
|  **3** | x | x |   |   |
|  **4** |   |   | x |   |
|  **5** | x |   | x |   |
|  **6** |   | x | x |   |
|  **7** | x | x | x |   |
|  **8** |   |   |   | x |
|  **9** | x |   |   | x |
| **10** |   | x |   | x |
| **11** | x | x |   | x |
| **12** |   |   | x | x |
| **13** | x |   | x | x |
| **14** |   | x | x | x |
| **15** | x | x | x | x |

`depthvis [50]` Filtering of colormap when downscaling with `@align 1` to remove double images along edges of objects. Double images are due to the depth and color cameras not being in the exact same location. Therefore, edges of seen objects are not identically seen by both cameras and often pixels are obstructed. This obstruction sometimes causes double images when not filtered by this feature or `@depthonlyplayers`. This filter defaults to a reasonable value of 50 (millimeters) to identify obstructed pixels and removes them in common situations. Set `@depthvis 0` for the original unfiltered behavior.

`distmeter [on]` Choice on/off for all distance measurements to be in 0=millimeters or 1=meters.

`flipx [off]` Choice on/off to enable flipping/negating the X axis values for all data output.

`irgamma [1.0]` A value from 0.0 to +max which applies a traditional gamma adjustment to the irmap values. This could be used to brighten dim areas of the infrared image without overexposing the entire image.

`orientformat [1 = quaternion absolute]` Choice of [skeleton joint orientation format/coordinates](Message-based-Data#skeleton-joints) where 0=quaternion in hierarchical coordinates, 1=quaternion in absolute coordinates, 2=4x4 rotation matrix in hierarchical coordinates, and 3=4x4 rotation matrix in absolute coordinates. You must set `@skeleton=2 (joints+orientation)` to receive the orientation data in your chosen format.

`posconfidence [0.5]` Sets the confidence filter for skeleton positions. The confidence of a skeleton position must be this value or higher. There are only three possible confidence values [0.0, 0.5, 1.0] from the Kinect hardware. Therefore, the default allows only values of normal and high confidence.

`position [0.0 0.0 0.0]` 3D origin of all Kinect data in the form: [x y z]. The attribute `translate` is deprecated and is only supported for backward compatibility.

`quat [0.0 0.0 0.0 1.0]` Rotation of all Kinect data as a quaternion in the form: [i j k w].

`rotate [0.0 0.0 0.0 1.0]` Angle of rotation (in degrees) and the xyz vector about which all Kinect data is rotated in the form: [angle x y z].

`rotatemethod [off]` Choice of rotation applied to all Kinect data based on the physical rotation of the Kinect. It can be 0=off, 1=simple elevation, or 2=gravity by multiple axes. This rotation is combined with rotations from jit.anim.node, @quat, @rotate, and @rotatexyz.

`rotatexyz [0.0 0.0 0.0]` Rotation of all Kinect data as the concatenation of rotations (in degrees) about the positive x, y, and z axes in the form: [xrot yrot zrot]. Also known as Euler angles. The order of rotation is y then z then x.

`scale [1.0 1.0 1.0]` 3D scaling factor of all Kinect data in the form: [x y z].

`smoothing [0.5 0.5 0.5 0.05 0.04]` Five floats representing your choice of smoothing for skeleton data. The default is tuned for gesture recognition in games (some smoothing, little latency, and only filters out small jitters). These values **may not** be best for your needs. Please [read the detail Microsoft provides](https://docs.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh855623(v=ieb.10)) which includes other suggested values for specific scenarios and the [whitepaper on data smoothing](https://docs.microsoft.com/en-us/previous-versions/windows/kinect-1.8/jj131429(v=ieb.10)).