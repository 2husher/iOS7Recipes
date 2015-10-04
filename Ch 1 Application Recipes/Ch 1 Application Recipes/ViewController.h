//
//  ViewController.h
//  Ch 1 Application Recipes
//
//  Created by X on 04/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *myButton;

-(IBAction)clickMe:(id)sender;

-(IBAction)fakeNonFatalError:(id)sender;
-(IBAction)fakeFatalError:(id)sender;

@end

