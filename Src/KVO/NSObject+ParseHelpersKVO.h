//
//  NSObject+ParseHelpersKVO.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <Foundation/Foundation.h>

//===

@interface NSObject (ParseHelpersKVO)

- (void)observeParseObject:(id)targetObject withHandler:(void(^)(id object))changeHandler;

@end
