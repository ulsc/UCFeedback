//
//  ViewController.m
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/10/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UCFeedback *feedback = [[UCFeedback alloc] initWithFrame:CGRectMake(110, 150, 100, 50) andTitle:@"Feedback" andButtonType:UIButtonTypeRoundedRect];
    feedback.delegate = self;
    [self.view addSubview:feedback];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
