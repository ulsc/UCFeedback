//
//  UCFeedback.h
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/11/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <MessageUI/MessageUI.h>

@class UCFeedback;
@protocol UCFeedbackDelegate
@end

@interface UCFeedback : UIView <MFMailComposeViewControllerDelegate>

@property (nonatomic,assign) UIViewController <UCFeedbackDelegate> *delegate;

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andButtonType:(UIButtonType)type;

@end
