//
//  AppDelegate.m
//  ObjCSample
//
//

#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>

// Build settings - Bitcode encoding needs to be off.
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

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // The app specific key to access Blippar.
    [BlipparSDK setKey:@"74d0a61884974e52848bb13c198514c3fdbd0115573129a28e13870c4783e33a5520b1ee"];
    // Get the shared instance of the BlipparSDK.
    BlipparSDK* sdk = [BlipparSDK sharedInstance];
    // Make this app delegate a delegate of the SDK.
    [sdk addSDKDelegate:self];
    // Initialse SDK.
    [sdk initialise];
    // Logging level can be set.
    sdk.logLevel = BlipparLogLevelWarning;

    return YES;
}

#pragma mark - BlipparSDKDelegate

- (void) onBlipparInitialiseSuccess {
    
    // You can do anything specific to your app with a successfully initialised SDK.
    
    // This allows test Blipps to be used.
    BlipparSDK* sdk = [BlipparSDK sharedInstance];
    sdk.debugTestBlippsEnabled = YES;
    [sdk.debugConsole start];
}

- (void) onBlipparInitialiseError:(BlipparSDKError *)error {
    // Handle any error that may have occured when trying to initialise the SDK.
    NSLog(@"%@",error.description);
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error"
                                                                   message:error.localizedDescription
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *closeAction = [UIAlertAction actionWithTitle: @"OK"
                                                          style: UIAlertActionStyleDefault
                                                        handler: nil];
    [alert addAction:closeAction];
    [self.window.rootViewController presentViewController: alert animated: YES completion: nil];
}

- (void) onBlipparShutdown {
    // You can do anything specific to your app when the SDK is successfully shutdown.
}

@end
