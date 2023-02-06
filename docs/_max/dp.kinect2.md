---
title: dp.kinect2
layout: max-product
nav_order: 2
compatible_hardware:
  - name: Microsoft Kinect v2 (XBox One)
    slug: sensors/kinect-v2
---

### System Requirements

* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Microsoft Kinect v2 requirements](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn782036(v=ieb.10)#recommended-hardware-configuration) can be verified with their
  [configuration verifier](https://learn.microsoft.com/en-us/windows/apps/design/devices/kinect-for-windows#kinect-configuration-verifier)
* Windows 8.1 or newer (64-bit)

### Setup

1. Install [Cycling'74 Max](https://cycling74.com/downloads/) version 6.1.9 or newer (64-bit or 32-bit)
2. Download {{ page.title }} from <https://hidale.com/shop/{{- page.title | slugify -}}/>
3. [Decompress](https://support.microsoft.com/en-us/help/14200/windows-compress-uncompress-zip-files)
   this download and move the whole {{ page.title }} folder into your `Packages` folder.
   The default Max `Packages` folders are
   * Max 6: `home-folder/Max/Packages`
   * Max 7: `home-folder/Max 7/Packages`
   * Max 8: `home-folder/Max 8/Packages`
4. Install [Microsoft Kinect v2 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=44559).
5. Install [Microsoft Visual C++ Redistributable for VS 2015](https://learn.microsoft.com/en-US/cpp/windows/latest-supported-vc-redist?view=msvc-160)
   for [64-bit](https://aka.ms/vs/17/release/vc_redist.x64.exe) and/or [32-bit](https://aka.ms/vs/17/release/vc_redist.x86.exe)
   architecture to match your installed Cycling'74 Max architecture(s).
6. Plug your Kinect sensor into a USB 3.0 port. Do not plug any other USB devices into the same USB 3.0
   controller because this Kinect model requires all the bandwidth of a USB 3.0 controller.
7. [Register](#register) {{ page.title }}

### Optional setup

These optional features need additional setup.

* Face tracking: Download the [face tracking model](http://hidale.com/shop/dp-kinect2/#download)
  and follow the instructions found in your folder `Packages\{{ page.title }}\support`.
* Speech recognition: Install
  [Microsoft Speech Platform v11 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=27225). English-US is already installed. More languages are available with [Kinect for Windows 2.0 Language Packs](https://www.microsoft.com/en-us/download/details.aspx?id=43662).

{% include plugin-setup-register.md %}

### Compatibility with dp.kinect

dp.kinect2 is very compatible with [dp.kinect](dp.kinect.md). There are some known differences.

* Kinect v2 matrices are fixed sizes. Changes to resolution attributes are ignored. Resize or crop with
  [jit.matrix](https://docs.cycling74.com/max7/refpages/jit.matrix) or other matrix operators if you need
  the same sizes as dp.kinect. Kinect v2 fixed sizes are:
  * `512x424`: depthmap, infrared, playermap, pointcloud
  * `1920x1080`: color
* When the infrared (IR) output is set to the long type with [`@irtype 1`](attributes/irtype.md), these values
  will range from `[0..65535]`. This is different than the `[0..1023]` range of dp.kinect. This wider range is
  due to the increased precision of the Kinect v2 sensor. If you must have the original `[0..1023]` range, use
  [jit.op](https://docs.cycling74.com/max7/refpages/jit.op), [jit.expr](https://docs.cycling74.com/max7/refpages/jit.expr),
  or other matrix operators to scale the values in the matrix output. Please note, even though
  the Kinect v2 has more precision, the overall IR data is still degraded. See the [IR degraded issue](#known-issues).
* The face tracking pose `scale` value is always `1.0` _until_ you enable [`@facesuau 1`](attributes/facesuau.md)
  or [`@face3dmodel`](attributes/face3dmodel.md). When either is enabled, the `scale` value will be updated.
* The face tracking pose `translation` coordinate values is always the same as the head skeleton joint _until_
  you enable [`@facesuau`](attributes/facesuau.md) or [`@face3dmodel`](attributes/face3dmodel.md). When either is enabled,
  the `translation` coordinate will be further refined to be a more exact head pivot point to use with 3D face modeling.
* Face 2D points compatible with both [dp.kinect](dp.kinect.md) and dp.kinect2 are [`@face2dpoints 2`](attributes/face2dpoints.md).
  This provides [five basic 2D points](https://learn.microsoft.com/en-us/previous-versions/windows/kinect/dn791598(v=ieb.10)):
  left eye, right eye, nose, left mouth corner, and right mouth corner.
* Face animation units (AU) on dp.kinect2 are different than [dp.kinect](dp.kinect.md).
  Only [`@facesuau 2`](attributes/facesuau.md) is supported.
* The [`@soundinfo`](attributes/soundinfo.md) attribute is only updated when dp.kinect2 is banged. This is different
  than [dp.kinect](dp.kinect.md) which constantly updated the attribute.
* The `@sync` attribute is not available in dp.kinect2 since all frames are synchronized by Microsoft.
  See the [synchronization issue](#known-issues).
* Microsoft does not support control of the IR emitter, color camera processing, or audio processing. Therefore,
  the following parameters are not present on dp.kinect2:
  `iremitter, autoexposure, autowhitebalance, backlight, brightness, contrast, exposure, frameinterval, gain, gamma, hue, powerfreq, saturation, sharpness, whitebalance, autogain, echocancel`.
* Kinect v2 sensor works in all seated, near, and far situations while also having a 0.5-8.0 meter range. Therefore,
  these parameters are not available on dp.kinect2: `@seated, @nearmode, @depthrange`.
* Kinect v2 does not have a tilt motor within itself. Therefore, the [`@elevation`](attributes/elevation.md) attribute
  only outputs the basic elevation relative to the horizon.
* The following esoteric parameters are not available on dp.kinect2: `@gravsmooth`, `@facerate`, and `@sensorrate`.
* The dumpout messages `newkinect` and `lostkinect` are not implemented. Microsoft's API and drivers are not reliable
  for detecting plugged/unplugged sensors.

### Known Issues

* Microsoft has isolated a performance problem that might occur with the Kinect v2 on Intel CPUs. Microsoft believes
  it is isolated to Kinect software that uses eventing to get Kinect data. dp.kinect2 ***does not*** use eventing
  to process core Kinect data. Therefore, _I do not think dp.kinect2 is affected_. I asked Microsoft for more
  information but have not received any to date. Microsoft does provide a workaround in this [forum post](https://social.msdn.microsoft.com/Forums/en-US/7a9f139d-85fe-4e68-9ad2-5456f8e1f173/kinect-v2-disconnects-and-reconnects-on-recent-intel-chips-solution?forum=kinectv2sdk).
* With stress testing using a repeating Kinect Studio clip, a bug in the Microsoft Kinect v2 runtime was
  found when HD face tracking features are used. A private thread in their runtime accesses memory which is
  unavailable causing a crash in the runtime. The issue was escalated to Microsoft and they reproduced it. They have
  no fix. It is possible that the crash will not be seen in real-world usage. I recommend solid testing of any
  solutions that use HD face tracking to ensure stability.
* All frames are synced by the Microsoft drivers. Out of sync or delayed frames are likely due to Microsoft limitations.
  Microsoft made a design decision to keep frames in sync even if it must drop the framerate to 15fps for the color
  camera to have enough light and therefore penalize the depth/body/ir/other frames. There is no workaround
  and therefore the `@sync` parameter is not available on dp.kinect2.
* Microsoft has intentionally degraded the IR data. Intense IR regions do not linearly increase in v2 Runtime builds 1407
  and higher _including the final release_. The newer builds oversaturate, use half the intensity bit range, and the
  data is poor. A bug has been logged with Microsoft in [private forum](http://social.msdn.microsoft.com/Forums/en-US/b2417c26-d2da-4286-9580-2a587aae816f/ir-frames-significantly-degraded-bad-values-in-previews-1407-and-1408?forum=k4wv2devpreview)
  and [public forum](https://social.msdn.microsoft.com/Forums/en-US/64aad451-2339-49bf-8c18-fe31b63da97f/ir-data-degraded-only-12-values-in-possible-range-being-utilized-leading-to-poor-image?forum=kinectv2sdk).
  Microsoft acknowledges this is their issue and they will *not fix* it. The problem does not exist in 1406
  or earlier releases of the Kinect v2 Runtime. There is no workaround.
* Microsoft's driver for the Kinect v2 does not dependably report the existence or absence of a Kinect. This is a
  known Microsoft issue reported in the [private forum](http://social.msdn.microsoft.com/Forums/en-US/fe7d68b3-7051-478f-a4c8-6c4605d42c9e/how-to-determine-whether-k4w2-is-connected?forum=k4wv2devpreview)
  and [public forum](https://social.msdn.microsoft.com/Forums/en-US/9bd79fb6-39de-44d0-8cb9-166d513fe2bc/ikinectsensor-getisavailable-method-fails?forum=kinectv2sdk).
  Therefore, you can `open` a Kinect even when one isn't plugged in. Or the driver might report there is no
  Kinect even though there is one plugged in. The result is sometimes the "open" will fail. Or you will get a
  successful open yet get repeatedly the last known data (which could be zeros). Set [`@unique 1`](attributes/unique.md)
  to prevent this errant data.

### Standalone Applications and Collectives {#standalone}

Standalone applications can be created with dp.kinect2. All standard features of dp.kinect2 will work.
If you use the optional face features, you will need to copy the `Kinect20.Face.xxx.dll` and the `NuiDatabase`
folder into the support subfolder of your application.

Collectives can also be created and all standard features will work. Max 6 and Max 7 have a limitation;
the optional files needed for face tracking can not be directly included within the collective file.
I have created a workaround in the plugin codebase. It requires you copy the `Kinect20.Face.xxx.dll`
and the `NuiDatabase` folder into the same folder as the collective.

Please remember that your license for dp.kinect2 is only for one computer. You or your customers need
<a href="https://hidale.com/shop/{{- page.title | slugify -}}/">additional licenses</a> for each computer
on which your standalone or collective runs.
