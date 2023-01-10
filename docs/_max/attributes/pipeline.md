---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "PIPELINE_STRING"
  values:
    "async": "multi-threaded processing; no wait on sensor (default)"
    "sequent": "sequential processing; wait and timeout sensor"
  examples:
    - "@pipeline sequent"
---

Sensor data transforms and output can be multi-threaded and triggered
with different methods. Most considerations are related to time and clocks.
Sensor hardware and host computers do not share clocks and do not perfectly
run their clocks at the same rate. This leads to timing mismatches and variations.

Often host computer programs use 33 milliseconds as a wait time when they
use a 30 Hz sensor. A Max patch might have a `(qmetro 33)`. However, 33ms is
not 30 Hz. Instead, 1 second / 30 =
33.<span style="text-decoration:overline">3</span> milliseconds. However, it must be
adjusted for the delay due to data processing. If it takes 5ms to process data then
the wait should be:
33.<span style="text-decoration:overline">3</span> - 5 =
28.<span style="text-decoration:overline">3</span> milliseconds.

A more accurate Max patch clock for a 30 Hz sensor while ignoring processing
time is `(qmetro 30 hz)`.

There are infinite examples that demonstrate data loss or old data.
This example uses the poor 33ms wait for a 30 Hz sensor. Keep in mind that
in addition to the poor simulation, the sensor and host clocks are constantly
varying their clock rates at very small yet measurable amounts.
All of these factors result in data loss or old data.

1. Host computer samples the sensor and finds no new data
2. 1 picosecond later, the sensor has new data "alpha"
3. Host computer waits 33ms (poor estimate of 30 Hz frame rate)
4. 1 picosecond before 33ms, the sensor has new data "beta"
5. Host computer samples the sensor and gets new data "beta"
6. What happens to 33ms old data "alpha"? :thinking:
7. Host computer waits 33ms
8. Host computer samples the sensor and finds no new data :no_entry_sign:
9. 1 picosecond later, the sensor has new data "gamma"

## async

`async` creates output using multiple threads in parallel.
Output is the most current data with synchronized incrementing timestamps.

1. `bang` is the trigger
2. Get raw data from the sensor and queue it for post-process transforms
  * :twisted_rightwards_arrows: Multiple threads in parallel transform raw
    data into visual frames, skeleton tracking, etc. and queue their results
3. Output the most current data from the queue to Max on each outlet

The newest sensor data at the highest frame rate is available when the plugin
is triggered at the [Nyquist rate](https://en.wikipedia.org/wiki/Nyquist_rate).
Trigger the plugin at twice the sensor's raw data capability. For example,
if the sensor hardware outputs raw data at 30 Hz, then the plugin should be
triggered with a `bang` at 60 Hz using a clock like `(qmetro 60 hz)`

## sequent

`sequent` creates output using one thread in sequence.
Output is from the raw data gotten from the sensor with that raw data's timestamp.
This is the behavior for plugins before version v1.3.20210105 including
[dp.kinect](/max/dp.kinect/) and [dp.kinect2](/max/dp.kinect2/).

1. `bang` is the trigger
2. Get raw data from the sensor
3. Transform step 2 raw data into visual frames, skeleton tracking, etc.
4. Output step 3 results to Max on each outlet
