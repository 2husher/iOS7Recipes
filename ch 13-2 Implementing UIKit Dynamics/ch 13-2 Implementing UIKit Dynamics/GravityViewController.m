//
//  GravityViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "GravityViewController.h"

@interface GravityViewController ()

@end

@implementation GravityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior =
    [[UIGravityBehavior alloc] initWithItems:@[self.blueBall]];
    [self.animator addBehavior:gravityBehavior];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.blueBall.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
