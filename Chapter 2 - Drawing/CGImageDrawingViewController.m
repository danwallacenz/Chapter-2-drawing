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
@property (weak, nonatomic) IBOutlet UIImageView *anyResolutionImageSplitInHalfAndCompensatedForFlippingImageView;

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
    
    UIImage *anyResolutionImageSplitInHalfAndCompensatedForFlipping = [self createAnyResolutionImageSplitInHalfAndCompensatedForFlipping];
    [self.anyResolutionImageSplitInHalfAndCompensatedForFlippingImageView setImage:anyResolutionImageSplitInHalfAndCompensatedForFlipping];
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

- (UIImage *)createAnyResolutionImageSplitInHalfAndCompensatedForFlipping
{
    
    UIImage* mars = [UIImage imageNamed:@"Mars"];
    CGSize sz = mars.size;
    // Derive CGImage and use its dimensions to extract its halves
    CGImageRef marsCG = [mars CGImage];
    CGSize szCG = CGSizeMake(CGImageGetWidth(marsCG), CGImageGetHeight(marsCG));
    CGImageRef marsLeft =
    CGImageCreateWithImageInRect(
                                 marsCG, CGRectMake(0,0,szCG.width/2.0,szCG.height));
    CGImageRef marsRight =
    CGImageCreateWithImageInRect(
                                 marsCG, CGRectMake(szCG.width/2.0,0,szCG.width/2.0,szCG.height));
    UIGraphicsBeginImageContextWithOptions(
                                           CGSizeMake(sz.width*1.5, sz.height), NO, 0);
    // The rest is as before, calling flip() to compensate for flipping
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextDrawImage(con, CGRectMake(0,0,sz.width/2.0,sz.height),
                       flip(marsLeft));
    CGContextDrawImage(con, CGRectMake(sz.width,0,sz.width/2.0,sz.height),
                       flip(marsRight));
    UIImage* im = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    CGImageRelease(marsLeft); CGImageRelease(marsRight);
    return im;
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
