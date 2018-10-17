package com.blippar.demo.java;

import android.Manifest;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.app.ActivityCompat;
import android.support.v4.content.ContextCompat;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;

import com.blippar.ar.android.sdk.BlippContext;
import com.blippar.ar.android.sdk.BlippStateListener;
import com.blippar.ar.android.sdk.Blippar;
import com.blippar.ar.android.sdk.BlipparSDK;
import com.blippar.ar.android.sdk.BlipparSDKFragment;
import com.blippar.ar.android.sdk.InitialisationError;
import com.blippar.ar.android.sdk.internal.BlippRunningState;
import com.blippar.ar.android.sdk.internal.BlipparSDKBlippErrorType;
import com.blippar.ar.android.sdk.internal.LogLevel;

import org.json.JSONObject;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

import static android.content.pm.PackageManager.PERMISSION_GRANTED;

public class MainActivity extends AppCompatActivity {

    private static final String LOG_TAG = MainActivity.class.getSimpleName();
    private static final int CAMERA_REQUEST_CODE = 25;

    @BindView(R.id.bt_close)
    Button btClose;

    BlipparSDKFragment blipparSDKFragment;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        // set views for the activity
        setContentView(R.layout.activity_main);
        ButterKnife.bind(this);

        // Listen for the lifecycle of the SDK
        Blippar.getSDK().addSDKListener(mBlipparSDKListener);

        // Listen for blipp events
        Blippar.getSDK().addBlippStateListener(mBlippStateListener);

        // Optional, see debug logs
        Blippar.getSDK().setLogLevel(LogLevel.Debug);

        // Allow this demo blipp some blipps available to all
        // Useful to verify the app is working ok
        Blippar.getSDK().setDebugTestBlippsEnabled(true);

        // if we don't have Camera permission, ask before adding the SDK fragment
        if (!hasCameraPermission()) {
            ActivityCompat.requestPermissions(this, new String[]{Manifest.permission.CAMERA}, CAMERA_REQUEST_CODE);
        } else {
            setFragment();
        }
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();

        // Remove our listeners
        Blippar.getSDK().removeSDKListener(mBlipparSDKListener);
        Blippar.getSDK().removeBlippStateListener(mBlippStateListener);
    }

    /**
     * @return true if the app has Camera permission
     */
    private boolean hasCameraPermission() {
        return ContextCompat.checkSelfPermission(this, Manifest.permission.CAMERA) == PERMISSION_GRANTED;
    }

    /**
     * Add the Blippar's SDK fragment to the Activity's view
     */
    private void setFragment() {
        // BlipparSDKFragment does all the heavy lifting for us
        blipparSDKFragment = BlipparSDKFragment.create();

        getSupportFragmentManager().
                beginTransaction().
                replace(R.id.frame_layout, blipparSDKFragment).
                commitAllowingStateLoss();
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, @NonNull String[] permissions, @NonNull int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);

        // check if the user granted the Camera permission. If true, add the SDK Fragment
        if (requestCode == CAMERA_REQUEST_CODE && hasCameraPermission()) {
            setFragment();
        }
    }

    /**
     * Listen for SDK lifecycle events
     */
    private final BlipparSDK.BlipparSDKListener mBlipparSDKListener = new BlipparSDK.BlipparSDKListener() {
        @Override
        public void onInitialiseSuccess() {

            // Start detection with just markers
            // You can add other kinds of detectionTypes with the other startDetection variant
            Blippar.getSDK().startDetection();
        }

        @Override
        public void onInitialiseError(InitialisationError initialisationError) {
            Toast.makeText(MainActivity.this, "Unable to initialise SDK with error: " + initialisationError.toString(), Toast.LENGTH_LONG).show();
            Log.e(LOG_TAG, "Unable to initialise SDK with error: " + initialisationError.toString());
        }

        @Override
        public void onShutdown() {
            // Cleanup and remove the listener now
            Blippar.getSDK().removeSDKListener(this);
        }
    };

    /**
     * Listen to changes on Blipp states
     */
    private final BlippStateListener mBlippStateListener = new BlippStateListener() {
        @Override
        public void onBlippLoading(@NonNull BlippContext blippEngineContext) {

            // show the close button
            btClose.setVisibility(View.VISIBLE);
        }

        @Override
        public void onBlippLoadingProgress(@NonNull BlippContext context, int i) {
            // ignored
        }

        @Override
        public void onBlippLoaded(@NonNull BlippContext context) {
            // Ignored
        }

        @Override
        public void onBlippError(@NonNull BlippContext context, @NonNull BlipparSDKBlippErrorType blipparSDKBlippErrorType) {

            // hide the close button
            btClose.setVisibility(View.GONE);
        }

        @Override
        public void onBlippClosing(@NonNull BlippContext context) {
            // ignored
        }

        @Override
        public void onBlippClosed(@NonNull BlippContext context) {

            // hide the close button
            btClose.setVisibility(View.GONE);
        }

        @Override
        public void onBlippRunning(@NonNull BlippContext context, @NonNull BlippRunningState runningState) {
            // ignored
        }

        @Override
        public boolean onBlippEvent(@NonNull BlippContext blippContext, @NonNull String eventName, JSONObject eventJson) {
            // You can listen for blipp to app events here, handle them appropriately and stop propagation by returning true
            return false;
        }

        @Override
        public void onBlippWaitingForTrackingLock(@NonNull BlippContext context) {
            // ignored
        }
    };

    /**
     * Handle when the user clicks the close button
     */
    @OnClick(R.id.bt_close)
    protected void onCloseClick() {
        // if we have a blipp currently open, close the blipp
        blipparSDKFragment.closeCurrentBlipp();
    }
}
