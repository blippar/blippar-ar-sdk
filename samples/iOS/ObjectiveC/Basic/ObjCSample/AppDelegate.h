//
//  AppDelegate.h
//  ObjCSample
//
//

#import <UIKit/UIKit.h>
#import <BlipparSDK/BlipparSDK.h>

// Make this app delegate a delegate of BlipparSDKDelegate.

@interface AppDelegate : UIResponder <UIApplicationDelegate, BlipparSDKDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

