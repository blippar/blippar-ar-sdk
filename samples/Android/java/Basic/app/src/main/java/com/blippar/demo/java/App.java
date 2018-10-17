package com.blippar.demo.java;

import android.app.Application;

import com.blippar.ar.android.sdk.Blippar;

/**
 * BlipparSDK
 * The Blippar Augmented Reality SDK
 *
 * By implementing the Blippar SDK in your application, you agree to the Terms and Conditions
 * described in your Blippar_SDK_License_Agreement_*.pdf file which can be found in your Blippar SDK package.
 * Copyright (c) 2017 Blippar. All rights reserved.
 *
 */

public class App extends Application {

    @Override
    public void onCreate() {
        super.onCreate();

        // Set the application on the sdk
        Blippar.setApplication(this);

        // The app specific key to access Blippar.
        Blippar.setKey("eb58d8389f5c7c1f3607eec3275b96ac77365f4dd46c06fbe6755e203ee22b7b38b8ba04");
    }
}
