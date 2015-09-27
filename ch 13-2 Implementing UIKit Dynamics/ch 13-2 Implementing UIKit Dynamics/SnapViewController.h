//
//  SnapViewController.h
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SnapViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *blueBall;
@property (nonatomic) UIDynamicAnimator *animator;

- (IBAction)handleGestureRecognizer:(UITapGestureRecognizer *)sender;

@end
