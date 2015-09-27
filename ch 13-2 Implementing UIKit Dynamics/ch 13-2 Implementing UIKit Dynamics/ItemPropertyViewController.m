//
//  ItemPropertyViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ItemPropertyViewController.h"

@interface ItemPropertyViewController ()

@end

@implementation ItemPropertyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior =
        [[UIGravityBehavior alloc] initWithItems:@[self.ball1,self.ball2]];
    UICollisionBehavior *collisionBehavior =
        [[UICollisionBehavior alloc] initWithItems:@[self.ball1,self.ball2]];
    UIDynamicItemBehavior* propertiesBehavior =
        [[UIDynamicItemBehavior alloc] initWithItems:@[self.ball2]];

    propertiesBehavior.elasticity = 0.75f;
    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;

    [self.animator addBehavior:propertiesBehavior];
    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
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
