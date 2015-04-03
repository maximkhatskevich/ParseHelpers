//
//  PFObject+ParseHelpersKVO.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import <Parse/Parse.h>

//===

@interface PFObject (ParseHelpersKVO)

// returns on Main queue!!!
- (void)observeWithObserver:(NSObject *)observer changes:(void(^)(id object))changeHandler;
- (void)unobserveWithObserver:(NSObject *)observer;

@end
