//
//  CoreImageViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "CoreImageViewController.h"

@interface CoreImageViewController ()
@property (weak, nonatomic) IBOutlet UIView *imageView;

@end

@implementation CoreImageViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.imageView.layer.masksToBounds = YES;
    self.imageView.layer.borderColor = [UIColor redColor].CGColor;
    self.imageView.layer.borderWidth = 2;







}



@end
