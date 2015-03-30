//
//  ViewController.m
//  ParseHelpers
//
//  Created by Maxim Khatskevich on 12/03/15.
//  Copyright (c) 2015 Maxim Khatsevich. All rights reserved.
//

#import "ViewController.h"

#import "ParseHelpers.h"
#import "PFObject+ParseHelpersKVO.h"

@interface ViewController ()

@end

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
    
    PFObject *obj = [PFObject objectWithClassName:@"MyClass"];
    
    [obj observeChanges:^(id object) {
        
        NSLog(@"Changed! %@", object);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
