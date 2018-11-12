# Native AR Prerequisites

## BlipparSDK and JS

* BlipparSDK version `3.0.0` or newer
* BlippBuilder Script version `1.9.1` or newer

## iOS - ARKit

* A9+ family of processors, this equates to **iPhone 6S and newer**.
* Embedded in the operating system, as of **iOS 11**.

### Known Limitations

* Between backgrounding and foregrounding the ARKit tracking can totally lose its bearings. It is recommended a blipp handles this and asks a user to re-track the marker
* Camera cannot be stopped, or flipped to the front camera when active.
* The torch controls do not work when active.
* No dynamic focussing (as per ARKit 1.0, this is supported in ARKit 1.5)

## Android - ARCore

* **API 24** and upwards, that's Android Nougat or later.
* **ARM-based devices only**, x86_64 and x86 based devices do not work (see [Issue #212](https://github.com/google-ar/arcore-android-sdk/issues/212) and [Issue #333](https://github.com/google-ar/arcore-android-sdk/issues/333))
* ARCore is only available on **select devices** (see Supported Devices [here](https://developers.google.com/ar/discover/supported-devices))
* **NOT** embedded in the operating system. Requires ARCore installed on the device. The SDK will ask the user to install the ARCore SDK from the Google Play Store if it is not already installed.

### Known limitations (as of ARCore 1.4.0)

* There are many reasons why ARCore can fail to run (or be supported): ARCore is not installed, ARCore is out of date, device not compatible, APK is too old (for sideloading ARCore) or Android OS version not supported
* Camera cannot be stopped, or flipped to the front camera when active.
* The torch controls do not work when active.
* Going to the background and foreground again causes ARCore tracking to be badly lost. It will most likely be required to re-acquire tracking when this happens.

### Initialisation

ARCore is not embedded in the operating system, it is a downloadable app from the Google Play Store. Therefore, any AR experience that requires ARCore needs to check if the ARCore app is installed or not. If it is not installed the SDK can initiate an install of ARCore from the store to the device. This of course, can fail in many ways, it's declined, the device isn't compatible, the OS isn't compatible, network failure etc. The SDK captures these errors and reports them back to the blipp so it can handle them appropriately.

Even though ARKit is embedded in the operating system on iOS it can still fail to initialise, if the device is not supported for example.