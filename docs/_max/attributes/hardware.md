---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "{ HARDWARE_INT | HARDWARE_STRING }"
  values:
    "auto": automatically detect hardware (default)
    "0": unknown
    "1": Kinect for XBox 360 (gen 1)
    "2": Kinect for Windows (gen 1)
    "3": Kinect for XBox One and Windows (gen 2)
    "kinect-gen3-azure-dk": Azure Kinect DK
    "oak-&lt;id>": Luxonis OAK; &lt;id> is sensor model
  examples:
    - "@hardware 3                     <- configured for Kinect gen 2"
    - "@hardware kinect-gen3-azure-dk  <- configured for Azure Kinect DK"
    - "@hardware oak-d-lite            <- configured for OAK-D Lite"
---

Identify/select sensor hardware model. It is read-only on some plugins.
Automatically detecting the hardware may require the sensor to be open
and processing data.

Opening the sensor with the plugin may fail when the plugin `@hardware`
selected does not match the actual sensor hardware. If that occurs, correct
the `@hardware` choice and open again.
