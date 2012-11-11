//
//  ViewController.m
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/10/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import "ViewController.h"
#import "UCFeedback.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UCFeedback *feedback = [[UCFeedback alloc] init];
    [feedback roundedRectFeedbackButton:CGRectMake(0, 0, 100, 100) forView:self.view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
