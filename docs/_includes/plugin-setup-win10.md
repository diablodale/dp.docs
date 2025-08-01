#### Windows 10 support  {#win10}

We recommended Windows 11. Windows 10 19H1 (version 1903) or newer
is possible, but may include an outdated DirectML, causing Max console warnings.
If you see these warnings and need GPU support for machine learning
or skeleton tracking, move `DirectML.dll` from the plugin's `optional` folder
into the same folder as `onnxruntime.dll`. Restart Max.
