//
//  ProgressView.m
//  ObjCSample
//
//

#import "ProgressView.h"

@implementation ProgressView

- (void) setPercentage:(int)percentage {
    
    // When percentage is changed setNeedsDisplay is called on this view.
    _percentage = percentage;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    // Create two different line widths.
    CGFloat markLineWidth = 2.0;
    CGFloat fillLineWidth = 4.0;
    
    // Set up start and end angles.
    CGFloat startAngle = M_PI * 2.0;
    CGFloat endAngle = startAngle + (self.percentage / 100.0) * M_PI * 2.0;
    
    // Get the view's context.
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // Set view's alpha to 0.7.
    self.alpha = 0.7;
    
    // Fill a semi-transparent circle.
    CGContextSetGrayFillColor(context, 0.9, 0.5);
    CGContextAddEllipseInRect(context, rect);
    CGContextFillPath(context);
    
    // Set narrower line width.
    CGContextSetLineWidth(context, markLineWidth);
    
    // Draw complete circle track.
    CGContextSetStrokeColorWithColor(context, [UIColor lightGrayColor].CGColor);
    CGContextAddEllipseInRect(context, CGRectInset(rect, fillLineWidth / 2.0, fillLineWidth / 2.0));
    CGContextStrokePath(context);
    
    // Set wider line width.
    CGContextSetLineWidth(context, fillLineWidth);
    
    // Draw amount of circle that represents the percentage.
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextAddArc(context, CGRectGetMidX(rect), CGRectGetMidY(rect), CGRectGetMidX(rect) - fillLineWidth / 2.0, startAngle, endAngle, NO);
    CGContextStrokePath(context);
}

@end
