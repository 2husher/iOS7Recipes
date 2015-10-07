//
//  AppDetailsViewController.m
//  ch 2-1: Implementing a Navigation Controller
//
//  Created by X on 07/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AppDetailsViewController.h"

@interface AppDetailsViewController ()

@end

@implementation AppDetailsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.nameLabel.text           = self.appDetails.name;
    self.descriptionTextView.text = self.appDetails.descriptionApp;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
