
# Table Of Contents

* [General](#general)
* [Custom Application Creation](#custom-application-creation)
* [Content Creation And Publishing](#content-creation-and-publishing)
* [Technical](#technical)
* [Analytics](#analytics)
* [Pricing](#pricing)
* [Support And Updates](#support-and-updates)

# General

## What is the Blippar SDK?

The Blippar SDK is a tool that allows to incorporate AR functionality in a third party application. Currently the main features it supports are marker recognition and tracking and bespoke Blipp playback. The tool itself is a library of platform specific classes that are needed for developers to enable Blippar functionality in their application. The SDK is available to both Android and iOS and supports Apps written in Java, Kotlin, Objective-C and Swift. On iOS the SDK is supplied as a Framework and on Android it is provided as an AAR.

## What features are provided by the Blippar SDK?

Here is a short list of the main features the SDK provides:

* A plug n' play solution that can get AR content into an app in less than 20 lines of code.
* The SDK allows to detect markers and entities (some are available in generic recognition - ex. Level 1 entities. For others - ex. Car, fashion, face, logos etc. - they have to be paid for separately). Barcodes (EAN-8, 12 and 13) are also supported for detection.
* A native view to render the camera and AR content.
* Customisation of AR content via JSON, direct script callbacks or by extending/altering SDK behaviour through delegates & listeners.
* The SDK allows to do a reasonable amount of graphical rendering and animation using which one can create compelling interactive experiences.
* The SDK supports 3D markers for standard shapes - ex. Cones, cylinders, spheres, cuboid.
* Face tracking through the OS face tracking and an enhanced in-house face tracker.
* The SDK supports native AR (ARKit and ARCore) through markerless SLAM. Surface detection will be available very soon in a future release.
* Supports all [Blippbuilder Script API](https://developer.blippar.com/portal/ar-api/home/) features.

The SDK does not provide content in itself. The creation of blipps can be done via Blippbuilder, a self service tool for creating blipps. Alternatively blipps can be created by developers by using the [Blippbuilder Script API](https://developer.blippar.com/portal/ar-api/home/).

## What are the requirements for the SDK to be compatible with an app?

The SDK is compatible with native iOS and Android apps only.

Blippar iOS SDK can only be linked as a part of an Xcode project, we advise to use Xcode 8.3.3 or later. The SDK supports iOS 10.0 and later.

Blippar Android SDK should be linked as a part of the Android project in Android Studio or another Android IDE. The SDK supports Android 4.4 or later, you need to build your app with Android SDK Revision 4.4.0 (API Level 19) or later.

Currently, the BlipparSDK only supports portrait mode.

## How do I apply for an SDK license?

Get in touch through our [contact form](https://www.blippar.com/contact-us#contact_form) with the following details:

* App IDs for both Android and IOS apps
* App name
* Company name
* A short description of the app
* A short description of the intended SDK use
* Your Blippbuilder account email. You can create a free trial account at [https://www.blippar.com/build-ar](https://www.blippar.com/build-ar)

## Will there be any Blippar branding on the SDK?

The demo apps have a watermark embedded into the camera view. There is no watermark for paid licenses.

## What is an App ID and how do I find it?

App ID can refer to a _iTunes Bundle Id_ or _Google Play App Id_ (sometimes known as _package name_) depending on the mobile platform (OS) the app was built for.
Normally if you have access to the source code you can find both IDs in your app project.

* For iOS app project open in Xcode:
  1. In the project editor, choose the target and click General.
  2. If necessary, click the disclosure triangle next to Identity to reveal the settings.
  3. Find the bundle ID in the Bundle Identifier field.

* Android

`applicationId` is the application's package name as found in your app module's build.gradle file.

    android {
      defaultConfig {
          applicationId "com.example.myapp"
          minSdkVersion 15
          targetSdkVersion 24
          versionCode 1
          versionName "1.0"
      }
      ...
    }

If you __don't__ have access to the app source code you can still find the App ID if the app has already been published on the Apple App Store or Google Play Store:

When you create a new project in Android Studio, the application ID exactly matches the Java-style package name you chose during setup.

* iOS:
  * Unofficial way:

    1. Go to this site [http://offcornerdev.com/bundleid.html](http://offcornerdev.com/bundleid.html).
    2. Enter the app name and it should return all apps which match the search criteria and their IDs.

  * Official:

    1. Find the app online (Google for the iTunes link). For this example, use Apple Pages: [https://itunes.apple.com/app/pages/id361309726?mt=8](https://itunes.apple.com/app/pages/id361309726?mt=8).
    2. Copy the number after the id in the URL. (Here: `361309726`).
    3. Open [https://itunes.apple.com/lookup?id=361309726](https://itunes.apple.com/lookup?id=361309726) where you replace the ID with the one you looked up.
    4. Search the output for `bundleID`. In this example, it looks like this (next to a bunch of other data): "bundleId":"com.apple.Pages". So for Apple, the Bundle ID is `com.apple.Pages`.
    
  * If you have the .ipa file directly:
    1. Copy the .ipa file and rename the extension to .zip.
    2. Unzip the zip file. You will get a new folder named like the zip file.
    3. Search for the file iTunesMetadata.plist in that new folder.
    4. Open the file with a text editor and search for `softwareVersionBundleId`.

* For Android apps:

  * You can find the App Id in the App's Play Store URL after 'id'. For example, in [https://play.google.com/store/apps/details?id=com.company.appname](https://play.google.com/store/apps/details?id=com.company.appname) the identifier would be com.company.appname.

## What regions are supported by the Blippar SDK?

The Blippar SDK allows AR content publishing to all countries where Blippar is available. However please get in touch with your account manager regards the available countries included in your license. If you have a global license, you can choose to publish blipps to one or more or globally, which can be managed through Blippar Hub.

## Is it compatible with Unity or Unreal engine?

The SDK currently has a cross platform bespoke renderer and so is currently not compatible with Unity or Unreal engine.

## Is the SDK compatible with React Native, Flutter or Cordova?

These platforms are currently not supported.

---

# Custom Application Creation

## What can be customised in the SDK?

The main part of the SDK is a video feed from the camera, which the SDK is using for the image detection and tracking. The SDK also uses the video feed to draw the blipp contents over it. The video feed always runs fullscreen and in portrait mode. This is the part of the SDK that is not customisable, everything else is customisable. It means that:

* The application developer can display different UI elements on top of the UI feed. For example, they could display the label "point your camera at the pack" over the video feed.
* The application developer can follow different events, that the SDK reports, such as "Trigger image detected", "Blipp launched", "Tracking lost" and many more. For example, they could hide the label as soon as the pack is recognised in the video feed.
* The SDK provides some additional UI elements for external content display, for example, to display a web page or a video. However application developers can choose to monitor the SDK attempts to launch this external content, stop the SDK and do their own actions instead (display video content in their own video player).

## Can the end user view blipp contents without marker?

Yes, there is a special command that allows to launch a blipp in the SDK view using the blipp address and/or marker ID. The blipp, however, has to be published for this app following the publishing instructions and has to support peeled mode, as there will be no tracking with this mode. The tracker is still loaded with the marker, should the user point the device at the marker it will track.

## Can we prevent the blipp launch when the trigger image is detected?

Yes, the moment the trigger image is detected, the SDK lets the main application know, that it will launch the blipp now. The application developer can chose at this moment to stop the blipp launch and perform a different action instead. One of the use cases for such feature would be a different content display for different countries/target groups. It may be that app developers want to use the same product pack to launch a different blipp or the same blipp with a different configuration for each country.

## How do I integrate the SDK into an app that’s already live?

It is possible and you can refer to the SDK documentation and example applications to see how this has to be done. A very short and a very technical answer would be: You could create a BlipparSDKViewController/BlipparSDKFragment from within your app. Once created, the provided VC or fragment takes care of scanning, recognition and talking to our servers to pull the appropriate content published against your SDK license. The view needs to include the appropriate functions as outlined in the documentation.

## Does Blippar SDK suppot BitCode?

No, we we do not support BitCode for performance reasons.
A little bit of background: Bitcode is a representation of the compiled application that when submitted to the app store (or iTunes connect), Apple will automatically optimize for future platforms without having to resubmit the application. Bitcode essentially allows to recompile your app on apple’s servers before distribution.
The Blippar SDK is heavily dependant on various low level NEON optimisations to improve rendering and tracking performance. These optimisations are particular to individual architectures of current iOS device types, therefore re-compilation by Apple for (potentially) unknown device types is currently disabled.

---

# Content Creation and Publishing

## Can I publish the same AR content to both the Blippar app and the Blippar SDK?

Yes, the AR experiences created on Blippbuilder/Blippbuilder Script can be published to both the Blippar app and the Blippar SDK. There is no need to re-create AR content for different apps. However, please get in touch with your account manager regards to which app(s) is included in your license.

## Are there templates that we can use to build blipps?

Blippbuilder comes with pre-designed widgets to allow creating AR experiences quickly and easily. Feel free to visit support.blippar.com to explore more inspirations. For blipps created on Blippbuilder Script, there are examples and demos on the [developer portal](https://support.blippar.com/hc/en-us/categories/115000595548-Blippar-Script-API-Documentation) can be used as starting templates

### How do I create content to be shown through the Blippar SDK inside my app?

Both our self-service creation tools: Blippbuilder and Blippbuilder Script can be used to create content through the Blippar SDK. Our in-house studio can also create blipps for SDK users following the same process as if these blipps would be published in the Blippar app.

## Does the Blippar SDK also support Geo?

The Blippar platform supports regionalised triggering of AR content, at a country level. However it is possible for an app to integrate whatever location service they wish and programatically launch blipps according some criteria. Through the Blippbuilder Script location APIs or app <-> blipp communication it is possible to develop reasonably complex geo-features in blipps.

## Can we publish a Blipp both on the SDK and on Blippar? How do we check the Blipp pushed on Blippar?

Yes. When publishing your blipp via the Blippar Hub you will see an option to decide what app(s) the blipp can be detected on.

---

# Technical

## What are the main components of the BlipparSDK?

__IOS__

  * The `BlipparSDK` is a shared instance that provides much of the SDK functionality. See the [guides](guides/ios/README.md) and [API reference](documentation/api-reference/ios.md) for more info.
  * There is a provided a `BlipparSDKViewController` that should be integrated into your application. This has an associated view called `BlipparSDKView` that you can create programatically or add to your view hierarchy via Interface Builder. You must should connect the view to the VC's view, if you do not the SDK will search the view hierarchy for the view and manually connect it.
  * `BlipparSDKDebugView` is a debugging utility, primiarily for blipp debugging that can be added to your view hierarchy to assist development of blipps.
  * `BlipparSDKCamera` provides APIs to the SDK's camera.
  * `BlipparSDKDebugConsole` is a telnet console, that allows you to see device and blipp logs amongst other things.

__Android__

   * The `BlipparSDK` can be accessed from the `Blippar` class statically as a singleton, this provides much of the SDK functionality. See the [guides](guides/android/README.md) and [API reference](documentation/api-reference/android.md) for more info.
   * There is a provided a `BlipparSDKFragment` that should be integrated into your application. This has an associated view called `BlipparView` that you can create programatically or add to your view hierarchy via XML.
  * `DebugView` is a debugging utility, primiarily for blipp debugging that can be added to your view hierarchy to assist development of blipps.
  * `BlipparSDKCamera` provides APIs to the SDK's camera.
  * `DebugConsole` is a telnet console, that allows you to see device and blipp logs amongst other things

## How do I create a blipp?

See [here](#how-do-i-create-content-to-be-shown-through-the-blippar-sdk-inside-my-app)

## What format do I need to prepare my 3D models in?

For blipps created in Blippbuilder, please refer to Blippbuilder support https://support.blippar.com/hc/en-us/sections/360000271827-Add-3D. For blipps created in Blippbuilder Script, please refer to Blippbuilder Script developer portal https://developer.blippar.com/portal/ar-api/guides/creating-blipp/models/

## Does it use WebGL?

No, the SDK does not use webgl but renders using native OpenGL APIs. However through OverlayHTML it is possible for your blipp to utilitise WebGL if you wish.

## What version of Javascript is supported?

As a minimum the SDK has [ES6 support](https://en.wikipedia.org/wiki/ECMAScript#6th_Edition_-_ECMAScript_2015) across the board for iOS and Android. However on native WebViews on Android it is very likely on older OSes that you will get ES5.

## Can I publish apps for both iOS and Android with one codebase?

Currently no. You need to have two separate apps. You could integrate something like React Native and have a bridge to the Blippar SDK.

---

# Analytics

## We need to collect analytics from our custom application. What options does Blippar offer?

The Blippar SDK collects a number of analytics relating to detection, blipp launching, dwell times and user actions. On Blippar Hub, you can view and customise Data Dashboard for each campaign. However, in the case when one campaign was published through several apps, currently we do not separate the source applications the data comes from. You can create and publish a separate blipp copy for each app to track app-specific data.

---

# Pricing

## How much does the SDK cost?

Please [contact us](https://www.blippar.com/contact-us#contact_form) and let us know how many apps you required the SDK for, and how many country(ies) will each app be live in. A member of our team will get in touch with you asap.

## Can I apply for a license for a single platform, e.g. Android?

Yes, however the price will not be any different. Licenses are per application rather than platform. If you want you can use same app ID on both platforms or you can request a separate SDK license for a different App ID on each platform.

## How does your pricing model look like?

The Blippar SDK pricing is based on an annual licensing model. Please get in touch for more details

## Why do you have an annual licensing model instead of a one-off fee?

As part of the annual licensing fee, we provide you with all updates to the SDK throughout the year. This is important to ensure that you are able to keep updating the technology embedded within your app, and not have to pay for each new feature that is released. This way we can also make sure that all SDKs on the market are active.

---

# Support and Updates

## Do I have to integrate the SDK in an app myself or can the Blippar team help?

If you’re looking to embed the Blippar SDK in an existing app, it is highly recommended that you work directly with the app development team who originally built your app. If you do not have an app yet, Blippar offers white-label app development services and we can integrate the Blippar SDK for you. Please [get in touch](https://www.blippar.com/contact-us#contact_form) for more information.

## I need some more help!

So you've checked our [guides](guides/README.md) and cannot find an answer to something...

* We now have a community on Slack: [https://blippar-dev.slack.com](https://communityinviter.com/apps/blippar-dev/blippar-development-community), try asking there.
* Try [contacting us](https://www.blippar.com/contact-us#contact_form) to receive support.
 
If you could have the following information it would be useful:

* App id
* Short issue description (Title);
* Blipp name, hub link and/or marker link.
* Environment; the device, OS version, developer tools version, the Blippar SDK version
* The detailed description of the issue: what went wrong? What was expected? Could the issue be reproduced several times? What would be the steps to reproduce the issue?
* Device logs or compiler error messages.
* If possible, screenshots and/or videos to help us understand the issue
* If possible, code snippets for interactions wtih the SDK. Full application source code would be most useful.