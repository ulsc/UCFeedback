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

- (id)initWithFrame:(CGRect)frame andTitle:(NSString *)title andButtonType:(UIButtonType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *feedbackButton = [UIButton buttonWithType:type];
        feedbackButton.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
        [feedbackButton setTitle:title forState:UIControlStateNormal];
        [feedbackButton addTarget:self action:@selector(feedbackTapped:) forControlEvents:UIControlEventTouchUpInside];
        
        // You can customize the button here
        
        [self addSubview:feedbackButton];
    }
    return self;
}

- (void)feedbackTapped:(id)sender
{
    // Check if Retina for Screenshot
    if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)])
        UIGraphicsBeginImageContextWithOptions(self.delegate.view.window.bounds.size, NO, [UIScreen mainScreen].scale);
    else
        UIGraphicsBeginImageContext(self.delegate.view.window.bounds.size);
    // Render visible objects
    [self.delegate.view.window.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // Create the screenshot data
    NSData * data = UIImagePNGRepresentation(image);
    // Send the data via mail
    [self sendMail:self withScreenshot:data];
}

- (void)sendMail:(id)sender withScreenshot:(NSData *)screenshot
{
    // Check if the device can send mail
    if ([MFMailComposeViewController canSendMail])
    {
        // Create the mail composer
        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        // Set mail composer delegate
        mailer.mailComposeDelegate = self;
        
        // Set Mail Subject
        [mailer setSubject:kFeedbackSubject];
        // Set Recipients
        NSArray *toRecipients = [NSArray arrayWithObjects:kFeedbackMail, nil];
        // Set Message Body
        NSString *emailBody = @"";
        
        // Prepare the mail to send
        [mailer setToRecipients:toRecipients];
        [mailer addAttachmentData:screenshot mimeType:@"image/png" fileName:@"feedback"];
        [mailer setMessageBody:emailBody isHTML:NO];
        
        // if iPad
        // mailer.modalPresentationStyle = UIModalPresentationPageSheet;
        
        [self.delegate presentModalViewController:mailer animated:YES];
    }
    else
    {
        // Device can't send mail
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
            // User cancelled the sending operation
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            // User cancelled the sending operation but tapped "Save Draft"
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            // User sent the mail
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            // The sending operation failed
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            // You probably won't see this, but this is a safety measure
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
