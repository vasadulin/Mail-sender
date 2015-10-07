//
//  ACMailSender.mm
//
//  Created by vasadulin on 05.10.15.
//
//

#include "ACMailSender.h"
#include "AppController.h"
#import <MessageUI/MessageUI.h>
#import "ACIsolatedMailSender.h"

namespace myNamespace {

void ACMailSender::sendMail(const char* localImageFName,
                            const char* subject,
                            const char* messageBody,
                            const char* fnameForUser)
{
    ACIsolatedMailSender* mailSender = [[ACIsolatedMailSender alloc]
                                        initWithSubject:[NSString stringWithUTF8String:subject]
                                            messageBody:[NSString stringWithUTF8String:messageBody]
                                     relativeFnameImage:[NSString stringWithUTF8String:localImageFName]
                                           fnameForUser:[NSString stringWithUTF8String:fnameForUser]];
    [mailSender showPopup];
}

} //myNamespace
