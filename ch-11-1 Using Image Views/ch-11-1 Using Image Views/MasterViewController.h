//
//  MasterViewController.h
//  ch-11-1 Using Image Views
//
//  Created by X on 22/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreImage/CoreImage.h>
#import "DetailViewController.h"

@interface MasterViewController : UITableViewController <DetailViewControllerDelegateProtocol>

@property (strong, nonatomic) DetailViewController *detailViewController;
@property (strong, nonatomic) UIImage *mainImage;
@property (strong, nonatomic) NSMutableArray *filteredImages;

@end

