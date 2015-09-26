//
//  ViewController.m
//  ch-12-1 Drawing Simple Shapes
//
//  Created by X on 26/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) canBecomeFirstResponder
{
    return YES;
}

- (void) viewWillAppear: (BOOL)animated
{
    [self.view becomeFirstResponder];
    [super viewWillAppear:animated];
}

- (void) viewWillDisappear: (BOOL)animated
{
    [self.view resignFirstResponder];
    [super viewWillDisappear:animated];
}

- (void) motionEnded: (UIEventSubtype)motion withEvent: (UIEvent *)event
{
    if (event.subtype == UIEventSubtypeMotionShake)
    {
        // Device was shaken

        // Acquire image of current layer
        UIGraphicsBeginImageContext(self.view.bounds.size);

        CGContextRef context = UIGraphicsGetCurrentContext();
        [self.view.layer renderInContext:context];
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();
        
        self.myView.image = image;
        [self.myView setNeedsDisplay];
    }
}

@end
