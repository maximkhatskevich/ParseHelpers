//
//  PFUser+ParseHelpers.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/18/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <Parse/Parse.h>

@interface PFUser (ParseHelpers)

@property (readonly) BOOL isAnonymous;

+ (BOOL)signUpWithUsername:(NSString *)username
                  password:(NSString *)password
                     error:(NSError **)error;

+ (instancetype)logInAnonymouslyWithError:(NSError **)error;

@end
