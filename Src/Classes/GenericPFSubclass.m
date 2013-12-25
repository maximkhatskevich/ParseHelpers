//
//  GenericPFSubclass.m
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 12/16/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import "GenericPFSubclass.h"

#import <Parse/PFObject+Subclass.h>

@implementation GenericPFSubclass

+ (NSString *)parseClassName
{
    return NSStringFromClass([self class]);
}

+ (BOOL)isObjectOfClassReady:(PFObject *)objectToCheck
{
    return
    
    // 1)
    
//    ([objectToCheck isKindOfClass:[self class]] &&
//     objectToCheck.isDataAvailable);
    
    // 2)
    
    isParseObjectOfClassReady(objectToCheck,
                              [[self class] parseClassName]);
}

@end
