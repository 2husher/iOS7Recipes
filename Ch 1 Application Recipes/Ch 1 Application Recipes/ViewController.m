//
//  ViewController.m
//  Ch 1 Application Recipes
//
//  Created by X on 04/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.myButton setTitle:@"Click Me" forState:UIControlStateNormal];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickMe:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert You!"
                                                    message:@"This is my alert"
                                                   delegate:self
                                          cancelButtonTitle:@"Undertand"
                                          otherButtonTitles:nil];
    [alert show];
}

@end
