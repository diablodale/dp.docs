---
products:
  - dp.kinect
  - dp.kinect2
tags:
  - audio
usage:
  signature: "path"
  examples:
    - '@grammarfile "c:\mypatch\mygrammar.grxml"'
---

Path to the speech recognition grammar file. It is a
[GRXML](http://msdn.microsoft.com/en-us/library/hh361658%28v=office.14%29.aspx)
file as defined by the [W3C standards](http://www.w3.org/TR/speech-grammar/).
The recognition engine is tuned for command/response type grammars and does not
support real-time dictation.
