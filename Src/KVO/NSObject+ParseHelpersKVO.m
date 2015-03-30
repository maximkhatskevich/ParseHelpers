//
//  NSObject+ParseHelpersKVO.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "NSObject+ParseHelpersKVO.h"

#import "NSObject+FBKVOController.h"
#import "MKHMacros.h"
#import "NSObject+MKHGenericHelpers.h"
#import <Parse/Parse.h>

//===

@implementation NSObject (ParseHelpersKVO)

- (void)observeParseObject:(id)targetObject withHandler:(void(^)(id object))changeHandler
{
    if ([PFObject isClassOfObject:targetObject] && changeHandler)
    {
        PFObject *parseObject = (PFObject *)targetObject;
        
        //===
        
        [self.KVOController
         observe:parseObject
         keyPath:MKH_selectorStr(updatedAt)
         options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
         block:^(id observer, id object, NSDictionary *change) {
             
             if (parseObject.isDataAvailable)
             {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     
                     changeHandler(parseObject);
                 });
             }
         }];
    }
}

@end
