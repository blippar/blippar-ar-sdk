# Blipping

Before reading this be sure to read [Detection](detection.md)

A blipp can be launched in two ways, either as a result of a detection result matching a marker or programatically using a known blipp identifier.

Using the in-built behaviour of the provided view controller or fragment as soon as a blipp entity descriptor is detected it is automatically launched and detection is suspended until it closes.

A user can decide to launch a blipp by programatically creating a blipp entity descriptor and passing that to `launchBlipp` in the SDK.

## Blipp Contexts

The blipp launch process is heavily asynchronous, launching a blipp takes some time as it goes through a number of different stages. When `launchBlipp` is called it returns a blipp context from the SDK.

This context does not wrap up an actual running instance of a blipp initially, only when a number of stages are complete is there an actual blipp being rendered. 

The provided view controller/fragment caches the launched blipp automatically. It is possible to get (and even set) the blipp context on the VC if desired. 

See diagram below that illustrates the different stages from invoking `launchBlipp`:

![Blipp Startup Diagram](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/blipp-startup-diagram-1.png)

Some notes on the diagram above:

* _Force blipp script download_: it is possible to force launchBlipp to always download the latest blipp script, regardless of what is cached on disk. Set `invalidateCache` to true in the _LaunchConfig_ object passed into `launchBlipp`.
* _Script Download Phase_: before a blipp is executed the SDK must download various pre-requisites such as the Blippbuilder Script scripts, the Blippbuilder Script library listed in the package.json for the blipp (if not already cached from another blipp) and fetch the tracking data. Only when these have been downloaded can a blipp execute. Once the fetch is started the app is notified with the `onBlippLoading` callback. Networking they can fail of course, the app is notified of failures via the `onBlippError` callback.
* _Tracking_: Most blipps require tracking to be acquired before launching a blipp. After downloading script pre-requisites the SDK is ready to launch the blipp, but there can be a period of time where the SDK is waiting for the tracker to lock onto the desired target. The app will receive the `onBlippWaitingForTrackingLock` callback to indicate this. There may be situations where you may want to launch a blipp without waiting for tracking. For example, a blipp may be designed to be entirely 2d and not require tracking features at all, or a marker may be quite poor to track and rather than having a poor experience you may want to launch immediately after the blipp script pre-requisites are downloaded. To indicate whether tracking is required or not, set the launch mode appropriately in your launchBlipp call.
* The SDK is now ready to run a blipp. The blipp launch and execution process is also highly asynchronous and has it's own internal states. 

At any point during this load process it is possible to close a context, this will cancel the launch altogether. The blipp state listener can inform the app of the state of the blipp as it transitions during the loading states.

## Launching a blipp programatically

Sometimes detection isn't needed to launch a blipp, it may be required to launch a blipp programatically. It is possible to create an `EntityDescriptor` programatically and use that in `launchBlipp`. To launch the blipp you first need to get the blipp address from Hub. It can be copied using the 'i' button in the blipp view.

**Objective C**

    NSString* blippAddress = @"abcdefgh";
    BlipparSDKEntityDescriptor *descriptor = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress];
           
    BlippLaunchConfig *config = [[BlippLaunchConfig alloc] init];
    // Load from cache if present or always ask the server for the latest blipp
    // Loading from cache is faster but can become out of date
    // You can potentially do this once a day, or use some similar heuristic
    BOOL invalidateCache = YES;
    config.invalidateCache = invalidateCache;

    // BlippLaunchModeNow is required for programatic launching
    BlipparSDKBlippContext* context = [[BlipparSDK sharedInstance] launchBlipp:BlippLaunchModeNow descriptor:descriptor config:config];

**Java**

    String blippAddress = "abcdefgh";
    EntityDescriptor descriptor = EntityDescriptorFactory.createFromAddress(blippAddress);
    LaunchConfig config = new LaunchConfig();
    // Load from cache if present or always ask the server for the latest blipp
    // Loading from cache is faster but can become out of date
    // You can potentially do this once a day, or use some similar heuristic
    boolean invalidateCache = true;
    config.setInvalidateCache(invalidateCache);
    // BlippLaunchMode.Now is required for programatic launching
    BlippContext context = Blippar.getSDK().launchBlipp(BlippLaunchMode.Now, descriptor, config);

There can be many markers associated with a blipp, and different functionality is unlocked depending on which is used. If the `EntityDescriptor` is created with the address, a marker is chosen at random and used for launching the blipp. To specify exactly which marker you require to launch a blipp then in Hub click into the marker and find the 'ID' listed on the page. Then you can create the `EntityDescriptor` using that markerID:

**Objective C**

    BlipparSDKEntityDescriptor *descriptor = [BlipparSDKEntityDescriptor entityWithAddress:blippAddress andMarkerID:blippMarkerId];

**Java**

    EntityDescriptor descriptor = EntityDescriptorFactory.createFromParameters(blippAddress, blippMarkerId);

A word of warning however, when markers are altered (even a single pixel), a new marker ID is generated in Hub. If using a marker ID that doesn't exist any more the blipp won't launch.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png)  The provided BlipparSDKFragment and BlipparSDKViewController cache the blipp context locally so it can perform certain operations on it. They automatically pick up on launched blipps, however it is possible to set the blipp context using the public property/setter. It is preferrable to manually set the context on the VC/fragment if possible.

## Blipp Execution States

A blipp is made up of one or more scenes, with the 'default' scene being the first scene that's launched. When a blipp is launched the JS script is interpreted and the SDK asks the current scene what assets are required to execute. 

The SDK then checks the local device storage for the presence of these assets. If any are missing the SDK requests them from the server. This asset fetching phase happens per scene and can vary depending on the assets required for the experience. During this phase a client app will receive the `onBlippLoadingProgress` callback with a percentage value. Part of the loading phase is reserved for unpacking and loading of the assets into the CPU. The SDK provides a circular loading spinner that tracks onto the marker that indicates the current loading progress. Only when the assets have been downloaded does the blipp begin to execute. 

### Peel

When a blipp loses tracking there are a couple of different options. The default behaviour is that the AR content 'peels' away from the tracked surface and sticks to the camera. When tracking is re-acquired the content will stick onto the tracked object once more. There are many ways to customise peel, such as the size, offset, orientation and scale.

It is possible to disable peel altogether. When this happens the blipp enters a suspended state known as Expiry.

### Expiry

Expiry is when a blipp has disabled peel. Once a blipp loses tracking it enters a state where everything is suspended (including sounds, video, animations) and the content is not rendered. A timer is started and if tracking is not reacquired after a period of time then the blipp is closed. If tracking is reacquired then the blipp resumes exactly where it suspended.

Transitions between tracking (Normal), peel and expiry are relayed to the app via the onBlippRunning callbacks.

![Blipp Execution Diagram](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/blipp-execution-sequence-1.png)

## Blipp Closure

Blipps can be closed in two ways. A blipp can close itself via a JS command or a user can invoke a method on the blipp context to close it. The provided view controller/fragment also has a function `closeCurrentBlipp` which wraps up the close call on the current blipp context.  

When closure is started the app receives a callback via the `onBlippClosing` callback.

> Only when all handles to blipp contexts are released does a blipp fully release all it's resources. Closure of a blipp is not immediate. Resources are freed and returned to the system and this happens asynchronously. When a blipp has closed an app can receive the onBlippClosed event.
