dp.kinect2 supports a normal compliment of Max attributes plus the following. They are grouped here in the same way they are visibly grouped in the Max inspector. Defaults are within brackets [] after the attribute name below, for example: `myattributename [off]`


### Face Tracking #
Below are the attributes related to face tracking. Please also reference the [face tracking message output](https://github.com/diablodale/dp.kinect2/wiki/Message-based-Data#face-tracking) to understand more details on the output.

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
