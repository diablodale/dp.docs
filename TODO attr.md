dp.kinect2 supports a normal compliment of Max attributes plus the following. They are grouped here in the same way they are visibly grouped in the Max inspector. Defaults are within brackets [] after the attribute name below, for example: `myattributename [off]`


### Face Tracking #
Below are the attributes related to face tracking. Please also reference the [face tracking message output](https://github.com/diablodale/dp.kinect2/wiki/Message-based-Data#face-tracking) to understand more details on the output.

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
