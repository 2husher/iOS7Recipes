//
//  ViewController.m
//  ch-11-4 Detecting Features
//
//  Created by X on 25/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.mainImageView.contentMode = UIViewContentModeScaleAspectFit;
    self.faceImageView.contentMode = UIViewContentModeScaleAspectFit;

    UIImage *image = [UIImage imageNamed:@"testimage.jpg"];
    if (image)
    {
        self.mainImageView.image = image;
    }
    else
    {
        [self.findFaceButton setTitle:@"No Image" forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha   = 0.6;
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)findFace:(id)sender
{
    UIImage *image       = self.mainImageView.image;
    CIImage *coreImage   = [[CIImage alloc] initWithImage:image];
    CIContext *context   = [CIContext contextWithOptions:nil];
    CIDetector *detector = [CIDetector detectorOfType:@"CIDetectorTypeFace"
                                              context:context
                                              options:[NSDictionary
                                                       dictionaryWithObjectsAndKeys:
                                @"CIDetectorAccuracyHigh", @"CIDetectorAccuracy", nil]];
    NSArray *features = [detector featuresInImage:coreImage];
    if ([features count] > 0)
    {
        CIImage *faceImage =
            [coreImage imageByCroppingToRect:[[features lastObject] bounds]];
        UIImage *face = [UIImage imageWithCGImage:[context createCGImage:faceImage
                                                                fromRect:faceImage.extent]];
        self.faceImageView.image = face;
        [self.findFaceButton setTitle:[NSString stringWithFormat:@"%lu Face(s) Found",
                                       [features count]] forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha   = 0.6;
    }
    else
    {
        [self.findFaceButton setTitle:@"No Faces Found"forState:UIControlStateNormal];
        self.findFaceButton.enabled = NO;
        self.findFaceButton.alpha = 0.6;
    }
}

@end
