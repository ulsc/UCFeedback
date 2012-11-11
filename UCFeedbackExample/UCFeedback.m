//
//  UCFeedback.m
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/10/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import "UCFeedback.h"

@implementation UCFeedback

- (void)roundedRectFeedbackButton:(CGRect)frame forView:(UIView *)view
{
    UIButton *feedbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    feedbackButton.frame = frame;
        [feedbackButton setTitle:@"Feedback" forState:UIControlStateNormal];
        feedbackButton.tag = 1;
    [feedbackButton addTarget:self action:@selector(feedbackTapped:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:feedbackButton];
}

- (void)feedbackTapped:(id)sender
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions([sender superview].window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext([sender superview].window.bounds.size);
    [[sender superview].window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImagePNGRepresentation(image);
    NSLog(@"%@",data);
    [data writeToFile:@"my.png" atomically:YES];
}

@end
