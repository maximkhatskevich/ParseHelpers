//
//  PFObject+ParseHelpers.h
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 2/2/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import <Parse/PFObject.h>

@interface PFObject (ParseHelpers)

+ (NSString *)parseClassName;
- (NSDictionary *)dictionaryRepresentation;

@end
