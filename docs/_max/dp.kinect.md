---
title: dp.kinect
layout: max-product
nav_order: 1
compatible_hardware:
  - name: Microsoft Kinect v1 (XBox 360)
    slug: sensors/kinect-v1
---

### System requirements

* [Cycling74 Max requirements](https://cycling74.com/products/max)
* [Microsoft Kinect v1 requirements](https://learn.microsoft.com/en-us/previous-versions/windows/kinect-1.8/hh855359(v=ieb.10))
* Windows 8.1 or newer. Windows 7 is unsupported yet may work.

> ⚠️ Kinect v1 for Windows drivers are incompatible with Windows 10
> Memory Integrity. Workaround solution at <https://github.com/diablodale/dp.kinect/issues/54>.

### Setup

1. Install [Cycling'74 Max](https://cycling74.com/downloads/) version 6.1.9 or newer (64-bit or 32-bit)
2. Download {{ page.title }} from <https://hidale.com/shop/{{- page.title | slugify -}}/>
3. [Decompress](https://support.microsoft.com/en-us/help/14200/windows-compress-uncompress-zip-files)
   all the files in this download into an empty folder
4. Install [Microsoft Kinect v1 Runtime](https://www.microsoft.com/en-ca/download/details.aspx?id=40277)
   or [Microsoft Kinect v1 SDK](https://www.microsoft.com/en-us/download/details.aspx?id=40278).
5. Install [Microsoft Visual C++ Redistributable for VS 2012](https://www.microsoft.com/download/details.aspx?id=30679)
   for 64-bit and/or 32-bit architecture to match your installed Cycling'74 Max architecture(s).
6. Plug your Kinect sensor into a USB 2 or USB 3 port. Do not plug any other USB devices into the same USB
   controller because this Kinect model requires all the bandwidth of a USB controller.
7. [Register](#register) {{ page.title }}

#### Optional features

* Face tracking: Download [face tracking data](http://hidale.com/shop/dp-kinect/#download)
  and decompress all the files in this download into the same install folder
  as [step 3 of setup](#setup)
* Speech recognition: Install
  [Microsoft Speech Platform v11 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=27225). English-US is already installed. More languages are available with [Kinect for Windows 2.0 Language Packs](https://www.microsoft.com/en-us/download/details.aspx?id=43662).

### Register

1. Evaluate {{ page.title }} with a 14-day no-cost trial. When the plugin meets your needs,
   please visit <https://hidale.com/shop/{{- page.title | slugify -}}/>
   to purchase a license from the store.
2. Open the help file or patch included within the {{ page.title }} download.
3. Optional: Start a 14-day no-cost trial by using both the registration name "trial"
   during step 4, and registration key `<your install folder>/trial.dpreg` during step 5.
4. Type your registration name in the field beside the `register` button. You
   received your registration name in an email from the online store.
   🧐 Your registration name is usually _not your email address_.
5. Click the register button and use the dialog box that appears to select
   your {{ page.title }} registration key (.dpreg file)
6. You should see a successful registration. If not, please look at the Max console
   for any warnings or errors.

![dp.kinect registration]({{- site.baseurl -}}/assets/max/setup/dp.kinect-register-old.png)

### Dumpout messages

Some messages are automatically generated and output simultaneously from the dumpout
outlets of all dp.kinect instances in Max.

`newkinect`
: New Kinect sensor was plugged into the computer. It will be followed by two symbols.
  The first symbol is the USB ID for the new Kinect plugged in. The second symbol is
  pseudo-unique for the Kinect and should be *ignored*. This is an example
  message received after a Kinect was plugged into a computer:  
  `newkinect USB\VID_0409&PID_005A\5&332C30EE&0&1`

`lostkinect`
: Kinect sensor was unplugged, lost, or unable to fully initialize. It will be followed by a
  symbol representing the USB ID for the Kinect in question. You will often have an error message
  in your Max window providing further details. This is an example message received after
  a Kinect was unplugged from a computer:  
  `lostkinect USB\VID_0409&PID_005A\5&332C30EE&0&2`

### Collective/app  {#collective}

You can create standalone applications and collectives with dp.kinect.
In the Build Collective/Application dialog, click "Include file..." and choose the
`dp.kinectsupport_xx.dll` for your 32 or 64-bit application. When using face features,
you will need to additionally include the matching `FaceTrackData.dll`.
When you create a standalone application, it may be possible to copy these two files
into the support subfolder instead of including them with the Build dialog box.

Please remember that your license for {{ page.title }} is only for one computer. You or your customers need
<a href="https://hidale.com/shop/{{- page.title | slugify -}}/">additional licenses</a> for each computer
on which your standalone or collective runs.

### Compatibility

dp.kinect output is almost compatible with jit.openni yet faster, more stable, and more accurate.

* Joint orientation data is different than jit.openni
* jit.openni attributes often have new dp.kinect attribute names

> ⚠️ Installing both the official Microsoft Kinect v1 Runtime/SDK and the SensorKinect driver
> for OpenNI v1.x is not supported at the same time.

### Known issues

* [Kinect v1](../_hardware/sensors/kinect-v1.md) hardware does not support simultaneous
  color and IR streams; the hardware is bandwidth limited
* 3D coordinates for face tracking are not rotated by gravity or elevation of the Kinect.
* When you create a dp.kinect object in Max and receive an error message similar to
  "Missing the Microsoft Visual C++ 2012 Runtime", then download and install
  [Microsoft Visual C++ Redistributable for VS 2012](https://www.microsoft.com/download/details.aspx?id=30679)
  for 64-bit and/or 32-bit architecture to match your installed Cycling'74 Max architecture(s).
