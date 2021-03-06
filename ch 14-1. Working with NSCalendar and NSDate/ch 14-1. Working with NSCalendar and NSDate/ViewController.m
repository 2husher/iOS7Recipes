//
//  ViewController.m
//  ch 14-1. Working with NSCalendar and NSDate
//
//  Created by X on 28/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSCalendar *)gregorianCalendar
{
    if (!_gregorianCalendar)
    {
        _gregorianCalendar =
            [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    }
    return _gregorianCalendar;
}

-(NSCalendar *)hebrewCalendar
{
    if (!_hebrewCalendar)
    {
        _hebrewCalendar =
            [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierHebrew];
    }
    return _hebrewCalendar;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.gMonthTextField.delegate = self;
    self.gDayTextField.delegate   = self;
    self.gYearTextField.delegate  = self;
    self.hMonthTextField.delegate = self;
    self.hDayTextField.delegate   = self;
    self.hYearTextField.delegate  = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)convertToGregorian:(id)sender
{
    NSDateComponents *hComponents = [[NSDateComponents alloc] init];
    [hComponents setDay:[self.hDayTextField.text integerValue]];
    [hComponents setMonth:[self.hMonthTextField.text integerValue]];
    [hComponents setYear:[self.hYearTextField.text integerValue]];

    NSDate *hebrewDate = [self.hebrewCalendar dateFromComponents:hComponents];

    NSUInteger unitFlags =
        NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;

    NSDateComponents *hebrewDateComponents =
        [self.gregorianCalendar components:unitFlags fromDate:hebrewDate];

    self.gDayTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.day] stringValue];
    self.gMonthTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.month] stringValue];
    self.gYearTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.year] stringValue];
}

- (IBAction)convertToHebrew:(id)sender
{
    NSDateComponents *gComponents = [[NSDateComponents alloc] init];
    [gComponents setDay:[self.gDayTextField.text integerValue]];
    [gComponents setMonth:[self.gMonthTextField.text integerValue]];
    [gComponents setYear:[self.gYearTextField.text integerValue]];

    NSDate *gregorianDate = [self.gregorianCalendar dateFromComponents:gComponents];
    NSUInteger unitFlags =

        NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear;

    NSDateComponents *hebrewDateComponents =
        [self.hebrewCalendar components:unitFlags fromDate:gregorianDate];

    self.hDayTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.day] stringValue];
    self.hMonthTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.month] stringValue];
    self.hYearTextField.text =
        [[NSNumber numberWithInteger:hebrewDateComponents.year] stringValue];
}

#pragma mark - UITextFieldDelegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}

@end
