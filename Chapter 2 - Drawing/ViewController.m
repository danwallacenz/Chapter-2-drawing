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

@property (weak, nonatomic) IBOutlet UISlider *widthSlider;
@property (weak, nonatomic) IBOutlet UISlider *heightSlider;
@property (weak, nonatomic) IBOutlet UILabel *boundsWidthLabel;
@property (weak, nonatomic) IBOutlet UILabel *boundsHeightLabel;
@property (weak, nonatomic) IBOutlet UILabel *opaqueLabel;

@property (strong, nonatomic) UIImage *transparentImage;
@property (strong, nonatomic) UIImage *opaqueImage;
@property (strong, nonatomic) UIImage *transparentImageTemplate;
@property (strong, nonatomic) UIImage *opaqueImageTemplate;
@property (strong, nonatomic) UIImage *currentImage;

@property BOOL useTransparentImages;
@property BOOL useTemplateImages;


@property (weak, nonatomic) IBOutlet UISwitch *opaqueSwitch;

@end

@implementation ViewController

#pragma mark - actions.
- (IBAction)widthChanged:(UISlider *)sender {
    
    self.theImageView.bounds = CGRectMake(0, 0, sender.value, self.heightSlider.value);
    self.boundsWidthLabel.text = [NSString stringWithFormat:@"w: %f", sender.value];
}

- (IBAction)heightChanged:(UISlider *)sender {
    
    self.theImageView.bounds = CGRectMake(0, 0,  self.widthSlider.value, sender.value);
    self.boundsHeightLabel.text = [NSString stringWithFormat:@"h: %f",   sender.value];
    
}

- (IBAction)clipToBounds:(UISwitch *)sender {
    self.theImageView.clipsToBounds = !self.theImageView.clipsToBounds;
}

- (IBAction)opaqueChanged:(UISwitch *)sender {
//    self.theImageView.opaque = !self.theImageView.opaque;
    if(self.theImageView.opaque == YES){
        self.theImageView.opaque = NO;
    }else{
        self.theImageView.opaque = YES;
    }
    
    NSLog(@"opaque=%d", self.theImageView.opaque);
    self.opaqueLabel.text = [NSString stringWithFormat:self.theImageView.opaque == YES?@"yes":@"no"];
    
    [self.theImageView setNeedsDisplayInRect:self.theImageView.bounds];
    [self.view setNeedsDisplayInRect:self.view.bounds];
}

- (IBAction)mainViewBackgroundColorToggled:(UISwitch *)sender {
    if(self.view.backgroundColor){
        self.view.backgroundColor = nil;
    }else{
        self.view.backgroundColor = [UIColor colorWithRed:.8 green:.9 blue:.9 alpha:1];
    }
}


- (IBAction)imageViewBackgroundColorToggled:(UISwitch *)sender {
    if(self.theImageView.backgroundColor){
        self.theImageView.backgroundColor = nil;
    }else{
        self.theImageView.backgroundColor = [UIColor colorWithRed:.7 green:.8 blue:.8 alpha:1];
    }
}
- (IBAction)transparentImageChange:(UISwitch *)sender {
    self.useTransparentImages = sender.on;
    [self setImage];
}

- (IBAction)templateImagesChanged:(UISwitch *)sender {
    self.useTemplateImages = sender.on;
    [self setImage];
}
- (IBAction)mainViewOpacityChanged:(UISlider *)sender {
    self.view.backgroundColor = [self.view.backgroundColor colorWithAlphaComponent: sender.value];
}
- (IBAction)imageViewOpacityChanged:(UISlider *)sender {
    self.theImageView.backgroundColor = [self.theImageView.backgroundColor colorWithAlphaComponent: sender.value];

}

-(void) setImage
{
    NSLog(@"useTransparentImages %@. useTemplateImages %@.", self.useTransparentImages==YES?@"yes":@"no", self.useTemplateImages==YES?@"yes":@"no");
    NSLog(@"IMAGE BEFORE current image = %@.", self.currentImage);
    
    if(self.useTransparentImages == YES){
        if(self.useTemplateImages){
            self.currentImage = self.transparentImageTemplate;
        }else{
             self.currentImage = self.transparentImage;
        }
    }else{
        if(self.useTemplateImages == YES){
            self.currentImage = self.opaqueImageTemplate;
        }else{
            self.currentImage = self.opaqueImage;
        }
    }
    NSLog(@"IMAGE AFTER current image = %@.", self.currentImage);
    self.theImageView.image = self.currentImage;
}

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
        case 7:
            self.theImageView.contentMode = UIViewContentModeRight;
            break;
        case 8:
            self.theImageView.contentMode = UIViewContentModeTopLeft;
            break;
        case 9:
            self.theImageView.contentMode = UIViewContentModeTopRight;
            break;
        case 10:
            self.theImageView.contentMode = UIViewContentModeBottomLeft;
            break;
        case 11:
            self.theImageView.contentMode = UIViewContentModeBottomRight;
            break;
            
        default:
            break;
    }
    [self.view setNeedsDisplayInRect: self.theImageView.bounds];
    
}


#pragma mark - UIViewController methods.
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    self.transparentImage = [UIImage imageNamed: @"wheelchair-girl-two-thirds-size-transparent.png"];
    self.transparentImageTemplate = [self.transparentImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    self.opaqueImage = [UIImage imageNamed: @"wheelchair-girl-two-thirds-size-with-text-and-no-layers.png"];
    self.opaqueImageTemplate = [self.transparentImage imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    self.opaqueLabel.text = self.theImageView.opaque == YES?@"yes":@"no";
    [self.opaqueSwitch setOn:self.theImageView.opaque animated:YES];
    
    
    self.view.backgroundColor = nil;
    self.theImageView.backgroundColor = nil;
    
    self.theImageView.layer.masksToBounds = YES;
    self.theImageView.layer.borderColor = [UIColor redColor].CGColor;
    self.theImageView.layer.borderWidth = 1;

    self.theImageView.contentMode = UIViewContentModeCenter;
    
//    self.theImageView.image = self.transparentImage;
    self.currentImage = self.transparentImage;
    self.useTransparentImages = YES;
    
    self.useTemplateImages = NO;
    [self setImage];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
