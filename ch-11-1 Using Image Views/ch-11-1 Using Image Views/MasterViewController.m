//
//  MasterViewController.m
//  ch-11-1 Using Image Views
//
//  Created by X on 22/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@property NSMutableArray *detailElems;
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);
    [self configureDetailItem];
}

- (void)configureDetailItem
{
    UIImage *image        = [[UIImage alloc] init];
    UIImage *resizedImage = [[UIImage alloc] init];
    UIImage *scaledImage  = [[UIImage alloc] init];
    if (self.mainImage != nil)
    {
        image = self.mainImage;
        resizedImage = [self scaleImage:self.mainImage
                                 toSize:self.detailViewController.imageView.frame.size];
        scaledImage  = [self aspectScaleImage:self.mainImage
                                       toSize:self.detailViewController.imageView.frame.size];
    }

    self.detailElems = [@[
                          @{ @"label" : @"Select an Image to Display",
                             @"image" : image,
                             @"showsButtons" : @(YES) },
                          @{ @"label" : @"Chosen Image Resized",
                             @"image" : resizedImage,
                             @"showsButtons" : @(NO) },
                          @{ @"label" : @"Chosen Image Scaled",
                             @"image" : scaledImage,
                             @"showsButtons" : @(NO) }
                          ] mutableCopy];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.detailViewController =
        (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    self.detailViewController.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIImage *)scaleImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}

-(UIImage *)aspectScaleImage:(UIImage *)image toSize:(CGSize)size
{
    if (image.size.height < image.size.width)
    {
        float ratio = size.height / image.size.height;
        CGSize newSize = CGSizeMake(image.size.width * ratio, size.height);
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    }
    else {
        float ratio = size.width / image.size.width;
        CGSize newSize = CGSizeMake(size.width, image.size.height * ratio);
        UIGraphicsBeginImageContext(newSize);
        [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    }
    UIImage *aspectScaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return aspectScaledImage;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        [self configureDetailItem];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDictionary *object   = self.detailElems[indexPath.row];

        // by reference get existing destinationViewController to controller?
        DetailViewController *controller =
            (DetailViewController *)[[segue destinationViewController] topViewController];
        [controller setDetailItem:object];

        controller.navigationItem.leftBarButtonItem
            = self.splitViewController.displayModeButtonItem;
        controller.navigationItem.leftItemsSupplementBackButton = YES;
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    if (self.mainImage == nil)
        return 1;
    else
        return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    if (indexPath.row == 0)
        cell.textLabel.text = NSLocalizedString(@"Selected Image", @"Detail");
    else if (indexPath.row == 1)
        cell.textLabel.text = NSLocalizedString(@"Resized Image", @"Detail");
    else if (indexPath.row == 2)
        cell.textLabel.text = NSLocalizedString(@"Scaled Image", @"Detail");

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UIImage *image = nil;
//    NSString *label;
//    BOOL showsButtons = NO;
//    if (indexPath.row == 0)
//    {
//        label = @"Select an Image to Display";
//        showsButtons = YES;
//    }
//    else if (indexPath.row == 1)
//    {
//        label = @"Chosen Image Resized";
//    }
//    else if (indexPath.row == 2)
//    {
//        label = @"Chosen Image Scaled";
//    }

}

# pragma mark - DetailViewControllerDelegateProtocol Methods

- (void)detailViewController:(DetailViewController *)controller didSelectImage:(UIImage *)image
{
    self.mainImage = image;
    [self.tableView reloadData];
}

- (void)detailViewControllerDidClearImage:(DetailViewController *)controller
{
    self.mainImage = nil;
    [self.tableView reloadData];
}

@end
