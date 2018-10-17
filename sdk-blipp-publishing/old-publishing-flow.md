# Publishing Blipps for the Old SDK Versions (pre-2.2.0)

## Introduction

The following manual explains how to publish a blipp if you are still using the Blippar SDK 2.1.x in your application.

We have introduced the old publishing flow as a temporal solution during the early days of Blippar SDK. Please note that old publishing flow will be disabled after the migration period is over (the date will be announced in advance).

When the old publishing flow is used blipps are restricted so that they can only run within certain applications:

* Blipps designed to be published in the Blippar app cannot be published in third-party apps that use Blippar SDK.
* Blipps designed to be published in third-party apps that use the Blippar SDK cannot be published in the Blippar app.

Besides the user experience improvements, one of the other reasons behind the introduction of the new publishing flow is to allow the simultaneous blipp publishing or testing in third-party apps that use the SDK and in the Blippar app.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>**Note**: Please remember that the SDK provides some options for blipp control and communication that can make it impossible to play the blipp designed for the SDK in the Blippar app. Be aware of this and don't make the blipp available to the Blippar app if it is using specific SDK functionality, such as application and blipp intercommunication, as in these cases the blipp will not be detected by the Blippar app even if it is published.

## Detection Codes for the Old Publishing Flow
In the old publishing flow, these blipp availability restrictions are controlled using special Detection Codes. Detection Codes are set up when you create and upload your blipps to the Blippar servers.  

The Detection Code is defined as the first 8 characters of your Blippar SDK License-Key that was provided to you when you registered your application with us. For example, if your SDK license key is *24d5019300eda2b722fa3ec21a2b86e2f4f1cb47fd697704f04979db8b2d0d795a99464e* then your special unique Detection code is *24d50193*.

This detection code is specific to the application tied to this SDK License Key and will not work with any other application you create.

You do not need to do anything in your application source code to make this detection behaviour work.  It is handled automatically using your License Key when you initialise the SDK.

Publishing a Blipp for the SDK Using the Old Publishing Flow
Publishing the blipp for the SDK 2.1.x and older using the old publishing flow is performed similarly to the way it is done in the new publishing flow. The key difference is on the testing screen. Please follow the instructions for the new publishing flow to the point where the test code entry screen is shown:

* If you have been using *[Blippbuilder Script](https://developer.blippar.com/portal/ar-api/home/)* to create your blipp, please follow the Blippbuilder Script blipp publishing documentation till step 5 (stop before selecting the "Update Test Publish" action).
* If you have been using *[Blippbuilder](https://blippar.com/en/products/blippbuilder/)* to create your blipp, please follow the Blippbuilder blipp publishing documentation till step 5, press the Preview button on the top right side of the tool.

>![Warning Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Warning.png) 
> **Warning!** Do not publish blipp to live if you want for it to be available for the old publishing flow. If you have published the blipp to live, un-publish the blipp using the "Set Offline" action available in the blipp version history and start the publishing process again.

Once you land on the Test Blipp screen (by selecting "Update Test Publish" action in the blipp menu), you must set the blipp detection code to be the first 8 characters of your License Key.

1. Select any target application in the "Choose your target apps" drop-down, this selection is ignored by the old publishing flow:  
  ![JS testing a blipp: select target application](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0060.js_blipp_test_select_app.png) ![JS testing a blipp: review selected target applications](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0070.js_blipp_test_selected_app.png)
2. On the "Add Test Codes" screen enter the first 8 characters of your SDK App Key.  
  ![JS testing a blipp: enter test code](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0080.js_blipp_test_enter_code.png)
3. If you need to publish the blipp for multiple apps, add up to 5 test codes using the "+" button in the upper right corner and set them to the app first 8 characters of the license keys accordingly. Press "Continue".  
  ![JS testing a blipp:enter multiple test codes](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0090.js_blipp_test_enter_multiple_codes.png)
4. Review blipp test codes on the final review screen. Ignore "Apps" list. Here you can change test codes if you notice an error. Note that at this point the blipp is not available for scanning yet. Press "Publish to Test" to publish the blipp for your custom applications using the old publishing flow.  
  ![JS testing a blipp: review entered info](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0100.js_blipp_test_review.png)
5. After pressing "Publish To Test" button wait for a bit while the blipp is published. When it is done, the blipp status screen will be shown. Feel free to use it for blipp testing. Scan the marker or cycle through the markers to chose a different marker to scan.    
  ![JS testing a blipp: status of the blipp in testing](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0110.js_blipp_in_test_status.png)
6. Click "Close" when you are done to return to the blipp management screen.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>**Note**: Please note that it does not matter which target application you select during test publishing, the selection will be ignored anyway and only detection code will be considered for the blipps published for the SDK 2.1.x.

Congratulations, your new blipp is ready to go. It is now registered against the detection code and will only be visible in your application.

## Publishing the Same blipp for Two Target SDK Applications Using the Old Publishing Flow

When using the old publishing flow to publish the same blipp for several target applications blipp publisher has to enter every application first eight symbols in separate fields on the "Add Test Codes" form.

For example, let us say the client has two SDK licenses, one for iOS and one for Android:

* iOS SDK License key is "12345678...".
* Android license key is "abcdefgh...".

If the blipp publisher wants to publish only for iOS, they need to enter only the code "12345678" on the "Add Test Codes" form.
To publish the blipp for both target platforms they should enter the first code in the first field and the second code in the additional field.
![JS publishing a blipp for the old publishing flow: enter two codes for two target apps](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0260.old_pub_flow_blipp_test_enter_two_codes.png)


You only need to create a copy of the blipp if you want it to be available using both old and new publishing flow.  See the chapter "Publishing the Same Blipp for the Old and New Publishing Flow" for the detailed instruction about this.

## Publishing the Same Blipp for the Old and New Publishing Flow

If you are using the old publishing flow to publish the blipp then it will not be available for the new publishing flow.

To be able to see the blipp using both publishing flows you will have to create two copies of the same blipp. Here is how:

1. Open the list of your blipps.
2. Instead of opening the blipp you want to copy in Blippbuilder or uploading a new script in Blippbuilder Script, find the three dots next to the blipp name and click on them to see actions menu.
3. Choose "Duplicate" action from the menu.
4. A copy of the blipp will be created in the same project. It will appear as the latest blipp in the top left corner, next to the button "Create Blipp" with a random trigger image (marker).
5. Using the three dots next to the blipp name view blipp history. On the blipp history screen, you can change the name of the blipp by clicking on it.
6. You can upload same trigger images/markers for the new copy of the blipp, as it will be published using the old publishing flow and will not interfere with your other blipp.
7. Now publish both copies of the blipp using the different publishing flows. We recommend keeping the main blipp copy published using the latest publishing flow and a copy using the old publishing flow.
8. If you need to update the blipp, update the man blipp copy and remove the other copy of the blipp. Then duplicate the main copy again and re-publish it.

## Migrating a Blipp From the Old Publishing Flow To the New Publishing Flow

It is pretty easy to migrate your existing blipp from the old publishing flow to the new one. To do that just go through the same steps you would go to update a blipp and use the new publishing flow while doing so.

## Migrating a Blipp From the New Publishing Flow To the New Publishing Flow

In an unlikely case when someone needs to make sure that a blipp published with a new publishing flow has to be available to the old SDK (2.1.x), please follow the same steps you would follow to update the blipp and publish it on test code using the first eight symbols of your SDK license key as the test code to make the blipp available to the old SDK.