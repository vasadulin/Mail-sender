//
//  ACMailSender.h
//
//  Created by vasadulin on 05.10.15.
//
//
/*
How to use
 Example:

 ACMailSender::sendMail("image.jpg", //file in Documents directory
                        "Mail subject",
                        "Mail body",
                        "attachementName"); //file in attach will be named attachementName.jpeg

 */
#ifndef __ACMailSender__
#define __ACMailSender__

#include <stdio.h>
#include "defines.h"

namespace myNamespace {

class ACMailSender
{
public:

    static void sendMail(const char* localImageFName,
                         const char* subject,
                         const char* messageBody,
                         const char* fnameForUser);
};

} //namespace myNamespace 


#endif /* defined(__ACMailSender__) */
