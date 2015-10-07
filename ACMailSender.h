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
#ifndef __AmwayCalc__ACMailSender__
#define __AmwayCalc__ACMailSender__

#include <stdio.h>
#include "defines.h"

NS_DODOTS_BEGIN

class ACMailSender
{
public:

    static void sendMail(const char* localImageFName,
                         const char* subject,
                         const char* messageBody,
                         const char* fnameForUser);
};

NS_DODOTS_END


#endif /* defined(__AmwayCalc__ACMailSender__) */
