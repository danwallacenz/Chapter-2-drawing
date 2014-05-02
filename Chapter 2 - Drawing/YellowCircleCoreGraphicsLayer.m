//
//  YellowCircleCoreGraphicsLayer.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 2/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "YellowCircleCoreGraphicsLayer.h"

@implementation YellowCircleCoreGraphicsLayer

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
  [self drawLayer:self.layer inContext: UIGraphicsGetCurrentContext()];
}

// Not the current context!
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextFillPath(ctx);
}

@end
