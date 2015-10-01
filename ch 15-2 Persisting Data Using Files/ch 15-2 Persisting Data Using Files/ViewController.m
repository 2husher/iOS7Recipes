//
//  ViewController.m
//  ch 15-2 Persisting Data Using Files
//
//  Created by X on 30/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSString *)currentContentFilePath
{
    NSArray *documentDirectories =
        NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [documentDirectories objectAtIndex:0];

    return [documentsDirectory stringByAppendingPathComponent:self.filenameTextField.text];
}

- (IBAction)saveContent:(id)sender
{
    NSString *filePath = [self currentContentFilePath];
    NSString *content  = self.contentTextView.text;
    NSError *error;
    BOOL success = [content writeToFile:filePath
                             atomically:YES
                               encoding:NSUnicodeStringEncoding
                                  error:&error];
    if (!success)
    {
        NSLog(@"Unable to save file: %@\nError: %@", filePath, error);
    }
}

- (IBAction)loadContent:(id)sender
{
    NSString *filePath = [self currentContentFilePath];
    NSError *error;
    NSString *content = [NSString stringWithContentsOfFile:filePath
                                                  encoding:NSUnicodeStringEncoding error:&error];
    if (error)
    {
        NSLog(@"Unable to load file: %@\nError: %@", filePath, error);
    }
    self.contentTextView.text = content;
}

@end
