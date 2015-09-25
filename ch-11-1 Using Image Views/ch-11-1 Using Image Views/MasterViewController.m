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
{
    NSArray *tableCellNames;
}
@property NSMutableArray *detailElems;
@end

@implementation MasterViewController

-(NSMutableArray *)filteredImages
{
    if (!_filteredImages)
    {
        _filteredImages = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return _filteredImages;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(320.0, 600.0);

    tableCellNames = @[
                       @"Selected Image", @"Resized Image", @"Scaled Image",
                       @"Hue Adjust", @"Straighten Filter", @"Series Filter"
                       ];
}

- (void)configureDetailItem
{
    UIImage *image              = [[UIImage alloc] init];
    UIImage *resizedImage       = [[UIImage alloc] init];
    UIImage *scaledImage        = [[UIImage alloc] init];
    UIImage *huedImage          = [[UIImage alloc] init];
    UIImage *straightenedImage  = [[UIImage alloc] init];
    UIImage *filteredImage  = [[UIImage alloc] init];
    if (self.mainImage != nil)
    {
        image             = self.mainImage;
        resizedImage      = [self scaleImage:self.mainImage
                                 toSize:self.detailViewController.imageView.frame.size];
        scaledImage       = [self aspectScaleImage:self.mainImage
                                       toSize:self.detailViewController.imageView.frame.size];
        huedImage         = [self aspectScaleImage:self.filteredImages[0]
                                    toSize:self.detailViewController.imageView.frame.size];
        straightenedImage = [self aspectScaleImage:self.filteredImages[1]
                                          toSize:self.detailViewController.imageView.frame.size];
        filteredImage     = [self aspectScaleImage:self.filteredImages[2]
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
                             @"showsButtons" : @(NO) },
                          @{ @"label" : @"Hue Adjustment",
                             @"image" : huedImage,
                             @"showsButtons" : @(NO) },
                          @{ @"label" : @"Straightening Filter",
                             @"image" : straightenedImage,
                             @"showsButtons" : @(NO) },
                          @{ @"label" : @"Series Filter",
                             @"image" : filteredImage,
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
    else
    {
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
        return tableCellNames.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =
        [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];


    cell.textLabel.text = NSLocalizedString(tableCellNames[indexPath.row], @"Detail");

    return cell;
}

# pragma mark - DetailViewControllerDelegateProtocol Methods

- (void)detailViewController:(DetailViewController *)controller didSelectImage:(UIImage *)image
{
    self.mainImage = image;
    [self populateImageViewWithImage:image];
    [self.tableView reloadData];
}

- (void)detailViewControllerDidClearImage:(DetailViewController *)controller
{
    self.mainImage = nil;
    [self.filteredImages removeAllObjects];
    [self.tableView reloadData];
}

# pragma mark - Other Methods

-(void)populateImageViewWithImage:(UIImage *)image
{
    CIImage *main      = [[CIImage alloc] initWithImage:image];
    CIContext *context = [CIContext contextWithOptions:nil];
    [self createFilteredImageFromImage:main
                              WithName:@"CIHueAdjust"
                              andValue:(3.14/2.0f)
                             inContext:context];
    [self createFilteredImageFromImage:main
                              WithName:@"CIStraightenFilter"
                              andValue:(3.14f)
                             inContext:context];
    [self createFilteredImageFromImage:main
                              WithName:@"CIStraightenFilter"
                              andValue:(3.14/2.0f)
                             inContext:context];
}

-(void)createFilteredImageFromImage:(CIImage *)main
                           WithName:(NSString *)filterName
                           andValue:(float)filterValue
                          inContext:(CIContext *)context
{
    CIFilter *filter =
        [CIFilter filterWithName:filterName];
    [filter setDefaults];
    [filter setValue:main forKey:@"inputImage"];
    [filter setValue:[NSNumber numberWithFloat: filterValue]
              forKey:@"inputAngle"];
    CIImage *outputImage  = [filter valueForKey:@"outputImage"];
    CGImageRef cgImage1   = [context createCGImage:outputImage
                                          fromRect:outputImage.extent];
    UIImage *outputImage1 = [UIImage imageWithCGImage:cgImage1];
    CGImageRelease(cgImage1);
    [self.filteredImages addObject:outputImage1];
}

@end
