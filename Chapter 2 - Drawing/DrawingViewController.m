//
//  DrawingViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "DrawingViewController.h"
#import "DrawingView.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DrawingView *drawingView = [[DrawingView alloc] initWithFrame:CGRectMake(20, 20, 150, 100)];
//    drawingView.backgroundColor  = [UIColor redColor];
    drawingView.opaque = NO; //??
    
    [self.view addSubview:drawingView];
}



@end
