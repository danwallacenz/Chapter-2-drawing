//
//  CoreImageViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "CoreImageViewController.h"
#import "VignetteFilter.h"

@interface CoreImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIImageView *secondImageView;

@end

@implementation CoreImageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.mainImageView.layer.masksToBounds = YES;
    self.mainImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.mainImageView.layer.borderWidth = 2;
//    [self.mainImageView setImage: [UIImage imageNamed:@"396px-Mona_Lisa" ]]; // normal image
    
    [self.mainImageView setImage: [self createCIImage]];
    [self.secondImageView setImage:[self createCIImageWithFilterSubclass]];
}

- (UIImage *) createCIImageWithFilterSubclass
{
    CIFilter *vig = [VignetteFilter new];
    CIImage *coreImageInputImage = [CIImage imageWithCGImage:[UIImage imageNamed: @"396px-Mona_Lisa"].CGImage];
    
    // apply the filter
    [vig setValue: coreImageInputImage forKeyPath: @"inputImage"];
    CIImage *coreImageOutputImage = vig.outputImage;
    
    UIGraphicsBeginImageContextWithOptions( coreImageOutputImage.extent.size, NO, 0 );
    [[UIImage imageWithCIImage:coreImageOutputImage] drawInRect: coreImageOutputImage.extent];
    
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return result;
}

- (UIImage *) createCIImage
{
    
    UIImage *monaLisa =  [UIImage imageNamed: @"396px-Mona_Lisa" ];
    CIImage *coreImageMonaLisa = [[CIImage alloc] initWithCGImage: monaLisa.CGImage ];
    CGRect monaLisaExtent = coreImageMonaLisa.extent;
    
    // first filter
    CIFilter *grad = [CIFilter filterWithName:@"CIRadialGradient"];
    CIVector *center = [CIVector vectorWithX: monaLisaExtent.size.width/2.0
                                           Y: monaLisaExtent.size.height/2.0];
    [grad setValue: center
            forKey:@"inputCenter"];
    [grad setValue: @85
            forKey:@"inputRadius0"];
    [grad setValue: @100
            forKey:@"inputRadius1"];
    
    CIImage *gradImage =[grad valueForKey:@"outputImage"];
    
    // second filter
    CIFilter *blend = [CIFilter filterWithName:@"CIBlendWithMask"];
    [blend setValue: coreImageMonaLisa
            forKey:@"inputImage"];
    [blend setValue: gradImage
            forKey:@"inputMaskImage"];
    
    // extract a bitmap
    CGImageRef coreGraphicsImageRef = [[CIContext contextWithOptions: nil]
                                       createCGImage: blend.outputImage
                                       fromRect:monaLisaExtent];
    
    UIImage *result = [UIImage imageWithCGImage: coreGraphicsImageRef];
    return result;
}

@end
