//
//  PFUser+ParseHelpers.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/18/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <Parse/PFUser.h>

@interface PFUser (ParseHelpers)

@property (readonly) BOOL isAnonymous;

+ (BOOL)extSignUpWithUsername:(NSString *)username
                     password:(NSString *)password
                        error:(NSError **)error;
+ (instancetype)extLogInAnonymouslyWithError:(NSError **)error;

+ (instancetype)extLogInWithUsername:(NSString *)username
                            password:(NSString *)password
                               error:(NSError **)error;
+ (void)extLogOut;

@end
