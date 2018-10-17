# Responding to SDK Events

The Blippar SDK exposes several public interfaces that can be implemented in the host app to receive callbacks and events from the SDK.

## BlipparSDK Lifecycle

The most critical interface that almost every app will need is `BlipparSDKDelegate` on iOS and `BlipparSDKListener` on Android.

This interface allows an app to listen for important SDK events such as initialisation, shutdown and when initialisation errors occur.

The SDK initialisation process is asynchronous as there is communication with the Blippar servers to validate the license, so an app can register a class that implements the interface to indicate when the initialisation process is complete. If there is a problem with initialisation (e.g. an invalid or expired license key) then the user will receive an error callback.

Similarly for shutting down the SDK, it may not be immediate so this interface tells the user when it is completed.

## Detection

The detection process callbacks is exposed by the `BlipparDetectionDelegate` and `DetectionListener`. There are two types of callbacks:

* The server has found a match with the current camera image (see the various types of entities that can be matched in the [Detecting](../detection.md) document)
* No match is found or has failed for another reason.

The host app can receive these callbacks and respond to them appropriately. The `onDetectionNoResults` callback is useful to display feedback to the user that detection is not working and get them to take some appropriate action. 

If the host app wants to change the in-built behaviour when it launches a blipp as soon as a marker is detected in `onDetectionResults` then the developer should derive from the `BlipparSDKViewController` or `BlipparSDKFragment`, override the method and not call the `super` function. 

## Blipp Lifecycle

When a blipp is launched (either programatically or by scanning a marker) there are a number of phases that the blipp goes through (see the [Blipping Guide](../blipping.md) for more). To receive callbacks into your app you can implement the `BlipparBlippDelegate` or `BlippStateListener`. Then register with the SDK and you will receive callbacks for loading (with and without progress), loaded, error, running, tracking/peel, closing and closure events.

## HTML Callbacks

By default the BlipparSDK provides in-built functionality that can be customised by the user, if they wish.
The provided HTML viewer is a wrapper around the native iOS and Android webviews, it's robust and heavily tested. 

However a host app may want to do something custom such as using SFSafariViewController on iOS or Chrome Tabs on Android. To do this the host app should implement the `HTMLHandler` interface on Android or `BlipparHTMLDelegate` on iOS. By setting the delegate/handler on the SDK the developer is effectively unhooking the provided implementation from the SDK.

There is a separate callback for PDFs vs HTML as it is possible to render the content in a different way. For example on Android a developer could forward to an external browser/app whereas iOS can use the native UIWebView to render the content.

The `HTMLConfig` that is passed to various calls contains various attributes that can be set directly from the BlippJS call. Local HTML is html that is downloaded as part of the blipp assets and loaded directly from a file path. 

External HTML is a request to open HTML in an external browser and will leave the app. Technically it does not have to be HTML, the blipp could be opening an external app using a system protocol e.g. `twitter://`. On iOS the SDK uses [openURL](https://developer.apple.com/documentation/uikit/uiapplication/1648685-open) and on Android it uses `startActivity` with the `ACTION_VIEW` intent. Both the `tel:` and `mailto:` protocols are supported.  

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>When the SDK launches a modal view, it goes into a suspended state. On returning from a modal interface it is critical to call `onBlippOperationCompleted`, otherwise the rendering and blipp operation will remain suspended.

## Video

Similar to the HTML callbacks, the BlipparSDK provides an in-built fullscreen video view.
Again, this can be replaced if required by implementing `VideoHandler` or `BlipparVideoDelegate` and setting the delegate/handler on the SDK.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>When the SDK launches a modal view, it goes into a suspended state. On returning from a modal interface it is critical to call `onBlippOperationCompleted`, otherwise the rendering and blipp operation will remain suspended.

## Sharing

When a blipp calls share functions, a host app can receive callbacks via the `BlipparShareDelegate` or the `ShareHandler`. There are two types of sharing, sharing a url with optional text or an asset with optional text.
If some custom behaviour is needed the developer can implement these protocols and set it on the SDK to unhook the in-built functionality.

The sharing assets types supported are images and video.
The sharing targets supported by the SDK are email, generic sharing (i.e. using the platform sharing mechanism) or in-sdk photo sharing which shows a custom view in the SDK with the photo taken as a background. From that view the user can share the photo with social media.

With email sharing it is possible from the BlippJS to customise the share subject, recipients and body of the message.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>When the SDK launches a modal view, it goes into a suspended state. On returning from a modal interface it is critical to call `onBlippOperationCompleted`, otherwise the rendering and blipp operation will remain suspended.

## Telephony

It is possible to customise the telephony events in a host app by implementing the `BlipparTelephonyDelegate` or `TelephonyHandler`. 

The SDK forwards the user to the phone call/sms screen, it does not have functionality to actually start a phone call or send an SMS without the user accepting to do so.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>Be careful to check if the device supports calling, some iPads do not. It is also recommended to prompt to ask the user if they accept the request to start the phone call.


