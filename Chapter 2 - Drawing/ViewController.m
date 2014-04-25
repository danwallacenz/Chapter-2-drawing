//
//  ViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 25/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *marsImageView;

@end

@implementation ViewController

- (IBAction)topSegmentedButton:(UISegmentedControl *)sender {
    long selectedIndex = sender.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            self.marsImageView.contentMode = UIViewContentModeScaleToFill;
            break;
        case 1:
            self.marsImageView.contentMode = UIViewContentModeScaleAspectFit;
            break;
        case 2:
            self.marsImageView.contentMode = UIViewContentModeScaleAspectFill;
            break;
        case 3:
            self.marsImageView.contentMode = UIViewContentModeCenter;
            break;
        case 4:
            self.marsImageView.contentMode = UIViewContentModeTop;
            break;
        case 5:
            self.marsImageView.contentMode = UIViewContentModeBottom;
            break;
        case 6:
            self.marsImageView.contentMode = UIViewContentModeLeft;
            break;
            
        default:
            break;
    }
    [self.view setNeedsDisplayInRect:self.marsImageView.bounds];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.marsImageView.image = [UIImage imageNamed:@"396px-Mona_Lisa.png"];
    
//    self.marsImageView.autoresizingMask = (UIViewAutoresizingFlexibleBottomMargin|UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleRightMargin|UIViewAutoresizingFlexibleTopMargin|UIViewAutoresizingFlexibleWidth);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
