//
//  PFGeoPoint+Helpers.m
//  CocoaTouchHelpers
//
//  Created by Maxim Khatskevich on 11/14/13.
//  Copyright (c) 2013 Maxim Khatskevich. All rights reserved.
//

#import "PFGeoPoint+Helpers.h"

@implementation PFGeoPoint (Helpers)

- (CLLocationCoordinate2D)location
{
    CLLocationCoordinate2D result;
    
    //===
    
    result.latitude = self.latitude;
    result.longitude = self.longitude;
    
    //===
    
    return result;
}

@end
