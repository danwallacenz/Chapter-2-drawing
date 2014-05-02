//
//  GraphicsContextImagesViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 1/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "GraphicsContextImagesViewController.h"
#import "RedCircleViewCoreGraphics.h"
#import "BlueCircleViewUIKit.h"
#import "GreenCircleUIKitLayer.h"
#import "YellowCircleCoreGraphicsLayer.h"

@interface GraphicsContextImagesViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueCircleContainerViewUIKit;
@property (weak, nonatomic) IBOutlet UIView *redCircleContainerViewCoreGraphics;
@property (weak, nonatomic) IBOutlet UIView *greenCircleContainerViewUIKitLayer;
@property (weak, nonatomic) IBOutlet UIView *yellowCircleContainerCGLayer;
@property (weak, nonatomic) IBOutlet UIImageView *orangeCircleUIImageimageView;
@property (strong, nonatomic) UIImage *orangeCircleImage;
@property (weak, nonatomic) IBOutlet UIImageView *secondOrangeCircleUIImageimageView;
@property (weak, nonatomic) IBOutlet UIImageView *brown100X200ImageView;
@property (weak, nonatomic) IBOutlet UIImageView *blendImageView;

@end

@implementation GraphicsContextImagesViewController

#pragma  actions

- (IBAction)UIViewContentModeChanged:(UISegmentedControl *)sender {
    long selectedIndex = sender.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeScaleToFill;
            break;
        case 1:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 2:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeScaleAspectFill;
            break;
        case 3:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeCenter;
            break;
        case 4:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeTop;
            break;
        case 5:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeBottom;
            break;
        case 6:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeLeft;
            break;
        case 7:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeRight;
            break;
        case 8:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeTopLeft;
            break;
        case 9:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeTopRight;
            break;
        case 10:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeBottomLeft;
            break;
        case 11:
            self.secondOrangeCircleUIImageimageView.contentMode = UIViewContentModeBottomRight;
            break;
            
        default:
            break;
    }
}

#pragma UIViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // UIKit blue circle
    BlueCircleViewUIKit *blueCircleView = [[BlueCircleViewUIKit alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    blueCircleView.opaque = NO;
    [self.blueCircleContainerViewUIKit addSubview: blueCircleView];
    
    // CG blue circle
    RedCircleViewCoreGraphics *redCircleView = [[RedCircleViewCoreGraphics alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redCircleView.opaque = NO;
    [self.redCircleContainerViewCoreGraphics addSubview: redCircleView];
    
    // UIKit layer green circle
    GreenCircleUIKitLayer *greenCircleView = [[GreenCircleUIKitLayer alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    greenCircleView.opaque = NO;
    [self.greenCircleContainerViewUIKitLayer addSubview: greenCircleView];
 
     // CG yellow circle
    YellowCircleCoreGraphicsLayer *yellowCircleView = [[YellowCircleCoreGraphicsLayer alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    yellowCircleView.opaque = NO;
    [self.yellowCircleContainerCGLayer addSubview: yellowCircleView];
    
    // orange circles
//  200 * 200
    self.orangeCircleImage = [self createOrangeCircleImageUsingUIKit];
    
    [self.orangeCircleUIImageimageView setContentMode:UIViewContentModeCenter];
    [self.orangeCircleUIImageimageView setImage:self.orangeCircleImage];
    
//  200 * 400
    [self.secondOrangeCircleUIImageimageView setContentMode:UIViewContentModeCenter];
    [self.secondOrangeCircleUIImageimageView setImage:self.orangeCircleImage];
    
    // create an image from another image by drawing the original image at two different points.
    [self.brown100X200ImageView setImage:[self createPurpleCircleImagesSideBySide]];
    
    [self.blendImageView setImage:[self createCircleImagesOfDifferentSizesBlended ]];
}

- (UIImage *) createOrangeCircleImageUsingUIKit
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0,0,100,100)];
    [[UIColor orangeColor] setFill];
    [path fill];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *) createPurpleCircleImageUsingCoreGraphics
{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(100, 100), NO, 0);
    CGContextRef con = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(con, CGRectMake(0, 0, 100, 100));
    CGContextSetFillColorWithColor(con, [UIColor purpleColor].CGColor);
    CGContextFillPath(con);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *) createPurpleCircleImagesSideBySide
{
    UIImage *purpleCircle = [self createPurpleCircleImageUsingCoreGraphics];
    CGSize purpleCircleSize = purpleCircle.size;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(purpleCircleSize.width * 2, purpleCircleSize.height), NO, 0);
    [purpleCircle drawAtPoint:CGPointMake(0, 0)];
    [purpleCircle drawAtPoint:CGPointMake(purpleCircleSize.width, 0)];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *) createCircleImagesOfDifferentSizesBlended
{
    UIImage *purpleCircle = [self createPurpleCircleImageUsingCoreGraphics];
    UIImage *orangeCircle = [self createOrangeCircleImageUsingUIKit];
    
    CGSize viewSize = self.blendImageView.bounds.size;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.blendImageView.bounds.size.width * 2, self.blendImageView.bounds.size.height * 2), NO, 0);
    
    [purpleCircle drawInRect:CGRectMake(0, 0, viewSize.width * 2, viewSize.height * 2)];
    [orangeCircle drawInRect:CGRectMake(viewSize.width / 2.0, viewSize.height / 2.0 , viewSize.width, viewSize.height)
                   blendMode:kCGBlendModeMultiply alpha:1.0];

    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
