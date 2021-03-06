//
//  ResizableImagesViewController.m
//  Chapter 2 - Drawing
//
//  Created by Daniel Wallace [DATACOM] on 27/04/14.
//  Copyright (c) 2014 Daniel Wallace [DATACOM]. All rights reserved.
//

#import "ResizableImagesViewController.h"

@interface ResizableImagesViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *UIContentModeStatusLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsWidthLabel;

@property (weak, nonatomic) IBOutlet UISlider *heightSlider;
@property (weak, nonatomic) IBOutlet UISlider *widthSlider;
@property (weak, nonatomic) IBOutlet UILabel *imageHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *imageWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *capInsetsValueLabel;

@end

@implementation ResizableImagesViewController

#pragma mark - actions

- (IBAction)clipsToBoundsChanged:(UISwitch *)sender {
    self.imageView1.clipsToBounds = !self.imageView1.clipsToBounds;
}



- (IBAction)capInsetsChanged:(UISlider *)sender {
    UIImage *mars = [UIImage imageNamed:@"Mars"];
    UIImage *marsResized;
    
    UIEdgeInsets insets = UIEdgeInsetsMake(mars.size.height - sender.value, mars.size.width - sender.value, mars.size.height - sender.value, mars.size.width - sender.value);
    marsResized = [mars resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeTile];

    self.imageView1.image = marsResized;
    
    self.capInsetsValueLabel.text = [NSString stringWithFormat:@"%f",sender.value];
    
}

- (IBAction)UIImageResizingModeChanged:(UISwitch *)sender {
    
    UIImage *mars = [UIImage imageNamed:@"Mars"];
    UIImage *marsResized;
    
    if(sender.on){
        marsResized = [mars resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    }else{
        marsResized = [mars resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    }
    self.imageView1.image = marsResized;
}

- (IBAction)contentModeChanged:(UISegmentedControl *)sender
{
    
    NSString *contentModeDescription;
    
    long selectedIndex = sender.selectedSegmentIndex;
    switch (selectedIndex) {
        case 0:
            self.imageView1.contentMode = UIViewContentModeScaleToFill;
            contentModeDescription = @"UIViewContentModeScaleToFill";
            break;
        case 1:
            self.imageView1.contentMode = UIViewContentModeScaleAspectFit;
            contentModeDescription = @"UIViewContentModeScaleAspectFit";
            break;
        case 2:
            self.imageView1.contentMode = UIViewContentModeScaleAspectFill;
            contentModeDescription = @"UIViewContentModeScaleAspectFill";
            break;
        case 3:
            self.imageView1.contentMode = UIViewContentModeCenter;
            contentModeDescription = @"UIViewContentModeCenter";
            break;
        case 4:
            self.imageView1.contentMode = UIViewContentModeTop;
            contentModeDescription = @"UIViewContentModeTop";
            break;
        case 5:
            self.imageView1.contentMode = UIViewContentModeBottom;
            contentModeDescription = @"UIViewContentModeBottom";
            break;
        case 6:
            self.imageView1.contentMode = UIViewContentModeLeft;
            contentModeDescription = @"UIViewContentModeLeft";
            break;
        case 7:
            self.imageView1.contentMode = UIViewContentModeRight;
            contentModeDescription = @"UIViewContentModeRight";
            break;
        case 8:
            self.imageView1.contentMode = UIViewContentModeTopLeft;
            contentModeDescription = @"UIViewContentModeTopLeft";
            break;
        case 9:
            self.imageView1.contentMode = UIViewContentModeTopRight;
            contentModeDescription = @"UIViewContentModeTopRight";
            break;
        case 10:
            self.imageView1.contentMode = UIViewContentModeBottomLeft;
            contentModeDescription = @"UIViewContentModeBottomLeft";
            break;
        case 11:
            self.imageView1.contentMode = UIViewContentModeBottomRight;
            contentModeDescription = @"UIViewContentModeBottomRight";
            break;
            
        default:
            break;
    }
    self.UIContentModeStatusLabel.text = contentModeDescription;
    
    [self.view setNeedsDisplayInRect: self.imageView1.bounds];
}

/*
 
 - (IBAction)widthChanged:(UISlider *)sender {
 
 self.theImageView.bounds = CGRectMake(0, 0, sender.value, self.heightSlider.value);
 self.boundsWidthLabel.text = [NSString stringWithFormat:@"w: %f", sender.value];
 }
 
 - (IBAction)heightChanged:(UISlider *)sender {
 
 self.theImageView.bounds = CGRectMake(0, 0,  self.widthSlider.value, sender.value);
 self.boundsHeightLabel.text = [NSString stringWithFormat:@"h: %f",   sender.value];
 
 }
 
 */

- (IBAction)boundsHeightChanged:(UISlider *)sender
{
    self.imageView1.bounds = CGRectMake(0, 0,  self.widthSlider.value, sender.value);
    self.boundsHeightLabel.text = [NSString stringWithFormat:@"h: %f", sender.value];
}

- (IBAction)boundsWidthChanged:(UISlider *)sender
{
    self.imageView1.bounds = CGRectMake(0, 0, sender.value, self.heightSlider.value);
    self.boundsWidthLabel.text = [NSString stringWithFormat:@"w: %f", sender.value];
}


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
    
    self.imageView1.layer.masksToBounds = YES;
    self.imageView1.layer.borderColor = [UIColor redColor].CGColor;
    self.imageView1.layer.borderWidth = 1;
    
    UIImage *mars = [UIImage imageNamed:@"Mars"];
    UIImage *marsTiled = [mars resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeTile];
    self.imageView1.image = marsTiled;
    
    self.imageHeightLabel.text = [NSString stringWithFormat:@"%f", mars.size.height];
    self.imageWidthLabel.text = [NSString stringWithFormat:@"%f", mars.size.width];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
