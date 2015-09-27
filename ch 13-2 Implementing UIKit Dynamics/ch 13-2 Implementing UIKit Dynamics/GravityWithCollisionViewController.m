//
//  GravityWithCollisionViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "GravityWithCollisionViewController.h"

@interface GravityWithCollisionViewController ()

@end

@implementation GravityWithCollisionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{
    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    UIGravityBehavior *gravityBehavior =
        [[UIGravityBehavior alloc] initWithItems:@[self.blueBall]];
    UICollisionBehavior *collisionBehavior =
        [[UICollisionBehavior alloc]initWithItems:@[self.blueBall]];

    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;
    collisionBehavior.collisionDelegate = self;

    [self.animator addBehavior:gravityBehavior];
    [self.animator addBehavior:collisionBehavior];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.blueBall.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

# pragma mark - UICollisionBehaviorDelegate Methods

-(void)collisionBehavior:(UICollisionBehavior *)behavior
     beganContactForItem:(id<UIDynamicItem>)item
  withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p
{
    [self.blueBall setAlpha:1.0f];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior
     endedContactForItem:(id<UIDynamicItem>)item
  withBoundaryIdentifier:(id<NSCopying>)identifier
{
    [self.blueBall setAlpha:0.5f];
}

@end
