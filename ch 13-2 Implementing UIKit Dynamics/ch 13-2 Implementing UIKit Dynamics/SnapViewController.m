//
//  SnapViewController.m
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "SnapViewController.h"

@interface SnapViewController ()

@end

@implementation SnapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@", NSStringFromCGRect(self.blueBall.frame));

    self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.blueBall.hidden = YES;

//    NSString *imageFrame = NSStringFromCGRect(self.blueBall.frame);
//    self.blueBall.frame = CGRectFromString(imageFrame);
//    NSLog(@"%@", NSStringFromCGRect(self.blueBall.frame));
}

- (IBAction)handleGestureRecognizer:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:self.view];
    if ([self.animator behaviors])
    {
        [self.animator removeAllBehaviors];
        UISnapBehavior *snapBehavior =
            [[UISnapBehavior alloc] initWithItem:self.blueBall
                                     snapToPoint:point];
        [self.animator addBehavior:snapBehavior];
    }
    else
    {
        UISnapBehavior *snapBehavior =
            [[UISnapBehavior alloc] initWithItem:self.blueBall
                                     snapToPoint:point];
        [self.animator addBehavior:snapBehavior];
    }
}

@end
