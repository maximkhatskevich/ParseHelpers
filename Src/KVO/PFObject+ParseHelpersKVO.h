//
//  PFObject+ParseHelpersKVO.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 30/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

@import Parse;

//===

// input param is "id", NOT "PFObject" to let developer
// to make input parameter of its custom PFObject-subclass
typedef void (^ParseHelpersKVOBlock)(id object);

//===

@interface PFObject (ParseHelpersKVO)

- (void)observeChanges:(ParseHelpersKVOBlock)changeHandler;

@end
