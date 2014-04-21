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

@end
