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

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *result = [NSMutableDictionary dictionary];
    
    //===
    
    for (id key in self.allKeys)
    {
        result[key] = [self objectForKey:key];
    }
    
    //===
    
    return [NSDictionary dictionaryWithDictionary:result];
}

@end
