//
//  Socket_io_DemoTests.m
//  Socket.io-DemoTests
//
//  Created by Wilson on 2017/12/8.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface Socket_io_DemoTests : XCTestCase

@property ViewController *vcTest;
@end

@implementation Socket_io_DemoTests

@synthesize vcTest;

- (void)setUp {
    [super setUp];


    vcTest=[[ViewController alloc]init];
    
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testConnect
{

    [vcTest setServiceUrl];
    
    XCTAssertEqualObjects(vcTest.serviceUrl, @"localhost",@"Testing Url");
}

- (void)testMessageSend {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
