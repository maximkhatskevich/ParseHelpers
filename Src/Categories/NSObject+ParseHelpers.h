//
//  NSObject+ParseHelpers.h
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 6/23/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (ParseHelpers)

+ (BOOL)isObjectOfClassReady:(id)objectToCheck;
- (BOOL)isEqualToParseObject:(id)object;

@end
