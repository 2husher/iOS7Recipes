//
//  SpringAttachmentViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "SpringAttachmentViewController.h"

@interface SpringAttachmentViewController ()

@end

@implementation SpringAttachmentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(void)viewDidAppear:(BOOL)animated
{
    self.animator = [[UIDynamicAnimator alloc]
                     initWithReferenceView:self.view];

    UIGravityBehavior *gravityBehavior =
        [[UIGravityBehavior alloc] initWithItems:@[self.ball,self.star]];
    UICollisionBehavior *collisionBehavior =
        [[UICollisionBehavior alloc] initWithItems:@[self.ball,self.star]];

    CGPoint anchorPoint = CGPointMake(self.view.frame.size.width / 2, 20);

    UIAttachmentBehavior *ballAttachmentBehavior =
        [[UIAttachmentBehavior alloc] initWithItem:self.ball
                                  attachedToAnchor:anchorPoint];
    UIAttachmentBehavior *starAttachmentBehavior =
        [[UIAttachmentBehavior alloc] initWithItem:self.star
                                  offsetFromCenter:UIOffsetMake(-20.0, 0)
                                    attachedToItem:self.ball
                                  offsetFromCenter:UIOffsetZero];

    collisionBehavior.translatesReferenceBoundsIntoBoundary = YES;

    [ballAttachmentBehavior setFrequency:1.0];
    [ballAttachmentBehavior setDamping:0.65];

    [starAttachmentBehavior setFrequency:1.0];
    [starAttachmentBehavior setDamping:0.65];

    [self.animator addBehavior:ballAttachmentBehavior];
    [self.animator addBehavior:starAttachmentBehavior];
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:gravityBehavior];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.ball.hidden = YES;
    self.star.hidden = YES;
}

@end
