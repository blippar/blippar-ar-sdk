# Face Tracking

By default whenever face tracking is enabled in an app the default system face tracking is used. On iOS this uses Apple's [CIDetector](https://developer.apple.com/documentation/coreimage/cidetector) API to provide the tracking data. This is reasonable for very simple scenarios but often more complex tracking features are required.

Blippar has a proprietry face tracking solution in the SDK which can be activated using the [setFaceTracking](https://developer.blippar.com/portal/ar-api/documentation/method/Blipp/setFacetracking/) command and passing through the 'enhanced' mode.
To activate this tracking solution in the BlipparSDK, a trained dataset file is searched for at SDK startup. If it is found then the enhanced mode is enabled, if not found tracking will revert to the system tracking.

Please contact Blippar support to obtain the face tracking dataset.

Once you have the dataset it should be added to the project. Make sure that the dataset has a Target Membership set to the target app see screenshow below:

![Target Membership](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/target-membership-dataset.jpg)