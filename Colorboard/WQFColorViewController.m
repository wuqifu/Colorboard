//
//  WQFColorViewController.m
//  Colorboard
//
//  Created by Wuqifu on 15/6/14.
//  Copyright (c) 2015年 Wuqifu. All rights reserved.
//

#import "WQFColorViewController.h"

@interface WQFColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;

@property (weak, nonatomic) IBOutlet UISlider *greenSlider;

@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation WQFColorViewController


- (void) viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *color = self.colorDescription.color;
    
    CGFloat red, green, blue;
    [color getRed:&red
            green:&green
             blue:&blue
            alpha:nil];
    
    
    self.redSlider.value = red;
    self.greenSlider.value = green;
    self.blueSlider.value = blue;
    
    self.view.backgroundColor = color;
    self.textField.text = self.colorDescription.name;
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // Remove the 'Done' button if this is an existing color
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.colorDescription.name = self.textField.text;
    self.colorDescription.color = self.view.backgroundColor;
}

-(IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

- (IBAction)changeColor:(UISlider *)sender {
    float red = self.redSlider.value;
    float green = self.greenSlider.value;
    float blue = self.blueSlider.value;
    
    UIColor *newColor = [UIColor colorWithRed:red
                                        green:green
                                         blue:blue
                                        alpha:1.0];
    
    self.view.backgroundColor = newColor;
}


@end
