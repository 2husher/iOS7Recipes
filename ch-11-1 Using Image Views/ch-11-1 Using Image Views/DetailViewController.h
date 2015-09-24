//
//  DetailViewController.h
//  ch-11-1 Using Image Views
//
//  Created by X on 22/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DetailViewControllerDelegateProtocol;

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (nonatomic, weak) id <DetailViewControllerDelegateProtocol> delegate;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *selectImageButton;
@property (weak, nonatomic) IBOutlet UIButton *clearImageButton;

@property (strong, nonatomic) UIPopoverController *pop;

- (IBAction)selectImage:(id)sender;
- (IBAction)clearImage:(id)sender;

@end

@protocol DetailViewControllerDelegateProtocol <NSObject>

- (void)detailViewController:(DetailViewController *)controller didSelectImage:(UIImage *)image;
- (void)detailViewControllerDidClearImage:(DetailViewController *)controller;

@end

