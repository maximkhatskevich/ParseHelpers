//
//  PFUser+ParseHelpers.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/18/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFUser+ParseHelpers.h"

#import <Parse/PFAnonymousUtils.h>
#import "MKHGenericHelpers.h"

//===

@implementation PFUser (ParseHelpers)

#pragma mark - Property accessors

- (BOOL)isAnonymous
{
    return [PFAnonymousUtils isLinkedWithUser:self];
}

#pragma mark - Custom

+ (BOOL)extSignUpWithUsername:(NSString *)username
                     password:(NSString *)password
                        error:(NSError **)error
{
    BOOL result = NO;
    
    //===
    
    PFUser *user = [self currentUser];
    
    //===
    
    if (user.isAnonymous)
    {
        // user is logged in anonymously
        
        //===
        
        DLog(@"Anonymous user with ID '%@' is about to sign up.",
             user.objectId);
        
        //===
        
        // lets convert anonymous user into a regular one
        
        user.username = username;
        user.password = password;
        user.email = username;
        
        result = [user signUp:error];
        
        if (!*error && result)
        {
            DLog(@"Anonymous user CONVERTED successfully");
        }
        else
        {
            DLog(@"Anonymous user CONVERTION failure, error: %@", *error);
        }
    }
    else
    {
        // no logged in user OR a regular user is logged in
        
        //===
        
        [self extLogOut];
        
        //===
        
        // lets try to sign up then
        
        user = [self user]; // create new user !!!
        
        user.username = username;
        user.password = password;
        user.email = username; // NOTE: we assume username is a valid email!
        
        result = [user signUp:error];
        
        if (!*error && result)
        {
            DLog(@"SIGNED UP successfully");
        }
        else
        {
            DLog(@"SIGN UP failure");
        }
    }
    
    //===
    
    return result;
}

+ (instancetype)extLogInAnonymouslyWithError:(NSError **)error
{
    __block PFUser *currentUser = nil;
    
    //===
    
    currentUser = [self currentUser];
    
    //===
    
    if (currentUser)
    {
        // lets check the type of user
        
        if (currentUser.isAnonymous)
        {
            // already logged in as anonymous user
            
            DLog(@"Anonymous user ALREADY logged in");
            DLog(@"User with ID: %@", currentUser.objectId);
        }
        else
        {
            [self extLogOut];
        }
    }
    
    //===
    
    if (!currentUser.isAnonymous)
    {
        // log in anonymously
        
        dispatch_semaphore_t canProceed = dispatch_semaphore_create(0);
        
        [PFAnonymousUtils
         logInWithBlock:^(PFUser *user, NSError *logInError) {
             
             if (!logInError && user)
             {
                 DLog(@"Anonymous user LOGGED IN with ID: %@",
                      user.objectId);
             }
             else
             {
                 *error = logInError;
                 DLog(@"Anonymous user LOG IN failure");
             }
             
             //===
             
             dispatch_semaphore_signal(canProceed);
         }];
        
        //===
        
        dispatch_semaphore_wait(canProceed, DISPATCH_TIME_FOREVER);
    }
    
    //===
    
    return [self currentUser];
}

+ (instancetype)extLogInWithUsername:(NSString *)username
                            password:(NSString *)password
                               error:(NSError **)error
{
    [self extLogOut];
    
    //===
    
    id result =
    [self
     logInWithUsername:username
     password:password
     error:error];
    
    if (!*error && result)
    {
        DLog(@"LOGGED IN successfully");
    }
    else
    {
        DLog(@"LOG IN failure");
    }
    
    //===
    
    return result;
}

+ (void)extLogOut
{
    __block PFUser *user = [self currentUser];
    
    if (user)
    {
        DLog(@"User with ID '%@' will log out.", user.objectId);
        
        if (user.isAnonymous)
        {
            DLog(@"Anonymouse user will be deleted.");
            [user deleteEventually];
        }
        else
        {
            [self logOut];
            DLog(@"User is logged out now.");
        }
    }
}

@end
