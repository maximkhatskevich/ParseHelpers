//
//  NSObject+ParseHelpers.m
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 6/23/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import "NSObject+ParseHelpers.h"

#import "ParseMacros.h"
#import "Parse.h"

@class PFObject;

@implementation NSObject (ParseHelpers)

+ (BOOL)isObjectOfClassReady:(id)objectToCheck
{
    return
    
    // 1)
    
    //    ([objectToCheck isKindOfClass:[self class]] &&
    //     objectToCheck.isDataAvailable);
    
    // 2)
    
    isParseObjectOfClassReady(objectToCheck,
                              [[self class] parseClassName]);
}

- (BOOL)isEqualToParseObject:(id)object
{
    BOOL result = NO;
    
    //===
    
    if ([self isKindOfClass:[PFObject class]] &&
        [object isKindOfClass:[PFObject class]])
    {
        result = [((PFObject *)self).objectId
                  isEqualToString:((PFObject *)object).objectId];
    }
    
    //===
    
    return result;
}

@end
