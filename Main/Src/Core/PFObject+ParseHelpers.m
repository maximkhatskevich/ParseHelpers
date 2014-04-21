//
//  PFObject+ParseHelpers.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/2/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "PFObject+ParseHelpers.h"

@implementation PFObject (ParseHelpers)

+ (NSString *)parseClassName
{
    return NSStringFromClass([self class]);
}

@end
