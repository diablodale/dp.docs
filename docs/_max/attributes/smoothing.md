---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - visual adjustment
usage:
  signature: "SMOOTH_FLOAT1 [SMOOTH_FLOAT2 SMOOTH_FLOAT3 SMOOTH_FLOAT4 SMOOTH_FLOAT5]"
  values: sensor specific default
  examples:
    - "@smoothing 0.5 0.1 0.5 0.1 0.1"
    - "@smoothing 0.1"
---

Smoothing for skeleton joint values with either a simplified one parameter factor or
five parameter Holt double-exponential filter.

* 1-parameter: simplified temporal smoothing factor where 0.0 is no smoothing
  and 1.0 is extreme smoothing. Less smoothing will decrease the lag of joints
  yet cause more position and orientation jitters.
* 5-parameter: smoothing based on a Holt double-exponential filter with the five
  [Holt parameters](#holt) of smoothing, correction, prediction, jitter-reduction
  radius, and max-deviation radius

## Holt double-exponential parameters {#holt}

When a plugin uses Holt, the default smoothing parameters are tuned for gesture recognition.
These default values **may not** be best for your needs.

smoothing
: Range is [0.0..1.0] and the default value is 0.5. A higher value corresponds
to more smoothing; passing 0 causes the raw data to be returned. As the smoothing value is increased,
responsiveness to the raw data decreases; therefore, increased smoothing leads to increased latency.

correction
: Range is [0.0..1.0] and the default value is 0.5. A higher value corrects toward
the raw data more quickly. Too high a value can make values "springy". A lower value
corrects more slowly and appears smoother.

prediction
: Range is [0.0..inf] and the default value is 0.5 frames. This is the number of frames
to predict into the future. A value greater than 0.5 will likely lead to overshoot when the
data changes quickly; dampen the overshoot effect by using a smaller value of max-deviation radius.

jitter-reduction radius
: Range is [0.0001..inf] and the default value is 0.05 meters. This is the radius (meters)
that defines a jitter value and therefore how that value is smoothed. Values outside this
radius are considered new positions and smoothed differently.

max-deviation radius
: Range is [0.0..inf] and the default value is 0.04 meters. It is the maximum radius (meters)
that a filtered position can deviate from raw data. A filtered value that exceeds this radius is
clamped at the maximum radius in the direction of the filtered value. Too high a value can
snap back to noisy data.

### Parameter suggestions

Microsoft's documentation and [smoothing whitepaper](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/jj131429(v=ieb.10))
provide three parameter set suggestions

* `0.5 0.5 0.5 0.05 0.04` some smoothing with little latency; only filters out small jitters,
  good for gesture recognition (this is the default)
* `0.5 0.1 0.5 0.1 0.1` smoothed with some latency; filters out medium jitters, good for a
  menu system that needs to be smooth but doesn't need the reduced latency as much as gesture
  recognition
* `0.7 0.3 1.0 1.0 1.0` very smooth and much latency; filters out large jitters, good
  for situations where smooth data is absolutely required and latency is not an issue
