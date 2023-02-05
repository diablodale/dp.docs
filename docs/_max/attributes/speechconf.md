---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - audio
usage:
  signature: "INT"
  values:
    "0": "no filter"
    "1": "normal (default)"
    "2": "high"
  examples:
    - "@speechconf 0"
---

Filter speech based on recognition confidence. Speech with the
chosen confidence level and above will be output. For example,
the normal filter will output speech it recognized as having
normal or high confidence.
