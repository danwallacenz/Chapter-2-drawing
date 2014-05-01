//
//  BlueCircleViewCoreGraphics.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 1/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "RedCircleViewCoreGraphics.h"

@implementation RedCircleViewCoreGraphics

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
 
 // Core Graphics red circle
 CGContextRef con = UIGraphicsGetCurrentContext();
 CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100));
 CGContextSetFillColorWithColor(con, [UIColor redColor].CGColor);
 CGContextFillPath(con);
 
}


@end
