//
//  UCFeedback.m
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/11/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import "UCFeedback.h"

@implementation UCFeedback

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *feedbackButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        feedbackButton.frame = frame;
        [feedbackButton setTitle:@"Feedback" forState:UIControlStateNormal];
        feedbackButton.tag = 1;
        [feedbackButton addTarget:self action:@selector(feedbackTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:feedbackButton];
    }
    return self;
}

- (void)feedbackTapped:(id)sender
{
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions([sender superview].window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext([sender superview].window.bounds.size);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImagePNGRepresentation(image);
    NSLog(@"%@",data);
    [data writeToFile:@"my.png" atomically:YES];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
