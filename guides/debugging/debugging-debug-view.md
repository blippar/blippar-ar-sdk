# Blippar SDK - Debug View

The debug view can be added into your app's view hierarchy and help when debugging blipps. The view is intended to be **full screen**, so the logs can fill the screen.

On iOS you should add the _BlipparSDKDebugView_ into your view hierarchy (through interface builder or programatically).

On Android you should add _com.blippar.ar.android.sdk.DebugView_ to your view hierarchy (through XML or programatically):

     <com.blippar.ar.android.sdk.DebugView
        android:id="@+id/sdk_debug_view"
        android:layout_width="0dp"
        android:layout_height="0dp"
        app:layout_constraintRight_toRightOf="parent"
        app:layout_constraintLeft_toLeftOf="parent"
        app:layout_constraintBottom_toBottomOf="parent"
        app:layout_constraintTop_toTopOf="parent">
    </com.blippar.ar.android.sdk.DebugView>

The bottom of the debug view is tappable to slide the view up and down to reveal more options.

iOS and Android are largely similar, Android does not have the CPU overlay. It is intended to be added in an upcoming release. iOS screenshots have been used for reference, the style of Android is slightly different.

## During Scanning

By default the view is unexpanded and looks something like below:

![Debug View Folder Unset](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_folder_unset.jpg)

This means that there is nothing 'locked' to the sideload folder (i.e. NOT SET). 

If you have sideloaded a blipp and it is currently locked against a marker (more on this below) then the view will look like below:

![Debug View Folder Set](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_view_debug_set.png)

This means that the data is the sideload folder is 'locked' against the blipp with the address/hash of '31sun06nsq'. If you scan the blipp with this address then the scripts & data in the sideload folder will be used instead of the data downloaded from the server.

If you scan any other blipp then the server data is used for that blipp.

Sometimes you may want to lock against another blipp or marker. On tapping the 'Reset' button the view content will clear back to "NOT SET". The next blipp you scan will now be locked and you'll see it's hash/address instead. This blipp is now locked for use as for sideloading and all other markers will be using the server scripts & data.

>NOTE: Sideloading will only happen if you have enabled the debugSideload option in the SDK

In a blipp
When you scan a blipp this section changes to display some statistics about the blipp in the debug view.

![Debug View Running Blipp](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_view_running_blipp.jpg)

These stats have various pieces of data in them:

_FPS_ - frames per second

_m_ - model count

_drn_ - models drawn

_v_ - number of vertices

_T_ - number of resources

_b_ - number of bound textures

_ub_ - number of unbound textures

_h_ - number of texture handles

_Total Blipp memory in use in Mb_

_Anim_ - number of animations

_Part_ - number of particle systems

When the view is expanded you see the following:

![Debug View Open](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_view_open.jpg)

When the view is expanded several debug options are revealed. 

_Log is OFF/ON_ - toggles whether the debug log view is visible or not

_More..._ - Reveals some more debug options

_Wht_ - Change the debug log text to white. See below:

![Debug View White](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_view_open.jpg)

_Red_ - Change the debug log text to red

_Grn_ - Change the debug log text to green

_Blk_ - Change the debug log text to black. Also changes the log background to white and makes the log text scrollable.  While in this mode you cannot click on anything within the blipp since gestures will be used to scroll the log text.  You need to put the log into one of the other modes to interact with the blipp once again.

![Debug View Black](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_black_log.png)

_Mesh Outline_ - Displays wireframes indicating the outline of meshes in the blipp

_Hide Textures_ - Disable rendering of textures, useful when viewing bounding boxes or mesh outlines

_Bounding Box_ - Displays the bounding boxes of meshes in the blipp

![Debug Hide Textures](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_black_log.png)

_Hotspots_ - Displays hotspots active in the blipp (legacy feature)

_CPU Display_ - A graph indicating CPU usage over time, note this value can go over 100% indicating multiple cores are being used

## Extra Developer Options


![Debug View More](https://blippar-devportal-dev.s3.amazonaws.com/media/uploads/debug_hide_textures_show_bounding_box.png)

_Copy log to clipboard_ - Copies the content of the log view into the devices clipboard. Useful for emailing or pasting in elsewhere for further inspection

_Clear log_ - Clear the logs on screen, useful when re-blipping

_Clear blipp cache_ - Deletes cached blipp data from the server, forcing a redownload when scanning markers

_Clear sideload cache_ - Deletes all the sideload data