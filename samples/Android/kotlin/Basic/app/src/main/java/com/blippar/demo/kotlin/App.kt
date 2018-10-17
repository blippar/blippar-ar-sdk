package com.blippar.demo.kotlin

import android.app.Application
import com.blippar.ar.android.sdk.Blippar

/**
 * Copyright (c) 2017 blippar. All rights reserved.
 */

class App : Application() {
    override fun onCreate() {
        super.onCreate()

        // Set the application on the SDK
        Blippar.setApplication(this)

        // The app specific key to access Blippar.
        Blippar.setKey("9a31bfe551b9a9376b2a62c0ead065ffd84c22e89772c167fe4ce93d9783a7b87e00b5fb")
    }
}
