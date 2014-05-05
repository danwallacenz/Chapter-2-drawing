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
#import "ArrowWithGradient.h"
#import "ArrowWithPatternedHead.h"
#import "ArrowRotated.h"
#import "BlueRectangleWithACornerCutOut.h"

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
    
    
    ArrowWithGradient *arrowWithGradient = [[ArrowWithGradient alloc] initWithFrame:CGRectMake(20, 380, 150, 100)];
    arrowWithGradient.opaque = NO;
    arrowWithGradient.layer.masksToBounds = YES;
    arrowWithGradient.layer.borderColor = [UIColor redColor].CGColor;
    arrowWithGradient.layer.borderWidth = 2;
    
    [self.view addSubview: arrowWithGradient];
    
    
    ArrowWithPatternedHead *arrowWithPatternedHead = [[ArrowWithPatternedHead alloc] initWithFrame:CGRectMake(20, 550, 150, 100)];
    arrowWithPatternedHead.opaque = NO;
    arrowWithPatternedHead.layer.masksToBounds = YES;
    arrowWithPatternedHead.layer.borderColor = [UIColor blueColor].CGColor;
    arrowWithPatternedHead.layer.borderWidth = 2;
    
    [self.view addSubview: arrowWithPatternedHead];
    
    
    ArrowRotated *arrowRotated = [[ArrowRotated alloc] initWithFrame:CGRectMake(420, 20, 150, 120)];
    arrowRotated.opaque = NO;
    arrowRotated.layer.masksToBounds = YES;
    arrowRotated.layer.borderColor = [UIColor blueColor].CGColor;
    arrowRotated.layer.borderWidth = 2;
    
    [self.view addSubview: arrowRotated];
    
    
    BlueRectangleWithACornerCutOut *blueRectangleWithACornerCutOut = [[BlueRectangleWithACornerCutOut alloc] initWithFrame:CGRectMake(420, 220, 100, 100)];
//    blueRectangleWithACornerCutOut.opaque = NO;
    blueRectangleWithACornerCutOut.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:1.0];
//    blueRectangleWithACornerCutOut.layer.masksToBounds = YES;
//    blueRectangleWithACornerCutOut.layer.borderColor = [UIColor blueColor].CGColor;
//    blueRectangleWithACornerCutOut.layer.borderWidth = 2;
    
    [self.view addSubview: blueRectangleWithACornerCutOut];
    
    BlueRectangleWithACornerCutOut *blueRectangleWithACornerCutOut2 = [[BlueRectangleWithACornerCutOut alloc] initWithFrame:CGRectMake(420, 380, 100, 100)];
//    blueRectangleWithACornerCutOut2.opaque = NO;
    blueRectangleWithACornerCutOut2.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.99];
//    blueRectangleWithACornerCutOut2.layer.masksToBounds = YES;
//    blueRectangleWithACornerCutOut2.layer.borderColor = [UIColor blueColor].CGColor;
//    blueRectangleWithACornerCutOut2.layer.borderWidth = 2;
    
    [self.view addSubview: blueRectangleWithACornerCutOut2];
    
}

@end
