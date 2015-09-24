//
//  DetailViewController.m
//  ch-11-1 Using Image Views
//
//  Created by X on 22/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem)
    {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    if (self.detailItem)
    {
        BOOL showsButtons;
        self.detailDescriptionLabel.text = [self.detailItem objectForKey:@"label"];
        self.imageView.image             = [self.detailItem objectForKey:@"image"];
        showsButtons                     = [[self.detailItem objectForKey:@"showsButtons"] boolValue];
        if (showsButtons == NO)
        {
            self.selectImageButton.hidden = YES;
            self.clearImageButton.hidden  = YES;
        }
        else if (showsButtons == YES)
        {
            self.selectImageButton.hidden = NO;
            self.clearImageButton.hidden  = NO;
        }
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)selectImage:(UIButton *)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    if ([UIImagePickerController
         isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate   = self;

        self.pop = [[UIPopoverController alloc]
                    initWithContentViewController:picker];
        self.pop.delegate = self;
        [self.pop presentPopoverFromRect:sender.frame
                                  inView:self.view
                permittedArrowDirections:UIPopoverArrowDirectionAny
                                animated:YES];
    }
}

- (IBAction)clearImage:(id)sender
{
    self.imageView.image = nil;
}

# pragma mark - UIImagePickerControllerDelegate Methods

-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self.pop dismissPopoverAnimated:YES];
}

-(void) imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    self.imageView.image = image;
    [self.pop dismissPopoverAnimated:YES];
}

@end
