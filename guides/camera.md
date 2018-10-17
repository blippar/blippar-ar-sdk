# Camera

## Controlling the camera

The BlipparSDK provides APIs for developers to perform high level operations on the camera such as starting, stopping, changing direction and turning on and off the flashlight. See the `BlipparSDKCamera` API reference for more details.

## Accessing the camera feed

It is possible to receive callbacks when camera frames are available, which allows developers to possibly perform custom Computer Vision algorithms on the camera frame or send them off remotely to a custom webservice.

To receive callbacks a class needs to implement the `BlipparSDKCameraDelegate` protocol and then registers as a delegate with the `BlipparSDKCamera` class.

If the camera is running the class will receive callbacks on the camera thread. There are a few important things to note about these callbacks:

* Callbacks happen on the camera thread. **UI operations on this thread will crash!** The developer should use GCD/Runnables or other means to push any UI operations onto the UI thread.
* Long running operations should be avoided, if the camera thread is blocked then this will cause frame rate issues. The camera thread should be kept as clear as possible. If something CPU intensive needs to be performed then it is recommended to farm it off to a background thread.
* There are a limited number of camera frames in the system, only one reference to a camera frame should be kept at a time.
* Be careful with formats. On iOS typically the format is `kCVPixelFormatType_420YpCbCr8BiPlanarFullRange` and on Android it is `NV21`. However when ARCore is active this format is normally in `YUV-420-888` format. There are functions to get the pixel format of the frame from the camera image on both platforms.
* The front camera may not provide the same sized image as the back. The image is also mirrored so may need some modification if it needs to be rendered on screen.
* Camera images are sent to the host app in the same way they are received from the hardware. On most devices this is in landscape.

### iOS Frame Processing Example

    -(void) onCameraFrame:(BlipparSDKCameraFrame *)frame { 
      dispatch_async(dispatch_get_main_queue(), ^{
          UIImage* cameraImage = [self getImageFromFrame:frame];
          
          UIImage * portraitImage = [[UIImage alloc] initWithCGImage: cameraImage.CGImage
                                                     scale: 1.0
                                                     orientation: UIImageOrientationRight];
          // Handle mirroring
          if ([BlipparSDK sharedInstance].camera.direction == BlipparCameraDirectionFront) {
              self.cameraImageView.transform   = CGAffineTransformMakeScale(-1, 1);
          }
          // TODO: Do something with the portrait image
      });
    } 
    
    - (UIImage*) getImageFromFrame:(BlipparSDKCameraFrame*)frame {
        CVPixelBufferRef pixelBuffer = frame.data;
        CIImage *ciImage = [CIImage imageWithCVPixelBuffer:pixelBuffer];
        
        CIContext *temporaryContext = [CIContext contextWithOptions:nil];
        CGImageRef videoImage = [temporaryContext
                                createCGImage:ciImage
                                fromRect:CGRectMake(0, 0,
                                CVPixelBufferGetWidth(pixelBuffer),
                                CVPixelBufferGetHeight(pixelBuffer))];
        
        UIImage *uiImage = [UIImage imageWithCGImage:videoImage];
        CGImageRelease(videoImage);
        return uiImage;
    }

### Android Frame Processing Example

A few things to note in the example below. Camera sensors need to be accounted for. Some devices have the camera sensors at 90 degrees to the camera, some are 270. To check this the camera object provides an accessor `Blippar.getSDK().getCamera().getSensorOrientation()`

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) On Android the CameraFrame class implements the AutoCloseable interface. It is _very_ important to call `close()` when you are finished with the camera frame. This is so the underlying resources can be freed up and added back into the available camera buffers.

    class CameraFrameListener implements CameraListener {
        CameraFrame mCurrentFrame = null;
        private final Runnable mConvertImageRunnable = new Runnable() {
            @Override
            public void run() {
                synchronized (this) {
                    Bitmap bitmap = null;
                    if (mCurrentFrame.getFormat() == ImageFormat.NV21) {
                        ByteBuffer buffer = mCurrentFrame.getData();
                        int[] strides = new int[mCurrentFrame.getNumberOfPlanes()];
                        for (int i = 0; i < mCurrentFrame.getNumberOfPlanes(); ++i) {
                            strides[i] = (int) mCurrentFrame.getRowStride(i);
                        }

                        byte[] arr = new byte[buffer.remaining()];
                        buffer.get(arr);
                        YuvImage yuvImage = new YuvImage(arr, mCurrentFrame.getFormat(), mCurrentFrame.getWidth(), mCurrentFrame.getHeight(), strides);
                        ByteArrayOutputStream out = new ByteArrayOutputStream();
                        yuvImage.compressToJpeg(new Rect(0, 0, mCurrentFrame.getWidth(), mCurrentFrame.getHeight()), 100, out);
                        byte[] imageBytes = out.toByteArray();
                        bitmap = BitmapFactory.decodeByteArray(imageBytes, 0, imageBytes.length);
                    } else if (mCurrentFrame.getFormat() == ImageFormat.YUV_420_888) {
                        // A standard YUV 420 888 convertor
                        bitmap = YUVConverter.YUV_420_888_toRGB(getBaseContext(), mCurrentFrame);
                    }

                    if (bitmap != null) {
                        // Rotate the bitmap (most images are in landscape)
                        Matrix matrix = new Matrix();

                        matrix.postRotate(90 + Math.abs(90 - Blippar.getSDK().getCamera().getSensorOrientation()));
                        Bitmap scaledBitmap = Bitmap.createScaledBitmap(bitmap, mCurrentFrame.getWidth(), mCurrentFrame.getHeight(), true);
                        Bitmap rotatedBitmap = Bitmap.createBitmap(scaledBitmap, 0, 0, scaledBitmap.getWidth(), scaledBitmap.getHeight(), matrix, true);

                        cameraImageView.setImageBitmap(rotatedBitmap);
                        try {
                            mCurrentFrame.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        mCurrentFrame = null;
                    }
                }
            }
        };

        private Handler mMainHandler;

        CameraFrameListener() {
            mMainHandler = new Handler();
        }

        void clearFrame() {
            synchronized (this) {
                mMainHandler.removeCallbacks(mConvertImageRunnable);
                if (mCurrentFrame != null) {
                    try {
                        mCurrentFrame.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                mCurrentFrame = null;
            }
        }

        @Override
        public void onCameraStart() {
            clearFrame();
        }

        @Override
        public void onCameraStop() {
            clearFrame();
        }

        @Override
        public void onCameraFrame(@NonNull ImageReader reader) {
            synchronized (this) {
                if (mCurrentFrame == null) {
                    mCurrentFrame = reader.acquireImage();
                    mMainHandler.post(mConvertImageRunnable);
                }
            }
        }
    }
  
The example above omits the YUV420_888 frame conversion. There are many examples online of this conversion.