package com.blippar.demo.kotlin

import android.Manifest
import android.content.pm.PackageManager
import android.os.Bundle
import android.support.v4.app.ActivityCompat
import android.support.v4.content.ContextCompat
import android.support.v7.app.AppCompatActivity
import android.util.Log
import android.view.View
import android.widget.Toast
import com.blippar.ar.android.sdk.*
import com.blippar.ar.android.sdk.internal.BlippRunningState
import com.blippar.ar.android.sdk.internal.BlipparSDKBlippErrorType
import com.blippar.ar.android.sdk.internal.LogLevel
import kotlinx.android.synthetic.main.activity_main.*
import org.json.JSONObject

class MainActivity : AppCompatActivity() {

    private val CAMERA_REQUEST_CODE = 25
    private val LogTag = MainActivity::class.java.simpleName

    internal var blipparSDKFragment: BlipparSDKFragment? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        setContentView(R.layout.activity_main)

        // Listen for the lifecycle of the SDK
        Blippar.getSDK().addSDKListener(mBlipparSDKListener)

        // Listen for blipp events
        Blippar.getSDK().addBlippStateListener(mBlippStateListener)

        // Optional, see debug logs
        Blippar.getSDK().logLevel = LogLevel.Debug

        // Allow this demo blipp some blipps available to all
        // Useful to verify the app is working ok
        Blippar.getSDK().debugTestBlippsEnabled = true

        bt_close.setOnClickListener({ _ -> blipparSDKFragment!!.closeCurrentBlipp() })

        // if we don't have Camera permission, ask before adding the SDK fragment
        if (!hasCameraPermission()) {
            ActivityCompat.requestPermissions(this, arrayOf(Manifest.permission.CAMERA), CAMERA_REQUEST_CODE)
        } else {
            setFragment()
        }
    }

    override fun onDestroy() {
        super.onDestroy()

        // Remove our listeners
        Blippar.getSDK().removeSDKListener(mBlipparSDKListener)
        Blippar.getSDK().removeBlippStateListener(mBlippStateListener)
    }

    /**
     * @return true if the app has Camera permission
     */
    private fun hasCameraPermission(): Boolean {
        return ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PackageManager.PERMISSION_GRANTED
    }

    /**
     * Add the Blippar's SDK fragment to the Activity's view
     */
    private fun setFragment() {
        // BlipparSDKFragment does all the heavy lifting for us
        blipparSDKFragment = BlipparSDKFragment.create()

        supportFragmentManager.beginTransaction().replace(R.id.frame_layout, blipparSDKFragment).commitAllowingStateLoss()
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        // check if the user granted the Camera permission. If true, add the SDK Fragment
        if (requestCode == CAMERA_REQUEST_CODE && hasCameraPermission()) {
            setFragment()
        }
    }

    /**
     * Listen for SDK lifecycle events
     */
    private var mBlipparSDKListener = object : BlipparSDK.BlipparSDKListener {
        override fun onInitialiseSuccess() {
            // Start detection with just markers
            // You can add other kinds of detectionTypes with the other startDetection variant
            Blippar.getSDK().startDetection()
        }

        override fun onInitialiseError(error: InitialisationError) {
            Toast.makeText(this@MainActivity, "Unable to initialise SDK with error: " + error.toString(), Toast.LENGTH_LONG).show()
            Log.e(LogTag, "Unable to initialise SDK with error: " + error.toString())
        }

        override fun onShutdown() {
            // Cleanup and remove the listener now
            Blippar.getSDK().removeSDKListener(this)
        }
    }

    /**
     * Listen to changes on Blipp states
     */
    private val mBlippStateListener = object : BlippStateListener {
        override fun onBlippLoading(blippEngineContext: BlippContext) {

            // show the close button
            bt_close.visibility = View.VISIBLE
        }

        override fun onBlippWaitingForTrackingLock(context: BlippContext) {
            // ignored
        }

        override fun onBlippLoadingProgress(context: BlippContext, i: Int) {
            // ignored
        }

        override fun onBlippLoaded(context: BlippContext) {
            // ignored
        }

        override fun onBlippEvent(context: BlippContext, eventName: String, eventJson: JSONObject?): Boolean {
            // You can listen for blipp to app events here, handle them appropriately and stop propagation by returning true`
           return false
        }

        override fun onBlippError(context: BlippContext, blipparSDKBlippErrorType: BlipparSDKBlippErrorType) {

            // hide the close button
            bt_close.visibility = View.GONE
        }

        override fun onBlippRunning(context: BlippContext, runningState: BlippRunningState) {
            // ignored
        }

        override fun onBlippClosing(context: BlippContext) {
            // ignored
        }

        override fun onBlippClosed(context: BlippContext) {

            // hide the close button
            bt_close.visibility = View.GONE
        }
    }

}
