//
//  NSMutableArray+ParseHelpers.h
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 11/8/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ParseHelpers)

- (void)safeAddUniqueParseObject:(id)object;

@end
