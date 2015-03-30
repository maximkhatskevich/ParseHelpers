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

- (void)observeChanges:(void(^)(id object))changeHandler; // returns on Main queue!!!

@end
