# Mail-sender
Send email with attach for iOS from C++ code (cocos2d-x)

Now works only for iOS.

Instruction:

1. Add framework MessageUI to Build Phases->Link Binary With Libraries

2. Add files from this repository to your project

3. include "ACMailSender.h"

4. call 

          ACMailSender::sendMail("image.jpg", //file in Documents directory
                        "Mail subject",
                        "Mail body",
                        "attachement"); //file in attach will be named attachement.jpeg
