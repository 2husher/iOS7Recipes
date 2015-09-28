//
//  ViewController.m
//  ch 13-1. View Animation Using UIKit
//
//  Created by X on 27/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)startRotationOfBall
{
    [UIView animateWithDuration:1.5f
                     animations:^{
                         self.blueBall.transform = CGAffineTransformMakeRotation(M_PI);
                     }
                     completion:^(BOOL finished) {
                         NSLog(@"Rotation Finished");
                     }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    CGFloat blueBallHeightAtStart = 10.0f;
    CGFloat blueBallWidthAtStart  = blueBallHeightAtStart;

    UIImage *blueBallImage = [[UIImage alloc] init];
    blueBallImage = [UIImage imageNamed:@"Ball"];
    self.blueBall = [[UIImageView alloc] initWithImage:blueBallImage];
    self.blueBall.frame = CGRectMake(self.view.frame.size.width / 2 - blueBallWidthAtStart / 2,
                                     20.0f,
                                     blueBallWidthAtStart,
                                     blueBallHeightAtStart);
    self.blueBall.alpha = 0.0f;
    [self.view addSubview:self.blueBall];

    CGFloat blueBallHeightAtFinish = 64.0f;
    CGFloat blueBallWidthAtFinish  = blueBallHeightAtFinish;

    [UIView animateWithDuration:3.0f
                     animations:^{
                         self.blueBall.frame = CGRectMake(self.view.frame.size.width / 2 -
                                                          blueBallWidthAtFinish / 2,
                                                          self.view.frame.size.height / 2 -
                                                          blueBallHeightAtFinish / 2,
                                                          blueBallWidthAtFinish,
                                                          blueBallHeightAtFinish);
                         self.blueBall.alpha = 1.0f;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Animation Finished");
                         [self startRotationOfBall];
                     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
