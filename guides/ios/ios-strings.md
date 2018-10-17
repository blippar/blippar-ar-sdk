For many Blippar SDK features UI is needed and wherever there is UI there is text. We try to use simple text whenever possible
but there can be a scenario whereby you may want to customise this text. The client app can redefine the text the SDK uses,
there is default English versions for all text. To enable localisation or for customisation these can be redefined in the
client app. To redefine a string simply put in an entry in your Localisable.strings with the appropriate BlipparSDK key:

<pre>
"BSDK_STRING_BLIPP_REMOVED_FROM_FAVOURITES_MESSAGE" = "my text";
</pre> 

Below is a list of strings embedded in the SDK, you can overwrite them by defining the same string in your app's Localizable.strings
in the appropriate language. See <strong>BlipparSDKTypes.h</strong> for the same list of strings.

<h4>String List</h4>
<table border="1" class="sdk-view-controller table-striped table-bordered">
    <thead>
        <tr>
            <th style="user-select: none; min-width: 8px; max-width: none;">
                String Name
            </th>
            <th style="user-select: none; min-width: 8px; max-width: none;">
                English Default
            </th>
            <th style="user-select: none; min-width: 8px; max-width: none;">
                Context
            </th>
            <th style="user-select: none; min-width: 8px; max-width: none;">
                Description
            </th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>
                BSDK_STRING_WEBVIEW_SHARE
            </td>
            <td>share</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Share option</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_WEBVIEW_OPEN_IN_BROWSER
            </td>
            <td>
                <p>
                    <span>open in browser</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">HTML</span>
            </td>
            <td>Open in browser option</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_WEBVIEW_LOADING_ERROR
            </td>
            <td>
                <p>
                    <span>Problems loading page</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Shown if loading a web view fails</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_WEBVIEW_LOADING
            </td>
            <td>
                <p>
                    <span>Loading...</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">HTML</span>
            </td>
            <td>Used for web view loading</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_WEBVIEW_COPY_LINK
            </td>
            <td>
                <p>
                    <span>copy link</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">HTML</span>
            </td>
            <td>Copy link option</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_VIDEO_SAVED_TITLE
            </td>
            <td>
                <p>
                    <span>Video Saved!</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Videos</span>
            </td>
            <td>Title used when a video has been successfully saved&nbsp;to the local file system</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_VIDEO_SAVED_MESSAGE
            </td>
            <td>
                <p>
                    <span>The video has been saved to your videos.</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Videos</span>
            </td>
            <td>Main text used when a video has been successfully saved to the local file system</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_VIDEO_SAVED_FAILED_TITLE
            </td>
            <td>Sorry</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title used when a video has failed to be saved&nbsp;to the local file system</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_VIDEO_SAVED_FAILED_MESSAGE
            </td>
            <td>
                <p>
                    <span>Failed to save video!</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used when a video has failed to be saved&nbsp;to the local file system</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_VIDEO_SAVED_CLOSE
            </td>
            <td>
                <p>
                    <span>TAP TO DISMISS</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Videos</span>
            </td>
            <td>Close button text for video saved alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_UNFAVOURITE_MESSAGE
            </td>
            <td>
                <p>
                    <span>Do you want to unfavourite this blipp?</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Title used for unfavouriting alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_TWITTER_NO_ACCOUNT_TITLE</span>
                </p>
            </td>
            <td>No Accounts</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title used for missing Twitter account alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_TWITTER_NO_ACCOUNT_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>No Twitter Account! Please add an account in iOS Settings</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used for missing Twitter account alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_SHARED_FROM
            </td>
            <td>
                <p>
                    <span>Shared from Blippar</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Used in the email subject line</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_SHARE_CLOSE</span>
                </p>
            </td>
            <td>TAP TO DISMISS</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Close button text for&nbsp;missing share&nbsp;alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_SAVED_TITLE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Photo Saved!</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Photos</span>
            </td>
            <td>Title used when a photo has been successfully saved&nbsp;to the local file system</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_SAVED_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>The picture has been saved to your photo album.</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Photos</span>
            </td>
            <td>Main text used when a photo has been successfully saved to the local file system</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_SAVED_CLOSE</span>
                </p>
            </td>
            <td>TAP TO DISMISS</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Photos</span>
            </td>
            <td>Close button text for photo saved alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_ERROR_TITLE</span>
                </p>
            </td>
            <td>Sorry</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title used when a photo has failed to save</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_ERROR_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Unable to save photo Check your privacy settings.</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used when a photo has failed to save</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHOTO_ERROR_CLOSE</span>
                </p>
            </td>
            <td>Ok</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Close button text for photo saved error alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHONE_TITLE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Make Phone Call?</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Phone</span>
            </td>
            <td>Title for phone call alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_PHONE_NUMBER
            </td>
            <td>
                <p>
                    <span>Phone Number</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Phone</span>
            </td>
            <td>
                <span class="inline-comment-marker valid" data-ref="56f1f424-7f66-4aa2-9402-54eba80a76d9">Phone call text</span>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHONE_ERROR_TITLE</span>
                </p>
            </td>
            <td>Sorry</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Phone call error title text</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>
                        <span class="inline-comment-marker valid" data-ref="ac1a11a1-17b3-4b59-8410-6b4df0955113">BSDK_STRING_PHONE_ERROR_MESSAGE</span>
                    </span>
                </p>
            </td>
            <td>
                <p>
                    <span>This device cannot make phone calls. The number is %s</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Device doesn't support phone calls</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHONE_ERROR_CLOSE</span>
                </p>
            </td>
            <td>TAP TO DISMISS</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Close button text for call error alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHONE_CANCEL</span>
                </p>
            </td>
            <td>Cancel</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Phone</span>
            </td>
            <td>Used for cancel button on phone call alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_PHONE_CALL</span>
                </p>
            </td>
            <td>Call</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Phone</span>
            </td>
            <td>Text before phone number</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_INSTAGRAM_NOT_INSTALLED_TITLE</span>
                </p>
            </td>
            <td>Sorry</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title&nbsp;used for missing&nbsp;
                <span>Instagram app</span>
            </td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_INSTAGRAM_NOT_INSTALLED_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Instagram is not installed on your device</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used for missing&nbsp;
                <span>Instagram app</span>
            </td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_GENERIC_BLIPP_SHARE_MESSAGE
            </td>
            <td>
                <p>
                    <br>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Text component shared from generic share</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_FAVOURITE_YES
            </td>
            <td>Yes</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Button text for favourite alert option</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_FAVOURITE_TITLE
            </td>
            <td>
                <p>
                    <span>Favourite</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Title used for favourite/unfavourite alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_FAVOURITE_NO
            </td>
            <td>No</td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Button text for favourite alert option</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_FAVOURITE_MESSAGE
            </td>
            <td>
                <p>
                    <span>Do you want to favourite this blipp?</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Main text used&nbsp;for favouriting alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_FACEBOOK_NO_ACCOUNT_TITLE</span>
                </p>
            </td>
            <td>No Accounts</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title used for missing FaceBook account alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_FACEBOOK_NO_ACCOUNT_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>No Facebook Account! Please add an account &nbsp;in iOS Settings</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used for missing FaceBook account alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_VIDEO_SHARE_TITLE
            </td>
            <td>
                <p>
                    <span>Check out my video</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Title for email with video</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_VIDEO_SHARE_BODY
            </td>
            <td>
                <p>
                    <br>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Main text for email with video</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_SOUND_SHARE_TITLE
            </td>
            <td>
                <p>
                    <span>Check out my recording</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Title&nbsp;for email with audio</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_SOUND_SHARE_BODY
            </td>
            <td>
                <br>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Main text for email with audio</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_PHOTO_SHARE_TITLE
            </td>
            <td>
                <p>
                    <span>Check out my photo</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Title for email with photo</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_PHOTO_SHARE_BODY
            </td>
            <td>
                <p>
                    <br>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Main text for email with photo</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_EMAIL_NOT_SETUP_TITLE</span>
                </p>
            </td>
            <td>Sorry</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Title used for missing email account alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_EMAIL_NOT_SETUP_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Email is not set up on your device. You need to run your email App and set up an account.</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text used for missing email account alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_FOOTER
            </td>
            <td>
                <br>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Text for email footer</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_BLIPP_SHARE_TITLE
            </td>
            <td>
                <p>
                    <span>I've just blipped this</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Title for email with link to app</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_EMAIL_BLIPP_SHARE_BODY
            </td>
            <td>
                <p>
                    <br>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Sharing</span>
            </td>
            <td>Main text&nbsp;for email with link to app</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_CONNECTION_ERROR_TITLE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Connection Error</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Connection error alert title</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_CONNECTION_ERROR_MESSAGE</span>
                </p>
            </td>
            <td>
                <p>
                    <span>Please check your network connection and try again.</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Main text for connection error alert</td>
        </tr>
        <tr>
            <td>
                <p>
                    <span>BSDK_STRING_CONNECTION_ERROR_CLOSE</span>
                </p>
            </td>
            <td>TAP TO DISMISS</td>
            <td>
                <span style="color: rgb(51,51,51);">Alert Dialogs</span>
            </td>
            <td>Close button text for internet connection error alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_CALENDAR_SUCCESS_TITLE
            </td>
            <td>
                <p>
                    <span>Success!</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Calendar</span>
            </td>
            <td>Title used for calendar event saved alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_CALENDAR_SUCCESS_MESSAGE
            </td>
            <td>
                <p>
                    <span>Entry added to calendar</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Calendar</span>
            </td>
            <td>Main text used for calendar event saved alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_CALENDAR_SAVED_CLOSE
            </td>
            <td>
                <span>TAP TO DISMISS</span>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Calendar</span>
            </td>
            <td>Close button text for calendar event saved alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_CALENDAR_PRIVACY_TITLE
            </td>
            <td>
                <p>
                    <span>Privacy</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Calendar</span>
            </td>
            <td>Title used for calendar event save error alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_CALENDAR_PRIVACY_MESSAGE
            </td>
            <td>
                <p>
                    <span>Blippar cannot access your calendar Please enable in Privacy settings</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Calendar</span>
            </td>
            <td>Main text used for calendar event save error alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_BLIPP_REMOVED_FROM_FAVOURITES_MESSAGE
            </td>
            <td>
                <p>
                    <span>Blipp removed from favourites</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Text for informing the user that the Blipp has been removed from favourites</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_BLIPP_IMAGE_NEEDED_TITLE
            </td>
            <td>
                <p>
                    <span>Blipp Image Needed</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Photos</span>
            </td>
            <td>Title used for marker needed alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_BLIPP_IMAGE_NEEDED_MESSAGE
            </td>
            <td>
                <p>
                    <span>This blipp needs the original blippable image or object to run.&nbsp; Point your camera at the image
                        or object</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Photos</span>
            </td>
            <td>Main text used for&nbsp;marker needed alert</td>
        </tr>
        <tr>
            <td>
                BSDK_STRING_BLIPP_ADDED_TO_FAVOURITES_MESSAGE
            </td>
            <td>
                <p>
                    <span>Blipp added to favourites</span>
                </p>
            </td>
            <td>
                <span style="color: rgb(51,51,51);">In Blipp - Favouriting</span>
            </td>
            <td>Text for informing the user that the Blipp has been added to favourites</td>
        </tr>
    </tbody>
</table>