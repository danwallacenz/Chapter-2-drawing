//
//  DrawingView.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "Arrow.h"

@implementation Arrow

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
    
    [self drawArrowUsingUIKit];

//    [self drawArrowUsingCoreGraphics];
    
    UIBezierPath* path = [UIBezierPath
                          bezierPathWithRoundedRect: CGRectMake(2, 2, 146, 96)
                          cornerRadius: 10];
    path.lineWidth = 2;
    [UIColor.blackColor setStroke];
    [path stroke];
    
    [self drawArrowUsingCoreGraphics];
    
}

- (void) drawArrowUsingUIKit
{
    
    CGFloat OFFSET = -50.0;
    // shaft of the arrow
    UIBezierPath *p = [UIBezierPath bezierPath];
    [p moveToPoint: CGPointMake(100 + OFFSET, 100)];
    [p addLineToPoint: CGPointMake(100 + OFFSET, 19)];
    [p setLineWidth: 20];
    [p stroke];
    // point of the arrow yellow
    [[UIColor greenColor] set];
    [p removeAllPoints];
    [p moveToPoint: CGPointMake(80 + OFFSET, 25)];
    [p addLineToPoint: CGPointMake(100 + OFFSET, 0)];
    [p addLineToPoint: CGPointMake(120 + OFFSET, 25)];
    [p fill];
    // snip out triangle in the tail
    [p removeAllPoints];
    [p moveToPoint: CGPointMake(90 + OFFSET,101)];
    [p addLineToPoint: CGPointMake(100 + OFFSET, 90)];
    [p addLineToPoint: CGPointMake(110 + OFFSET, 101)];
    [p fillWithBlendMode:kCGBlendModeClear alpha: 1.0];
}

- (void) drawArrowUsingCoreGraphics
{
    // Drawing code
    
    // obtain the current graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(con, [[UIColor blackColor] CGColor]);
    
    //draw a black (by default) verticle line, the shaft of the arrow
    CGContextMoveToPoint(con, 100, 100);
    CGContextAddLineToPoint(con, 100, 19);
    CGContextSetLineWidth(con, 20);
    CGContextStrokePath(con);
    
    // draw a red triangle, the point of the arrow
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    CGContextMoveToPoint(con, 80, 25);
    CGContextAddLineToPoint(con, 100, 0);
    CGContextAddLineToPoint(con, 120, 25);
    CGContextFillPath(con);
    
    // snip a triangle out of the shaft by drawing in Clear blend mode
    CGContextMoveToPoint(con, 90, 101);
    CGContextAddLineToPoint(con, 100, 90);
    CGContextAddLineToPoint(con, 110, 101);
    CGContextSetBlendMode(con, kCGBlendModeClear);
    CGContextFillPath(con);
}

@end
