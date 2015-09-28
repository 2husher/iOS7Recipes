//
//  PushViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "PushViewController.h"

@interface PushViewController ()

@end

@implementation PushViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];

    UIPushBehavior *instantPushBehavior =
        [[UIPushBehavior alloc] initWithItems:@[self.ball1]
                                         mode:UIPushBehaviorModeInstantaneous];
    UIPushBehavior *continuousPushBehavior =
        [[UIPushBehavior alloc] initWithItems:@[self.ball2]
                                         mode:UIPushBehaviorModeContinuous];

    instantPushBehavior.angle    = -1.57;
    continuousPushBehavior.angle = -1.57;

    instantPushBehavior.magnitude    = 0.5;
    continuousPushBehavior.magnitude = 0.5;

    [self.animator addBehavior:instantPushBehavior];
    [self.animator addBehavior:continuousPushBehavior];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.ball1.hidden = YES;
    self.ball2.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
