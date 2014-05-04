//
//  VignetteFilter.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "VignetteFilter.h"

@interface VignetteFilter ()
@property (nonatomic, strong) CIImage *inputImage;
@end

@implementation VignetteFilter

-(CIImage *)outputImage
{
    CGRect inextent = self.inputImage.extent;
    
    // first filter
    CIFilter *grad = [CIFilter filterWithName:@"CIRadialGradient"];
    CIVector *center = [CIVector vectorWithX: inextent.size.width/2.0
                                           Y: inextent.size.height/2.0];
    [grad setValue: center
            forKey:@"inputCenter"];
    [grad setValue: @85
            forKey:@"inputRadius0"];
    [grad setValue: @100
            forKey:@"inputRadius1"];
    
    CIImage *gradImage =[grad valueForKey:@"outputImage"];
    
    // second filter
    CIFilter *blend = [CIFilter filterWithName:@"CIBlendWithMask"];
    [blend setValue: self.inputImage
             forKey:@"inputImage"];
    [blend setValue: gradImage
             forKey:@"inputMaskImage"];
    
    return blend.outputImage;
}


@end
