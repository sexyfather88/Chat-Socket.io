//
//  Socket_io_DemoUITests.m
//  Socket.io-DemoUITests
//
//  Created by Wilson on 2017/12/8.
//  Copyright © 2017年 Wilson. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Socket_io_DemoUITests : XCTestCase
@property     XCUIApplication *app;

@end


@implementation Socket_io_DemoUITests

@synthesize app;
- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    app = [[XCUIApplication alloc] init];

    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnect {

    [app.buttons[@"連線"] tap];
    
    XCUIElement *welcomeToChatroomAlert = app.alerts[@"Welcome to ChatRoom"];
    [[[[[[[[welcomeToChatroomAlert.collectionViews childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeTextField].element typeText:@"Test"];
    [welcomeToChatroomAlert.buttons[@"OK"] tap];

    [self testSendMessage];

    
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}


-(void)testSendMessage
{

    XCUIElement *saySomethingTextField = app.textFields[@"Say something..."];
    [saySomethingTextField tap];
    [saySomethingTextField typeText:@"COOL"];
    [app.buttons[@"Send"] tap];
    
}
@end
