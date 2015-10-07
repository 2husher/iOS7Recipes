//
//  AppDetails.m
//  ch 2-1: Implementing a Navigation Controller
//
//  Created by X on 07/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AppDetails.h"

@implementation AppDetails

-(id)initWithName:(NSString *)name description:(NSString *)descr
{
    self = [super init];
    if (self)
    {
        self.name           = name;
        self.descriptionApp = descr;
    }
    return self;
}

@end
