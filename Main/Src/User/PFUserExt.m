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

@end
