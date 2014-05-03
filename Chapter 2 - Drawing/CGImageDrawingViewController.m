//
//  CGImageDrawingViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "CGImageDrawingViewController.h"

@interface CGImageDrawingViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *splitCGImageView;
@property (weak, nonatomic) IBOutlet UIImageView *splitCGImageFlippedCorrectlyImageView;

@end

@implementation CGImageDrawingViewController

//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        // Custom initialization
//    }
//    return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImage *splitImageFlipped = [self createImageSplitInHalfAndFlipped];
    [self.splitCGImageView setImage:splitImageFlipped];
    
    UIImage *splitImageUnflipped = [self createImageSplitInHalfAndCompensatedForFlipping];
    [self.splitCGImageFlippedCorrectlyImageView setImage:splitImageUnflipped];
    
}

- (UIImage *)createImageSplitInHalfAndFlipped
{
//    UIImage *mars = [UIImage imageNamed: @"Mars"];
    UIImage *mars = [UIImage imageNamed: @"396px-Mona_Lisa"];

    
    // extract each half as a CGImage
    CGSize sz = mars.size;
    
    CGImageRef marsLeft = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(0, 0, sz.width/2.0, sz.height));
    
    CGImageRef marsRight = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(sz.width/2.0, 0, sz.width/2.0, sz.height));
    
    // draw each CGImage into an image context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width * 1.5, sz.height), NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw each side
    CGContextDrawImage(context, CGRectMake(0, 0, sz.width/2.0, sz.height), marsLeft);
    
    CGContextDrawImage(context, CGRectMake(sz.width, 0, sz.width/2.0, sz.height), marsRight);
    
    // create the UIImage
    UIImage *marsSplit = UIGraphicsGetImageFromCurrentImageContext();
    
    // clean up
    UIGraphicsEndImageContext();
    CGImageRelease(marsLeft);
    CGImageRelease(marsRight);

    return marsSplit;
}

- (UIImage *)createImageSplitInHalfAndCompensatedForFlipping
{
    //    UIImage *mars = [UIImage imageNamed: @"Mars"];
    UIImage *mars = [UIImage imageNamed: @"396px-Mona_Lisa"];
    
    
    // extract each half as a CGImage
    CGSize sz = mars.size;
    
    CGImageRef marsLeft = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(0, 0, sz.width/2.0, sz.height));
    
    CGImageRef marsRight = CGImageCreateWithImageInRect([mars CGImage], CGRectMake(sz.width/2.0, 0, sz.width/2.0, sz.height));
    
    // draw each CGImage into an image context
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(sz.width * 1.5, sz.height), NO, 0);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw each side
    CGContextDrawImage(context, CGRectMake(0, 0, sz.width/2.0, sz.height), flip(marsLeft));
    
    CGContextDrawImage(context, CGRectMake(sz.width, 0, sz.width/2.0, sz.height), flip(marsRight));
    
    // create the UIImage
    UIImage *marsSplit = UIGraphicsGetImageFromCurrentImageContext();
    
    // clean up
    UIGraphicsEndImageContext();
    CGImageRelease(marsLeft);
    CGImageRelease(marsRight);
    
    return marsSplit;
}


// My first function
CGImageRef flip (CGImageRef im)
{
    CGSize sz = CGSizeMake(CGImageGetWidth(im), CGImageGetHeight(im));
    
    UIGraphicsBeginImageContextWithOptions(sz, NO, 0);
    
    CGContextDrawImage(UIGraphicsGetCurrentContext(), CGRectMake(0, 0, sz.width, sz.height), im);
    
    CGImageRef result = [UIGraphicsGetImageFromCurrentImageContext() CGImage];
    
    UIGraphicsEndImageContext();
    
    return result;
}

@end
