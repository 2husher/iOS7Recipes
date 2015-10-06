//
//  ViewController.m
//  ch 1-10: Handling Exceptions
//
//  Created by X on 06/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)throwFakeException:(id)sender
{
    NSException *e = [[NSException alloc] initWithName:@"FakeException"
                                                reason:@"The developer sucks!"
                                              userInfo:[NSDictionary dictionaryWithObject:@"Extra info"
                                                                                   forKey:@"Key"]];
    [e raise];
}

@end
