//
//  ViewController.h
//  ch 14-1. Working with NSCalendar and NSDate
//
//  Created by X on 28/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *gMonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *gDayTextField;
@property (weak, nonatomic) IBOutlet UITextField *gYearTextField;
@property (weak, nonatomic) IBOutlet UITextField *hMonthTextField;
@property (weak, nonatomic) IBOutlet UITextField *hDayTextField;
@property (weak, nonatomic) IBOutlet UITextField *hYearTextField;

@property (nonatomic, strong) NSCalendar *gregorianCalendar;
@property (nonatomic, strong) NSCalendar *hebrewCalendar;

- (IBAction)convertToHebrew:(id)sender;
- (IBAction)convertToGregorian:(id)sender;

@end

