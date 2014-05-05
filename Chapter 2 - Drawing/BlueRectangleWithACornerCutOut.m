//
//  BlueRectangleWithACornerCutOut.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 5/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "BlueRectangleWithACornerCutOut.h"

@implementation BlueRectangleWithACornerCutOut

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
    
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(con, [UIColor blueColor].CGColor);
    CGContextFillRect(con, rect);
    CGContextClearRect(con, CGRectMake(0,0,30,30));
}


@end
