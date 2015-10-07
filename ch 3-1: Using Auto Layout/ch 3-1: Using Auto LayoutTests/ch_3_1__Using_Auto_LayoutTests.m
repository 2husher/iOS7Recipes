//
//  ch_3_1__Using_Auto_LayoutTests.m
//  ch 3-1: Using Auto LayoutTests
//
//  Created by X on 07/10/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface ch_3_1__Using_Auto_LayoutTests : XCTestCase

@end

@implementation ch_3_1__Using_Auto_LayoutTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
