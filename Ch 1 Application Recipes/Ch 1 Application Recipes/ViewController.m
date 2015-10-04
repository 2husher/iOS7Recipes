//
//  ViewController.m
//  Ch 1 Application Recipes
//
//  Created by X on 04/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"
#import "ErrorHandler.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.myButton setTitle:@"Click Me" forState:UIControlStateNormal];
}

//- (void)viewDidAppear:(BOOL)animated
//{
//
//}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)clickMe:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert You!"
                                                    message:@"This is my alert"
                                                   delegate:self
                                          cancelButtonTitle:@"Undertand"
                                          otherButtonTitles:nil];
    [alert show];
}

- (IBAction)fakeNonFatalError:(id)sender
{
    NSString *description        = @"Connection Error";
    NSString *failureReason      = @"Can't seem to get a connection.";
    NSArray *recoveryOptions     = @[@"Retry"];
    NSString *recoverySuggestion = @"Check your wifi settings and retry.";
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: description,
                               NSLocalizedFailureReasonErrorKey: failureReason,
                               NSLocalizedRecoveryOptionsErrorKey: recoveryOptions,
                               NSLocalizedRecoverySuggestionErrorKey:recoverySuggestion,
                               NSRecoveryAttempterErrorKey:self
                               };
    NSError *error = [[NSError alloc] initWithDomain:@"NSCookbook.iOS7recipesbook"
                                                code:42
                                            userInfo:userInfo];
    [ErrorHandler handleError:error fatal:NO];
}

- (BOOL)attemptRecoveryFromError:(NSError *)error optionIndex:(NSUInteger)recoveryOptionIndex
{
    return NO;
}

- (IBAction)fakeFatalError:(id)sender
{
    NSString *description        = @"Data Error";
    NSString *failureReason      = @"Data is corrupt. The app must shut down.";
    NSString *recoverySuggestion = @"Contact support!";
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey:description,
                               NSLocalizedFailureReasonErrorKey:failureReason,
                               NSLocalizedRecoverySuggestionErrorKey:recoverySuggestion
                               };
    NSError *error = [[NSError alloc] initWithDomain:@"NSCookbook.iOS7recipesbook"
                                                code:22
                                            userInfo:userInfo];
    [ErrorHandler handleError:error fatal:YES];
}

@end
