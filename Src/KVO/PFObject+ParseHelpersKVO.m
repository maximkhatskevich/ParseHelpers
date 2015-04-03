//
//  PFObject+ParseHelpersKVO.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "PFObject+ParseHelpersKVO.h"

#import "NSObject+FBKVOController.h"
#import "MKHGenericHelpers.h"

//===

@implementation PFObject (ParseHelpersKVO)

- (void)observeWithObserver:(NSObject *)observer changes:(void(^)(id object))changeHandler
{
    if ([NSObject isClassOfObject:observer] && changeHandler)
    {
        MKH_weakSelfMacro;
        
        //===
        
        [observer.KVOController
         observe:self
         keyPath:MKH_selectorStr(updatedAt)
         options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
         block:^(id observer, id object, NSDictionary *change) {
             
             if (weakSelf.isDataAvailable)
             {
                 MKH_runMain(^{
                     
                     changeHandler(weakSelf);
                 });
             }
         }];
    }
}

- (void)unobserveWithObserver:(NSObject *)observer
{
    if ([NSObject isClassOfObject:observer])
    {
        [observer.KVOController
         unobserve:self
         keyPath:MKH_selectorStr(updatedAt)];
    }
}

@end
