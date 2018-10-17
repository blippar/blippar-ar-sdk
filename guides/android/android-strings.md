For many Blippar SDK features UI is needed and wherever there is UI there is text. We try to use simple text whenever possible but there can be a scenario whereby you may want to customise this text.

The client app can redefine the text the SDK uses, there is default English versions for all text. To enable localisation or for customisation these can be redefined in the client app.

To redefine a string simply put in an entry in your <strong>strings.xml</strong>> with the blipparsdk key:

<pre>
&lt;string name="blipparsdk_cancel_button"&gt;ANNULER&lt;/string&gt;
</pre>

<p>Below is a list of strings embedded in the SDK, you can overwrite them by defining the same string in your app's strings.xml in the appropriate language.</p>

<table border="1" class="android-strings-table table-striped table-bordered">
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
            <td class="small_title">blipparsdk_blipp_added_to_favourites_notification_text</td>
            <td>Blipp added to favourites</td>
            <td>In Blipp - Favouriting</td>
            <td>Message when a blipp has been added to favourites</td>
        </tr>
        <tr>
            <td class="small_title">blipparsdk_blipp_removed_from_favourites_notification_text</td>
            <td>Blipp removed from favourites</td>
            <td>In Blipp - Favouriting</td>
            <td>Message when a blipp has been removed from favourites</td>
        </tr>
        <tr>
            <td>blipparsdk_cancel_button</td>
            <td>CANCEL</td>
            <td>Alert Dialogs</td>
            <td>Cancel button for dialogs</td>
        </tr>
        <tr>
            <td>blipparsdk_choose_email_client_chooser_title</td>
            <td>Choose an email client</td>
            <td>In Blipp - Sharing</td>
            <td>Activity chooser dialog title</td>
        </tr>
        <tr>
            <td>blipparsdk_copy_link_option_text</td>
            <td>copy link</td>
            <td>HTML</td>
            <td>HTML option to copy a link</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_blipp_body</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The email&nbsp;default prefill body</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_blipp_title</td>
            <td>I've just blipped this</td>
            <td>In Blipp - Sharing</td>
            <td>The email default share subject</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_footer</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The email default prefill footer</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_photo_text</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The email photo share default prefill body</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_photo_title</td>
            <td>Check out my photo</td>
            <td>In Blipp - Sharing</td>
            <td>The email photo share&nbsp;default prefill subject</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_sound_body</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The email sound share&nbsp;default prefill body</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_sound_title</td>
            <td>Check out my recording</td>
            <td>In Blipp - Sharing</td>
            <td>The email sound share&nbsp;default prefill subject</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_video_body</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The email video share&nbsp;default prefill body</td>
        </tr>
        <tr>
            <td>blipparsdk_email_share_video_title</td>
            <td>Check out my video</td>
            <td>In Blipp - Sharing</td>
            <td>The email video share&nbsp;default prefill subject</td>
        </tr>
        <tr>
            <td>blipparsdk_error_calendar_adding_title</td>
            <td>Calendar event</td>
            <td>In Blipp - Calendar</td>
            <td>Adding an entry to the calendar</td>
        </tr>
        <tr>
            <td class="small_title">blipparsdk_error_calendar_not_supported_android_version</td>
            <td>Adding event to calendar not supported in this version</td>
            <td>In Blipp - Calendar</td>
            <td>Error when an entry cannot be added to the calendar due to OS reasons</td>
        </tr>
        <tr>
            <td>blipparsdk_error_title</td>
            <td>Whoops</td>
            <td>Alert Dialogs</td>
            <td>Generic alert dialog title</td>
        </tr>
        <tr>
            <td class="small_title">blipparsdk_external_storage_read_permission_text</td>
            <td>Selecting images from gallery requires external storage permission.</td>
            <td>Permissions</td>
            <td>Used when the SDK attempts to access external storage for reading</td>
        </tr>
        <tr>
            <td class="small_title">blipparsdk_external_storage_write_permission_text</td>
            <td>Saving camera photos requires external storage permission.</td>
            <td>Permissions</td>
            <td>Used when the SDK attempts to access external storage for writing</td>
        </tr>
        <tr>
            <td>blipparsdk_failed_to_play_video_error</td>
            <td>Failed to play video. Please try again</td>
            <td>Alert Dialogs</td>
            <td>Error dialog when there has been a playback issue when playing back a fullscreen video</td>
        </tr>
        <tr>
            <td>blipparsdk_favourite_blipp_prompt_message</td>
            <td>Do you want to favourite this blipp?</td>
            <td>Alert Dialogs</td>
            <td>Prompt when a favourite is requested from the SDK or blipp</td>
        </tr>
        <tr>
            <td>blipparsdk_favourite_prompt_title</td>
            <td>Favourite</td>
            <td>Alert Dialogs</td>
            <td>Title for favourite dialog</td>
        </tr>
        <tr>
            <td>blipparsdk_Info</td>
            <td>Info</td>
            <td>Alert Dialogs</td>
            <td>Title for dialog displayed for JS alerts originating from the HTML</td>
        </tr>
        <tr>
            <td>blipparsdk_loading_message</td>
            <td>Loading...</td>
            <td>HTML</td>
            <td>Loading message for the full screen html screen</td>
        </tr>
        <tr>
            <td>blipparsdk_loading_text</td>
            <td>Loading...</td>
            <td>Video</td>
            <td>Loading message for the full screen video screen</td>
        </tr>
        <tr>
            <td class="small_title">blipparsdk_microphone_required_permission_prompt_text</td>
            <td>Microphone is required to record audio clips.</td>
            <td>Permissions</td>
            <td>Used when the SDK attempts to access the microphone for recording</td>
        </tr>
        <tr>
            <td>blipparsdk_no_button</td>
            <td>NO</td>
            <td>Alert dialogs</td>
            <td>No option for dialogs</td>
        </tr>
        <tr>
            <td>blipparsdk_ok_button</td>
            <td>OK</td>
            <td>Alert Dialogs</td>
            <td>OK option for dialogs</td>
        </tr>
        <tr>
            <td>blipparsdk_open_in_browser_option_text</td>
            <td>open in browser</td>
            <td>HTML</td>
            <td>HTML option to open the page in the system browser</td>
        </tr>
        <tr>
            <td>blipparsdk_phone_call_failed</td>
            <td>This device cannot make phone calls.</td>
            <td>In Blipp - Phone</td>
            <td>Shown we the device cannot make phone calls</td>
        </tr>
        <tr>
            <td>blipparsdk_phone_call_number_prompt_text</td>
            <td>Do you want to call this number?</td>
            <td>In Blipp - Phone</td>
            <td>Dialog body when making a phone call from a blipp</td>
        </tr>
        <tr>
            <td>blipparsdk_phone_call_title</td>
            <td>Phone Call</td>
            <td>In Blipp - Phone</td>
            <td>Dialog title when making a phone call from a blipp</td>
        </tr>
        <tr>
            <td>blipparsdk_phone_number</td>
            <td>Phone Number</td>
            <td>In Blipp - Phone</td>
            <td>Dialog prefix for phone number due to call</td>
        </tr>
        <tr>
            <td>blipparsdk_picture_saved_album_message</td>
            <td>The picture has been saved to your photo album.</td>
            <td>In Blipp - Photos</td>
            <td>Dialog body when saving a photo to the Gallery</td>
        </tr>
        <tr>
            <td>blipparsdk_picture_saved_album_title</td>
            <td>Photo saved!</td>
            <td>In Blipp - Photos</td>
            <td>Dialog title when saving a photo to the Gallery</td>
        </tr>
        <tr>
            <td>blipparsdk_share_blipp_generic_prefill</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The generic share default prefill text</td>
        </tr>
        <tr>
            <td>blipparsdk_share_movie_generic_prefill</td>
            <td>
                <br>
            </td>
            <td>In Blipp - Sharing</td>
            <td>The generic movie share default prefill text</td>
        </tr>
        <tr>
            <td>blipparsdk_share_option_text</td>
            <td>share</td>
            <td>HTML</td>
            <td>Share option to share the page using the generic sharing facility</td>
        </tr>
        <tr>
            <td>blipparsdk_share_title</td>
            <td>Share</td>
            <td>In Blipp - Sharing</td>
            <td>Alert dialog title for sharing intent chooser</td>
        </tr>
        <tr>
            <td>blipparsdk_sharing_complete_text</td>
            <td>Thanks for sharing!</td>
            <td>In Blipp - Sharing</td>
            <td>Pop over when sharing has completed</td>
        </tr>
        <tr>
            <td>blipparsdk_sorry_title</td>
            <td>Sorry</td>
            <td>Alert dialogs</td>
            <td>Alert dialog title&nbsp;</td>
        </tr>
        <tr>
            <td>blipparsdk_tap_to_dismiss</td>
            <td>TAP TO DISMISS</td>
            <td>Alert dialogs</td>
            <td>
                <p>Alert dialog single button action</p>
            </td>
        </tr>
        <tr>
            <td>blipparsdk_unable_save_photo</td>
            <td>Unable to save photo</td>
            <td>In Blipp - Photos</td>
            <td>Alert dialog title for failing to save a photo</td>
        </tr>
        <tr>
            <td>blipparsdk_unable_to_save_video_text</td>
            <td>Unable to save video</td>
            <td>In Blipp - Videos</td>
            <td>Alert dialog title for failing to save a video</td>
        </tr>
        <tr>
            <td>blipparsdk_unfavourite_blipp_prompt_message</td>
            <td>Do you want to unfavourite this blipp?</td>
            <td>In Blipp - Favouriting</td>
            <td>Alert dialog body for unfavouriting a blipp</td>
        </tr>
        <tr>
            <td>blipparsdk_video_save_title</td>
            <td>Video Saved!</td>
            <td>In Blipp - Videos</td>
            <td>Alert dialog title for saving a video</td>
        </tr>
        <tr>
            <td>blipparsdk_video_saved_to_videos_text</td>
            <td>The video has been saved to your videos.</td>
            <td>In Blipp - Videos</td>
            <td>Alert dialog body for saving a video</td>
        </tr>
        <tr>
            <td>blipparsdk_yes_button</td>
            <td>Yes</td>
            <td>Alert Dialogs</td>
            <td>Alert dialog Yes button</td>
        </tr>
        <tr>
            <td>blipparsdk_pdf_open_in_ext_app_option_text</td>
            <td>open in external app</td>
            <td>Menu Pop up Internal Pdf Viewer</td>
            <td>Item on the list of action available&nbsp;</td>
        </tr>
        <tr>
            <td>blipparsdk_pdf_reader_not_found</td>
            <td>No app found for displaying PDF files</td>
            <td>Alert Dialogs</td>
            <td>Message displayed if the device has no PDF viewer app installed</td>
        </tr>
    </tbody>
</table>