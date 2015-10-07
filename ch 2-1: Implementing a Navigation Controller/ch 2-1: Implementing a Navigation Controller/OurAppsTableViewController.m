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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AppCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    switch (indexPath.row)
    {
        case 0:
            cell.textLabel.text       = @"Awesome App";
            cell.detailTextLabel.text = @"Long description of the awesome app...";
            break;
        case 1:
            cell.textLabel.text       = @"Even More Awesome App";
            cell.detailTextLabel.text =
                @"Long description of the even more awesome app...";
            break;
        case 2:
            cell.textLabel.text       = @"The Most Awesome App Ever";
            cell.detailTextLabel.text =
                @"Long description of the most awesome app ever seen...";
            break;
        default:
            cell.textLabel.text       = @"Unknown";
            cell.detailTextLabel.text = @"Unknown";
            break;
    }
    return cell;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PushAppDetails"])
    {
        AppDetailsViewController *appDetailsViewController = segue.destinationViewController;
        UITableViewCell *cell = sender;
        appDetailsViewController.appDetails =
            [[AppDetails alloc] initWithName:cell.textLabel.text
                                 description:cell.detailTextLabel.text];
    }
}

@end
