//
//  MKHMutableArray+ParseHelpers.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 01/05/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "MKHMutableArray+ParseHelpers.h"

#import <Parse/Parse.h>
#import "MKHGenericHelpers.h"

//===

@implementation MKHMutableArray (ParseHelpers)

+ (instancetype)arrayWithParseSupport
{
    MKHMutableArray *result = [[self class] array];
    
    //===
    
    [result
     setOnEqualityCheck:^BOOL(id leftObject, id rightObject){
         
         BOOL result = NO;
         
         //===
         
         if ([PFObject isClassOfObject:leftObject] &&
             [PFObject isClassOfObject:rightObject])
         {
             result =
             [((PFObject *)leftObject).objectId
              isEqualToString:((PFObject *)rightObject).objectId];
         }
         
         //===
         
         return result;
     }];
    
    //===
    
    return result;
}

@end
