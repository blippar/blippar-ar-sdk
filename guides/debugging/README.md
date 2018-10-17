# Debugging Utilities

## Sideloading of blipp content

In order to speed up development of blipps it is possible to transfer blipp content directly over to the device and not have to upload to Hub each time a change is made. See the [Blippar SDK - Sideloading](debugging-testing-blipps-sideloading.md) document for more info.

## The BlipparSDK Debug View

The Debug View is a native UI view that sits on top of the SDK's 3d view. It is useful for seeing logs directly on the device and has a host of other useful debugging functionality. The debug view shows you statistics and logs from your blipp and you can also toggle various visual options to help debug your blipp. Also contains developer functionality such as clearing app caches, including sideloading cache.

See the [Blippar SDK - Debug View](debugging-debug-view.md) document for more detail.

## Logging Filtering

By default only warning and error messages are displayed in the Console on iOS and Android. The SDK has more verbose logging, occasionally you may want more detail if looking into a problem etc., changing the log level on the SDK can be done by:

### iOS - Objective C

    [BlipparSDK sharedInstance].logLevel = BlipparLogLevelDebug;

### Android - Java

    Blippar.getSDK().setLogLevel(LogLevel.Debug);

## Test blipps for SDK validation

There are a few blipps that are blippable by all third party SDK apps. This allows a user to verify that the SDK is up and running. 

See the [Blippar SDK - Sample Markers](../../samples/sample-markers.md) document for more detail.

## The Telnet Console

This allows you to set the statistics, logs and other useful information from your running instance of the SDK from your desktop connecting remotely to the device. 

See the [Blippar SDK - Telnet Console](debugging-telnet-console.md) document for more detail.