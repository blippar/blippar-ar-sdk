# Location

The BlipparSDK has a few different location APIs. It is possible from the blipp to do single-shot or continuous location tracking of a user. It is also possible to get their longitude and latitude and use this to get their address using reverse geo code. For more see the following script APIs:

[setLocationSeekMode](https://developer.blippar.com/portal/ar-api/documentation/method/Blipp/setLocationSeekMode)

[reverseGeocode](https://developer.blippar.com/portal/ar-api/documentation/method/Blipp/reverseGeocode)

[Geo Object](https://developer.blippar.com/portal/ar-api/documentation/#class/Geo)

[onLocationChange](https://developer.blippar.com/portal/ar-api/documentation/method/Scene/onLocationChange/)

## Enabling Location Services In The SDK

Unlike other permissions, the BlipparSDK does not acquire location permissions on your behalf. Due to the sensitive nature of this permission - it is left to the app to acquire. Also there are different kinds of permissions an app can obtain, you need to decide what suits your requirement best.

Even when location permissions are acquired the SDK does not use them by default, you must explicitly opt-in to their usage.

Enabling location services starts a single shot location search to try and find a good 'lock' on the device position. This data is then available once a blipp starts in the [Geo Object](https://developer.blippar.com/portal/ar-api/documentation/#class/Geo).

Setting location services to be disabled at any time will stop any pending location lookups.

### iOS

**Objective C**

    [BlipparSDK sharedInstance].locationServicesEnabled = YES;

### Android

**Java**

    Blippar.getSDK().setLocationServicesEnabled(true);

You need to integrate the Google Play Location Services library into your gradle file. See the [Android integration](android/README.md) document for more.
The BlipparSDK will crash if the Google Play Location Services library is not found. Be very careful to use the same version as the BlipparSDK as a different version may cause runtime crashes.