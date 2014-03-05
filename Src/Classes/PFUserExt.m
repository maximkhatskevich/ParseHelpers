//
//  PFUserExt.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 06/03/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFUserExt.h"

#import "PFUser+ParseHelpers.h"

@implementation PFUserExt

+ (UserState)signUpWithUsername:(NSString *)username
                       password:(NSString *)password
                       andError:(NSError **)error
{
    UserState result = kUnknownUserState;
    
    //===
    
    PFUser *user = [[self class] currentUser];
    
    //===
    
    if (user.isAnonymous)
    {
        // user is logged in anonymously
        
        //===
        
        result = kAnonymousUserState;
        
        NSLog(@"Anonymous user with ID: %@", user.objectId);
        
        //===
        
        // lets convert anonymous user into a regular one
        
        user.username = username;
        user.password = password;
        user.email = username;
        
        BOOL succeeded = [user signUp:error];
        
        if (!*error && succeeded)
        {
            result = kRegisteredJustNowUserState;
            NSLog(@"Anonymous user CONVERTED successfully");
            NSLog(@"User with ID: %@", user.objectId);
        }
        else
        {
            result = kRegistrationFailedUserState;
            NSLog(@"Anonymous user CONVERTION failure");
        }
    }
    else
    {
        // no logged in user OR a regular user is logged in
        
        //===
        
        [[self class] logOut];
        
        //===
        
        // lets try to sign up then
        
        user = [PFUser user]; // create new user !!!
        
        user.username = username;
        user.password = password;
        user.email = username;
        
        BOOL succeeded = [user signUp:error];
        
        if (!*error && succeeded)
        {
            result = kRegisteredJustNowUserState;
            NSLog(@"SIGNED UP successfully");
        }
        else
        {
            result = kRegistrationFailedUserState;
            NSLog(@"SIGN UP failure");
        }
    }
    
    //===
    
    return result;
}

+ (UserState)logInWithUsername:(NSString *)username
                      password:(NSString *)password
                      andError:(NSError **)error
{
    UserState result = kUnknownUserState;
    
    //===
    
    [[self class] logOut];
    
    //===
    
    // lets try to log in then
    
    PFUser *user =
    [[self class] logInWithUsername:username
                           password:password
                              error:error];
    
    if (!*error && user)
    {
        result = kAuthenticatedUserState;
        NSLog(@"LOGGED IN successfully");
    }
    else
    {
        result = kLogInFailedUserState;
        NSLog(@"LOG IN failure");
    }
    
    //===
    
    return result;
}

+ (UserState)logInAnonymouslyWithError:(NSError **)error
{
    __block UserState result = kUnknownUserState;
    
    //===
    
    PFUser *user = [PFUser currentUser];
    
    //===
    
    if (user)
    {
        // lets check the type of user
        
        if (user.isAnonymous)
        {
            // already logged in as anonymous user
            
            result = kAnonymousUserState;
            NSLog(@"Anonymous user ALREADY logged in");
            NSLog(@"User with ID: %@", user.objectId);
            
            NSLog(@"isAuthenticated --> %d", user.isAuthenticated);
        }
        else
        {
            [[self class] logOut];
        }
    }
    
    //===
    
    if (result != kAnonymousUserState)
    {
        // log in anonymously
        
        __block BOOL canProceed = NO;
        
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *logInError) {
            
            if (!logInError)
            {
                result = kAnonymousUserState;
                NSLog(@"Anonymous user LOGGED IN with ID: %@",
                      user.objectId);
            }
            else
            {
                result = kAnonymousFailedUserState;
                *error = logInError;
                NSLog(@"Anonymous user LOG IN failure");
            }
            
            //===
            
            canProceed = YES;
        }];
        
        //===
        
        while (!canProceed) { /* NSLog(@"Waiting for condition..."); */ }
    }
    
    //===
    
    return result;
}

+ (void)logOut
{
    __block PFUser *user = [self.class currentUser];
    
    if (user)
    {
        NSLog(@"User with ID '%@' will log out.", user.objectId);
        
        if (user.isAnonymous)
        {
            NSLog(@"Anonymouse user will be deleted.");
            [user deleteEventually];
        }
        else
        {
            [PFUser logOut];
            NSLog(@"User is logged out now.");
        }
    }
}

@end
