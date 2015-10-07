//
//  OurAppsTableViewController.m
//  ch 2-1: Implementing a Navigation Controller
//
//  Created by X on 07/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "OurAppsTableViewController.h"
#import "AppDetailsViewController.h"
#import "AppDetails.h"

@interface OurAppsTableViewController ()

@end

@implementation OurAppsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *name;
    NSString *description;
    if ([segue.identifier isEqualToString:@"PushAppDetailsFromCell1"])
    {
        name        = @"Awesome App";
        description = @"Long description of the awesome app...";
    }
    else if ([segue.identifier isEqualToString:@"PushAppDetailsFromCell2"])
    {
        name        = @"Even More Awesome App";
        description = @"Long description of the even more awesome app...";
    }
    else if ([segue.identifier isEqualToString:@"PushAppDetailsFromCell3"])
    {
        name        = @"The Most Awesome App Ever";
        description = @"Long description of the most awesome app ever seen...";
    }
    else
    {
        return;
    }
    AppDetailsViewController *appDetailsViewController = segue.destinationViewController;
    appDetailsViewController.appDetails = [[AppDetails alloc] initWithName:name
                                                               description:description];
}

@end
