//
//  ErrorHandler.h
//  Ch 1 Application Recipes
//
//  Created by X on 04/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIAlertView.h>

@interface ErrorHandler : NSObject <UIAlertViewDelegate>

@property (strong, nonatomic) NSError *error;
@property (nonatomic) BOOL fatalError;

-(id)initWithError:(NSError *)error fatal:(BOOL)fatalError;

+(void)handleError:(NSError *)error fatal:(BOOL)fatalError;

@end
