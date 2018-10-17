# Face Tracking

By default whenever face tracking is enabled in an app the default system face tracking is used. On Android this uses Google's [Mobile Vision](https://developers.google.com/vision/) library to provide the tracking data. This is reasonable for very simple scenarios but often more complex tracking features are required.

Blippar has a proprietry face tracking solution in the SDK which can be activated using the [setFaceTracking](https://developer.blippar.com/portal/ar-api/documentation/method/Blipp/setFacetracking/) command and passing through the 'enhanced' mode.
To activate this tracking solution in the BlipparSDK, a trained dataset file is searched for at SDK startup.  If it is found then the enhanced mode is enabled, if not found tracking will revert to the system tracking.

Please contact Blippar support to obtain the face tracking dataset.

Once you have the dataset it should be placed in the `src/main/assets` folder for your app. Below is a snippet of gradle to add the assets folder to your build process:

    android.sourceSets {
        main {
            assets.srcDirs = ['src/main/assets']
        }
    }
