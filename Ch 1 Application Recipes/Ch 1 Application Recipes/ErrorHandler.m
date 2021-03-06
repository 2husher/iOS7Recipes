//
//  ErrorHandler.m
//  Ch 1 Application Recipes
//
//  Created by X on 04/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ErrorHandler.h"

@implementation ErrorHandler

static NSMutableArray *retainedDelegates = nil;

-(id)initWithError:(NSError *)error fatal:(BOOL)fatalError
{
    self = [super init];
    if (self)
    {
        self.error      = error;
        self.fatalError = fatalError;
    }
    return self;
}

+(void)handleError:(NSError *)error fatal:(BOOL)fatalError
{
    NSString *localizedCancelTitle = NSLocalizedString(@"Dismiss", nil);
    if (fatalError)
    {
        localizedCancelTitle = NSLocalizedString(@"Shut Down", nil);
    }
    // Notify the user
    ErrorHandler *delegate = [[ErrorHandler alloc] initWithError:error fatal:fatalError];
    if (!retainedDelegates)
    {
        retainedDelegates = [[NSMutableArray alloc] init];
    }
    [retainedDelegates addObject:delegate];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[error localizedDescription]
                                                    message:[error localizedFailureReason]
                                                   delegate:nil
                                          cancelButtonTitle:localizedCancelTitle
                                          otherButtonTitles:nil];
    if ([error recoveryAttempter])
    {
        // Append the recovery suggestion to the error message
        alert.message = [NSString stringWithFormat:@"%@\n%@", alert.message,
                         error.localizedRecoverySuggestion];
        // Add buttons for the recovery options
        for (NSString * option in error.localizedRecoveryOptions)
        {
            [alert addButtonWithTitle:option];
        }
    }
    [alert show];
    // Log to standard out
    NSLog(@"Unhandled error:\n%@, %@", error, [error userInfo]);
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != [alertView cancelButtonIndex])
    {
        NSString *buttonTitle   = [alertView buttonTitleAtIndex:buttonIndex];
        NSInteger recoveryIndex = [[self.error localizedRecoveryOptions]
                                   indexOfObject:buttonTitle];
        if (recoveryIndex != NSNotFound)
        {
            if ([[self.error recoveryAttempter] attemptRecoveryFromError:self.error
                                                             optionIndex:recoveryIndex] == NO)
            {
                // Redisplay alert since recovery attempt failed
                [ErrorHandler handleError:self.error fatal:self.fatalError];
            }
        }
    }
    else
    {
        if (self.fatalError)
        {
            // In case of a fatal error, abort execution
            abort();
        }
    }
    // Job is finished, release this delegate
    [retainedDelegates removeObject:self];
}

@end
