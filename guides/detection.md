# Detection

## The Detection Process

Detection is a core feature of the Blippar SDK. When detection is enabled the SDK sends compressed camera images to the Blippar image recognition servers up to four times a second, network bandwidth allowing. The server does image recognition on these images and if matches are found, they are returned to the SDK and passed to the client app via callbacks (`onDetectionResults` and `onDetectionNoResults`). The client app can then iterate over these results (see _Entities_ below) and take appropriate action; such as launch a blipp. By default the SDK will continuously send images to the server sequentially, one after another until told to stop or until a blipp launches. It is possible to use a 'single-shot' detection approach (via a UI button perhaps) where the app will scan until either the server has responded with a match or not. This can be done by implementing the detection callbacks in the client app and stopping detection appropriately. Detection is an intensive process, it uses device bandwidth and resources to constantly send images up to the server, it is recommended you use it only when required.

A client app can receive callbacks (`onDetectionNoResults`) when detection fails or doesn't find any matches with a reason as to why it failed. Reasons include: bad/no internet connection, camera image is too dark, device is moving too quickly, the image lacks any detail. These can be useful to display UI to direct the user to take action.

Camera images are also sent to the image and face trackers (if active) on the device for processing.

![Detection Process Overview](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/detection-process.png)

## What is detected

There are a few different modes of detection:

* **Default** detection detects markers and VS entities. Everything will be detected including barcodes and barcode markers
* **Markers**. In this mode only markers as set up in the Hub CMS system are being detected in the SDK.
* **Barcodes**. Barcode detection is device-side only. The SDK looks at images coming from the camera and looks for common barcodes in the image, such as EAN-8, EAN-13.
    >Note: Barcodes only work if the device is held approximately parallel or at right angles to the barcode.
* **Barcode Markers**. It is possible to associate a barcode with a blipp. To do so see the publishing a blipp section of the documentation and associating a barcode. When barcodes are detected on the device they are sent to the server alongside the camera image. If a barcode is associated with a blipp the blipp is started immediately, that is without waiting for a tracking lock.

## Entity Descriptors

Entity descriptors wrap up of different types of SDK entities, such as blipp marker detections, barcodes and visual search objects.

The `onDetectionResults` callback will receive a list of entities that have been recognised. There are blipps, barcodes or visual search entities that match based on the sent camera image. Each entity descriptor has an associated type and data specific to that type. The most commonly used type of entity is a blipp descriptor, which can used to launch blipp experiences with the SDK.

The default SDK view controller/fragment that is included with the SDK automatically launches blipps from any blipp entity descriptors found during detection, i.e. blipps set up in the Hub CMS. This behaviour can be altered if desired by overloading the implementation of the detection callbacks in the app's own code.

It is also possible to programatically create Blipp entity descriptors from information, such as a Blipp's identifying "Address".  You can then launch the corresponding blipp directly without requiring any marker detection at all.

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/lightbulb.png) It is possible to detect bad or slow internet connections by starting a timer when `startDetection` is called. Then, when you receive back detection results (or failures) you can reset this timer. If the timer ever fires it can be used to display feedback to the user, warning them about a slow internet connection.

### Automatic Detection Restart

When a blipp is automatically launched using the controller/fragment, detection is stopped automatically. When the blipp closes or has an error the detection is restarted again automatically, using the same mode of detection as previously.

If you want tighter control over the detection process, is possible to alter this behaviour by altering the cached automatic detection restart mode on the BlipparSDK blipp context.