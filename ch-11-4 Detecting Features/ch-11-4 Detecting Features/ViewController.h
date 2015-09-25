//
//  ViewController.h
//  ch-11-4 Detecting Features
//
//  Created by X on 25/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UIButton *findFaceButton;
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;

- (IBAction)findFace:(id)sender;

@end

