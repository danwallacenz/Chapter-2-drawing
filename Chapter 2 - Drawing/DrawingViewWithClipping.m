//
//  DrawingViewWithClipping.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 5/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "DrawingViewWithClipping.h"

@implementation DrawingViewWithClipping

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
    // punch triangular hole in context clipping region
    CGContextMoveToPoint(con, 90, 100);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 100);
    CGContextClosePath(con);
    
    CGRect bBox =  CGContextGetClipBoundingBox(con);
    NSLog(@"CGContextGetClipBoundingBox = %f, %f, %f, %f.",  bBox.origin.x, bBox.origin.y, bBox.size.width, bBox.size.height);
    
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    CGContextEOClip(con);
    
    // draw the vertical line
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    CGContextStrokePath(con);
    
    // draw the red triangle, the point of the arrow
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
}


@end
