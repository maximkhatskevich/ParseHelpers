//
//  PFUserExt.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 06/03/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <Parse/Parse.h>

//===

typedef enum
{
    kUnknownUserState = 0,
    
    kNotFoundUserState,           // user does NOT exist
    kCheckingFailedUserState,     // user existance checking failed
    
    kAlreadyRegisteredUserState,  // user exists, but not logged in yet
    
    kRegisteredJustNowUserState,  // user successfully has been created
    kRegistrationFailedUserState, // registration attempt failed
    
    kAuthenticatedUserState,      // user exists and successfully logged in
    kLogInFailedUserState,        // user exists, but password seems to be incorrect
    
    kAnonymousUserState,          // anonymous user is logged in
    kAnonymousFailedUserState    // anonymous user log in failed
    
    //    kConvertedUserState,          // anonym. user successfully converted
    //    kConvertionFiledUserState,    // anonym. convertion failed
}
UserState;

//===

@interface PFUserExt : PFUser

+ (UserState)signUpWithUsername:(NSString *)username
                       password:(NSString *)password
                       andError:(NSError **)error;

+ (UserState)logInWithUsername:(NSString *)username
                      password:(NSString *)password
                      andError:(NSError **)error;

+ (UserState)logInAnonymouslyWithError:(NSError **)error;

@end
