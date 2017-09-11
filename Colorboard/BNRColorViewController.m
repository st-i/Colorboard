//
//  BNRColorViewController.m
//  Colorboard
//
//  Created by iStef on 26.01.17.
//  Copyright © 2017 Stefanov. All rights reserved.
//

#import "BNRColorViewController.h"

@interface BNRColorViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;

@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;

@end

@implementation BNRColorViewController

-(void)viewWillDisappear:(BOOL)animated
{
    self.colorDescription.name=self.textField.text;
    self.colorDescription.color=self.view.backgroundColor;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    UIColor *color=self.colorDescription.color;
    
    //get the RGB values out of the UIColor object
    CGFloat red, green, blue;
    [color getRed:&red green:&green blue:&blue alpha:nil];
    
    //set the intial slider values
    self.redSlider.value=red;
    self.greenSlider.value=green;
    self.blueSlider.value=blue;
    
    //set the background color and text field value
    self.view.backgroundColor=color;
    self.textField.text=self.colorDescription.name;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.existingColor) {
        self.navigationItem.rightBarButtonItem=nil;
    }
}

-(IBAction)changeColor:(id)sender
{
    float red=self.redSlider.value;
    float green=self.greenSlider.value;
    float blue=self.blueSlider.value;
    
    UIColor *color=[UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.view.backgroundColor=color;
}

-(IBAction)dismiss:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [self.textField resignFirstResponder];
}

@end
