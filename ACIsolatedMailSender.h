//
//  ACIsolatedMailSender.h
//
//  Created by vasadulin on 06.10.15.
//
//

#import <UIKit/UIKit.h>

@interface ACIsolatedMailSender : UIViewController  <MFMailComposeViewControllerDelegate>

@property (nonatomic, retain)NSString* subject;
@property (nonatomic, retain)NSString* messageBody;
@property (nonatomic, retain)NSString* relativeFnameImage;
@property (nonatomic, retain)NSString* fnameForUser;

-(id)initWithSubject:(NSString*)subject
         messageBody:(NSString*)messageBody
  relativeFnameImage:(NSString*)relativeFnameImage
        fnameForUser:(NSString*)fnameForUser;

//open default mail client with setted parameters
-(void)showPopup;


@end

