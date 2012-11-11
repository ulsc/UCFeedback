//
//  UCFeedback.m
//  UCFeedbackExample
//
//  Created by Ulaş Can Cengiz on 11/11/12.
//  Copyright (c) 2012 Ulas Can Cengiz. All rights reserved.
//

#import "UCFeedback.h"

#define kFeedbackMail   @"ulas@ulas.co"
#define kFeedbackSubject @"Feedback from Your Awesome App!"

@implementation UCFeedback

@synthesize delegate = _delegate;

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
        UIGraphicsBeginImageContext(self.delegate.view.window.bounds.size);
    [self.delegate.view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    NSData * data = UIImagePNGRepresentation(image);
    [self sendMail:self withScreenshot:data];
}

- (void)sendMail:(id)sender withScreenshot:(NSData *)screenshot
{
    if ([MFMailComposeViewController canSendMail])
    {
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        mailer.mailComposeDelegate = self;
        [mailer setSubject:kFeedbackSubject];
        NSArray *toRecipients = [NSArray arrayWithObjects:kFeedbackMail, nil];
        [mailer setToRecipients:toRecipients];
        [mailer addAttachmentData:screenshot mimeType:@"image/png" fileName:@"feedback"];
        NSString *emailBody = @"";
        [mailer setMessageBody:emailBody isHTML:NO];
        [self.delegate presentModalViewController:mailer animated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the composer sheet"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    // Remove the mail view
    [self.delegate dismissModalViewControllerAnimated:YES];
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
