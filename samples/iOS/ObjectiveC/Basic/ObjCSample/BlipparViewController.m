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

@property (nonatomic, weak) IBOutlet UIButton* scanButton;

@property (nonatomic, weak) IBOutlet UIImageView* detectionAnimationView;

@property (nonatomic, assign) BOOL animatingDetection;

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

- (void) setScanningUI:(BOOL)enabled {
    if (enabled) {
        
        self.blippCloseButton.hidden = YES;
        self.scanButton.hidden = NO;
        self.progressView.percentage = 0;
        self.progressView.hidden = YES;
        
        self.detectionAnimationView.hidden = YES;
        self.animatingDetection = NO;
        self.scanButton.hidden = NO;
        self.scanButton.alpha = 0.0f;
        [UIView animateWithDuration:0.25 animations:^{
            self.scanButton.alpha = 1.0f;
        }];
    } else {
        self.scanButton.hidden = YES;
        self.detectionAnimationView.hidden = YES;
        self.animatingDetection = NO;
        
        self.blippCloseButton.hidden = NO;
        
        // Set our progress indicator to zero.
        self.progressView.percentage = 0;
        self.progressView.hidden = YES;
    }
}

#pragma mark BlipparSDKDelegate

- (void) onBlipparInitialiseSuccess {
    
    // You must call the super class's method.
    [super onBlipparInitialiseSuccess];
    
    [self setScanningUI:YES];
}

- (void) onBlipparInitialiseError:(BlipparSDKError*)error {
    
    // You must call the super class's method.
    [super onBlipparInitialiseError: error];
}

#pragma mark BlipparBlippDelegate

- (void) onBlippLoading:(BlipparSDKBlippContext*)context {
    
    // You must call the super class's method.
    [super onBlippLoading:context];
    
    // We don't want detection to restart automatically on closure
    // As detection was running when we start the blipp it will restart automatically
    [context clearAutoDetectionRestart];
    
    [self setScanningUI:NO];
}

- (void) onBlippLoadingProgress: (BlipparSDKBlippContext *)context progressPercent:(int)progressPercent {
    
    // You must call the super class's method
    [super onBlippLoadingProgress: context progressPercent:progressPercent];
    
    self.progressView.percentage = progressPercent;
}

- (void) onBlippClosed:(BlipparSDKBlippContext*)context {
    
    // You must call the super class's method.
    [super onBlippClosed:context];
    
    [self setScanningUI:YES];
}

#pragma mark BlipparDetectionDelegate

- (void) onDetectionResults:(NSArray<BlipparSDKEntityDescriptor *> *)entities {
    
    // You must call the super class's method.
    [super onDetectionResults:entities];
}

#pragma mark Scan Button

- (IBAction)scanTouchDown:(id)sender {
    [[BlipparSDK sharedInstance] startDetection];
    self.detectionAnimationView.hidden = NO;
    
    CABasicAnimation *rotation;
    rotation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotation.fromValue = [NSNumber numberWithFloat:0];
    rotation.toValue = [NSNumber numberWithFloat:(2*M_PI)];
    rotation.duration = 1.25;
    rotation.repeatCount = HUGE_VALF;
    [self.detectionAnimationView.layer addAnimation:rotation forKey:@"ScanRotate"];
}

- (IBAction)scanTouchUp:(id)sender {
    [[BlipparSDK sharedInstance] stopDetection];
    self.detectionAnimationView.hidden = YES;
    [self.detectionAnimationView.layer removeAnimationForKey:@"ScanRotate"];
}

@end
