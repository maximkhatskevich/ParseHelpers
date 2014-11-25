//
//  ViewController.m
//  ParseHelpersSample
//
//  Created by Maxim Khatskevich on 25/11/14.
//  Copyright (c) 2014 Maxim Khatskevich. All rights reserved.
//

#import "ViewController.h"

#import "ParseHelpers.h"

//===

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //===
    
    if (isParseObjectReady([PFObject new]))
    {
        NSLog(@"It works!");
    }
}

@end
