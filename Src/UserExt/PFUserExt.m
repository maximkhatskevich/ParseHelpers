//
//  PFUserExt.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 06/03/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFUserExt.h"

#import "PFUser+ParseHelpers.h"
#import <Parse/PFAnonymousUtils.h>

//===

@implementation PFUserExt

#pragma mark - Overrided methods

+ (instancetype)logInWithUsername:(NSString *)username
                         password:(NSString *)password
                            error:(NSError **)error
{
    return
    [self
     extLogInWithUsername:username
     password:password
     error:error];
}

+ (void)logOut
{
    [self extLogOut];
}

@end
