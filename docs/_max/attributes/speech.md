---
products:
  - dp.kinect
  - dp.kinect2
categories:
  - audio
usage:
  signature: "INT"
  values:
    "0": "off (default)"
    "1": "recognition"
    "2": "recognition and interference"
  examples:
    - "@speech 1"
---

Speech recognition and speech interference output on the fifth outlet.
It is optimized for command-response usage. It does not support dictation.
The sensor's microphone array allows localizing the speaker and hearing
them without wearing a headset.

The speech recognition grammar (the words to recognize) are defined in a
[GRXML file](http://msdn.microsoft.com/en-us/library/hh361658%28v=office.14%29.aspx)
as defined by the [W3C standards](http://www.w3.org/TR/speech-grammar/).
The speech recognition does support multiple simultaneous languages.
US English is installed with the official drivers.
[Additional language packs](http://go.microsoft.com/fwlink/?LinkID=248679) are available.

```sh
# @skeletonformat 0
/speech/recognize/ruleid tag conf srconf heardwords
/speech/error/interfere problem

# @skeletonformat 1
speech recognize ruleid tag conf srconf heardwords 
speech error interfere problem
```

* `ruleid` is the value of the id attribute on the \<rule\> tag within the GRXML file
* `tag` is the text between the \<tag\> tags within the GRXML file
* `conf` is a floating point number [0.0, 0.5, 1.0] representing the increasing confidence
  in recognition. This confidence is used for filtering via the
  [`@speechconf`](speechconf.md) attribute.
* `srconf` is a floating point number inclusively [0.0 - 1.0] and specific to the sensor
  recognition technology. It can be used for more detailed confidence information.
* `heardwords` is a single symbol containing the entire phrase recognized and matched
  to a `tag`. If you defined an \<item\> in your GRXML file which contained several words
  in a single phrase to be recognized, then `heardwords` will be a single symbol containing
  all of those defined words separated by a space character.
* `problem` is a single symbol representing the interference to speech recognition. These
  error messages are optional and only enabled when `@speech 2`.

The possible symbol values for interference problems are:

* `noise` The sound received is interpreted by the speech recognition engine as noise.
* `nosignal` A sound is received but it is of a constant intensity. This also includes
  the microphone being unplugged or muted.
* `tooloud` A sound is received but the intensity is too high for recognition. If you
  receive many of these events, it could be due to a known issue with the sensors's
  default audio gain settings. Try enabling the [`@autogain`](autogain.md) attribute.
  Or, for more explicit fine-tuned control, open the Windows Control Panel and select
  Sound, then the Recording tab. Select your sensor (e.g. Kinect Microphone Array) and
  then press the Properties button. Select the Levels tab. Set the Microphone Array
  gain level to a lower value. Press OK and then OK.
* `tooquiet` A sound is received but the intensity is too low for recognition.
* `toofast` The words are spoken too quickly for recognition.
* `tooslow` The words are spoken too slowly and indicates excessive time between words.
