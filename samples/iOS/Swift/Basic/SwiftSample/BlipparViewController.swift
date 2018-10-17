//
//  BlipparViewController.swift
//  SwiftSample
//
//

import UIKit
import AVFoundation

// This class subclasses the BlipparSDKViewController.

class BlipparViewController: BlipparSDKViewController {
    
    // Create a close blipp button.
    @IBOutlet weak var blippCloseButton : UIButton!
    
    // An example of a simple progress indicator showing the progress of a Blipp download.
    @IBOutlet weak var progressView : ProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customise button appearance.
        blippCloseButton.backgroundColor = UIColor(white: 0.9, alpha: 0.5)
        blippCloseButton.layer.cornerRadius = 8.0
        blippCloseButton.isHidden = true;
        
        // Give the view a title in the navigation bar.
        navigationItem.title = "Blipp Away"
    }
    
    @IBAction func closeBlipButtonAction(sender: UIButton) {
        
        // Call the supper class's closeCurrentBlipp method.
        closeCurrentBlipp()
    }
    
    // MARK: BlipparSDKDelegate

    override func onBlipparInitialiseSuccess() {
        
        // You must call the super class's method.
        super.onBlipparInitialiseSuccess()
        
        // On a successful initialisation of the SDK, detection can be started.
        let sdk = BlipparSDK.sharedInstance()
        sdk.startDetection()
    }
    
    override func onBlipparShutdown() {
        
        // You must call the super class's method.
        super.onBlipparShutdown()
    }
    
    override func onBlipparInitialiseError(_ error: BlipparSDKError) {
        
        // You must call the super class's method.
        super.onBlipparInitialiseError(error)
    }
    
    // MARK: BlipparBlippDelegate
    
    override func onBlippLoading(_ context: BlipparSDKBlippContext) {
        
        // You must call the super class's method.
        super.onBlippLoading(context)
        
        blippCloseButton.isHidden = false;
        
        // Set our progress indicator to zero.
        progressView.percentage = 0
    }
    
    override func onBlippLoadingProgress(_ context: BlipparSDKBlippContext, progressPercent: Int32) {
        
        // You must call the super class's method.
        super.onBlippLoadingProgress(context, progressPercent: progressPercent)

        // Set our progress indicator to the current percentage loaded.
        progressView.percentage = progressPercent
    }
    
    override func onBlippClosed(_ context: BlipparSDKBlippContext) {
        
        // You must call the super class's method.
        super.onBlippClosed(context)
        
        blippCloseButton.isHidden = true;
        
        // Set our progress indicator to zero.
        progressView.percentage = 0
    }
    
    // MARK: BlipparDetectionDelegate
    
    override func onDetectionResults(_ entities: [BlipparSDKEntityDescriptor]) {
        
        // You must call the super class's method.
        super.onDetectionResults(entities)
    }
    
}

