# Integration Guide - Android

## Requirements

Blippar Android SDK should be linked as a part of an Android project in Android Studio or another Android IDE.
The SDK supports Android 4.4 or later, you need to build your app with Android SDK Revision 19.0.0 (API Level 19) or later. The SDK is built with a target SDK version of 27.

The SDK contains four architectures: _armeabi-v7a, arm64-v8a, x86\_64 and x86_.

Currently, the BlipparSDK only supports full screen portrait mode. This can be set in the activity xml or programmatically.

## Distribution

The Android SDK bundle is distributed as an AAR module file.

## License Key

You must obtain a license key from Blippar to use the SDK in your app.  This key must be embedded into your app source code and then given to the SDK during its initialisation (this is shown in the example below.)

If you have more than one app then you will need separate keys for each app.

## Linking

Assuming you are using Android Studio 1.3 or later please follow the following steps to import the Android SDK to your project:

1. Save the provided .AAR file locally.
2. Open the project you want to use SDK with.
3. Import a local .AAR file via the following menu: File>New>New Module>Import .JAR/.AAR Package.

This should automatically add the following line to your app build.gradle file under dependencies section:

    dependencies {
        ...
        implementation project(':blipparsdk')
        ...
    }

where `:blipparsdk` is the name you have given to the Blippar SDK module.

If this line has not been added automatically, please add it manually. 

    Error:Execution failed for task ':app:processDebugManifest'.
    > Manifest merger failed : Attribute application@theme value=(@style/AppTheme) from AndroidManifest.xml:11:9-40
        is also present at [:blipparsdk] AndroidManifest.xml:11:18-49 value=(@style/SDKTheme).
        Suggestion: add 'tools:replace="android:theme"' to <application> element at AndroidManifest.xml:5:5-19:19 to override.

If you add the following line to your AndroidManifest.xml <application> tag:

    tools:replace="android:theme"

If tools appear in red in Android Studio then may need to hover over tools and hit alt+enter to automatically import the correct namespace.

## Permissions

The SDK requires following basic permissions to function:

* the camera
* internet
* network state

Without these the SDK will not function.

There are a few **optional** permissions. The SDK will function without them, but if the blipp requires one or several optional permissions to function correctly, it may not work and even crash at runtime if permissions are not granted.

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) It is recommended you only acquire the permissions you know your app needs to run blipps. If you know your blipp while running in your custom app won't be saving or picking photos from the gallery/Photos then you should not acquire the permission.

When targeting Marshmallow or higher the optional permissions are requested from the SDK dynamically at runtime, if not already granted. This only happens at the point at which an operation that requires the permission is performed in the blipp. The one exception to this is the location permission, this must be explicitly acquired by the client app and is never requested by the SDK. You can overload the text used for the various permission prompts if desired.

If targetting earlier versions than Marshmallow then you'll need to request the permissions up front in your _AndroidManifest.xml_ (see below):

    <!-- Mandatory permissions -->
    <uses-feature
        android:name="android.hardware.camera"
        android:required="true"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    <uses-permission android:name="android.permission.VIBRATE"/>
    
    <!-- Optional permissions -->
    
    <!-- Used when writing photos taken within a blipp to the Photos/Gallery app -->
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE" />
    <!-- Used to read from Photos/gallery when a blipp wants to choose an existing photo -->
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" />
    
    <!-- Used when performing video recording within a blipp -->
    <uses-feature
            android:name="android.hardware.microphone"
            android:required="false" />
    <uses-permission android:name="android.permission.RECORD_AUDIO"/>
    
    <!-- Blipps can vibrate the device using a JS API -->
    <uses-permission android:name="android.permission.VIBRATE" />
    
    <!-- Location permissions -->
    <uses-feature
        android:name="android.hardware.location"
        android:required="false" />
    <uses-feature
        android:name="android.hardware.location.network"
        android:required="false" />
    <uses-feature
        android:name="android.hardware.location.gps"
        android:required="false" />
    <!-- Used for determining the user's location. Must still be enabled via the SDK setLocationEnabled API -->
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION" />
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION" />

## Dependencies

The SDK has a few dependencies. Some of these are optional and only needed if your app uses the feature that is associated, for example if your app does not need location services or face tracking then you can leave out the Google Play Services. The following gradle commands are for Android Plugin for Gradle 3.0.0 or higher. It is possible to use the Blippar SDK for older gradle plugins but is recommended to upgrade to the latest if possible.

    // For kotlin (see kotlin gradle-guide for other gradle requirements)
    implementation "org.jetbrains.kotlin:kotlin-stdlib-jdk7:$kotlinVersion"
    // For SDK user interface
    implementation "com.android.support:support-core-utils:${androidSupportLibVersion}"
    implementation "com.android.support:design:${androidSupportLibVersion}"
    implementation "com.android.support:preference-v14:${androidSupportLibVersion}"
    // For loading images from Photos/gallery and knowing the correct orientation of the asset
    implementation "com.android.support:exifinterface:${androidSupportLibVersion}"
    // For local PDF rendering
    implementation "com.android.support:recyclerview-v7:${androidSupportLibVersion}"
    implementation "com.squareup.picasso:picasso:${picassoVersion}"
    // Face detection/tracking
    implementation "com.google.android.gms:play-services-vision:${googlePlayServicesLibVersion}"
    //  Required by Location Services
    implementation "com.google.android.gms:play-services-location:${googlePlayServicesLibVersion}"
    // Required for ARCore
    implementation "com.google.ar:core:${arcoreLibVersion}"

The Blippar SDK uses **Kotlin**. See [this guide](https://kotlinlang.org/docs/reference/using-gradle.html#targeting-android) on how to add Kotlin to your app. See the dependencies below for the Kotlin version used in the SDK, you will need to match Kotlin versions.

If the target app uses the same dependencies on the app level as the SDK then the version of the library must match. If they do not then there can be undefined behaviour and crashing at runtime due to different APIs being called in the app vs. the SDK.
The SDK provides a mechanism for the app to specify what version of the library to use but is built against specific versions of the library.
The below snippet shows the default value for all the SDK libraries, you can copy and paste it into your top level build.gradle and be sure that the app will match the SDK:

    project.ext {
        buildToolsVersion = '27.0.3'
        supportLibVersion = '27.1.1'
        googlePlayServicesVersion = '12.0.1'
        picassoVersion = '2.5.2'
        arcoreVersion = '1.3.0'
        kotlinVersion = '1.2.61'
    }

It is most likely ok to upgrade patch revisions of libraries but not recommended to upgrade major or even minor revisions, due to interface changes that may happen in these new libraries.

### ARCore

If using ARCore in the target app then even with the SDK it **must** have the ARCore library added in the _app_ build.gradle file. When initialising the ARCore system checks if the ARCore app is installed on the device from the Play Store, if not it prompts the user to install it. If the app does not have the ARCore dependency present then this check always fails in ARCore.
Adding ARCore to the app and having it in the Blippar SDK causes a conflict with the ARCore native libraries at build time, there are two versions of the native libraries.

If you see the error `More than one file was found with OS independent path: 'lib/arm64-v8a/libarcore_sdk_c.so'` then add the following to the app's build.gradle `android` section:

    android {
        packagingOptions {
            pickFirst 'lib/arm64-v8a/libarcore_sdk_c.so'
            pickFirst 'lib/armeabi-v7a/libarcore_sdk_c.so'
            pickFirst 'lib/x86_64/libarcore_sdk_c.so'
            pickFirst 'lib/x86/libarcore_sdk_c.so'
        }
    }

## Proguard

The SDK gradle defines a proguard configuration using the `consumerProguardFiles 'blipparsdk_proguard-project.pro`.

This means there is nothing special you should need to do.

## SDK Registration

### Java / Kotlin

1. Open (or create) your _Application_ class/Kotlin file.
2. Add the following line at the top of the file below your own import statements (Android Studio does this automatically for you)
        import com.blippar.ar.android.sdk.Blippar;
3. Search for the callback `onCreate()` or override it.
4. Add the following lines to setup and start the Android Blippar SDK:
        super.onCreate();
        
        Blippar.setApplication(this);
        Blippar.setKey("enter your license key here");

Note: Please keep your key secure.  Do not store it inside any obviously textual files inside your application bundle.

## Integrating SDK Fragment in an Activity 

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) As Blippar SDK is using a camera feed to display an AR experience we assume that developer has taken care of getting the camera permission. Launching the SDK without camera permission will crash the app. Location permission is optional and is only needed if the client's custom app is going to display a location-based AR experience. See the `Permissions` chapter in this document for more detail.

>`BlipparSDKFragment` must be full screen. If using an ActionBar see this document on how to achieve overlaying of content http://android.xsoftlab.net/training/basics/actionbar/overlaying.html

>See this document on how to hide the status bar https://developer.android.com/training/system-ui/status.html 

>If using AppCompat you will need to use `windowActionBarOverlay` as opposed to the android namespaced one in your activity/app's theme in xml.

>If you do not make the view full screen then certain undesirable resizing of blipp content can happen on backgrounding and foregrounding of the app. We will fix this issue in a future release of the SDK.

### Adding SDK Fragment Through the Activity XML Layout File

#### Java

1. In the activity .xml file add a fragment with the class property set to `com.blippar.ar.android.sdk.BlipparSDKFragment`. Alternatively, create the fragment programmatically based on the BlipparSDKFragment class, there is a convenience static `BlipparSDKFragment.create()` function.
2. To control the SDK lifecycle you need to create an SDK observer and override its default callbacks. Use the onInitialiseSuccess callback to start blipp detection:

        private final BlipparSDK.BlipparSDKListener blipparSDKListener = new BlipparSDK.BlipparSDKListener() {
            @Override
            public void onInitialiseSuccess() {
                final BlipparSDK sdk = Blippar.getSDK();

                // after the SDK is initialised, start detection and rendering
                // You can add other kinds of detectionTypes with the other startDetection variant
                sdk.startDetection();
            }

            @Override
            public void onInitialiseError() {
            }

            @Override
            public void onShutdown() {
            }
        };

3. In the activity class add an observer for the SDK:

        Blippar.getSDK().addSDKListener(blipparSDKListener);

4. Don't forget to remove the observer after it is not used anymore (overriding `onDestroy` callback would be a good place for that):

        protected void onDestroy() {
            super.onDestroy();

            // when destroying the activity, remove the lifecycle observer
            Blippar.getSDK().removeSDKListener(blipparSDKListener);
        }

#### Kotlin

1. In the activity .xml file add a fragment with the class property set to `com.blippar.ar.android.sdk.BlipparSDKFragment`. Alternatively, create the fragment programmatically based on the BlipparSDKFragment class, there is a convenience static `BlipparSDKFragment.create()` function.
2. To control the SDK lifecycle you need to create an SDK observer and override its default callbacks. Use the onInitialiseSuccess callback to start blipp detection:

        private var mBlipparSDKListener = object : BlipparSDK.BlipparSDKListener {
            override fun onInitialiseSuccess() {
                // Start detection with just markers
                // You can add other kinds of detectionTypes with the other startDetection variant
                Blippar.getSDK().startDetection()
            }
        
            override fun onInitialiseError(error: InitialisationError) {
                Toast.makeText(this@MainActivity, "Unable to initialise SDK with error: " + error.toString(), Toast.LENGTH_LONG).show()
                Log.e(LogTag, "Unable to initialise SDK with error: " + error.toString())
            }
        
            override fun onShutdown() {
                // Cleanup and remove the listener now
                Blippar.getSDK().removeSDKListener(this)
            }
        }

3. In the activity class add an observer for the SDK:

        Blippar.getSDK().addSDKListener(mBlipparSDKListener)

4. Don't forget to remove the observer after it is not used anymore (overriding onDestroy callback would be a good place for that):

        override fun onDestroy() {
            super.onDestroy()
        
            // Remove our listeners
            Blippar.getSDK().removeSDKListener(mBlipparSDKListener)
        }

### Blipp Lifecycle

#### Java

To respond to the blipp lifecycle you need to implement a blipp state listener.

1. Create a blipp event listener object based on the BlippStateListener class. It has several callbacks that will allow you to follow the blipp lifecycle events: `onBlippLoading`, `onBlippError`, `onBlippRunning`, `onBlippWaitingForTrackingLock`, `onBlippClosing`, `onBlippEvent` and `onBlippClosed`.

        private final BlippStateListener mBlippStateListener = new BlippStateListener() {
        
            @Override
            public void onBlippLoading(BlippContext context) {
                // Blipp has started loading
            }
            
            @Override
            public void onBlippWaitingForTrackingLock(BlippContext context) {
                // Blipp is waiting for the tracker to lock onto the target before loading 
            }
            
            @Override
            public void onBlippLoadingProgress(BlippContext context, int progress) {
                // Blipp is loading with the visible progress spinner
            }
        
            @Override
            public void onBlippError(BlippContext context, BlipparSDKBlippErrorType errorType) {
                // Blipp has failed to trigger with the given error
            }
        
        
            @Override
            public void onBlippRunning(BlippContext context, BlippRunningState runState) {
                // Blipp is running in the given state
            }
        
            @Override
            public void onBlippClosing(BlippContext context) {
                // Blipp has begun closing
            }
        
            @Override
            public void onBlippClosed(BlippContext context) {
                // Blipp is closed
            }

            @Override
            public boolean onBlippEvent(BlippContext blippContext, String eventName, JSONObject jsonObject) {
                // Blipp to app events will come through here. This app is not interested in these
                // Return true to indicate that the app has handled the event
                return false;
            }
        };

2. You can cache the blippcontext provided by the `BlippEventListener.onBlippLoading` callback to control the Blipp lifecycle. However, the BlipparSDKFragment already does this so beware that cache the context may cause reference problems if you don't release it correctly. The BlipparSDKFragment there is a public function to close the currently running blipp called `closeCurrentBlipp`.

#### Kotlin

To respond to the blipp lifecycle you need to implement a blipp state listener.

1. Create a blipp event listener object based on the BlippStateListener class. It has several callbacks that will allow you to follow the blipp lifecycle events: `onBlippLoading`, `onBlippError`, `onBlippRunning`, `onBlippWaitingForTrackingLock`, `onBlippClosing`, `onBlippEvent` and `onBlippClosed`.

        private val mBlippStateListener = object : BlippStateListener {
            override fun onBlippLoading(blippEngineContext: BlippContext) {
                // Blipp has started loading
            }
        
            override fun onBlippWaitingForTrackingLock(context: BlippContext) {
                // Blipp is waiting for the tracker to lock onto the target before loading 
            }
        
            override fun onBlippLoadingProgress(context: BlippContext, i: Int) {
                // Blipp is loading with the visible progress spinner
            }
        
            override fun onBlippError(context: BlippContext, blipparSDKBlippErrorType: BlipparSDKBlippErrorType) {
                // Blipp has failed to trigger with the given error
            }
        
            override fun onBlippRunning(context: BlippContext, runningState: BlippRunningState) {
                // Blipp is running in the given state
            }

            override fun onBlippEvent(context: BlippContext, eventName: String, jsonObject: JSONObject) [
                // Blipp to app events will come through here. This app is not interested in these
                // Return true to indicate that the app has handled the event
                return false;
            ]
        
            override fun onBlippClosing(context: BlippContext) {
                // Blipp has begun closing
            }
        
            override fun onBlippClosed(context: BlippContext) {
                // Blipp is closed
            }
        }

    Register with the SDK

        Blippar.getSDK().addBlippStateListener(mBlippStateListener)
        
    Make sure you remove the listener e.g. in `onDestroy()`
2. You can cache the blippcontext provided by the `BlippEventListener.onBlippLoading` callback to control the blipp lifecycle. However, the BlipparSDKFragment already does this so beware that cache the context may cause reference problems if you don't release it correctly. The BlipparSDKFragment there is a function to close the currently running Blipp called `closeCurrentBlipp`.

## Integrating the Debug View

* Add `com.blippar.ar.android.DebugView` to your view/activity. Ideally, it would be full screen and on top of everything else.
* The DebugView can be toggled (slid in and out) by tapping the bottom of the UI. It will slide down and reveal other options.
* The debug view really is only useful when in a blipp but there are some helpful options within the 'More..' overflow menu.

## Testing Your App

Once you have a running app you may wish to test against some real markers. See the provided Sample Markers document.

Once the SDK has been initialised call the SDK's `setDebugTestBlippsEnabled` function and set this to true in order to see the sample markers.

Make sure you turn off this flag (by default it is off) before releasing your app to the public.

It is also possible to increase the verbosity of the logging system within the SDK.

## Sample Apps

Try out the provided sample apps [here](../../samples).

You can scan the [Sample Markers](../../samples/sample-markers.md) to see the sample app in action.

They are an example of the most basic integration of the SDK, in Java and Kotlin.

You need to provide your own key and change the package name to remove the demo watermark. You can provide your key in _App.java_ or _App.kt_.

You will also need to change the package name in the _AndroidManifest.xml_ or _build.gradle_ to your licensed package name to validate the SDK.