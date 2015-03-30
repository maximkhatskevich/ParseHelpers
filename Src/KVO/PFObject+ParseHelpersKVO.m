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

- (void)observeChanges:(ParseHelpersKVOBlock)changeHandler
{
    MKH_weakSelfMacro;
    
    //===
    
    [self.KVOController
     observe:self
     keyPath:MKH_selectorStr(updatedAt)
     options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew
     block:^(id observer, id object, NSDictionary *change) {
         
         if (weakSelf.isDataAvailable && changeHandler)
         {
             [weakSelf
              performSelector:@selector(notifyWithHandler:)
              withObject:changeHandler
              afterDelay:0.01]; // 0.0 - just to make it async
         }
     }];
}

- (void)notifyWithHandler:(ParseHelpersKVOBlock)changeHandler
{
    changeHandler(self);
}

@end
