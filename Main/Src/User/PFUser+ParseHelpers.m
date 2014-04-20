//
//  PFUser+ParseHelpers.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/18/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFUser+ParseHelpers.h"

@implementation PFUser (ParseHelpers)

#pragma mark - Property accessors

- (BOOL)isAnonymous
{
    return [PFAnonymousUtils isLinkedWithUser:self];
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
        }
    }
    
    //===
    
    return result;
}

+ (instancetype)logInAnonymouslyWithError:(NSError **)error
{
    __block PFUser *currentUser = nil;
    *error = nil;
    
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
        
        __block BOOL canProceed = NO;
        
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
            
            canProceed = YES;
        }];
        
        //===
        
        while (!canProceed) { /* NSLog(@"Waiting for condition..."); */ }
    }
    
    //===
    
    return [self currentUser];
}

@end
