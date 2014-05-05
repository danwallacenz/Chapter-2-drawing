//
//  DrawingViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 4/05/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "DrawingViewController.h"
#import "Arrow.h"
#import "ArrowWithClipping.h"

@interface DrawingViewController ()

@end

@implementation DrawingViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    Arrow *drawingView = [[Arrow alloc] initWithFrame:CGRectMake(20, 20, 150, 100)];
//    drawingView.backgroundColor  = [UIColor redColor];
    drawingView.opaque = NO; //??
    
    drawingView.layer.masksToBounds = YES;
    drawingView.layer.borderColor = [UIColor redColor].CGColor;
    drawingView.layer.borderWidth = 1;
    
    [self.view addSubview:drawingView];
    
    ArrowWithClipping *drawingViewWithClipping = [[ArrowWithClipping alloc] initWithFrame:CGRectMake(20, 220, 150, 100)];
    drawingViewWithClipping.opaque = NO;
    drawingViewWithClipping.layer.masksToBounds = YES;
    drawingViewWithClipping.layer.borderColor = [UIColor blackColor].CGColor;
    drawingViewWithClipping.layer.borderWidth = 2;
    
    [self.view addSubview: drawingViewWithClipping];
}

@end
