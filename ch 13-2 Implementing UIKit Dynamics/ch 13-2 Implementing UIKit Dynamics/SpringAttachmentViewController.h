//
//  SpringAttachmentViewController.h
//  ch 13-2 Implementing UIKit Dynamics
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpringAttachmentViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *ball;
@property (weak, nonatomic) IBOutlet UIImageView *star;
@property (nonatomic) UIDynamicAnimator *animator;

@end
