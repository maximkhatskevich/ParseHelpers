//
//  GenericPFSubclass.h
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 12/16/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import <Parse/Parse.h>

@interface GenericPFSubclass : PFObject<PFSubclassing>

+ (NSString *)parseClassName;
+ (BOOL)isObjectOfClassReady:(PFObject *)objectToCheck;

@end
