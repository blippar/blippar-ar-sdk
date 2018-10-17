//
//  AppDelegate.swift
//  SwiftSample
//
//

import UIKit
import AVFoundation

// Build settings - Bitcode encoding needs to be off
//
// In target - Build Phases add:
//
// New Copy Phase to add BlipparSDK.framework
// Libraries to link with also add BlipparSDK.framework
//
// Add to app plist:
//
// Privacy - Camera Usage Description
//
// The following may also be required, depending on SDK features used.
//
// Privacy - Calendars Usage Description
// Privacy - Location When In Use Usage Description
// Privacy - Microphone Usage Description
// Privacy - Photo Library Usage Description
//
// Add a BlipparView to the Storyboard UIViewController
//

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, BlipparSDKDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // The app specific key to access Blippar.
        BlipparSDK.setKey("386741fadaffd1889e371ae70904a5baa5c76a1302d7e96eead68c91373153997f00689a")
        // Get the shared instance of the BlipparSDK.
        let sdk = BlipparSDK.sharedInstance()
        // Make this app delegate a delegate of the SDK.
        sdk.addSDKDelegate(self)
        // Initialse SDK.
        sdk.initialise()
        // Logging level can be set.
        sdk.logLevel = .debug
        
        return true
    }
    
    // MARK: BlipparSDKDelegate
    
    func onBlipparInitialiseSuccess() {
        
        // You can do anything specific to your app with a successfully initialised SDK.
        
        // This allows test Blipps to be used.
        let sdk = BlipparSDK.sharedInstance()
        sdk.debugTestBlippsEnabled = true
    }
    
    func onBlipparInitialiseError(_ error: BlipparSDKError) {
    
        // Handle any error that may have occured when trying to initialise the SDK.
        print(error.description)
        
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(closeAction)
        self.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    func onBlipparShutdown() {
        
        // You can do anything specific to your app when the SDK is successfully shutdown.
    }
}

