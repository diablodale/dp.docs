
### Face Tracking #

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


