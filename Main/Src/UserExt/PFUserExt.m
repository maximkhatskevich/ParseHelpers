//
//  PFUserExt.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 06/03/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFUserExt.h"

#import "PFUser+ParseHelpers.h"

@interface PFUserExt ()

@end

@implementation PFUserExt

#pragma mark - Overrided methods

+ (instancetype)logInWithUsername:(NSString *)username
                         password:(NSString *)password
                            error:(NSError **)error
{
    [[self class] logOut];
    
    //===
    
    id result =
    [PFUser logInWithUsername:username
                     password:password
                        error:error];
    
    if (!*error && result)
    {
        NSLog(@"LOGGED IN successfully");
    }
    else
    {
        NSLog(@"LOG IN failure");
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

#pragma mark - Custom methods

+ (BOOL)signUpWithUsername:(NSString *)username
                  password:(NSString *)password
                     error:(NSError **)error
{
    BOOL result = NO;
    
    //===
    
    PFUser *user = [self currentUser];
    
    //===
    
    BOOL wasAnonymous = user.isAnonymous;
    
    if (user.isAnonymous)
    {
        // user is logged in anonymously
        
        //===
        
        NSLog(@"Anonymous user with ID '%@' is about to sign up.",
              user.objectId);
        
        //===
        
        // lets convert anonymous user into a regular one
        
        user.username = username;
        user.password = password;
        user.email = username;
        
        result = [user signUp:error];
        
        if (!*error && result)
        {
            NSLog(@"Anonymous user CONVERTED successfully");
        }
        else
        {
            NSLog(@"Anonymous user CONVERTION failure");
            
            if (wasAnonymous)
            {
                [[self class] logInAnonymouslyWithError:nil];
            }
        }
    }
    else
    {
        // no logged in user OR a regular user is logged in
        
        //===
        
        [self logOut];
        
        //===
        
        // lets try to sign up then
        
        user = [PFUser user]; // create new user !!!
        
        user.username = username;
        user.password = password;
        user.email = username;
        
        result = [user signUp:error];
        
        if (!*error && result)
        {
            NSLog(@"SIGNED UP successfully");
        }
        else
        {
            NSLog(@"SIGN UP failure");
            
            if (wasAnonymous)
            {
                [[self class] logInAnonymouslyWithError:nil];
            }
        }
    }
    
    //===
    
    return result;
}

+ (instancetype)logInAnonymouslyWithError:(NSError **)error
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
            
            NSLog(@"Anonymous user ALREADY logged in");
            NSLog(@"User with ID: %@", currentUser.objectId);
        }
        else
        {
            [self logOut];
        }
    }
    
    //===
    
    if (!currentUser.isAnonymous)
    {
        // log in anonymously
        
        dispatch_semaphore_t canProceed = dispatch_semaphore_create(0);
        
        [PFAnonymousUtils logInWithBlock:^(PFUser *user, NSError *logInError) {
            
            if (!logInError && user)
            {
                NSLog(@"Anonymous user LOGGED IN with ID: %@",
                      user.objectId);
            }
            else
            {
                *error = logInError;
                NSLog(@"Anonymous user LOG IN failure");
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

@end
