//
//  AppDetails.h
//  ch 2-1: Implementing a Navigation Controller
//
//  Created by X on 07/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppDetails : NSObject

@property(strong, nonatomic) NSString *name;
@property(strong, nonatomic) NSString *descriptionApp;

-(id)initWithName:(NSString *)name description:(NSString *)descr;

@end
