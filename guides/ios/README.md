# Integration Guide - iOS

## Requirements

Blippar iOS SDK can only be linked as a part of an Xcode project, we advise to use Xcode 9.4.1 or later. The SDK supports iOS 10.0 and later.

The BlipparSDK cannot use Bitcode, therefore Bitcode must be disabled for your entire project by setting the 'Enable Bitcode' Build Setting to 'No'.

Currently the BlipparSDK only supports portrait mode. This can be set in the Target→General in your app

## Distribution

The iOS SDK bundle is distributed as a framework.

## License Key

You must obtain a license key from Blippar to use the SDK in your app.  This key must be embedded into your app source code and then given to the SDK during its initialisation (this is shown in the example below).

If you have more than one app then you will need separate keys for each app. 

## Linking

1. Select your project in the Project Navigator (⌘+1).
2. Select your app target.
3. Select the tab Build Phases.
4. Expand Link Binary With Libraries.
5. Use the 'Add Other...' option to add the following SDK framework: BlipparSDK.framework
6. In project→General→Embedded Binaries add BlipparSDK.framework (see screenshot below)
7. Build and run..

![iOS Framework Linking](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/iOS_Framework_linking.jpg)

## Integration
 
There are two frameworks provided: the 'fat' framework which includes all architectures for the device and simulator (armv7, arm64, x86\_64 and i386) and the 'thin' framework that contains just device architectures (armv7 and arm64). It is recommended you use the fat framework during development and switch to the thin framework when submitting to the store (simply copy, rename to BlipparSDK.framework and replace in your project). Apple rejects apps with x86_64 or i386 architectures included so you will not be able to submit your app with the fat framework.

## Permissions

The Blippar SDK uses a camera feed to display the AR experience. We recommend that the developer takes care of getting the camera permission before launching the SDK. If this is not done the SDK will handle the camera permission request, but you must include the _Privacy - Camera Usage Description_ `NSCameraUsageDescription` message in your app's Info.plist. If this message is not added, the app will crash. This crash behaviour required by Apple to protect user's privacy. It is not possible to prevent this crash behaviour if the privacy message is missing.

Apple now scans all apps for third party API usage on upload to the store and so all permissions that are possible in the app now **must** have corresponding Privacy descriptions in the Info.plist.
The additional permissions the SDK can use are: 

* Privacy - Calendars Usage Description `NSCalendarsUsageDescription`
* Privacy - Microphone Usage Description `NSMicrophoneUsageDescription`
* Privacy - Photo Library Additions Usage Description `NSPhotoLibraryAddUsageDescription`
* Privacy - Photo Library Usage Description `NSPhotoLibraryUsageDescription`
* Privacy - Location When In Use Usage Description `NSLocationWhenInUseUsageDescription`

All of these permissions are optional and is only needed if the client custom app/blipp is going to use the feature a permission relates to. If your blipp isn't going to add to the calendar, the permission will not be requested at runtime.

The SDK will not request permission automatically for location, it is up to the app to request this permission itself and enable location services on the SDK.

## SDK Registration

### Objective-C

1. Open your AppDelegate.h file.
2. Add the following line at the top of the file below your own import statements:

        #import <BlipparSDK/BlipparSDK.h>

3. Add the BlipparSDKDelegate to your AppDelegate declaration.
        
        @interface AppDelegate : UIResponder <UIApplicationDelegate, BlipparSDKDelegate>

4. Open your AppDelegate.m file. Search for the method `application:didFinishLaunchingWithOptions:`
5. Add the following lines to setup and start the iOS Blippar SDK (you will need your SDK license key to initialise the SDK):

        // Initialise the SDK
        [BlipparSDK setKey: your_license_key];
        BlipparSDK* sdk = [BlipparSDK sharedInstance];
        [sdk addSDKDelegate:self];
        [sdk initialise];

    The initialise function will return to your code immediately, but the initialise process is not complete.  The initialise process will continue in the background and will eventually call the success or failure delegates.  You cannot use any other SDK functions until the onBlipparInitialiseSuccess gets called (see below).

    The Blippar SDK will contact our servers to validate your license key, therefore an internet connection must be available during the initialisation process.  If the internet connection isn't working properly then the SDK will keep trying to validate until it eventually times out after 30 seconds.

    Note: Please keep your key secure.  Do not store it inside your application's plist or any obviously textual files inside your application bundle.
6. Add BlipparSDKDelegate methods to your AppDelegate.m file.

        - (void) onBlipparInitialiseSuccess {
            // You can do anything specific to your app with a successfully initialised SDK.
        }
        
        - (void) onBlipparInitialiseError:(BlipparSDKError *)error {
        
            // Handle any error that may have occurred when trying to initialise the SDK.
            // If your license key is invalid then this function will also be called.
            NSLog(@"%@",error.description);
        }
        
        - (void) onBlipparShutdown {
        
            // You can do anything specific to your app when the SDK is successfully shutdown.
        }

## Swift 3

1. You will need to create an Objective-C bridging header. The Objective-C bridging header is set in Target→Build Settings→Objective-C bridging header. Add the import for the BlipparSDK header.

        #import <BlipparSDK/BlipparSDK.h>

2. Open your AppDelegate.swift file.
3. Add the BlipparSDKDelegate to your AppDelegate declaration.

        class AppDelegate: UIResponder, UIApplicationDelegate, BlipparSDKDelegate

4. Search for `func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool`
5. Add the following lines to setup and start the iOS Blippar SDK (you will need your SDK license key to initialise the SDK):

        BlipparSDK.setKey(appKey)
        let sdk = BlipparSDK.sharedInstance()
        sdk.addSDKDelegate(self)
        sdk.initialise()

    The initialise function will return to your code immediately, but the initialise process is not complete.  The initialise process will continue in the background and will eventually call the success or failure delegates.  You cannot use any other SDK functions until the onBlipparInitialiseSuccess gets called (see below).

    The Blippar SDK will contact our servers to validate your license key, therefore an internet connection must be available during the initialisation process.  If the internet connection isn't working properly then the SDK will keep trying to validate until it eventually times out after 30 seconds.

    Note: Please keep your key secure.  Do not store it inside your application's plist or any obviously textual files inside your application bundle.

6. Add BlipparSDKDelegate methods to your AppDelegate.swift file.

        func onBlipparInitialiseSuccess() {
        
            // You can do anything specific to your app with a successfully initialised SDK.
        }
        
        func onBlipparInitialiseError(_ error: BlipparSDKError) {
        
            // Handle any error that may have occurred when trying to initialise the SDK.
            // If your license key is invalid then this function will also be called.
            print(error.description)
        }
        
        func onBlipparShutdown() {
        
            // You can do anything specific to your app when the SDK is successfully shutdown.
        }

## Connecting SDK to a View Controller 

### Objective-C

You have two options if you want to use the SDK in your app once it has been successfully initialised:

1. (Recommended) In the interface builder add the VC that derives from the `BlipparSDKViewController`:
    1. Create a new ViewController class. In your view controller class header file add the framework import at the top of the file below your own import statements:
            
            #import <BlipparSDK/BlipparSDK.h>

    2. In your view controller class header file make sure that your class derives from BlipparSDKViewController:

            @interface SDKViewController : BlipparSDKViewController

    3. Create or open your storyboard file, and select the view controller you want to be the VC to contain your Blippar SDK view.
    4. Go to the View Identity Inspector and in the **Custom Class** section there change the **Class** of your view controller to the class you have just created (SDKViewController in this example).
    5. Add a view onto the view controller's view. Set the class type to `BlipparSDKView`.
    6. Once you have the `BlipparSDKView` in the storyboard, you can drag from the VC to the view and select the outlet 'BlipparSDKView'.
2. You can create the view controller programatically and push it onto a navigation controller. If you do this then you need to set the BlipparSDKView as the BlipparSDKViewController base class property value.

### Swift 3

You have two options if you want to use the SDK in your app once it has been successfully initialised:

1. (Recommended) In the interface builder add the VC that derives from the BlipparSDKViewController:
    1. Create a new ViewController class. In it's header file make sure that your class derives from `BlipparSDKViewController`:

            class BlipparSDKViewController: BlipparSDKViewController

    2. Create or open your storyboard file, and select the view controller you want to be the VC to contain your Blippar SDK view. 
    3. Go to the View Identity Inspector and in the **Custom Class** section there change the **Class** of your view controller to the class you have just created (SDKViewController in this example).
    4. Add a view onto the view controller's view. Set the class type to `BlipparSDKView`.
    5. Once you have the `BlipparSDKView` in the storyboard, you can drag from the VC to the view and select the outlet 'BlipparSDKView'.
2. You can create the view controller programatically and push it onto a navigation controller. If you do this then you need to set the BlipparSDKView as the BlipparSDKViewController base class property value.

### Adding an SDK View to a View Controller

To see the camera and AR experiences in the Blippar SDK you need to add a BlipparSDKView to your View Controller. It can be added either using Interface Builder or programmatically.

### Adding an BlipparSDKView to a View Controller Using Interface Builder

1. To add Blippar SDK view to your view controller, create or open your storyboard/xib file, select the view controller you want to modify and add a new **View** to it.
2. Go to the View Identity Inspector and in the **Custom Class** section there change the **Class** to _BlipparSDKView_.
3. We recommend that the _BlipparSDKView_ is put behind all other views. Currently only fullscreen views are supported.

> ![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) BlipparSDKView MUST be added as full screen, i.e. match the screen width and height. Running a different size BlipparSDKView will likely result in SDK and blipps unpredictable behaviour and decrease in overall stability of the SDK.

### Adding an SDK View to a View Controller Programmatically

#### Objective-C

1. In your ViewController class search for the method `viewWillAppear:animated`.
2. Add following code there:

        BlipparSDKView* blippView = [[BlipparSDKView alloc] initWithFrame:self.view.bounds];// Blippar SDK is meant to be run full screen. Running it in resized view will cause issues in content display.
        [self.view addSubview:blippView];

#### Swift 3

1. In your ViewController class search for the method `viewWillAppear(_ animated: Bool)`.
2. Add following code there:

        // Blippar SDK is meant to be run full screen. Running it in resized view will cause issues in content display.
        let blippView = BlipparSDKView(frame: view.bounds)
        view.addSubview(blippView)

## Using an SDK View in Your App

Introducing a BlipparSDKView to a view controller is not enough to start displaying blipps. To display a blipp you need to override several SDK callbacks. The provided _BlipparSDKViewController_ takes care of a lot of functionality for you but you can override behaviour yourself. Here is an example of what should be done.

### Objective-C

1. In your view controller class search for the method `viewDidLoad`.
2. Add the following lines to setup and start the Blippar SDK:

        BlipparSDK* blipparSDK = [BlipparSDK sharedInstance];
        [blipparSDK addSDKDelegate:self];

3. Override the `BlipparSDKDelegate onBlipparInitialiseSuccess` callback (assuming your View Controller is implementing the BlipparSDKDelegate protocol):

        - (void) onBlipparInitialiseSuccess {
            [super onBlipparInitialiseSuccess];
        
            BlipparSDK* blipparSDK = [BlipparSDK sharedInstance];
            [blipparSDK startDetection];  //Camera view screenshots will only be sent for recognition after this method is called
        }

4. That's it! The base _BlipparSDKViewController_ will take care of the rest. It automatically handles detection and starting of blipps. If you need to close a blipp just call 

        [self closeCurrentBlipp];
    Should you want to do some more complex behaviour then you can start implementing the _BlipparDetectionDelegate_ and _BlipparBlippDelegate_ protocols yourself.

### Swift 3


1. In your view controller class search for the method `viewDidLoad`.
2. Add the following lines to setup and start the Blippar SDK:

        let sdk = BlipparSDK.sharedInstance()
        sdk.addSDKDelegate(self)

3. Override the `BlipparSDKDelegate onBlipparInitialiseSuccess` callback (assuming your View Controller is implementing the _BlipparSDKDelegate_ protocol):

        override func onBlipparInitialiseSuccess() {
            super.onBlipparInitialiseSuccess()
        
            let sdk = BlipparSDK.sharedInstance()
            sdk.startDetection()
        }

4. That's it! The base _BlipparSDKViewController_ will take care of the rest. It automatically handles detection and starting of blipps. If you need to close a blipp just call

        closeCurrentBlipp()

    Should you want to do some more complex behaviour then you can start implementing the _BlipparDetectionDelegate_ and _BlipparBlippDelegate_ protocols yourself.

## Adding a SDK Debug View to Your App

If you want to add the SDK debug view to your app, simply add a new view to your Blippar view controller's view and set the class type to `BlipparSDKDebugView`.

## Testing Your App

Once you have a running app you may wish to test against some real markers. See the provided Sample Markers document.

In your AppDelegate method _onBlipparInitialiseSuccess_ add the SDK's `debugTestBlippsEnabled` flag and set this to true in order to see the sample markers.

Make sure you turn off this flag (it's default is off) before releasing your app to the public.

You can also change the log level of the SDK, this may be helpful to see more detailed logs.

### Objective-C

    BlipparSDK* sdk = [BlipparSDK sharedInstance];
    sdk.debugTestBlippsEnabled = YES;
    [BlipparSDK sharedInstance].logLevel = BlipparLogLevelDebug;

### Swift 3

    let sdk = BlipparSDK.sharedInstance()
    sdk.debugTestBlippsEnabled = true
    sdk.logLevel = .debug

## Sample Apps

Try out the provided sample apps [here](../../samples).

You can scan the [Sample Markers](../../samples/sample-markers.md) to see the sample app in action.

They are an example of the most basic integration of the SDK, in Objective C and Swift.

You can put in your provided app key in _AppDelegate.m_ or _AppDelegate.swift_

You will also need to change the bundle id to your licensed bundle id to validate the SDK. You can do this in General → Bundle Identifier.

To deploy to a device you'll also need to select a development team as usual in iOS development.
