# Blippar SDK 2.1.0 Release notes

## **Major Changes**

* While keeping the current API as backward compatible as possible, we have introduced several new API calls and we have optimised several existing API calls. In general, no code changes are required to replace the existing Blippar SDK with a new one, however as some advanced features were updated, some clients will have to perform minor updates in their code.
   1. The `startDetection` calls have now been simplified, you can stop detection using `stopDetection` as before. The detection still starts automatically when provided SDK view controller/fragment is initialised.
   2. on iOS all localisable strings extracted in a separate dictionary `localizedStrings`, these can be customised if required. On Android, it is possible to overwrite the strings from the AAR in your strings.xml file.
   3. `onRequestToLoadBlipp` callback introduced to capture the event when one blipp is trying to launch another blipp.
   4. `onRequestToStartDetection` callback introduced to capture the event when the blipp context has requested to start detection.
   5. `BlipparAlert` callbacks with methods `showErrorAlert` and `showFatalErrorAlert` introduced to show alert dialogue boxes inside the BlipparSDK view, mainly to respond to share events.
   6. Added interface to the SDK blipp context to enable script functions to be called with optional parameters. Fixed blipp JSON config association.
   7. Error codes were updated, indexes for some errors have been changed.
   8. A reason is provided if the trigger image is not recognised.
* Various major bug fixes, including several rendering issues that caused strange visual effects during the blipp playback. Proguard configuration improved on Android.
* Improved Blippar API reference, using Javadoc on Android.

## **Breaking API changes**

N/A

## **Api Reference**

[iOS Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/ios/2.1.0)

[Android Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/android/2.1.0)

## **Release Date**

September 2017

## **Blipp JS Maximum Library Supported**

1.7.8

## **Known issues**

* It is not possible to test a blipp published on a code yet. This will come in a future SDK release.