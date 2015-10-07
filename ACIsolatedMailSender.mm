//
//  ACIsolatedMailSender.mm
//
//  Created by vasadulin on 06.10.15.
//
//

#import <Foundation/Foundation.h>
#import <MessageUI/MessageUI.h>
#import "ACIsolatedMailSender.h"

@implementation ACIsolatedMailSender


-(id)initWithSubject:(NSString*)subject
           messageBody:(NSString*)messageBody
    relativeFnameImage:(NSString*)relativeFnameImage
          fnameForUser:(NSString*)fnameForUser
{
    self = [super init];
    if(self)
    {
        self.subject = subject;
        self.messageBody = messageBody;
        self.relativeFnameImage = relativeFnameImage;
        self.fnameForUser = fnameForUser;
    }
    return self;
}

-(void)showPopup
{
    UIWindow* wnd = [UIApplication sharedApplication].keyWindow;
    UIViewController *topController = wnd.rootViewController;
    while (topController.presentedViewController)
    {
        topController = topController.presentedViewController;
    }
    
    MFMailComposeViewController *mailcontroller = [[MFMailComposeViewController alloc]init];
    [mailcontroller setMailComposeDelegate:self];
//    NSString *adress = @"adress@example.com";
//    NSArray *adressArray = [[NSArray alloc]initWithObjects:adress, nil];
    
    NSArray  *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir  = [documentPaths objectAtIndex:0];
    NSString  *pngfile = [documentsDir stringByAppendingPathComponent:self.relativeFnameImage];
    //NSLog(@"%@", pngfile);
    if ([[NSFileManager defaultManager] fileExistsAtPath:pngfile])
    {
        NSData *imageData = [NSData dataWithContentsOfFile:pngfile];
        
        [mailcontroller addAttachmentData:imageData mimeType:@"image/png" fileName:self.fnameForUser];
        [mailcontroller setMessageBody:self.messageBody isHTML:YES];
        //[mailcontroller setMessageBody:self.messageBody isHTML:NO];
        //[mailcontroller setToRecipients:adressArray];
        [mailcontroller setSubject:self.subject];
        [mailcontroller setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        
        [topController presentViewController:mailcontroller animated:YES completion:nil];
    }
    else
    {
        NSLog(@"ERROR!!! There is no file:%@", pngfile);
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

-(void) mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error
{
    UIWindow* wnd = [UIApplication sharedApplication].keyWindow;
    UIViewController *topController = wnd.rootViewController;
    while (topController.presentedViewController)
    {
        topController = topController.presentedViewController;
    }
    
    [topController dismissViewControllerAnimated:YES completion:nil];
}


@end


