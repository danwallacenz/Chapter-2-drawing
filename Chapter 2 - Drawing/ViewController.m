//
//  ViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 25/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *theImageView;

@end

@implementation ViewController

- (IBAction)topSegmentedButton:(UISegmentedControl *)sender {
    long selectedIndex = sender.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            self.theImageView.contentMode = UIViewContentModeScaleToFill;
            break;
        case 1:
            self.theImageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 2:
            self.theImageView.contentMode = UIViewContentModeScaleAspectFill;
            break;
        case 3:
            self.theImageView.contentMode = UIViewContentModeCenter;
            break;
        case 4:
            self.theImageView.contentMode = UIViewContentModeTop;
            break;
        case 5:
            self.theImageView.contentMode = UIViewContentModeBottom;
            break;
        case 6:
            self.theImageView.contentMode = UIViewContentModeLeft;
            break;
            
        default:
            break;
    }
    [self.view setNeedsDisplayInRect: self.theImageView.bounds];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
//    self.marsImageView.image = [UIImage imageNamed:@"396px-Mona_Lisa.png"];
    

    
    self.theImageView.layer.masksToBounds = YES;
    self.theImageView.layer.borderColor = [UIColor redColor].CGColor;
    self.theImageView.layer.borderWidth = 1;
    self.theImageView.backgroundColor = nil;
    
    self.theImageView.image = [UIImage imageNamed: @"wheelchair-girl-two-thirds-size.png"];
    
    
    
//    self.marsImageView.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
