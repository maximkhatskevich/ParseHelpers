//
//  NSArray+ParseHelpers.m
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 6/23/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import "NSArray+ParseHelpers.h"
#import "NSObject+ParseHelpers.h"
#import "Parse.h"

@class PFObject;

@implementation NSArray (ParseHelpers)

- (BOOL)containsParseObject:(id)object
{
    BOOL result = NO;
    
    //===
    
    if ([object isKindOfClass:[PFObject class]])
    {
        for (id item in self)
        {
            if ([item isEqualToParseObject:object])
            {
                result = YES;
                break;
            }
        }
    }
    
    //===
    
    return result;
}

- (NSInteger)indexOfParseObject:(PFObject *)object
{
    NSInteger result = NSNotFound;
    
    //===
    
    if ([object isKindOfClass:[PFObject class]])
    {
        for (NSInteger i = 0; i < self.count; i++)
        {
            if ([self[i] isEqualToParseObject:object])
            {
                result = i;
                break;
            }
        }
    }
    
    //===
    
    return result;
}

@end
