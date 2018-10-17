//
//  ProgressView.swift
//  SwiftSample
//
//

import UIKit

class ProgressView: UIView {
    
    // When percentage is changed setNeedsDisplay is called on this view.
    var percentage : Int32 = 0 { didSet { self.setNeedsDisplay() } }

    override func draw(_ rect: CGRect) {
        
        // Create two different line widths.
        let markLineWidth : CGFloat = 2.0
        let fillLineWidth : CGFloat = 4.0
        
        // Set up start and end angles.
        let startAngle : CGFloat = -.pi/2.0
        let endAngle : CGFloat = startAngle + CGFloat(Double(percentage) / 100.0) * .pi * 2.0
        
        // Get the view's context.
        let context : CGContext = UIGraphicsGetCurrentContext()!
        
        // Set view's alpha to 0.7.
        alpha = 0.7
        
        // Fill a semi-transparent circle.
        context.setFillColor(gray: 0.9, alpha: 0.5)
        context.addEllipse(in: rect)
        context.fillPath()

        // Set narrower line width.
        context.setLineWidth(markLineWidth)
        
        // Draw complete circle track.
        context.setStrokeColor(UIColor.lightGray.cgColor)
        context.addEllipse(in: rect.insetBy(dx: fillLineWidth / 2.0, dy: fillLineWidth / 2.0))
        context.strokePath()
        
        // Set wider line width.
        context.setLineWidth(fillLineWidth)
        
        // Draw amount of circle that represents the percentage.
        context.setStrokeColor(UIColor.red.cgColor) //red: 0.0, green: 0.5, blue: 0.5, alpha: 0.9)
        context.setLineCap(.round)
        context.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.midX - fillLineWidth / 2.0, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        context.strokePath()
    }
}
