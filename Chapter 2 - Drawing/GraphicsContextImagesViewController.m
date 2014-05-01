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

@interface GraphicsContextImagesViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueCircleContainerViewUIKit;
@property (weak, nonatomic) IBOutlet UIView *redCircleContainerViewCoreGraphics;

@end

@implementation GraphicsContextImagesViewController

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
    
    // UIKit blue circle
    RedCircleViewCoreGraphics *redCircleView = [[RedCircleViewCoreGraphics alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    redCircleView.opaque = NO;
    [self.redCircleContainerViewCoreGraphics addSubview: redCircleView];
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
