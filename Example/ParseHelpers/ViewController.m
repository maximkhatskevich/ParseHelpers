//
//  ViewController.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 12/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "ViewController.h"

#import "ParseHelpers.h"
#import "ParseHelpersKVO.h"

//===

@interface ViewController ()

@property (retain, nonatomic) PFObject *obj;

@end

//===

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //===
    
    if (isParseObjectReady(@"TestStr"))
    {
        NSLog(@"PFObject is ready!");
    }
    else
    {
        NSLog(@"Not a PFObject or it is NOT ready!");
    }
    
    //=== KVO
    
    self.obj = [PFObject objectWithClassName:@"MyClass"];
    
    [self.obj
     observeWithObserver:self
     changes:^(id object) {
         
         NSLog(@"Changed! %@", object);
     }];
}

- (void)dealloc
{
    [self.obj unobserveWithObserver:self];
}

@end