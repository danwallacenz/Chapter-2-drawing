//
//  ArrowWithGradient.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 5/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ArrowWithGradient.h"

@implementation ArrowWithGradient

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    // obtain the current graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSaveGState(con);
    // punch triangular hole in context clipping region
    CGContextMoveToPoint(con, 90, 100);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 100);
    CGContextClosePath(con);
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    CGContextEOClip(con);
    // draw the vertical line, add its shape to the clipping region
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    CGContextReplacePathWithStrokedPath(con);
    CGContextClip(con);
    // draw the gradient
    CGFloat locs[3] = { 0.0, 0.5, 1.0 };
    CGFloat colors[12] = {
        0.3,0.3,0.3,0.8, // starting color, transparent gray
        0.0,0.0,0.0,1.0, // intermediate color, black
        0.3,0.3,0.3,0.8 // ending color, transparent gray
    };
    CGColorSpaceRef sp = CGColorSpaceCreateDeviceGray();
    CGGradientRef grad =
    CGGradientCreateWithColorComponents (sp, colors, locs, 3);
    CGContextDrawLinearGradient (
                                 con, grad, CGPointMake(89,0), CGPointMake(111,0), 0);
    CGColorSpaceRelease(sp);
    CGGradientRelease(grad);
    CGContextRestoreGState(con); // done clipping
    // draw the red triangle, the point of the arrow
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
    
}


@end
