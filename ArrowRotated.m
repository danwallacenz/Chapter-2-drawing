//
//  ArrowRotated.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 5/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ArrowRotated.h"

@interface ArrowRotated ()

@property (strong, nonatomic) UIImage *arrow;

@end

@implementation ArrowRotated

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.arrow = [self arrowImage];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
//    CGContextRef con = UIGraphicsGetCurrentContext();
//    [self.arrow drawAtPoint:CGPointMake(0,0)];
//    for (int i=0; i<3; i++) {
//        CGContextTranslateCTM(con, 20, 100);
//        CGContextRotateCTM(con, 30 * M_PI/180.0);
//        CGContextTranslateCTM(con, -20, -100);
//        [self.arrow drawAtPoint:CGPointMake(0,0)];
//    }
    
    
    // Add shadows
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetShadow(con, CGSizeMake(7, 7), 12);
    CGContextBeginTransparencyLayer(con, nil);
    [self.arrow drawAtPoint:CGPointMake(0,0)];
    for (int i=0; i<3; i++) {
        CGContextTranslateCTM(con, 20, 100);
        CGContextRotateCTM(con, 30 * M_PI/180.0);
        CGContextTranslateCTM(con, -20, -100);
        [self.arrow drawAtPoint:CGPointMake(0,0)];
    }
    CGContextEndTransparencyLayer(con);
    
}

- (UIImage*) arrowImage
{
    CGFloat EIGHTY = 80.0;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(40,100), NO, 0.0);
    // obtain the current graphics context
    CGContextRef con = UIGraphicsGetCurrentContext();
    // draw the arrow into the image context
    // draw it at (0,0)! adjust all x-values by subtracting 80
    // ... actual code omitted ...
    
    CGContextSaveGState(con);
    // punch triangular hole in context clipping region
    CGContextMoveToPoint(con, 90 - EIGHTY, 100);
    CGContextAddLineToPoint(con, 100 - EIGHTY, 90);
    CGContextAddLineToPoint(con, 110 - EIGHTY, 100);
    CGContextClosePath(con);
    CGContextAddRect(con, CGContextGetClipBoundingBox(con));
    CGContextEOClip(con);
    // draw the vertical line, add its shape to the clipping region
    CGContextMoveToPoint(con, 100 - EIGHTY, 100);
    CGContextAddLineToPoint(con, 100 - EIGHTY, 19);
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
                                 con, grad, CGPointMake(89 - EIGHTY,0), CGPointMake(111 - EIGHTY,0), 0);
    CGColorSpaceRelease(sp);
    CGGradientRelease(grad);
    CGContextRestoreGState(con); // done clipping
    
    // draw the red triangle, the point of the arrow
    //CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    // draw the pattern
    
#define createPatternWithQuartz2  1
#if createPatternWithQuartz2==1
    
    // Use Core Graphics
    CGColorSpaceRef sp2 = CGColorSpaceCreatePattern(nil);
    CGContextSetFillColorSpace (con, sp2);
    CGColorSpaceRelease (sp2);
    CGPatternCallbacks callback = {
        0, drawStripes2, nil
    };
    CGAffineTransform tr = CGAffineTransformIdentity;
    CGPatternRef patt = CGPatternCreate(nil,
                                        CGRectMake(0,0,4,4),
                                        tr,
                                        4, 4,
                                        kCGPatternTilingConstantSpacingMinimalDistortion,
                                        true,
                                        &callback);
    CGFloat alph = 1.0;
    CGContextSetFillPattern(con, patt, &alph);
    CGPatternRelease(patt);
    
#elif createPatternWithQuartz2==2
    
    // use UIKit
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(4,4), NO, 0);
    drawStripes(nil, UIGraphicsGetCurrentContext());
    UIImage* stripes = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIColor* stripesPattern = [UIColor colorWithPatternImage:stripes];
    [stripesPattern setFill];
    UIBezierPath* p = [UIBezierPath bezierPath];
    [p moveToPoint:CGPointMake(80 - EIGHTY,25)];
    [p addLineToPoint:CGPointMake(100 - EIGHTY,0)];
    [p addLineToPoint:CGPointMake(120 - EIGHTY,25)];
    [p fill];
#endif
    
    
    // draw the arrowhead
    CGContextMoveToPoint(con, 80 - EIGHTY, 25);
    CGContextAddLineToPoint(con, 100 - EIGHTY, 0);
    CGContextAddLineToPoint(con, 120 - EIGHTY, 25);
    CGContextFillPath(con);
    
    
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return im;
}

void drawStripes2 (void *info, CGContextRef con) {
    // assume 4 x 4 cell
    CGContextSetFillColorWithColor(con, [[UIColor redColor] CGColor]);
    CGContextFillRect(con, CGRectMake(0,0,4,4));
    CGContextSetFillColorWithColor(con, [[UIColor blueColor] CGColor]);
    CGContextFillRect(con, CGRectMake(0,0,4,2));
}
@end
