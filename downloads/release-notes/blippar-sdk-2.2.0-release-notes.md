# Blippar SDK 2.2.0 Release notes

## **Major Changes**

1. The support of the new publishing flow: It is now possible to select a target application user wants to publish the blipp for instead of entering first eight symbols of the license key. Due to this change, the old SDK support will be discontinued soon.
2. JSON API to share JSON from the app with a blipp.
3. Test Code API.
4. Blippar SDK Debug Telnet Console (see "Debugging Utilities" in the SDK documentation for further details).
5. Customisation of all SDK strings.
6. Added APIs to allow SDK users to change the name of the media folder where pictures and videos taken during the blipp playback are to be saved.
7. More meaningful error reports in case of SDK authentication failure.
8. Full Xcode 9 and iPhone X support.
9. Improved Blippar API reference.
10. New blipp publishing manual.
11. Additional documentation on various useful SDK related topics.
12. Various bug fixes.

### New Publishing Flow

With the release of the SDK 2.2.0, we are introducing a new publishing flow for our blipps. Now you don't have to enter the first eight symbols of the SDK license key as the blipp test code to allow your custom application to scan it. You can simply choose one or several applications you want to publish the blipp for instead. This makes publishing and un-publishing blipps much simpler and faster and allows us to introduce a new feature: testing blipps in your custom applications. Now you can publish blipps that will run only in your internal application builds without a risk of revealing it to your customers before it is ready to go live.

On our Hub, we are going to enable the new blipps publishing flow for all our current SDK users tomorrow (February 7, 2018). 

Please note that blipps published using the new publishing flow can only be scanned with the latest SDK (2.2.0 or newer). However, if you have not moved to the new SDK yet and for some reason cannot migrate immediately there is still an option to publish your blipps for the SDK 2.1.x using the old publishing flow. Please note that the old publishing flow will be turned off eventually, so we strongly advise to migrate to the new SDK as soon as possible. The current plan is to turn the old publishing flow off three months after the new publishing flow release, but depending on customer needs the actual deadline may move.

The SDK users who have already published their blipps using current publishing flow can find migration instructions at the end of the help document "Blipp Publishing for the Blippar SDK in Custom Applications". iI you have already released your app live with the SDK 2.1.x, we strongly advise to copy existing blipps and keep one copy published for the old SDK and one copy published for the new SDK.

We hope that you will find a new publishing flow much more convenient and will find a good use for all the improvements we have made. 

### JSON API

As it was mentioned on various occasions previously one of the great features that SDK is offering to its users is a possibility to preconfigure the blipp based on the information the app supplies to it. There are various use cases for this functionality and one of the bright examples would be configuring blipp contents based on the current user information. With the new Blippar SDK release we have introduced several new API calls to make use of this feature even easier. Please refer to the API documentation to find out more about the following Blippar API methods:

* `setConfigJSONForEntity`
* `removeConfigDataForEntity`
* `removeAllConfigData`

### Test Code Set API

One of the new options that the new publishing flow is providing is testing blipps. Those who have worked with Blippar hub and published Blipps for the Blippar app might be already familiar with this feature. During the blipp development process, it is important to have an option to test a blipp without exposing it to your users. With the old publishing flow, blipp developers could only test blipps in the Blippar app. That is not very convenient if your blipp has features that would only work if you run it in your custom app. Now you can create blipps that will only run in your custom app if you set a detection code before you start detecting the trigger image. Just create a special build of your application with detection code set and test your blipps without any worries about exposing it to your clients. Please refer to the API documentation to find out more about the following Blippar API methods:

* `setDetectionCode`
* `getDetectionCode`
* `clearDetectionCode`

### Improved SDK Documentation

In the latest Blippar SDK package we have introduced various new documentation topics to introduce users with various useful features the SDK is providing to make the development even simpler. Some of the new topics covered in the SDK documentation are:

* Blippar SDK License Key Management.
* Blippar SDK Customisable Strings.
* Blippar SDK - Debugging Utilities.

We are constantly working on further SDK documentation improvements. Soon all these and many more documents will be available on the Blippar developer portal online, thus ensuring that the latest document copy is always available to the Blippar SDK users.

### Changing the Media Folder Name

It is now possible to change the name of the folder where blipps will save images, audio records and videos captured during the blipp playback.

While previously the media folder name was hardcoded to "Blippar", now it is using the application "Display Name" by default. However, if the default option is not good, it is possible to change the media folder name by overriding the method getSavedMediaFolderName, for example:

        blipp.getSavedMediaFolderName = function() {
            return "myapp";
        }

The SDK will call the function getSavedMediaFolderName from the blipp automatically each time before saving the media file.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>**Note**: Due to the iOS architecture specifics, all video files on iOS will be saved in the folder "Video".

### Additional Architectures Support

We supply the SDK for iOS in two variants now:

* The thin iOS SDK variant supports only architectures armv7, armv7s and arm64. 
* The fat iOS SDK variant supports x86_64 and i386 in addition to architectures already supported by the thin variant:

This is to simplify the final app submission to the Apple app store, as any non-arm architecture is not supported on the app store and is not stripped out automatically from the final app during the submission process.

Following multiple clients requests the Android SDK now supports arm64 and x86_64 architectures in addition to already supported armv7 and x86.

The support of the x86 architectures on both platforms permits to run the SDK on emulators and simulators if needed. However note, that the SDK itself does not work properly on emulators and simulators as camera support is essential to enable most of the SDK functionality.

## **Breaking API changes**

None

### **Bugfixes**

#### iOS

* Fixed blipp launchMode not working for 'Now' configuration
* Fixed audio volume being dramatically reduced after video/audio recording
* Added Done button accessory to blipp keyboard
* Fixed blipp.setKeyboardText not changing the keyboard text

#### Android

* Fixed hanging encountered in Oreo devices
* Fixed OpenAL crashes on Oreo
* Fixed blipp.setKeyboardText not changing the keyboard text
* Fixed takePhoto command to also capture overlay HTML contents

#### Both Platforms

* Improved SDK shutdown stability
* Overlay HTML now added to view hierarchy dynamically for each bespoke blipp
* Fixed billboards particles appearing squashed
* Various stability improvements

## **Api Reference**

[iOS Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/ios/2.2.0)

[Android Reference](http://phqeq0ldrt2zcqjc2xhayirsvmil1qz2.s3-website-eu-west-1.amazonaws.com/blippar-sdk/api/android/2.2.0)

### **Release Date**

February 2018

### **Blipp JS Maximum Library Supported**

1.7.8