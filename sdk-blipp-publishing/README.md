# Introduction
## Current Publishing Flow
With the release of the SDK 2.2.0, we have introduced a new publishing flow for the blipps. Now you don't have to enter the first eight symbols of the SDK license key as the blipp test code to allow your custom application to scan it. You can just select one or several apps available to you for publishing and publish your blipp for them. This makes publishing and un-publishing blipps much simpler and faster and allows us to introduce a new feature: testing blipps in your custom applications. Now you can publish blipps that will run only in your internal application builds without a risk of revealing it to your customers before it is ready to go live.

Blipps published using the current publishing flow can only be scanned with the latest SDK (2.2.0 or newer). However, if you have not moved to the new SDK yet and for some reason cannot migrate immediately there is still an option to publish your blipps for the SDK 2.1.x using the old publishing flow. Please note that the old publishing flow will be turned off eventually (current plan is to support it for three months after the new publishing flow release), so we strongly advise to migrate to the new SDK as soon as possible.

This manual provides detailed instructions for blipp publishing for both older and newer SDKs using the old and the current blipp publishing flow accordingly.

## Blipps Hub

Current Blippar hub has been out there for a long time. It was developed several years ago using state of the art technologies of that time. But as it happens with many things, new technologies were introduced lately which will allow the hub to work faster and provide a better experience with improved usability and enriched functionality. So we would like to present to you the new, updated and improved Blippar blipps hub: [https://blipps.blippar.com/](https://blipps.blippar.com/)

The new hub is still in the beta stage and it is being tested and improved. This means that there are still some unfixed issues, though these are mostly minor and navigation related. The UI may also change before the final release and additional functionality is likely to be added. However, the new hub already offers better support for the new SDK publishing flow. Here are some of the publishing features, available only in the new hub:

* Simplified UI provides an easier overview of the target applications and countries to publish the blipp for.
* Simplified publishing for the old and new SDK versions. You can now enter several test codes in several test fields to make publishing for the old publishing flow simpler. Unfortunately to support both publishing flows users still need to publish two copies of blipp — one for the old SDK should be published for testing and the other for the new SDK should be published live. And this brings us to the next improvement.
* An option to copy any blipp version into a separate blipp. This feature works both for the Blippbuilder blipps and for custom JS blipps. The support of the Blippbuilder blipps means that now users copy them and open the copy in Blippbuilder and continue using the Blippar visual editor to modify the blipp.
* Faster performance.
With this in mind please try our new hub using your current hub account. The hub can be accessed using your current hub credentials with the following address: [https://blipps.blippar.com/](https://blipps.blippar.com/)

The manual below is the blipp publishing manual updated with the new Blippar Hub UI changes.

# Current Blipp Publishing Flow for the Blippar SDK Applications (for SDK 2.2.0 and later) in the Blipps Hub

The key difference between the current SDK publishing flow and the old one is that now you can select the application you want to publish your blipp for instead of using test codes for the same aim. The following manual will explain how to use the new publishing flow.

When creating a new blipp, users have two options:

* Use our visual editor called Blippbuilder 
* Use a more advanced and complex Blippbuilder script for creating a complex experience.

While in general both of these options use the same Blippar services for blipp publishing there are some differences in the UI users should be aware of.

Please read the following manual carefully to understand how to use the current publishing flow with the Blipps Hub.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>**Note**: This publishing flow will not be available to users, who have no other target applications available to publish to except Blippar app. To have other target applications available for publishing either current user or one of the group members user belongs to has to own an SDK license key.

>![Info Icon](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/BlipparSDK_Info.png) 
>**Important**: Blippar app uses this publishing flow. To publish something for the Blippar app use the flow described below and select the Blippar app as a target application.
>All blipps published previously for the Blippar app will continue to work as before, there is no need to republish them.


## Testing and Publishing a Blipp Created Using "Blippar Script" (JS)

### Creating a new JS Blipp

1. Login to hub UI.
2. Hit "Create a Blipp" and select "Blippar Script" from the available options:  
  ![JS choose tool](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0010.js_choose_tool.png) 
3. Upload one or several blipp markers and hit the button "Continue":  
  ![JS create blipp](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0020.js_create_bipp.png) 
  ![JS upload marker](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0030.js_upload_marker.png)
4. Upload the zip with your created blipp:  
  ![JS upload zip](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0040.js_upload_zip.png)
5. As soon as the new blipp is uploaded to the hub you have two options: you can either test the blipp with the Blippar app or one of the applications available to you or you can publish the blipp for the Blippar app or one of the applications available to you.  
  ![JS blipp history menu](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0050.js_blipp_history_menu.png)

### Testing

To test the blipp:

1. Chose the option "Update Test Publish" from the blipp control menu.
2. Select applications you want to test the blipp with:  
  ![JS testing a blipp: select target application](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0060.js_blipp_test_select_app.png)
3. After the application is selected it will be added to the list of the publishing targets. If there are several App IDs registered with this application name, they all will be listed under the same name. Click on the app name to see all target app IDs. Leave the checkbox checked for the apps you want to test the blipp with and remove the checkbox for the IDs that should not have any access to the test blipp. Press "Continue" to manage blipp test codes on the next screen.  
  ![JS testing a blipp: review selected target applications](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0070.js_blipp_test_selected_app.png)
4. Review test codes that will be saved with your blipp to use them later to access the blipp.  
  ![JS testing a blipp: enter test code](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0080.js_blipp_test_enter_code.png)
5. Add up to 5 more test codes using the "+" button in the upper right corner. Press "Continue" to review blipp test targets and test codes.  
  ![JS testing a blipp:enter multiple test codes](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0090.js_blipp_test_enter_multiple_codes.png)
6. Review blipp test targets and test codes on the final review screen. Here you can change the list of the target apps and test codes if you notice an error. Note that at this point the blipp is not available for testing yet. Press "Publish to Test" to publish the blipp with the testing code to test with target applications.  
  ![JS testing a blipp: review entered info](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0100.js_blipp_test_review.png)
7. After pressing "Publish To Test" button wait for a bit while the blipp is published for testing. When it is done, the blipp status screen will be shown. Feel free to use it for blipp testing. Scan the marker or cycle through the markers to chose a different marker to scan.  
  ![JS testing a blipp: status of the blipp in testing](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0110.js_blipp_in_test_status.png)

8. Click "Close" when you are done to return to the blipp management screen.

### Publishing

To publish the blipp:

1. Choose the option "Publish to Live" from the blipp menu.
2. Select target applications for your blipp. Same principles as with selecting target applications for testing apply: if there are several app IDs registered for the same application name you can choose app IDs to publish with after selecting the application name. Several target application names can be selected. Please note that if you have already published your blipp for testing previously, the list of target applications will be pre-filled with applications you have used for testing. These applications can be removed if they are not needed. Click the "X" button on the right side from the application name to remove it from the targets list. Press "Continue" to select target countries for the blipp.  
  ![JS publishing a blipp: select target application](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0120.js_blipp_publish_select_app.png)
3. On the next screen, you can select a list of countries you want the blipp to be available in. Choose "Global" option to make your blipp available everywhere or select "Local to Country" and add countries to a targets list to restrict campaign availability to certain countries. Always publish blipps only to the countries your license permits to publish for. Press "Continue" after the target country list is complete to continue to the review screen.  
  ![JS publishing a blipp: select target country](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0130.js_blipp_publish_select_country.png)
4. Before publishing the blipp, please review target countries in which this blipp will be available and applications that will be able to open the blipp. If you find that you need to change the country or the target app list, it is still possible to do so by pressing the "Change" button next to the list you want to change. At this moment the blipp is not public yet. Press the "Publish" button to publish the blipp.  
  ![JS publishing a blipp: review publisinfo](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0140.js_blipp_publish_review.png)
5. Wait for a bit until the blipp is published. After the blipp is published you will be redirected to the Blipp Status screen which can be used to review blipp status, list of target countries and applications and blipp markers. Use this screen to test the blipp if needed.  
  ![JS publishing a blipp: status of the published blipp](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0150.js_blipp_publish_status.png)

6. Press "Close" to return to the blipp management screen. Your blipp is live now!

## Managing the "Blippar Script" JS Blipps

Besides testing and publishing "Blippar Script" JS blipps there are various other operations available for users to perform with these blipps. These operations can be performed using two main screens:

* Blipp project management screen
* Blipp History screen

### Blipp Project Management Screen

This is a screen where users can manage all blipps created for a single project:
![JS blipp: project view](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0160.js_blipp_project_view.png)

Every blipp on this screen has a horizontal "meatballs" menu button that allows accessing blipp specific actions. The actions available in this menu are:

1. **Set Offline** — Unpublish blipp. This option is only available for the blipps published live or in testing. 
2. **View Stats** — Access blipp statistics.
3. **Version History** — Access blipp version history. This is the screen where you can upload a new Blippar Script JS Blipp version and perform various other actions. See next Chapter for more information.
4. **Move To...** — Move the blipp to a different project (within the same user group/company).
5. **Duplicate** — make an exact copy of the latest blipp version. This functionality is useful in case you want to create a new blipp using current blipp as a template or if you want to create an exact blipp copy to publish the blipp using the old publishing flow.
6. **Delete** — Remove the blipp completely.
7. **Status** — opens the blipp status screen where you can review if the blipp is live or in testing, which apps the blipp has been published for, in which countries and what are the test codes that allow accessing the blipp (if it is on testing).
8. **Publish to Live / Publish to test / Update Live Publish / Update Test Publish** — blipp testing and publishing commands described in previous chapters.

### Blipp History Screen

Blipp history screen can be accessed using the "Version History" option from the project management screen described in the previous chapter. Blippar Script JS blipps also redirect to this screen when users want to edit such blipps. 

The main functionality available on this screen is an option to upload a new version of the blipp source code and download the current blipp source code. But besides these, there are various other options available on this screen through the blipp version menu. To access these options click in the top right corner of the blipp version you want to work with.
![JS blipp: history view](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0170.js_blipp_history_view.png)

Here are the actions you can do with blipp versions:

1. **Set Offline** — Unpublish blipp. This option is only available for the blipps published live or in testing. 
2. **Status** — opens the blipp status screen where you can review if the blipp is live or in testing, which apps the blipp has been published for, in which countries and what are the test codes that allow accessing the blipp (if it is on testing).
3. **Publish to Live / Publish to test / Update Live Publish / Update Test Publish** — blipp testing and publishing commands described in previous chapters.
4. **Restore** — Set this blipp version as the current blipp version. The blipp will be updated with the new code copied from this blipp version.
5. **Create New Blipp From Version** — Create a new blipp using the selected blipp version as the first blipp version. The action is similar to "Duplicate" from the project management screen but allows to create a new blipp form one of the previous blipp versions, not just the latest one.
6. **Download Code** — Download the source code for the current Blippar Script JS blipp. It can be then used to create a new blipp or a new version of the current blipp.
7. **Add Trigger Images** — Add more trigger images.

#### "Add Version" Button and Other Blipp Modifications

On the very top of the blipp history screen, there is an "Add Version" button. Use this button to upload a new version of the source code for the current blipp.

If you need to add new trigger images fro the blipp use "Add Trigger Images" button. This will not create a new blipp version, only add more trigger images for the current blipp version.

If you need to remove a trigger image, hover the mouse over it. An icon with a bin will appear in the top right corner of the marker. Click it to remove the trigger image (marker) from the set of images that can be used to launch the blipp.

If you need to update a set of target countries, applications or test codes for an already published blipp, use "Update Live Publish" and "Update Test Publish" actions. Updating these parameters will not unpublish the blipp, there is no downtime for changing them.

## Publishing a Blipp Created Using the "Blippbuilder" Visual Editor

1. Login to hub UI.
2. Hit "Create a Blipp" and select "Blippbuilder" from the options:

  ![Blippbuilder choose tool](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0180.bb_choose_tool.png)
3. Upload your marker and hit the button "Continue":

  ![Blippbuilder create blipp](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0190.bb_create_bipp.png)
  ![Blippbuilder upload marker](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0200.bb_upload_marker.png)
4. You'll be redirected to blipp builder UI. Make the necessary changes to your blipp:

  ![Blippbuilder visual experience editor](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/0210.bb_create_experience.png)
5. Once you have done the necessary changes you will have two options: you can either test the blipp with one of the applications available to you or you can publish the blipp for one of the applications available to you. Press the "Preview" button to test the blipp. Press the "Publish" button to publish the blipp to live. Please refer to the chapters "Testing" and "Publishing" for the Blippar Script JS blipps above to get more information about blipp testing and publishing, the Blippbuilder blipps publishing the process is exactly the same as for the JS blipps.

If you are still using one of the old Blippar SDK versions (Blippar SDK version 2.1.x or earlier) please refer to the old publishing flow manual: [Old Publishing Flow](old-publishing-flow.md).