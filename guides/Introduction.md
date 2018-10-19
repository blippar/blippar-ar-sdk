# Introduction

## What is the Blippar SDK?

The Blippar SDK is a library of classes that provides a range of Augmented Reality and image detection features that can be incorporated into third-party applications.

The API is available to both Android and iOS and supports applications written in Java, Kotlin, Objective-C and Swift.

On iOS, the SDK is supplied as a Framework and on Android, it is provided as an AAR.

## Basic Requirements to Use the SDK in Your Application

* The minimum supported Android version is KitKat (4.4.x), API version 19 and the minimum iOS version supported is iOS 9.
* A rear-facing camera. The end-user must grant permission for access to the camera in your application.
* A good internet connection. The Blippar SDK uses internet connections extensively to perform detection tasks and download content.
* Location Services. This is not compulsory, but you can ask the user for permission for this and potentially provide enhanced AR experiences as a result.

## Licence Key

In order to use this SDK a license key is required. This license key is tied to the App ID and platform (iOS or Android) of your application. If you want to use the Blippar SDK in more than one app, or on iOS and Android) then you will need a separate key for each app and each platform. If you decide to change your App ID then you will need to get a new key from us before you can use the SDK.

You will register your App ID with us and we will generate the key that you should use in your application. Please keep your key safe.

If you would like to request a license key please reach out to your account manager or email info@blippar.com.

## Upgrading the SDK

Please keep up to date with the latest Blippar SDK versions and update the SDK each time you update and release your own application. It is important to keep pace with changes, fixes and other improvements that we will continually make to our system.

## What's in the SDK?

The Blippar SDK is divided into three main components:

* Marker and Entity Detector
* Augmented Reality Target Tracker
* Augmented Reality 3D Engine

The **Marker and Entity Detector** uses a complex server system to recognise objects and images that your users are pointing their device's camera at. You can run the detector and it will give you results about what the camera is seeing.

The **AR Target Tracker** uses the camera to follow specific target images and provides an output that allows 3D animations to be drawn to the device screen as if attached to the target images.

The **AR Engine** can draw and animate sophisticated 3D scenes on top of images within the camera and then track and follow the images so that the scenes seem to be part of the real world - in other words; Augmented Reality. The AR scenes that the Blippar SDK can show are self-contained packages called blipps. Blipps contain 3D models, textures, images, sounds, videos and controlling javascript scripts that allow you to make it all interactive.

![BlipparSDK Intro](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Introduction.png)

## How Do I Create AR Content?

The AR content displayed by the Blippar SDK is packaged in what we call blipps. Each blipp contains all the content required for a single AR experience. A blipp is designed to run on top of a particular image, called [marker](https://support.blippar.com/hc/en-us/articles/208577187-Choosing-a-Marker). The Blippar SDK will automatically project and draw the blipp on the marker as if it was part of it; the essence of AR.

The Blippar SDK will use your device camera and draw onto the screen so you can see the camera image and the blipp content. You do not need to do any work with the camera or with 3D rendering yourself; all this will be handled by the Blippar SDK.

These blipps can either be entirely built by hand with javascript, using [**Blippbuilder Script**](https://developer.blippar.com/portal/ar-api/home/) or can be build using our drag-and-drop blipp design tool; [**Blippbuilder**](https://blippar.com/en/products/blippbuilder/).

Blipp creation is a large subject all on its own and we don't cover the details in the SDK documentation. You can find more on how to create a blipp with Blippbuilder Script here: [https://developer.blippar.com/portal/ar-api/guides/creating-blipp/](https://developer.blippar.com/portal/ar-api/guides/creating-blipp/), or with Blippbuilder here: [https://support.blippar.com/hc/en-us/articles/208577557-Your-First-Blipp-Build](https://support.blippar.com/hc/en-us/articles/208577557-Your-First-Blipp-Build). 

In a large organisation, it is typical that the blipps are created by a separate design and development team to those building Blippar SDK based applications.

When a blipp is created it is packaged up with its **marker** and stored on our servers where it can later be downloaded by the Blippar SDK and drawn on the screen automatically.

## What is a Marker?

A marker is a flat image that our system can detect and track using the camera and then project a 3D AR experience onto. The choice of marker is entirely up to you. Common markers include advertising collateral, packaging, manuals, or any other branded imagery.

Markers can be good or bad! Good markers contain a lot of detail, with high contrast and bold colour changes. The Blippar tracker looks for detail and if there isn't much, it can't be sure of the exact position and orientation of your marker so the AR experience might not **stick** onto your marker very well. For more information and examples check out our ["Choosing a Marker"](https://developer.blippar.com/portal/ar-api/guides/recommended-standards/markers/) article.

One important point is that text typically does not make a good marker, because a block of text looks rather similar to other blocks of text and is hard to recognise one from another for our computer vision system. To maximise your success don't use markers that are just text. Full page layouts with text and pictures from a magazine or brochures work great.

## What's the Difference Between a Marker and a Blipp?

A marker is not a blipp. This is an important distinction.

A marker is an image that has been registered with Blippar's Marker Detector. It can be detected and recognised by our detector.
A [blipp](https://developer.blippar.com/portal/ar-api/guides/blipp-structure/) is an AR experience wrapped up into a package that can be stored on our servers and run by the SDK on your device.

## What are the Different Ways I can Use Markers?

You can associate one or many markers with a blipp, so that when those markers are detected our SDK can download and run the relevant blipp AR experience.

You can change the markers that are associated with a blipp, and you can also run a blipp without any markers at all.

Running blipps without markers can be useful in several cases:

* When you want users that do not have access to the markers to be able to trigger the AR experience. For example, you have designed a blipp that is triggered by a marker attached to a specific location – e.g. a plaque next to a monument or landmark. 
* When you want to use the Blippar SDK as a 3D engine. You may consider this if you are already using our SDK in your application and you want to add more 3D content that is not related to any marker. This may save you time and resources as you will not need to integrate another SDK while allowing your final application to consume less target device memory.
* Triggering AR experiences off a location instead of triggering from a marker. While the Blippar SDK does not support geo-triggered AR yet (i.e. it does not allow you to attach AR content to certain coordinates), your custom application could detect user location and launch different blipps based on this information. Please remember that blipps can be restricted to a limited set of countries during the publishing as well, so you can launch country-specific blipps even without tracking user location yourself.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>Note: If you wish to run a blipp without a marker, it should support the peel-away mode allowing the blipp’s content to stay on the screen when the user moves their device away from the marker.

## How Does Blippar SDK Work In My Application?

First, design your **marker(s)** and assets. Use them to build your unique blipps and upload the blipp packages to our server.

Next, you have to make your blipps available to scan with your application. Currently, this is done by assigning a test code to a blipp, this is the first eight symbols of your license key.

The typical flow in your application is as follows:

1. Initialise the SDK (the SDK will take over the camera and the screen).
2. Start the **Marker and Entity Detector** and wait for the user to point the camera at one of your **markers**.
3. The SDK will call you when your **marker** has been seen (detected), and it will tell you which blipp the marker is associated with.
4. You then ask the **AR Engine** to launch the associated blipp and the SDK will download all the required data and run your blipp.
5. The SDK will automatically start the **AR Target Tracker** and draw your AR experience attached to the marker.

You have complete control over which blipps are run in the SDK (you can launch any blipps as long as they are under your Hub account). You do not need to use the Marker and Entity Detector if you just want to run a blipp without waiting for a marker detection.

## Which Blipps Can I Run?

The Blippar SDK will only run blipps that belong to you and are associated with your license, or ones designed by Blippar for testing the SDK. The Marker Detector will not detect anybody else's markers.

##BlippBuilder Script API Versions

Blippbuilder Script is a Javascript API that defines functionality available in the blipp. You can find a full JS API reference on [developer portal](https://developer.blippar.com/portal/ar-api/home/). Each Blippar SDK supports a certain BlippBuilder Script API version, which is mentioned in its release notes. BlippBuilder Script API calls, introduced after the SDK release are not supported and should not be used in blipps. If the blipp is created in the Blippbuilder be sure to select the target SDK version correctly when creating a blipp. Select the lowest SDK version your app is currently using. Blippar SDKs are backwards compatible, which means that all newer SDKs will also be able to run the blipp that has been created using the older BlippBuilder Script API version or is targeting an older SDK version in the Blippbuilder.

## Blipp Caching

When blipps are downloaded, they will be cached within your application's disk storage. If the same blipp is run again then the SDK can save a lot of time and internet bandwidth by loading data directly from the cache.

## What About the Camera and the Screen?
The Blippar SDK takes care of all the camera image capturing, camera drawing, and 3D experience drawing. You do not need to do any of this by yourself.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png)
>Note: You will not be able to access the device's camera while the Blippar SDK is running in the application.

You can place your own UI controls (buttons, text, pictures and others) on top of the camera feed provided by the SDK if you choose to do so. Remember to be careful not to obstruct the AR area too much since it will make it difficult for your user's to interact with the AR experience. Our advice is to put your UI elements close to the screen edges and keep them small.

As a custom application developer, you might be interested to know that the Blippar SDK contains an iOS View Controller/View or Android Fragment (called the View in this document for convenience) that you will use to show the camera and 3D content. Once initialised the View will take control of the camera and do all the drawing necessary. The View requires the full screen when it is running.

The Blippar View elements draw the camera full screen so naturally, it should be the rear-most element in your stack of elements. 

## How Do the SDK and My Application Communicate?

The Blippar SDK uses **Delegates** or **Listeners** (i.e. callbacks) to report the status of what is going on. Most of what goes on in the SDK happens in background threads, so should be considered asynchronous.

When you call an SDK function to start the Marker Detector or launch a blipp, the function will return immediately (possibly with an instant error), but will then go off and perform all the work in the background and call your callbacks when they have something to report. Both systems use the internet connection to detect and download content.

The SDK initialise is an asynchronous operation that uses the internet connection and may take a short period of time to complete. It must do a variety of things, including checking your application's license key. When it succeeds or fails it will tell you by calling a callback that you must have in your application. You may want to perform some other action or animation of your own while the initialise completes.

You don't need to use all the callbacks the SDK provides: use only the ones that are necessary for your particular scenario.

A running Blipp is also an asynchronous process. As soon as you launch it, it will load, run and draw itself automatically without the need for any further action.

## Can I Extend the Blippar SDK Functionality?

The Blippar's main View Controller/Fragment is designed with flexibility in mind. Out of the box it tries to do as much as possible for you so that you can get up and running quickly. It will perform the main detect and blipp launch cycle for you automatically. It will:

1. Initialise and draw the camera.
2. Automatically perform detection of your markers.
3. Automatically launch your blipps if detected.
4. Allow for blipp closure and return to a detecting state.

However, The View Controller/Fragment is designed to be subclassed and you can override various parts of this behaviour and customise it for your own purposes.

## Can My Application Communicate With a Running Blipp?

The current version of our SDK provides several communication paths. 
One of the ways would be to call a special SDK function to associate a block of JSON data with a specific blipp ID. This data will be cached and stored, then when the associated blipp is run it will be given this block of JSON as a startup parameter. You can use this to customise the behaviour of a blipp according to previous actions taken in your application. This only happens when the blipp starts up, and calling it again while the blipp is running will not send the data to the blipp.

The other way is to call a named function from the host app in the blipp or from the blipp in the host app. You can find more about this in the relevant chapter [Communicating with the Blipp](customisation/communicating-with-the-blipp.md).