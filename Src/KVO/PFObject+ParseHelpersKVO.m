//
//  PFObject+ParseHelpersKVO.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "PFObject+ParseHelpersKVO.h"

#import "NSObject+FBKVOController.h"
#import "MKHMacros.h"

//===

@implementation PFObject (ParseHelpersKVO)

- (void)observeChanges:(void(^)(id object))changeHandler
{
    if (changeHandler)
    {
        MKH_weakSelfMacro;
        
        //===
        
        [self.KVOController
         observe:self
         keyPath:MKH_selectorStr(updatedAt)
         options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
         block:^(id observer, id object, NSDictionary *change) {
             
             if (weakSelf.isDataAvailable)
             {
                 dispatch_async(dispatch_get_main_queue(), ^{
                     
                     changeHandler(weakSelf);
                 });
             }
         }];
    }
}

@end
