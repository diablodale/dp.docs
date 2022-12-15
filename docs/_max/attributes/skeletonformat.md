---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - visual adjustment
usage:
  signature: "{0 | 1}"
  default: "0 = OSC"
  examples:
    - "@skeletonformat 1  <-- choose the native Max format"
---
Message format output from the fifth outlet (skeletons, users, etc.)

* 0 = OSC protocol  
  Can be manipulated with OSC tools like
  [CNMAT's OSC-route](http://cnmat.berkeley.edu/downloads/externals/overview).
  May be helpful when sending raw sensor data to heterogeneous network devices.
* 1 = native Max messages  
  Can be manipulated with all built-in Max, MSP, Jitter objects like route,
  routepass, and select. Usually the better choice when transforming sensor
  data within Cycling74 Max.
