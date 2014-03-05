//
//  PFUserExt.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 06/03/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <Parse/Parse.h>

@interface PFUserExt : PFUser

+ (BOOL)signUpWithUsername:(NSString *)username
                  password:(NSString *)password
                     error:(NSError **)error;

+ (instancetype)logInAnonymouslyWithError:(NSError **)error;

@end
