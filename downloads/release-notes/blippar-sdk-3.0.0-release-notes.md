# Blippar SDK 3.0.0 Release notes

This release is a major release with the addition of tighter app <-> blipp communication, streaming video, face tracking and native AR (ARCore/ARKit) integration.

## **Major Changes**

* App to Blipp and Blipp to App communication added (see [Communicating with the blipp](../../guides/customisation/communicating-with-the-blipp.md) for more).
* Streamed video to a texture.
* Added support for native AR via marker-based SLAM.
* Added new APIs to the camera classes to receive the camera frame on the app side (see [Camera](../../guides/camera.md) document for more).
* Added APIs to clear the blipp and sideload cache.
* Removed Facebook, Twitter & Instagram targeted sharing from the SDK and BlippJS APIs as it is no longer supported by iOS. Default prefill text (when none is specified by a developer), is now only set when `shareBlipp` is called. This is so Instagram can be targeted, which does not appear if there is any text being shared.
* New documentation portal created.

### Android

* Gradle 3 support has been added.
* Camera permissions are acquired on behalf of the app if it doesn't request them up front.
* Various dependencies have been upgraded, see the [Android integration](../../guides/android/README.md) guide for more detail.
* Added API annotations thoughtout the SDK for Kotlin support.
* ARCore support added.
* Converted BlippStateListener, ShareHandler and BlippFunctionHandler to Kotlin and made functions optional. This means that in Kotlin a user does not need to implement the entire interface.

### iOS

* iOS 10 is the new minimum supported OS.
* ARKit support added.
* Added annotations to SDK functions.

## **Breaking API changes**

### iOS

None

### Android

* `onBlippEvent` has been added to the `BlippStateListener`. This breaks all existing users of this interface until it is added.
* Renamed `type()` to `getType()` in `EntityDescriptor`

## **Bugfixes**

### Common

* Fixed an issue where another marker could be detected by the camera when a blipp is being launched programatically, even if detection is off.

### Android

* Fixed an issue where a blipp launched with 'OnTracking' could launch without tracking.
* Fixed distorted camera on certain devices (e.g. Huawei P20 Pro), this was caused by 400x400 camera size erroneously being chosen.
* Fixed hang on backgrounding and foregrounding seen on some Oreo devices.
* Fixed a NPE caused by status bar refreshing on startup.
* Fixed a crash caused by a race condition on startup due to the audio system initialisation failing.
* Fixed crash on closing scenes only on some larger blipps caused by resource deallocation.
* Hotspots debug option not persisted between runs of the SDK.
* Fixed scenario where DebugView wasn't updating if the SDK is already initialised when it is added to the view.

### iOS

* Fixed an issue where a blipp launched with 'OnTracking' could launch without tracking
* Fixed crash when 'landscape' orientation was picked for a photo share.
* Fixed issue where user was not able to interact with HTML overlay in the region of the share bar when it is hidden.
* Fixed safe area issues for iPhone X and newer devices with notches.
* Fixed a retain cycle issue that caused overlay HTML reference to be retained between presents of the BlipparSDKViewController.
* Fixed BlipparSDKDelegate being a strong reference, causing memory issues or other unforeseen problems.

## **Known Issues**

### Android

* Javadoc documentation is currently not being generated for Kotlin converted classes such as `BlippStateListener`, `ShareHandler` and a few others.

## **Api Reference**

[iOS Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/ios/3.0.0)

[Android Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/android/3.0.0)

## **Release Date**

October 2018

## **Blipp JS Maximum Library Supported**

1.9.x