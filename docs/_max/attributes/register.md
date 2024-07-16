---
products:
  - dp.kinect
  - dp.kinect2
  - dp.kinect3
  - dp.oak
tags:
  - registration
usage:
  signature: "REGISTRATION_NAME [DPREG_FILE]"
  values:
    "0": no license (default)
    "1": license registered
  examples:
    - "register Continuousname"
    - "register \"Firstname Lastname\""
    - "register \"Firstname Lastname\" dp.kinect2-1234.dpreg"
---

Register a license or get the status of registration.

Use [`unregister`](../methods/unregister.md) to unregister and remove a license.

## Register license {#register-license}

A license must be registered to use all features of a plugin.
Two items are needed to register a license.
These two items are provided when a license is purchased.

* `Registration name` is a string (a series of characters). This may
  be related to the name of the purchaser provided in the
  purchase order.
* `Registration key` is a file containing part of a license.

Follow the setup and registration instructions for your plugin.
A visual interface is provided to make registration easy.
The instructions are within this same documentation and in
the emails you receive with your purchase.

## Register license with message {#register-message}

Registration can also be done manually with messages.

* Send the `register` message with your registration name.
  A visual UI will appear to select your registration key file.
* Send the `register` message with your registration name
  and registration key filename.

A message for success `register 1` or failure `register 0` is reported at dumpout.

```python
# send registration name to first inlet of plugin
register RegistrationName

# send registration name and registration key filename to first inlet of plugin
register RegistrationName filename.dpreg

######## examples ########
# registration name is single word with no spaces
register ABCStore

# registration name is two words; name needs quotes
register "Jane Doe"

# registration name is two words, filename is simple; name needs quotes
register "Jane Doe" dp.kinect2-1234.dpreg

# registration name is two words and filepath has spaces; both need quotes
register "Jane Doe" "/projects/my project/dp.kinect2-1234.dpreg"
```

## Register status {#register-status}

The status of registration is always reported to the Max console.
It appears when the plugin is first loaded and after any
registration activity.

The status of license registration is also available using standard
Max approaches. The status of the `register` attribute can be viewed using
the Max Inspector, a Max [attrui](https://docs.cycling74.com/max7/refpages/attrui),
or sending `getregister` to the first inlet of the plugin to receive
a message for success `register 1` or failure `register 0` at dumpout.

> 📝 [`dp.kinect`](../dp.kinect.md) does not support getting the value
> of the `register` attribute.
