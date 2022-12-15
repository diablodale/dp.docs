---
products:
  - dp.kinect3
  - dp.oak
categories:
  - physical
usage:
  signature: "{0 | 1}"
  default: "0"
  examples:
    - "@timestamp 0"
    - "@timestamp 1"
---

Timestamps for skeleton and matrix data as microseconds
since the [Epoch](https://en.wikipedia.org/wiki/Unix_time).

Jitter matrix outlets (depth, color, ir, player, and optional pointcloud) will
append the timestamp to the end of the standard `jit_matrix` message.

```
jit_matrix u391000480                   <-- standard matrix message
jit_matrix u391000480 1616264945444860  <-- same with timestamp
```

Message/OSC data is also timestamped. A `timestamp` message sent on the
msg/osc outlet starts a timestamp block. All data after this timestamp message and
before the next timestamp message have the same timestamp.

```
timestamp 1616264778766184
user 1 0.092804 -0.510639 0.794896
skel 1 waist 0.092804 -0.510639 0.794896 1.
skel 1 torso 0.113126 -0.20709 0.847535 1.
```

It is possible to coordinate matrices and skeleton data across multiple
Kinect sensors on the same computer using these timestamps. If you have
*very accurate* NTP or PTP time synchronization on your local network,
it is also possible to coordinate data across multiple computers.
