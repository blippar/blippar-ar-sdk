//
//  BlipparViewController.m
//  ObjCSample
//
//

#import "BlipparViewController.h"
#import "ProgressView.h"

// This class subclasses the BlipparSDKViewController.

@interface BlipparViewController ()

// Create a close blipp button.
@property (nonatomic, weak) IBOutlet UIButton* blippCloseButton;

// An example of a simple progress indicator showing the progress of a Blipp download.
@property (nonatomic, weak) IBOutlet ProgressView* progressView;

@end

@implementation BlipparViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Customise button appearance.
    self.blippCloseButton.backgroundColor = [[UIColor alloc] initWithWhite:0.9 alpha:0.5];
    self.blippCloseButton.layer.cornerRadius = 8.0;
    self.blippCloseButton.hidden = YES;
    
    // Give the view a title in the navigation bar.
    self.navigationItem.title = @"Blipp Away";
}

// Connect this method to the close button added in the Storyboard.
- (IBAction) closeBlipButtonAction: (UIButton*) sender
{
    // Call the supper class's closeCurrentBlipp method.
    [self closeCurrentBlipp];
}

#pragma mark BlipparSDKDelegate

- (void) onBlipparInitialiseSuccess {
    
    // You must call the super class's method.
    [super onBlipparInitialiseSuccess];
    
    // On a successful initialisation of the SDK, detection can be started.
    BlipparSDK* blipparSDK = [BlipparSDK sharedInstance];
    [blipparSDK startDetection];
}

- (void) onBlipparInitialiseError:(BlipparSDKError*)error {
    
    // You must call the super class's method.
    [super onBlipparInitialiseError: error];
}

#pragma mark BlipparBlippDelegate

- (void) onBlippLoading:(BlipparSDKBlippContext*)context {
    
    // You must call the super class's method.
    [super onBlippLoading:context];
    
    self.blippCloseButton.hidden = NO;
    
    // Set our progress indicator to zero.
    self.progressView.percentage = 0;
}

- (void) onBlippLoadingProgress: (BlipparSDKBlippContext *)context progressPercent:(int)progressPercent {
    
    // You must call the super class's method
    [super onBlippLoadingProgress: context progressPercent:progressPercent];
    
    self.progressView.percentage = progressPercent;
}

- (void) onBlippClosed:(BlipparSDKBlippContext*)context {
    
    // You must call the super class's method.
    [super onBlippClosed:context];
    
    self.blippCloseButton.hidden = YES;
    self.progressView.percentage = 0;
}

#pragma mark BlipparDetectionDelegate

- (void) onDetectionResults:(NSArray<BlipparSDKEntityDescriptor *> *)entities {
    
    // You must call the super class's method.
    [super onDetectionResults:entities];
}

@end
