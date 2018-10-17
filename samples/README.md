# The Blippar SDK Sample Apps

This directory contains the sample iOS and Android apps to show how to use the Blippar SDK.

WARNING! The iOS or Android apps do not contain the Blippar SDK libraries itself, you must put the library into the project yourself.

## iOS

Both Objective C and Swift examples are provided.

Put your BlipparSDK.framework file into the project's `BlipparSDK` directory.

To run the samples you need to setup your development team. To do this go into Project->Targets->Signing and Teams section.

## Android

Both Java and Kotlin examples are provided.

Put your blipparsdk.aar file into the project's `blipparsdk` directory.

The apps are not set up for signing, you will need to enable this yourself.

## Examples

### Basic

This shows a very basic integration of the BlipparSDK. It has the camera feed displayed and is scanning continually. No fancy animation is added during detection.

When a blipp is detected it launches the blipp and enables a UI button to close the blipp again.

You can try [these images](https://developer.blippar.com/portal/sdk/guides/sample-markers) to test scanning.

More examples to be added soon!